# Arquitetura do Host Launcher MCPE

> Documento de síntese das 4 frentes de RE. Base: v29-decode (Toolbox que já carrega o jogo), emu32 (`guest_bridge/`), memórias do workspace e `_launcher/NATIVE_LOAD.md`. Fato aterrado citado com caminho+símbolo/método; inferência marcada **(a confirmar)**.

---

## 1. Visão

Um único produto host que mostra um **seletor** (versão × arquitetura) e **dá launch** no jogo, carregando a `libminecraftpe.so` **dinamicamente** — nunca "baked" numa `MainActivity` fixa. Modelo mcpelauncher/Toolbox.

Duas dimensões independentes:

- **Versão** (`0.15.10` agora, `0.14.3` depois) → é um **toggle de runtime real** dentro do app: muda a linha da tabela por-versão (offsets/símbolos de hook) e o diretório de conteúdo. O padrão já existe na referência viva: `MinecraftVersion.smali` carrega uma tabela de 26 entradas `{MD5, major, minor, build, betaNum, SupportLevel.FULL, Variant.ARMv7|X86}` e `getVersionForMD5Sum(md5)` mapeia o binário presente → versão.
- **Arquitetura** (`32-bit` / `64-bit`) → **NÃO é toggle de runtime**; é dimensão de **packaging/bitness de processo** (ver §5). `32-bit` = native-load (host carrega a `.so` 32 e nosso `libmodclient` hooka por nome via Substrate). `64-bit` = emu32 (roda a MESMA `.so` 32 num device 64-bit-only, sob tradução ARM32→ARM64).

O ponto-chave do modelo (provado no smali do v29): a **UI do launcher e o jogo são Activities diferentes**. `io.mrarm.mctoolbox.ToolboxActivity` é o `MAIN/LAUNCHER` (UI) e `getLaunchActivityClass()` (ToolboxActivity.smali ~268-283) devolve `io.mrarm.mctoolbox.MinecraftActivity` (a Activity do jogo). Dar "play" = `startActivity` da Activity de jogo. Nosso host precisa dessa separação **seletor-vs-jogo**.

---

## 2. Como o host carrega o jogo 32-bit (native-load)

### 2.1 A cadeia de Activities (v29-decode)

Quatro níveis, provados no smali:

```
io.mrarm.mctoolbox.ToolboxActivity         (MAIN/LAUNCHER, UI do seletor)
   extends io.mrarm.mcpelauncher.MainActivity        ← a tela do launcher
   getLaunchActivityClass() → ↓
io.mrarm.mctoolbox.MinecraftActivity       (Activity do jogo, camada mod)
   extends io.mrarm.mcpelauncher.MinecraftActivity   ← o LOADER de verdade
   extends com.mojang.minecraftpe.MainActivity       ← stock Mojang (NativeActivity)
   extends android.app.NativeActivity
```

Evidência: `ToolboxActivity.smali:2` (`.super io.mrarm.mcpelauncher.MainActivity`); `com/mojang/minecraftpe/MainActivity.smali:2` (`.super android.app.NativeActivity`).

### 2.2 A ordem de carga — passo a passo concreto

Tudo acontece em `io.mrarm.mcpelauncher.MinecraftActivity.onCreate` (MinecraftActivity.smali ~1074-1292), **antes** de `super.onCreate`:

1. **Seletor dispara o loader.** `MainActivity` (seletor) detecta a versão pelo MD5 da lib, checa permissão e faz `startActivity` do loader com um extra (`run_backup`). `startNormally()` ~52 / `startUsingBackup()` ~76 / `checkPermissions()` ~109.
2. **Loader sobe e escolhe a fonte da lib.** Lê o extra `run_backup`; `runFromBackup` → `loadFromBackup()`, senão → `loadFromPackage()` (~478). `loadFromPackage` faz `getPackageInfo("com.mojang.minecraftpe")`, `createPackageContext(...,2)` e `setNativeLibrariesDir(applicationInfo.nativeLibraryDir)`.
3. **`setNativeLibrariesDir(base)`** (~553-646): `System.load(base/libgnustl_shared.so)` **PRIMEIRO** (caminho absoluto); `PrepatchUtils.patchSoname(base/libminecraftpe.so → filesDir/libminecraftpe.so)` — se der certo usa a cópia em `filesDir`, senão a original; registra `libfmod.so` como dependência.
4. **Carrega as dependências e o jogo, por caminho ABSOLUTO** (no `onCreate`): loop `mcpeLibDependencies` → `System.load(libfmod.so)` (~1211); depois `System.load(mcpeLib)` = `libminecraftpe.so` (~1259). **A lib do jogo agora está mapeada na memória do processo, mas nada do jogo rodou ainda.** Como é caminho absoluto, a `.so` pode morar em qualquer lugar legível — não precisa estar no `nativeLibraryDir` do host.
5. **`initPatching()`** (~206-409): chama `loadNativeModLibraries()` → `setLibProtectionMode` → `applyPatches()`.
6. **`super.onCreate()`** → `com.mojang.minecraftpe.MainActivity.onCreate` (~1695) → `NativeActivity.onCreate`: aí o NativeActivity lê `meta-data android.app.lib_name` e dispara o jogo (ver §2.4).

### 2.3 Onde nosso `libmodclient` entra

Ponto exato de injeção: `io.mrarm.mctoolbox.MinecraftActivity.loadNativeModLibraries()` (MinecraftActivity.smali:59-94) chama `super.loadNativeModLibraries()` (= `System.loadLibrary('mobilesubstrate')` + `'mcpelauncher-utils'`) e **DEPOIS** `System.loadLibrary('toolbox')` + `System.loadLibrary('modclient')`.

Esse método roda dentro de `initPatching()`, **depois** do `System.load(libminecraftpe.so)` e **antes** de `super.onCreate` — **janela perfeita**: a lib do jogo já está em memória para `dlsym`/hook, mas o `ANativeActivity_onCreate` do jogo ainda não rodou.

Nosso backend limpo (`_launcher/native/jni/launcher.cpp`, `NATIVE_LOAD.md`) já é robusto a timing: `JNI_OnLoad` → `pthread` worker → `dlopen(libminecraftpe, RTLD_NOLOAD)` em loop → `dlopen(libmobilesubstrate/libsubstrate)` → `MSHookFunction` por **nome** de símbolo (`_ZN10ChatScreen17_drawChatMessagesEi`). Basta garantir que o `loadLibrary('modclient')` ocorra no `onCreate` antes do `super.onCreate`.

### 2.4 O despacho do `ANativeActivity_onCreate` — descoberta central

O carregamento da `libminecraftpe` **não** usa o auto-load do `NativeActivity`. O `meta-data android.app.lib_name` da Activity do jogo = **`mcpelauncher-utils`**, NÃO `minecraftpe` (provado por `aapt dump xmltree` do APK). Então, quando `NativeActivity.onCreate` roda, ele carrega `libmcpelauncher-utils.so` e chama o `ANativeActivity_onCreate` **dele** — não o do jogo.

Provado nos bytes de `lib/armeabi-v7a/libmcpelauncher-utils.so`:
- `ANativeActivity_onCreate` @`0x228e0` (12 bytes, thumb) = trampolim GOT-indireto (`ldr r3,[pc]; add r3,pc; ldr r3,[r3]; bx r3`).
- O slot (`0x29510`) é preenchido em runtime por `_Z18activityproxy_initv` (@`0x228ec`): `*slot = dlsym(dlopen('libminecraftpe.so',1), 'ANativeActivity_onCreate')`. Literais confirmados: `0x24959='libminecraftpe.so'`, `0x2552c='ANativeActivity_onCreate'`.
- O `ANativeActivity_onCreate` **real** da `libminecraftpe.so` está @`0xdbc7e5` (380 bytes, GLOBAL DEFAULT).

Ou seja: o helper intercepta a entrada do jogo e re-despacha para a entrada real. Isso permite carregar a lib de **qualquer caminho/modo** e envolver os callbacks.

### 2.5 Dois modelos para o nosso host

- **(A) Modelo Toolbox**: `lib_name='mcpelauncher-utils'` + um `libhost` com `ANativeActivity_onCreate` que faz `dlopen`+`dlsym` da lib do jogo escolhida e re-despacha. **Mais flexível** (multi-versão/multi-origem).
- **(B) Modelo stock/limpo** (`NATIVE_LOAD.md`): manifesto com `lib_name='minecraftpe'`, `NativeActivity` carrega a `libminecraftpe` direto. **Mais simples**, já validado no A71.

Para um host que carrega a lib dinamicamente de pastas por-versão, o **modelo (A)** é o indicado — escrever um pequeno `libhost` com `ANativeActivity_onCreate` que faz `dlsym` da lib do jogo escolhida. Se o modelo (B) basta quando a lib é carregada manualmente por `System.load` antes do `super.onCreate` é **(a confirmar no device)**.

### 2.6 O que o host limpo NÃO precisa

O aparato de patch do Toolbox é maquinaria **ModPE/backup — dispensável**: `CUtils.setLibProtectionMode` (mprotect gravável), `CUtils.patchAssetManager()`, `ModPEScriptLoader.nativeInit(ver)`, `initMod()` do `libtoolbox`, `ZipAssets`/`BackupVersionManager`. Para "launch + hook por nome via Substrate" basta: `System.load` das 3 libs + `loadLibrary('mobilesubstrate')` + `loadLibrary('modclient')`, e deixar o `NativeActivity` disparar o jogo. Mantém a `libminecraftpe` **INTACTA** (`NATIVE_LOAD.md`).

### 2.7 Dependências nativas obrigatórias e ordem

`libgnustl_shared.so` (STL 5.4 MB do Purple — a reduzida do launcher NÃO linka, erro `_ZSt24__throw_out_of_range_fmtPKcz`) **antes** da `libminecraftpe`; `libfmod.so` também antes. O host deve embarcar/apontar a gnustl correta **por versão**.

Inventário das libs do v29 (`lib/armeabi-v7a/`): `libminecraftpe.so` 23213 KB, `libgnustl_shared.so` 5418 KB, `libmcpelauncher-utils.so` 157 KB, `libtoolbox.so` 469 KB, `libmobilesubstrate.so` 18 KB, `libmodclient.so` 4 KB, `libmcpelauncher-prepatch-utils.so` 5 KB. `libminecraftpe.so` só existe em `armeabi-v7a` (jogo 32-bit ARM puro) — `lib/x86` não tem.

---

## 3. Asset bridge — estratégia recomendada

### 3.1 Mecanismo

O jogo nativo pega assets por **dois** caminhos que desaguam num **único** resolvedor Java `openAssetFile(path)`:
1. **JNI**: `com.mojang.minecraftpe.MainActivity.getFileDataBytes(path)` chama `openAssetFile(path)` e, se vier null, cai em `new FileInputStream(path)` (MainActivity.smali:675-700).
2. **C++ nativo**: `CUtils.patchAssetManager()` (nativo em `libmcpelauncher-utils.so`, declarado em CUtils.smali:120) **redireciona** as leituras de `AssetManager` nativas do MCPE para esse mesmo `openAssetFile`.

Esse par (`patchAssetManager` + `openAssetFile`) **é a "bridge"**.

O resolvedor real é `io.mrarm.mcpelauncher.MinecraftActivity.openAssetFile(path)` (MinecraftActivity.smali:1525-1894), com prioridade fixa, terminando em `minecraftContext.getAssets().open(path)` (~1841). `minecraftContext` vem de `createPackageContext("com.mojang.minecraftpe", 2)` (flag 2 = `CONTEXT_IGNORE_SECURITY`; MinecraftActivity.smali:510-518).

Diferença decisiva: o alvo é **sempre** `com.mojang.minecraftpe`. Se o APK host **também** se chama `com.mojang.minecraftpe` (self-referential), resolve para **si mesmo** → `AssetManager` próprio. Se o host tem pacote diferente, resolve o MCPE instalado à parte → leitura **cross-package**. O v29 é a variante **self-referential** (`apktool.yml:10` `renameManifestPackage: null`; assets-core embutidos em `assets/resourcepacks/vanilla/*.json`).

### 3.2 Armadilha de DADOS (fora da bridge)

Paths de **dados** (mundos/options/skins) o 0.15 monta concatenando o literal `com.mojang.minecraftpe` **dentro do binário** e abre por `open()/fopen()` — **não** passa por `openAssetFile` (confirmado em `reference_emu32_pacote_apk`). **A bridge resolve ASSETS, não DADOS.** Rodando sob pacote diferente, o jogo gravaria em `/data/data/com.mojang.minecraftpe` (inacessível) → não salva em silêncio.

### 3.3 Recursão do ResourcePackManager

A memória antiga culpou o caminho `ZipAssets`/backup pela recursão nativa. A RE nova (`NATIVE_LOAD.md` §6 / `reference_mcpe_0151_poco_crash`) refina: a recursão é de `ResourcePackManager::_loadLastActiveResourcePacksFromFile` quando o jogo não abre a config de packs no `/sdcard` OU faltam packs. **Lição: evitar o caminho `ZipAssets`/backup, manter packs COMPLETOS e storage concedido.**

### 3.4 Recomendação

Duas opções para o 32-bit:
- **(A) Self-referential** — host = `com.mojang.minecraftpe`, assets embutidos, SEM bridge cross-package. Simples e já provado. **Custo**: só UM pacote `com.mojang.minecraftpe` instalável → NÃO coexiste 0.15 e 0.14 como instalações separadas, e um `AssetManager` único não distingue versões (paths idênticos colidem).
- **(B) Bridge (recomendado p/ multi-versão)** — host com **pacote próprio**, mantém `patchAssetManager` + `openAssetFile`, mas **aponta a fonte de assets para a árvore da VERSÃO selecionada** (dir/zip por versão em disco, ex. `<externo>/versions/0.15.10/assets/`). A bridge é exatamente o que **desacopla** a fonte do único `AssetManager` do app — requisito do seletor.

**Recomendação de síntese:**
1. **32-bit**: manter a bridge `openAssetFile`/`patchAssetManager` e **parametrizar a fonte de assets por versão** (dir/zip em disco). Se precisar isolar save-data por versão, adicionar **hook de `open`/`fopen`** no `libmodclient` (estilo `thunk_open`/`pacote.c` do emu32) para reescrever o componente de pacote dos paths de dados. Se aceitar dados compartilhados e UMA versão por vez, o self-referential é o mais simples — mas é **incompatível** com trocar de versão sem reinstalar.
2. **64-bit**: delegar tudo ao emu32 (ver §4) — ele já resolve assets E dados.
3. **Ambos**: packs COMPLETOS + storage concedido.

---

## 4. Caminho 64-bit via emu32 — o que muda vs 32-bit

### 4.1 Ponto de entrada

O emu32 é uma **NativeActivity pura**: o único símbolo exportado é `ANativeActivity_onCreate` (`guest_bridge/apk_entrada.c:1695`), e o "host real" é a `libemu32.so` **arm64-v8a**. O framework 64-bit carrega essa `.so`, entrega a `ANativeActivity` real de 64 bits, e o emu32 **preenche os campos** da struct de callbacks (nunca troca o ponteiro — apk_entrada.c:1987-1998). **Não há `MainActivity`/mcpelauncher Java dirigindo a carga** como no 32-bit; quem dirige é o framework via callbacks.

### 4.2 A lib do jogo não passa pelo linker do Android

emu32 tem o **próprio loader ELF32-ARM** (`guest_lib_load`, `loader.c:259`; recusa `e_machine != 0x28` = EM_ARM): mapeia `PT_LOAD`, aplica relocações e trata a imagem como `soinfo*`. Ele carrega `libgnustl_shared` → `[libgnustl_unwind]` → `[libfmod]` → `libminecraftpe` → libs de mod — **tudo ARM32, rodando TRADUZIDO (JIT ARM32→ARM64)**. O binário do jogo fica **byte-idêntico** (MD5; `reference_emu32_arquitetura`).

### 4.3 Sequência de boot (dentro do `onCreate`)

1. Redireciona stdout/stderr; resolve pacote/dirs/`emu32.cfg`.
2. **Resolve o caminho da `libminecraftpe` 32** — prioridade `EMU32_SO` → `autocontido_prepara` (extrai `libminecraftpe`+`libgnustl`+`libfmod` de `assets/jogo32/` pro dir privado, checando CRC) → candidatos em `<raiz>/jogo/lib/armeabi-v7a/` e `externalDataPath` (apk_entrada.c:2018-2106; autocontido.c:200-326).
3. **`emu32_sobe(so)`** (sobe.c:131): abre engine ARM (uc), bridge, heap, leitor de asset; carrega as guest libs na ordem (STL ANTES do jogo; unwind opcional; fmod opcional; `libminecraftpe`; por fim as libs de ModPE se `EMU32_TOOLBOX`, sobe.c:257-324). Roda os `init_array` na ordem STL → fmod → jogo (sobe.c:405-449).
4. `substrate_liga(g_uc)` **arma a camada de ponte** no executor principal **antes** do mod_init (sobe.c:402).
5. **`emu32_entra_atividade`** (sobe.c:1168): `atividade_cria()` monta a `ANativeActivity` de 32 bits + `JNIEnv` guest; chama guest `JNI_OnLoad(vm)`, `nativeRegisterThis(env,thiz)`.
6. **Camada de mod liga AQUI** (sobe.c:1226-1251): `JNI_OnLoad` de cada lib do `EMU32_TOOLBOX` + `mod_init`, **DEPOIS do JNI e ANTES do `ANativeActivity_onCreate` do jogo** — mesma janela do 32-bit.
7. Chama o guest `ANativeActivity_onCreate` (o jogo instala seus callbacks) + thread marcapasso de 250 ms.

### 4.4 Hook: mesmo contrato, mecanismo diferente

A camada de hook usa o **mesmo contrato "por nome"** (`MSHookFunction`/`hookFunction`/`mcpelauncher_hook`), mas:
- **Inline hook é no-op SILENCIOSO** no emu32: o código guest já foi traduzido e **cacheado**; escrever bytes não invalida a tradução (substrate.c:13-47; sobe.c:278-287). Por isso **`libmobilesubstrate.so` é DELIBERADAMENTE NÃO carregada**.
- O mod pede a API por `dlsym` em runtime; o `thunk_dlsym` devolve a impl **própria** do emu32 (substrate.c:643, `substrate_table`). Essa impl registra uma **PONTE JIT** no endereço alvo (`uc_hook_add` UC_HOOK_CODE em `[alvo, alvo+1]`), que invalida o bloco traduzido. Ao chegar no PC do alvo, `ao_alvo` desvia o PC pra função de troca; `*orig` recebe um trampolim (`ao_tramp`+`uc_passa_uma_vez`, substrate.c:191-316). Alvo resolvido por **nome** (`MSFindSymbol`→`guest_find_export`).

Para o autor do mod, a camada é a **mesma "por nome"** — a diferença (ponte JIT vs patch inline, e rodar emulado) é invisível ao contrato.

### 4.5 Como o host liga o mod

As libs do mod entram como **guest libs** via `EMU32_TOOLBOX` (lista `:`-separada, sobe.c:290). No APK, quem seta isso é `autocontido.c:318` (`setenv('EMU32_TOOLBOX', lista, 0)`) com os caminhos das `.so` extraídas de `assets/jogo32/`. A **ordem importa** (resolver indefinidos por `DT_NEEDED`). Hooks são armados em **todo executor/uc** (`substrate_liga` por thread; sobe.c:402).

### 4.6 O que o host 64-bit NÃO precisa prover

- **Loader Java**: o emu32 já é NativeActivity própria.
- **JNI shim**: os 64 métodos da `MainActivity` da Mojang são **reimplementados em C** (`jni.c`), porque o APK vanilla não tem `classes.dex`. (Na build PRIVADA/ModPE há um `classes.dex` para a metade Java do ModPE + Rhino.)
- **Bridge de assets Java**: o emu32 lê assets E paths de dados sozinho de um game-root; `EMU32_PKG` + `guest_bridge/pacote.c` reescrevem o componente de pacote (coisa que o native-load NÃO ganha de graça).

### 4.7 Reuso do nosso `libmodclient`

Nosso `libmodclient.so` já é **ARM32** (`--target=armv7a-linux-androideabi21`). O **mesmo binário** pode ser reusado como guest lib no emu32, sem mudar o source. Muda só **como** é carregado: em vez de `System.loadLibrary` + libmobilesubstrate nativa, ele entra na lista `EMU32_TOOLBOX` e usa o thunk `MSHookFunction` do emu32. Para funcionar como guest lib, o mod tem de: (a) ser carregado **depois** da `libminecraftpe`; (b) resolver alvo e API de hook **por nome** (`MSFindSymbol`/`dlsym`), **nunca** reescrever bytes; (c) expor `JNI_OnLoad` para ser inicializado pelo laço de mods (sobe.c:1244).

### 4.8 Interruptores e identidade de pacote

`EMU32_PKG` controla o `applicationId` (default `com.mojang.minecraftpe` pros caminhos hardcoded baterem). Mundos em `/sdcard/games/com.mojang`. **Obrigatórios pro pacote jogável**: `EMU32_WITH_AUDIO` (senão MUDO) e `EMU32_WITH_GAME` pro auto-contido (`reference_emu32_apk_interruptores`). Multi-versão no emu32 = apontar `EMU32_GAME_DIR`/game-root (e sufixo de pacote) diferente por versão; o host só seta as env/cfg.

### 4.9 Guard-rail

O launcher usa a build **PRIVADA** do emu32 (com ModPE/substrate/art_ponte) — **OK**. `substrate.c:9-11` tem `#error` se compilado sem `EMU32_COM_MODPE`. **NÃO vazar** `substrate.c`/`modpe.c`/`modpe_tab.c`/`art_ponte.c` no release público GPLv3.

### 4.10 Regra de arquitetura do seletor

Só oferecer **"64-bit/emu32"** para versões que **NÃO trazem arm64 nativo** — emular quando já há arm64 é trabalho jogado fora (`reference_emu32_arquitetura`). `0.15.10` e `0.14.3` são **armeabi-v7a-only** → device 64-bit-only **EXIGE** emu32. Antes de adicionar qualquer versão nova, conferir se ela já empacota `lib/arm64-v8a` — se traz, o backend 64-bit deve ser native-load, não emu32.

---

## 5. Roteamento multi-versão × arch, estrutura e fonte de conteúdo

### 5.1 Por que DOIS flavors e não um APK com toggle

Bitness de processo é **fixada no launch** pelo ABI primário extraído:
- native-load **precisa de processo 32-bit** (`libmodclient.so` + `libmobilesubstrate.so` são `armeabi-v7a` e entram na **mesma namespace do linker** da `libminecraftpe.so` v7a).
- emu32 **precisa de processo arm64** (`libemu32.so` é arm64; roda a `.so` v7a como **dado**, sob tradução).

Um APK que declara `arm64-v8a` **DESCARTA** o ABI v7a na instalação; num device 64-bit o Android extrai só o arm64 → `libmodclient` (v7a) **some**. Os dois backends são **mutuamente exclusivos no nível de processo**.

**Conclusão:** o host deve shipar em **DOIS flavors** compartilhando o mesmo código de seletor/conteúdo/GameInterface:
- flavor **`native`**: `ndk.abiFilters 'armeabi-v7a'`, empacota `libmodclient`+`libmobilesubstrate`.
- flavor **`emu32`**: `abiFilters 'arm64-v8a'`, empacota `libemu32` (privado/ModPE).

Então "arch 32/64" no seletor é, na prática, **"qual flavor você instalou"** + auto-detect de `Build.SUPPORTED_ABIS`. O seletor de **versão** (0.15.10/0.14.3) SIM é toggle de runtime real dentro do flavor.

### 5.2 Estrutura do projeto (dois flavors, um código-fonte)

- **(A) Camada Java/smali compartilhada**: `SelectorActivity` + `ContentManager` + duas activities-loader (uma por flavor).
- **(B) Dois backends nativos**: `libmodclient.so` (v7a, hook por nome, código nosso limpo) e `libemu32.so` (arm64, PRIVADO/ModPE — **não vazar**).
- **(C) `GameInterface`** = tabela por versão (evolução de `MinecraftVersion.smali` + do `libmodclient` atual): `struct { version(major,minor,build); md5_esperado; hooks[]{nome_simbolo_mangled, offset_fallback, instalador} }`.

**Activity-loader do flavor `native`**: reaproveitar o esqueleto `mcpelauncher MinecraftActivity`, simplificando `loadFromPackage` para `loadFromContentDir(versao)`: `System.load(gnustl)` → `System.load(libfmod)` → `System.load(libminecraftpe)` → `System.loadLibrary(mobilesubstrate)+(modclient)` → `super.onCreate()`. CUtils/patchAssetManager/ModPE não são necessários no caminho limpo (`NATIVE_LOAD.md` prova boot sem eles) **(a confirmar — ver open questions sobre assets via AssetManager normal)**. Reusar `PrepatchUtils.patchSoname` só se houver colisão de soname entre versões coexistindo.

**Activity-loader do flavor `emu32`**: a `EmuActivity` (NativeActivity) já existente; passar versão/caminho via `EMU32_*` (`emu32.cfg` / `atividade_dirs_set`); multi-versão = `EMU32_GAME_DIR` por versão.

### 5.3 GameInterface — resolver por NOME, não offset

A lib exporta ~42k símbolos; `reference_emu32_arquitetura` mostra que **símbolo-por-nome sobrevive à troca de versão**, enquanto **offset hardcoded quebra até entre 0.15.9 e 0.15.10**. Portanto: resolver hook por `dlsym`/nome mangled, com offset só como fallback. A `0.15.10` já está mapeada (`_launcher/re/chat_syms_0.15.10.txt`). `nativeInit(major,minor,build)` já passa a versão pro lado nativo. O `libmodclient` hoje é **single-version** (`launcher.cpp`, offset 0.15.10 hardcoded) — refatorar o `worker()` para, após achar a `libminecraftpe`, selecionar a linha da GameInterface pela versão passada do Java (intent extra) e instalar os hooks daquela linha.

### 5.4 Fonte do conteúdo do jogo — recomendação: **USER-PROVIDES (import)**

Três opções e o trade-off legal:

| Opção | O que é | Trade-off legal |
|---|---|---|
| **Import (user-provides)** ✅ | O usuário popula uma árvore no `/sdcard` com a **cópia dele** do MCPE (a `.so` vanilla + assets). | **Limpo**: o host nunca distribui binário Mojang. É o que já se faz no native-load e no emu32; o release público do emu32 **explicitamente não embute o jogo** e manda tirar até o ícone Mojang. |
| **Bundle** | Embutir `libminecraftpe`/assets no APK. | **Distribui binário proprietário da Mojang** — risco legal/DMCA; incompatível com o guard-rail do release público. |
| **Download** | Baixar da Mojang. | Idem distribuição + depende de endpoint. |

**Recomendação: import.** Generalizar para uma árvore de conteúdo por versão no `/sdcard` que o usuário popula.

**Layout no device** (user-provides):
```
/sdcard/<host>/games/<versao>/
    lib/armeabi-v7a/{libminecraftpe.so, libgnustl_shared.so, libfmod.so}
    assets/            (+ resourcepacks COMPLETOS — faltar pack = recursão do ResourcePackManager)
/sdcard/games/com.mojang/    (mundos, legado; sobrevive a uninstall)
```
A **arch não aparece no path**: a `.so` é sempre o binário `armeabi-v7a`; o que muda é o **runtime** (native vs emu32), não o conteúdo. O `ContentManager` detecta quais versões têm conteúdo presente, confere o **MD5 contra a GameInterface** e só então habilita o botão de launch (`libminecraftpe` vanilla 0.15.10 = MD5 `8e120b0d`, 23.770.524 B).

### 5.5 Isolamento de dados por versão

- **32-bit**: a bridge NÃO cobre os paths de dados (literal `com.mojang.minecraftpe` concatenado + `open()/fopen()`). Isolar dados por versão exige **hookar `open`/`fopen`** no `libmodclient` e reescrever o componente de pacote. Sem isolar e com host = `com.mojang.minecraftpe`, 0.15 e 0.14 **compartilham** a árvore de dados → risco de colisão de formato de mundo/options.
- **64-bit (emu32)**: **já resolvido** por `EMU32_PKG` + `pacote.c`.

---

## 6. Plano incremental

### Fase 1 — MVP: host abre 0.15.10 em 32-bit (90% pronto)

O backend native-load já está **validado no A71** (`NATIVE_LOAD.md`): base stock Mojang intacta, injeta 2 libs (`modclient`+`mobilesubstrate`) + 2 linhas no smali após `loadLibrary(minecraftpe)`; fix de boot Android 13 (targetSdk 23, `requestLegacyExternalStorage`, grants adb — target 24 quebra o Substrate). Falta:

1. Partir do base-stock validado (`NATIVE_LOAD.md`).
2. Adicionar `SelectorActivity` como `LAUNCHER` (lista fixa: `0.15.10 · 32-bit`); detectar `/sdcard/<host>/games/0.15.10/lib/armeabi-v7a/libminecraftpe.so`, conferir MD5; checar/solicitar `WRITE_EXTERNAL_STORAGE`.
3. `startActivity(NativeLoadActivity)` com extra `versao=0.15.10`.
4. `NativeLoadActivity`: `System.load` por caminho absoluto a partir do content dir + `loadLibrary(modclient)` + `super.onCreate()`.
5. `libmodclient` hooka por nome.

**Entrega**: app que mostra o seletor e dá launch no 0.15.10 32-bit.

### Fase 2 — Backend 64-bit (emu32)

Segundo flavor `emu32` reusando a `EmuActivity`. Empacotar os MESMOS artefatos de 32 bits em `assets/jogo32/` (NÃO em `lib/`). Adicionar `libmodclient.so` ao `EMU32_TOOLBOX`. Setar `EMU32_WITH_AUDIO` + `EMU32_WITH_GAME` + `EMU32_PKG`. Confirmar que o `libmodclient` resolve a API de hook por `dlsym`/undefined-import (ver open questions).

### Fase 3 — Seletor cheio (versão × arch)

- `SelectorActivity` detecta `Build.SUPPORTED_ABIS` e conteúdo presente por versão; habilita botões conforme flavor instalado + MD5 conferido.
- Virar o `libmodclient` single-version em `GameInterface` com uma linha por versão (resolver por nome).
- Política de arch (2 APKs vs 1 + instrução) — **decisão do Allan** (ver §7).

### Fase 4 — 0.14.3

- RE própria dos símbolos equivalentes (`ChatScreen`/`GameMode::getPickRange` etc.) para a linha 0.14.3 da GameInterface.
- No emu32: re-achar os ~80 offsets tipo-A por versão (`entrada.c`/`fmod.c`/`servidor.c`/`sobe.c`/`jni.c`/`skin_java.c`).
- Conferir diferenças estruturais de assets/paths do 0.14 vs 0.15.

---

## 7. Riscos e open questions

### Riscos

- **Coexistência de versões no mesmo flavor**: ambas as `libminecraftpe.so` têm o MESMO soname. Se duas versões lado a lado, precisa `patchSoname` por versão ou processos separados. Provável que cada launch seja processo novo (basta `System.load` em sequência após restart), mas **(a confirmar)**.
- **Armadilha de dados 32-bit** (§3.2/§5.5): sem hook de `open`/`fopen`, versões compartilham árvore de dados → colisão de formato de mundo/options.
- **Recursão do ResourcePackManager**: packs incompletos ou storage negado → crash. Garantir packs completos + grant.
- **Guard-rail**: embutir o emu32 privado (ModPE) no flavor `emu32` é OK, mas NÃO misturar com o release open-source vanilla (outro repo); não versionar binário Mojang/keystores/emu32 privado.

### Open questions

**Carregamento 32-bit:**
- Quem chama `activityproxy_init()` e quando? Precisa rodar ANTES de `super.onCreate` (senão slot=0 → `bx 0` crasha). Suspeita: `JNI_OnLoad`/`.init_array` de `libmcpelauncher-utils.so`. Confirmar por disassembly.
- `PrepatchUtils.patchSoname` no v29 self-referential: devolve a cópia patchada em `filesDir` ou a original? Decide qual lib executa. `libmcpelauncher-prepatch-utils.so` (5 KB) implementa. Não verificado em runtime.
- `dlopen('libminecraftpe.so',1)` por nome com soname patchado ainda resolve? Relevante se o host carregar de caminho não-padrão.
- Modelo (A) helper vs (B) stock: o modelo stock basta quando a lib é carregada manualmente antes do `super.onCreate`? **Teste no device decide.**
- `ModPEScriptLoader.nativeInit`/`CUtils.patchAssetManager` são mesmo dispensáveis no native-load limpo com assets vindo do content dir via AssetManager normal? `project_mcpe_selfcontained` indica que o modo NORMAL funciona sem a bridge; confirmar.
- Host native-load pode ter pacote PRÓPRIO (não `com.mojang.minecraftpe`)? Confirmar que a `libminecraftpe` 0.15 não exige que o processo se chame `com.mojang.minecraftpe` — o emu32 precisou corrigir caminhos derivados do pacote via `pacote.c`; o native-load pode ter o mesmo problema.
- Qual símbolo/API C++ o `patchAssetManager` hooka exatamente (`AAssetManager_open`? `ResourcePack::load`? `fopen`?) e se vira no-op no self-referential — confirmar por disasm.
- Cravar o `package=` final do v29 por `aapt dump badging` (lido só via strings AXML + `apktool.yml`).

**64-bit / emu32:**
- `modclient.cpp` resolve `MSHookFunction` por `dlopen('libmobilesubstrate.so')+dlsym` (quebraria no emu32, que não carrega essa lib) ou por undefined-import/`RTLD_DEFAULT` (que o `thunk_dlsym` do emu32 atende)? Precisa seguir o modelo do `libtoolbox` (só importa `dlopen`/`dlsym` e pede `hookFunction` em runtime). **Não lido nesta frente — confirmar no `modclient.cpp`.**
- `monta_apk.sh`/`build_apk.sh` já aceitam adicionar `libmodclient.so` a `MODS32`/`EMU32_TOOLBOX`? Hoje a lista é fixa (prepatch/utils/toolbox). Incluir o nosso exige estender `MODS32` + a lista de `setenv` em `autocontido.c` (ou setar `EMU32_TOOLBOX` via `emu32.cfg`).
- `JNI_OnLoad` do `modclient` como guest lib, e comportamento da sua thread-worker/`dlopen(RTLD_NOLOAD)` loop sob emulação (timing difere do linker Android). Validar no device.
- 0.14.3 tem `alvo-014/` no emu32? Não verificado.

**Produto (decisão do Allan):**
- **Fonte do conteúdo**: confirmar a decisão por **import (user-provides)** — recomendado como o caminho legalmente limpo e já adotado. (Bundle/download distribuem binário Mojang.)
- **Política de arch**: 2 APKs (flavors) vs 1 APK + instrução. Como os flavors são APKs separados, o seletor de um flavor só pode **avisar "instale o outro flavor"** num device 64-bit-only, não trocar sozinho.
- **Design do host único**: 1 APK com roteamento runtime vs variantes de build — nos artefatos lidos **não há host-seletor já implementado**. O emu32 é NativeActivity própria; o native-load é dirigido por MainActivity. A integração dos dois backends sob um seletor é trabalho de design ainda aberto.
- **Branding/pacote final** e confirmação de que o emu32 privado pode ser embutido no flavor `emu32` sem conflitar com o guard-rail do release público.