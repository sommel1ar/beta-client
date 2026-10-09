Verificação de grounding concluída: todos os VAs/símbolos críticos dos três achados batem com `syms_0151.txt` e com a tabela de símbolos dinâmicos (`AppPlatform::mSingleton` @0x16b6cbc, `AppPlatform_android::showKeyboard` @0xdb1df8, `Keyboard::feedText` @0xdb5b64, `Level::createUniqueLevelID` @0xd22390, `MinecraftClient::startLocalServer` @0x6c985c, `ScreenChooser::pushProgressScreen` @0x873070, `ProgressScreenController` getters @0x7a7f60/0x7a87c8/0x7a7f1c/0x7a8044, vtable @0x1602cd8, `LocalPlayer::getPreloadingProgress` @0x93e5dc, e os símbolos gnustl `_ZNSsC1EPKcRKSaIcE`/`_ZNSsD1Ev`/`_ZNSs6assignEPKcj`). Segue o markdown.

---

# VOID_INPUT_CREATE_LOADING_RE.md

**Projeto:** Void Client — MCPE **0.15.10** (armeabi-v7a, Thumb-2)
**Escopo:** 3 frentes para as novas telas do overlay — (1) entrada de texto, (2) criar mundo local, (3) tela de loading.
**Binário:** `C:\modulo\minecraft\_emu32\mcpe-vanilla\lib\armeabi-v7a\libminecraftpe.so`
**Símbolos:** `C:\modulo\minecraft\_launcher\re\syms_0151.txt`
**Convenção de endereço:** todo VA abaixo é **file-VA** (somar `g_slide` no runtime). Função chamável = `VC_CALL(va) = (void*)((g_slide + va) | 1)` (bit Thumb). Tudo roda na **thread do jogo**, exceto os 4 JNI de texto (thread de UI, ver §1.2).

> Legenda de confiança: **[conf]** = provado no desassemblável; **(a confirmar)** = inferência a validar no device.

---

## 0. Pré-requisitos comuns

### 0.1 Helpers já existentes no projeto (reusar)
- `g_mc` = `MinecraftClient*`.
- `chooser = *(void**)(g_mc + 0x198)` — `ScreenChooser*`. **Gate geral:** só operar com `chooser != NULL` (jogo no menu/estável).
- `getTopScreen(g_mc)` — acessor já usado pelo pause/worlds (via `chooser`). Reusar; não re-auditado aqui.
- **std::string gnustl** (objeto = 1 ponteiro; `_Rep` em `ptr-0xc`, `len` em `ptr-0xc`): construir com `dlsym` `_ZNSsC1EPKcRKSaIcE` e destruir com `_ZNSsD1Ev`. **[conf]** símbolos presentes na tabela dinâmica (`U _ZNSsC1EPKcRKSaIcE`, `U _ZNSsD1Ev`, `U _ZNSs6assignEPKcj`). Apelidar como `vc_mkstr(const char*)` / `vc_delstr(std_string*)`.
- **Nunca** passar `std::string` do launcher (libc++ NDK r27) para funções do jogo — ABI incompatível com a gnustl COW de 4 bytes. Só os temporários `vc_mkstr`.

### 0.2 Regras de thread (valem para as 3 frentes)
- Tocar `g_mc`/`chooser`/`ctrl`/`model`/getters e chamar `startLocalServer`/`showKeyboard` **só na thread do jogo** (`my_update`/press), **nunca** em `swapBuffers`.
- Os 4 JNI de texto rodam na **thread de UI**: dentro deles só mexer em flags atômicas + buffer sob mutex curto; **nunca** chamar função do jogo direto do JNI (regra A1 do VOID_LEAK_AUDIT).

### 0.3 Como as 3 frentes se conectam
`startLocalServer` (criar mundo, §2) e `joinMultiplayer` (conectar servidor, já RE'd) **sobem sozinhos a ProgressScreen nativa** via `ScreenChooser::pushProgressScreen`. Logo, logo após §2 (ou após `joinMultiplayer`) o **gate de loading da §3 passa a casar** — é o mesmo handler (`WorldGenerationProgressHandler`) e a mesma tela (`ScreenView`+`ProgressScreenController`) nos dois casos. A §3 é o consumidor natural da §2.

---

## 1. Entrada de texto (abrir teclado + capturar em buffer próprio)

### 1.1 Abrir o teclado — `AppPlatform::mSingleton` → `showKeyboard`

**Fato central [conf]:** o jogo abre a IME pelo singleton global `AppPlatform::mSingleton` **@0x16b6cbc** (bss), **não** pela tela. `showKeyboard` = `AppPlatform` vtable **+0x24 (índice 9)**; `hideKeyboard` = vtable **+0x28 (índice 10)**. Provado em `MinecraftKeyboardManager::enableKeyboard` @0x900ad4 (carrega `mSingleton`, `ldr [vt+0x24]`, chama) e `disableKeyboard` @0x900b44 (`ldr [vt+0x28]`).

- O `AppPlatform::showKeyboard` **base** @0xb13aec é **STUB** (só `strb #1,[this+0x5]`) — **[conf]** presente na tabela, não usar. Quem abre a IME de verdade é o override `AppPlatform_android::showKeyboard` **@0xdb1df8** / `hideKeyboard` **@0xdb1e88**. Como `mSingleton` é sempre a instância android, `vt[9]`/`vt[10]` resolvem para esses endereços.
- **Preferir chamar via `mSingleton` direto (vtable)**, e **não** via `enableKeyboard`: `enableKeyboard` passa por `canActivateKeyboard` (@0x6d008c checa `[mc+0x50]`), que exige tela/level nativo focado — nosso overlay não tem, o gate pode bloquear. `showKeyboard` direto não tem esse gate.
- **Assinatura [conf]:** `showKeyboard(std::string const& textoInicial, int tipo, bool a, bool b, Vec2 const& pos)`. ABI: `r1=&string`, `r2=int tipo`, `r3=bool a`, `[sp]=bool b`, `[sp+4]=&Vec2`. Referência canônica de uso: `TextBox::setFocus` @0x6ed7c0, que passa **Vec2 zerado** (`vmov.i32 d16,#0`) → `Vec2{0,0}` serve.

```c
// === (A) ABRIR TECLADO — thread do jogo, ao campo ganhar foco ===
AppPlatform* ap = *(AppPlatform**)(g_slide + 0x16b6cbc);   // AppPlatform::mSingleton
if (ap) {
    void** vt = *(void***)ap;
    std_string initText = vc_mkstr(g_field.utf8);          // texto inicial = conteudo atual do NOSSO campo
    struct { float x, y; } pos = {0.0f, 0.0f};             // Vec2 zerado (igual TextBox::setFocus)
    int  tipo  = 0;      // 0 = teclado de texto normal. (a confirmar) valor numerico p/ campo PORTA
    bool flagA = false;  // (a confirmar) semantica (parece numbersOnly/limite em TextBox::setFocus r6/r7)
    bool flagB = false;  // (a confirmar)
    typedef void (*showkb_t)(void* self, const void* text, int type, int a, int b, const void* vec2);
    ((showkb_t)vt[9])(ap, &initText, tipo, flagA, flagB, &pos);   // vt[9] = +0x24 -> AppPlatform_android::showKeyboard @0xdb1df8
    vc_delstr(&initText);
}
g_activeField = FIELD_WORLDNAME;   // ATOMIC: setado na thread do jogo, lido pelos hooks JNI
```

### 1.2 Capturar — hook nos **4 JNI de texto** (fonte única, camada 1)

**Fato central [conf]:** os 4 JNI rodam na thread de UI e são a **fonte única** do texto; funilam em filas estáticas (`Keyboard::_inputs` @0x17332c8 / `_states` @0x1732ec8 / `_inputText` @0x17332d4) drenadas na thread do jogo por `KeyboardMapper::tick` @0x11ff488. **Estratégia = hookar os 4 JNI e “engolir” (não chamar o orig) quando `g_activeField != 0`** — assim nada entra nas filas e nenhuma tela nativa por baixo recebe o texto (alinhado ao fix M7 do VOID_LEAK_AUDIT).

Caminhos confirmados de cada JNI:
- **`nativeTypeCharacter` @0xdb5e34** — `arg2 = jstring` (texto commitado, **pode ser vários chars** — commit de palavra pela IME). Faz `GetStringUTFChars` → `std::string::assign` (PLT 0x5976f8) → `Keyboard::feedText(str,false)` (PLT 0x5d8708, reloc JUMP_SLOT 0x16981b8 → `_ZN8Keyboard8feedTextERKSsb`, **[conf]** símbolo presente). → tratar como **append** de string UTF-8.
- **`nativeSetTextboxText` @0xdb5c8c** — `arg2 = jstring` = **TEXTO COMPLETO** do campo (substitui tudo). Se termina em `0xa` (`\n`) faz `feedText` + despacha `setText` pelo elemento focado (`[..+0x1c]->vt+0x44`). → **fonte autoritativa** (snapshot completo) — mais robusto que reconstruir char-a-char.
- **`nativeReturnKeyPressed` @0xdb59e8** — enfileira keycode `0xd` (press+release) em `vector<KeyboardAction>` (PLT 0x5d86fc) **e** chama `feedText("\n",false)`. → **confirmar/submeter** o campo.
- **`nativeBackSpacePressed` @0xdb5908** — enfileira keycode `0x8` em `vector<KeyboardAction>` (PLT 0x5d86fc). **Não** passa por `feedText`. → **apagar 1 codepoint** do buffer.

> `feedText` @0xdb5b64 (sink de texto; push em `vector<TextInput>` via PLT 0x5d8714) seria uma camada alternativa, **inferior**: pega texto mas **não** pega backspace (que vai direto pro `vector<KeyboardAction>`). Por isso a camada dos **4 JNI é superior**.

```c
// === (B) CAPTURAR — hook (MSHookFunction em g_slide+VA). Rodam na thread de UI. ===
// Buffer proprio sob mutex; g_activeField atomic. Prioridade = nativeSetTextboxText (completo).
void my_nativeSetTextboxText(JNIEnv* env, jobject thiz, jstring s) {
    if (g_activeField) {                                   // snapshot completo + engolir
        const char* u = (*env)->GetStringUTFChars(env, s, 0);
        { lock(g_fieldMtx); g_field.utf8 = u ? u : ""; strip_trailing_newline(&g_field.utf8); }
        if (u) (*env)->ReleaseStringUTFChars(env, s, u);
        return;                                            // NAO chama orig -> nada entra em Keyboard::_inputs
    }
    orig_nativeSetTextboxText(env, thiz, s);
}
void my_nativeTypeCharacter(JNIEnv* env, jobject thiz, jstring s) {   // fallback incremental (append!)
    if (g_activeField) {
        const char* u = (*env)->GetStringUTFChars(env, s, 0);
        { lock(g_fieldMtx); if (u) g_field.utf8 += u; }   // IME pode mandar palavra inteira
        if (u) (*env)->ReleaseStringUTFChars(env, s, u);
        return;
    }
    orig_nativeTypeCharacter(env, thiz, s);
}
void my_nativeBackSpacePressed(JNIEnv* env, jobject thiz) {
    if (g_activeField) { lock(g_fieldMtx); utf8_pop_last_codepoint(&g_field.utf8); return; }  // 1 CODEPOINT, nao 1 byte
    orig_nativeBackSpacePressed(env, thiz);
}
void my_nativeReturnKeyPressed(JNIEnv* env, jobject thiz) {
    if (g_activeField) { g_submitRequested = 1; return; } // consumido na thread do jogo
    orig_nativeReturnKeyPressed(env, thiz);
}
```

### 1.3 Fechar o teclado

```c
// === (C) FECHAR TECLADO — thread do jogo, ao perder foco / confirmar ===
g_activeField = 0;
AppPlatform* ap = *(AppPlatform**)(g_slide + 0x16b6cbc);
if (ap) { void** vt = *(void***)ap; ((void(*)(void*))vt[10])(ap); }  // vt[10]=+0x28 -> hideKeyboard @0xdb1e88
```

### 1.4 Opcional — espelhar texto de volta na IME
`AppPlatform_android::updateTextBoxText(std::string const&)` **@0xdb1ee4** empurra nosso texto de volta pro EditText Android (mantém composição/caret da IME coerentes). (a confirmar) se é necessário ou se basta deixar o EditText ser o modelo e só espelhar via `nativeSetTextboxText` (2ª opção mais simples; provavelmente suficiente p/ nome/IP/porta).

### 1.5 Símbolos — entrada de texto
| Símbolo | VA | Papel |
|---|---|---|
| `AppPlatform::mSingleton` | `0x16b6cbc` | GLOBAL bss; `AppPlatform**` → instância android |
| `AppPlatform_android::showKeyboard(string const&,int,bool,bool,Vec2 const&)` | `0xdb1df8` | abre IME real = vt[9] (+0x24) |
| `AppPlatform_android::hideKeyboard()` | `0xdb1e88` | fecha IME = vt[10] (+0x28) |
| `AppPlatform::showKeyboard (base)` | `0xb13aec` | STUB — não usar |
| `AppPlatform_android::updateTextBoxText(string const&)` | `0xdb1ee4` | espelhar texto no EditText (opcional) |
| `MinecraftKeyboardManager::enableKeyboard` | `0x900ad4` | prova do caminho; tem gate `canActivate` — evitar |
| `MinecraftKeyboardManager::disableKeyboard` | `0x900b44` | prova de `hideKeyboard` (vt+0x28) |
| `MinecraftClient::canActivateKeyboard` | `0x6d008c` | gate `[mc+0x50]` (motivo de preferir showKeyboard direto) |
| `TextBox::setFocus(MinecraftClient*)` | `0x6ed7c0` | referência: Vec2 zerado, `tipo=[tb+0x54]`, `texto=&tb+0x30` |
| JNI `nativeTypeCharacter` | `0xdb5e34` | hook+engolir — texto commitado (append) |
| JNI `nativeSetTextboxText` | `0xdb5c8c` | hook+engolir — **texto completo autoritativo** |
| JNI `nativeReturnKeyPressed` | `0xdb59e8` | hook — confirmar campo |
| JNI `nativeBackSpacePressed` | `0xdb5908` | hook — apagar 1 codepoint |
| `Keyboard::feedText(string const&,bool)` | `0xdb5b64` | sink de texto (hook alternativo inferior) |
| `Keyboard::_inputs / _states / _inputText` | `0x17332c8 / 0x1732ec8 / 0x17332d4` | filas estáticas (vazias se engolirmos) |
| `KeyboardMapper::tick(InputEventQueue&)` | `0x11ff488` | drena as filas na thread do jogo |
| `MinecraftClient::handleTextChar / handleCaretLocation` | `0x6c3670 / 0x6c3660` | dispatch p/ `topScreen->vt+0x64 / +0x68` (só p/ engolir se houver textbox nativo focado — não é o caso) |

---

## 2. Criar + iniciar mundo local novo

### 2.1 Fluxo nativo (botão “Create”) — replicar 3 passos **[conf]**
`CreateWorldScreen::generateLocalGame` @0x7f2610 faz exatamente: `name = TextBox::getText()` (vazio→`"World"`); `levelId = Level::createUniqueLevelID(name)`; monta `LevelSettings`; chama `MinecraftClient::startLocalServer(levelId, name, LevelSettings)` @0x6c985c. **Não precisa de `PlayScreenModel`/`startWorld`** (esses são para mundos **existentes**). Criar = 100% via `startLocalServer` direto.

**`startLocalServer` @0x6c985c é auto-navegante [conf]:** copia `levelId/name/LevelSettings` por valor (`r1=&levelId`, `r2=&name`, `r3=&LevelSettings`), aloca task 0x40, cria `WorldGenerationProgressHandler(bool,std::function)` e chama `ScreenChooser::pushProgressScreen(...)` sobre `chooser=*(mc+0x198)`. **Uma chamada** faz criar(pasta nova)+gerar+carregar+**ENTRAR** e sobe a ProgressScreen sozinho. **Gate:** `chooser != NULL`.

### 2.2 `Level::createUniqueLevelID` @0xd22390 **[conf]**
Estático (`r0 = dst std::string retornada`, `r1 = &name`). **Não deriva do nome:** gera id de 2 fontes de entropia (0x59b61c, 0x59b3b8) XOR com o **ponteiro** do name, formata hex (8 bytes), troca `'/'`→`'-'`. Conteúdo do name é **ignorado** (só o ponteiro entra) → pasta praticamente única (colisão ~2^-64, igual ao nativo). Resultado = gnustl `std::string` no slot fornecido.

### 2.3 `LevelSettings` — 0x34 bytes, POD puro (sem dtor) **[conf]**
Layout (getters confirmam):

| Off | Tipo | Campo |
|---|---|---|
| +0x00 | u32 | seed |
| +0x04 | i32 | gameType |
| +0x08 | u8 | (=0) |
| +0x0c | i32 | generator |
| +0x10 | u8 | hasBeenLoadedInCreative |
| +0x14 | i32 | dimensionId |
| +0x18 | i32 | dayCycleStopTime |
| +0x1c | u8 | isEduWorld |
| +0x20 | f32 | rainLevel |
| +0x24 | f32 | lightningLevel |
| +0x28/+0x2c/+0x30 | i32×3 | spawn.x/y/z |

**ctor default @0xd794ec grava SENTINELAS “não definido”:** `seed=-1, gameType=-1, generator=4, dimensionId=2, dayCycleStopTime=-1, isEdu=0, rain=0, light=0, spawn={0,0,0}`. **Patches OBRIGATÓRIOS** para mundo survival infinito normal:
- `gameType = 0` (Survival). **[conf]** `validateGameType` @0xd796c8 clampa para `[0,1]`; deixar `-1` vira **Criativo=1**.
- `generator = 1` (Infinito). **[conf]** `_getDefaultGenerator` @0x7efe24 = `(hardware_concurrency()>=2) ? !flag(+0x17c) : 0` → multi-core = 1. (0=legacy, 1=infinito, 2=flat.)
- `dimensionId = 0` (Overworld).
- `seed` = `0` (determinístico) **ou** `Level::createRandomSeed()` @0xd22440 (estático, retorna uint).
- **`spawn = BlockPos::MIN`** (@0x1708a58, global; copiar 3 ints p/ +0x28/+0x2c/+0x30). **[conf]** `getDefaultSpawn` @0xd7965c retorna NULL **só** se `spawn==BlockPos::MIN` (sentinela “sem spawn” → gerador escolhe). `{0,0,0}` do default **NÃO serve** (forçaria spawn em 0,0,0, dentro do terreno/void).

`isEduWorld` default 0 já OK (`setIsEduWorld` @0xd797dc é no-op no vanilla). `dayCycleStopTime=-1` = ciclo normal (a confirmar visualmente).

### 2.4 Sequência C
```c
// vc_create_and_enter_world("Meu Mundo", seed, aleatorio) — thread do jogo, 1x por clique, chooser!=NULL
void vc_create_and_enter_world(const char* nome, uint32_t seed, int aleatorio) {
    if (!g_mc || !*(void**)((char*)g_mc + 0x198)) return;        // gate: chooser != NULL

    std_string name    = vc_mkstr(nome && *nome ? nome : "World");
    std_string levelId; memset(&levelId, 0, sizeof(levelId));    // slot de 4 bytes

    // levelId = Level::createUniqueLevelID(name)  (r0=dst, r1=&name)
    ((void(*)(void*, const void*))VC_CALL(0xd22390))(&levelId, &name);

    // LevelSettings default + patches obrigatorios
    char ls[0x34];
    ((void(*)(void*))VC_CALL(0xd794ec))(ls);                     // ctor default (sentinelas)
    *(uint32_t*)(ls+0x00) = aleatorio ? ((uint32_t(*)(void))VC_CALL(0xd22440))() : seed; // seed
    *(int32_t *)(ls+0x04) = 0;        // gameType = Survival
    *(int32_t *)(ls+0x0c) = 1;        // generator = Infinito
    *(int32_t *)(ls+0x14) = 0;        // dimensionId = Overworld
    memcpy(ls+0x28, (void*)(g_slide + 0x1708a58), 12);          // spawn = BlockPos::MIN (3 ints)

    // startLocalServer(mc, &levelId, &name, &ls) -> cria+gera+carrega+ENTRA + sobe ProgressScreen
    ((void(*)(void*, const void*, const void*, const void*))VC_CALL(0x6c985c))(g_mc, &levelId, &name, ls);

    // ABI caller-destroys: destruir DEPOIS da chamada (ela copia durante). ls e POD, sem dtor.
    vc_delstr(&levelId);
    vc_delstr(&name);
}
```

### 2.5 Símbolos — criar mundo
| Símbolo | VA | Papel |
|---|---|---|
| `MinecraftClient::startLocalServer(string,string,LevelSettings)` | `0x6c985c` | ALVO FINAL; cria+gera+carrega+ENTRA; auto-sobe ProgressScreen |
| `CreateWorldScreen::generateLocalGame()` | `0x7f2610` | referência do fluxo nativo |
| `Level::createUniqueLevelID(string const&)` | `0xd22390` | estático; `r0=dst`, `r1=&name`; pasta única |
| `LevelSettings::LevelSettings()` (default) | `0xd794ec` | ctor sentinelas — patchar obrigatoriamente |
| `LevelSettings::LevelSettings(uint,GameType,DimensionId,GeneratorType,BlockPos&,bool,int,bool,float,float)` | `0xd79518` | ctor cheio (confirma mapa/defaults) |
| `Level::createRandomSeed()` | `0xd22440` | estático; seed aleatória (opcional) |
| `LevelSettings::validateGameType(GameType)` | `0xd796c8` | clampa `[0,1]` (por que −1 vira Criativo) |
| `CreateWorldScreen::_getDefaultGenerator() const` | `0x7efe24` | prova generator=1 em multi-core |
| `LevelSettings::getDefaultSpawn() const` | `0xd7965c` | NULL se `spawn==BlockPos::MIN` |
| `BlockPos::MIN` | `0x1708a58` | global; sentinela de spawn (copiar 3 ints) |
| `LevelSettings::setIsEduWorld(bool)` | `0xd797dc` | +0x1c; no-op no vanilla |
| `WorldGenerationProgressHandler::WorldGenerationProgressHandler(bool,std::function)` | (via `startLocalServer`) | handler que dirige o load (ponte p/ §3) |
| `ScreenChooser::pushProgressScreen` | `0x873070` | onde `startLocalServer` sobe a tela (ponte p/ §3) |

---

## 3. Tela de LOADING (detectar + progresso/texto + suprimir)

### 3.1 Gate único cobre tudo **[conf]**
As 3 variantes de push levam à **mesma tela**: `pushNetworkProgressScreen` @0x873f60 (server-connect) e `pushNetherProgressScreen` @0x873d84 fazem tail-call em `ScreenChooser::pushProgressScreen` @0x873070. Esta chama `createScreen<MinecraftScreenModel,ProgressScreenController,...>` @0x8732e0, que monta um **`ScreenView` envolvendo um `ProgressScreenController`** (provado por `new_allocator<ScreenView>::construct<...,shared_ptr<ProgressScreenController>&,...>` @0x882274, **[conf]** símbolo presente). Logo o `topScreen` é **sempre** `ScreenView` (vptr `g_slide+0x160681c`) com controller `ProgressScreenController` (vptr `g_slide+0x1602ce0`) para world-load, server-connect e nether.

**vptr do gate [conf]:** nm mostra `01602cd8 D vtable for ProgressScreenController`; vptr-no-objeto = `base+8` = **`g_slide+0x1602ce0`**.

**Handler idêntico [conf]:** world **e** server usam `make_unique<WorldGenerationProgressHandler>(false)`. Logo leitura de progresso/estado/texto é idêntica nos três fluxos (import/export usa `ImportExportProgressHandler`, fora de escopo).

```c
// === 1) DETECTAR — thread do jogo, no update ===
#define SV_VPTR   0x160681cu   // vtable for ScreenView (+8)
#define PSC_VPTR  0x1602ce0u   // vtable for ProgressScreenController (+8) == GATE UNICO (world+server+nether)
void* top = getTopScreen(g_mc);                      // via chooser=*(mc+0x198)
int onProgress = 0; void* ctrl = 0;
if (top && *(uint32_t*)top == (g_slide + SV_VPTR)) {
    ctrl = *(void**)((char*)top + 0x80);             // ScreenView -> controller (mesmo offset do pause)
    if (ctrl && *(uint32_t*)ctrl == (g_slide + PSC_VPTR)) onProgress = 1;
}
```
> `ScreenView+0x80 = controller` é herdado da RE do pause (marcado “a confirmar no device”), mas **na prática já validado** pelo StartMenu (também ScreenView+controller) que suprime por esse mesmo offset.

### 3.2 Ler progresso (0..100) + texto de status **[conf]**
**Progresso:** a lambda-getter do binding (@0x7a88cc, registrada por `_registerProgressBindings` @0x7a81ac) faz: `lp = model->getLocalPlayer()` (`MinecraftScreenModel::getLocalPlayer` @0x8392d0); `st = handler->getLoadingState(model)`; se `st==0x10` → `100.0f`; senão se `lp==0` → `0.0f`; senão `clamp(lp->getPreloadingProgress()*100, 0, 100)` (`LocalPlayer::getPreloadingProgress` @0x93e5dc, retorna float 0..1). Dá para **replicar direto**.

**Estado:** `ProgressScreenController::_getLoadingState` @0x7a7f60 (bitfield; `0x10`=carregado/pronto). `_pendingTasksFinished` @0x7a7f1c (bool) e `_isInCancellableState` @0x7a8044 (bool) auxiliam.

**Texto dinâmico:** `ProgressScreenController::_getProgressMessage` @0x7a87c8 retorna `std::string` gnustl **por sret** (destruir com `_ZNSsD1Ev` a cada leitura). Texto/título **estáticos** também em `ctrl+0x16c` / `ctrl+0x168`.

```c
// === 2) LER PROGRESSO + TEXTO (so com 'ctrl') ===
typedef int   (*fn_i_p)(void*);
typedef void* (*fn_p_p)(void*);
typedef float (*fn_f_p)(void*);
typedef void  (*fn_msg)(void* sret, void* self);     // _getProgressMessage: retorno por sret

void*  model = *(void**)((char*)ctrl + 0x148);
int    state = ((fn_i_p)VC_CALL(0x7a7f60))(ctrl);    // _getLoadingState ; 0x10 = carregado
float  pct;
if (state == 0x10) pct = 100.0f;
else {
    void* lp = ((fn_p_p)VC_CALL(0x8392d0))(model);   // MinecraftScreenModel::getLocalPlayer
    float p  = lp ? ((fn_f_p)VC_CALL(0x93e5dc))(lp) : 0.0f;  // LocalPlayer::getPreloadingProgress (0..1)
    pct = p * 100.0f; if (pct < 0) pct = 0; if (pct > 100) pct = 100;
}
char msg_obj[4] = {0};                               // gnustl std::string = 1 ponteiro
((fn_msg)VC_CALL(0x7a87c8))(&msg_obj, ctrl);         // _getProgressMessage (sret)
const char* status = *(const char**)msg_obj;         // len = *(int*)(status-0xc)
// ... desenhar barra(pct) + texto(status) ...
vc_delstr((std_string*)&msg_obj);                    // _ZNSsD1Ev — OBRIGATORIO (senao vaza _Rep)
```

### 3.3 Suprimir o render nativo (estender o hook existente) **[conf]**
`ScreenView::render(ScreenContext&)` @0x89e1b0, dentro de um escopo de profiler, só chama 3 coisas: `BaseScreen::setupForRendering` (GOT 0x1688120), `ScreenView::setupAndRender(UIScreenContext&)` (GOT 0x1688f18, o desenho real) e `BaseScreen::cleanupForRendering` (GOT 0x1688124). **Nenhum tick/lógica de load** — é render-only. O load segue por `MinecraftClient::update` + `ProgressScreenController::tick` @0x7a7ca4 (passe separado). Ao terminar, o jogo faz **pop** da tela sozinho e o gate deixa de casar.

```c
// === 3) SUPRIMIR — no inline-hook de ScreenView::render @ g_slide+0x89e1b0 ===
// void* c = *(void**)((char*)self + 0x80);
// if (c && *(uint32_t*)c == (g_slide + PSC_VPTR)) return;   // nao chama orig -> some setup/UI/cleanup
// (StartMenu ja gateado por 0x160323c; agora soma 0x1602ce0)
// Desenhar a NOSSA barra por cima na mesma condicao onProgress — INCLUSIVE o FUNDO (ver riscos).
```

### 3.4 Layout de `ProgressScreenController` (ctor @0x7a74b8 + getters)
`+0x148`=`MinecraftScreenModel*` (model); `+0x159`=bool (onStart-já-chamado); `+0x15c/+0x160`=int contadores de tick; `+0x164`=int contador de frames (limiar `0x258`=600); `+0x168`=`std::string` título; `+0x16c`=`std::string` mensagem estática; `+0x170/+0x174/+0x178`=`std::vector` (tarefas pendentes); `+0x17c`=`ProgressHandler*` (unique_ptr).

### 3.5 Símbolos — loading
| Símbolo | VA / GOT | Papel |
|---|---|---|
| `ScreenChooser::pushProgressScreen` | `0x873070` | fábrica base (world-load direto); destino de todas as variantes |
| `ScreenChooser::pushNetworkProgressScreen` | `0x873f60` | server-connect; tail-call → pushProgressScreen |
| `ScreenChooser::pushNetherProgressScreen` | `0x873d84` | nether; idem |
| `createScreen<MinecraftScreenModel,ProgressScreenController,...>` | `0x8732e0` | monta ScreenView+controller (prova do gate) |
| `vtable ProgressScreenController` | `0x1602cd8` (vptr `+0x1602ce0`) | **VALOR DO GATE** |
| `vtable ScreenView` | `0x1606814` (vptr `+0x160681c`) | shell MVC do topScreen |
| `ProgressScreenController::_getLoadingState() const` | `0x7a7f60` | bitfield; `0x10`=carregado |
| `ProgressScreenController::_getProgressMessage() const` | `0x7a87c8` | std::string status (sret — destruir) |
| `ProgressScreenController::_pendingTasksFinished() const` | `0x7a7f1c` | bool: load terminou |
| `ProgressScreenController::_isInCancellableState() const` | `0x7a8044` | bool: cancelável |
| `ProgressScreenController::getAdditionalScreenInfo()` | `0x7a7f70` | lê msg estática em `ctrl+0x16c` |
| `ProgressScreenController::tick()` | `0x7a7ca4` | motor da tela (no update; independe do render) |
| `ProgressScreenController::_registerProgressBindings()` | `0x7a81ac` | registra getters (inclui fração @0x7a88cc) |
| `ProgressScreenController::ProgressScreenController(...)` | `0x7a74b8` | ctor; revela layout dos campos |
| `<lambda> progress-fraction getter` | `0x7a88cc` | fórmula nativa da barra |
| `MinecraftScreenModel::getLocalPlayer` | `0x8392d0` | `model->getLocalPlayer()` |
| `LocalPlayer::getPreloadingProgress` | `0x93e5dc` | float 0..1 — fonte real da fração |
| `WorldGenerationProgressHandler::getLoadingState` | `0x74c6ec` | handler (world+server+nether) |
| `WorldGenerationProgressHandler::getProgressMessage` | `0x74c71c` | escolhe string de status por estado |
| `ScreenView::render` | `0x89e1b0` | HOOK de supressão; gatear vptr==0x1602ce0 e `return` |
| `ScreenView::setupAndRender` | GOT `0x1688f18` | desenho real da UI (o que a supressão elimina) |
| `BaseScreen::setupForRendering / cleanupForRendering` | GOT `0x1688120 / 0x1688124` | confirmam que é render-only |

---

## 4. Riscos + perguntas em aberto

### 4.1 Riscos — entrada de texto
- **Corrupção cross-thread:** os 4 JNI (thread UI) escrevem o buffer que a thread do jogo lê. Escrever sem sincronização corrompe o `std::string`. Usar **mutex curto ou SPSC**; nunca chamar função do jogo do JNI.
- **Vazamento de texto:** se **não** engolir (não retornar antes do orig) com campo ativo, o texto entra em `Keyboard::_inputs/_states` e vai pra tela nativa por baixo (`handleTextChar` vt+0x64). **Sempre engolir** quando `g_activeField != 0`.
- **Gate do `enableKeyboard`:** passar por `canActivateKeyboard` sem tela nativa focada pode **não abrir** o teclado. Preferir `mSingleton->showKeyboard` direto.
- **gnustl errada:** construir/destruir a string inicial com funções erradas corrompe heap. Usar só `_ZNSsC1EPKcRKSaIcE` / `_ZNSsD1Ev`.
- **`mSingleton` nulo** antes do `AppPlatform_android` existir (boot/injeção): checar `ap != NULL`.
- **Multi-char / UTF-8:** `nativeTypeCharacter` pode entregar vários chars (commit de palavra) → tratar como **append**. Backspace apaga **1 codepoint**, não 1 byte.
- **IME aberta sobre o overlay:** a IME é janela Android, fora da nossa surface GL — não dá para cobrir. Sempre `hideKeyboard` no teardown do campo.

### 4.2 Riscos — criar mundo
- **Sentinelas do default ctor:** sem patches, `validateGameType` transforma `-1` em Criativo(1) e `generator=4` é inválido. **Sempre** `gameType=0` e `generator=1`.
- **Spawn:** `{0,0,0}` do default força spawn em y=0 (terreno/void). **Copiar `BlockPos::MIN` para `ls+0x28` é obrigatório.**
- **ABI caller-destroys:** destruir `levelId` e `name` **só depois** de `startLocalServer` retornar (UAF se antes; leak se nunca). `ls` é POD, sem dtor.
- **Passar o ponteiro do objeto std::string** (slot de 4 bytes), nunca `_M_p`/`char*`.
- **Nunca** std::string do launcher (libc++) — só os temporários gnustl.
- **Thread do jogo**, 1 criação por clique; `startLocalServer` gera o mundo = custa frames (esperado).
- **Gate:** `chooser=*(mc+0x198) != NULL`, senão a push da ProgressScreen quebra.
- **`BlockPos::MIN` é por `g_slide`** (OFF 0x1708a58) — usar o mesmo viés do VC_CALL, não VA absoluta.

### 4.3 Riscos — loading
- **Supressão sem gate** casaria TODA tela MVC (toast/modal/disconnect/signin/realms são `ScreenView`) e sumiria tudo. O gate `controller->vptr==0x1602ce0` é **obrigatório**.
- **Fundo preto:** durante world-gen/preload não há mundo atrás. Ao suprimir, **desenhar o próprio fundo** (quad full-screen); não depender do nativo.
- **Vazamento do `_getProgressMessage`:** destruir a `std::string` gnustl (`_ZNSsD1Ev`) a cada leitura.
- **Só na thread do jogo** (update/tick), nunca em `swapBuffers` — getters mexem em estado vivo do nível.
- **Não** patchear o slot de render na vtable da ScreenView (afeta todas as telas) nem hookar `Screen::render`/`BaseScreen::setupForRendering` genéricos; manter o inline-hook em `ScreenView::render` @0x89e1b0 com o gate.

### 4.4 Perguntas em aberto (validar no device)
**Entrada de texto:**
- Semântica exata de `int tipo`/`bool a`/`bool b` do `showKeyboard`: `tipo=0` = texto normal; valor numérico p/ campo PORTA (a confirmar); `a`/`b` parecem `numbersOnly`/limite (vistos em `TextBox::setFocus` r6/r7).
- Frequência/gatilho de cada callback Java é decidido no `MainActivity.java` (fora do .so): `nativeSetTextboxText` dispara a cada `afterTextChanged`? Se sim, basta ele como fonte; incrementais viram redundância.
- Gate `[ap+0xc4]` em `AppPlatform_android::showKeyboard`: se 0, não faz nada (provável “activity/surface pronta”). Confirmar que é 1 no contexto do overlay.
- Precisamos de `updateTextBoxText` @0xdb1ee4 para caret/composição, ou basta espelhar via `nativeSetTextboxText`?
- Latência de 1 frame entre escrita (UI) e leitura (jogo) não deve causar flicker — mutex curto basta (a confirmar).

**Criar mundo:**
- `createUniqueLevelID` não consulta o storage (só entropia) → pasta “praticamente única”. Se quiser 100%, validar com `ExternalFileLevelStorageSource::isNewLevelIdAcceptable` @0xd9911c.
- Confirmar no device que `startLocalServer` com levelId inexistente **cria** (prova atual é por paridade com `generateLocalGame`, não por execução).
- `createRandomSeed` @0xd22440: confirmar valor retornado (ou usar rand() próprio).
- `dayCycleStopTime=-1` = ciclo normal (confirmar visualmente).
- Chamar com o jogo numa tela custom nossa (chooser vivo) — validar que `pushProgressScreen` sobre nossa pilha não conflita com o overlay.

**Loading:**
- `ScreenView+0x80 = controller`: herdado do pause; já validado na prática pelo StartMenu — confirmar no device junto com o resto.
- A função ~`0x9edaac` (`getPreloadingState`/LocalPlayer) chamada por `getLoadingState` não foi desassemblada; bits (`0x10` pronto, `0x20`, `0x100/0x200` cancelável) inferidos de `tick`/`_isInCancellableState`. Para a barra não importa (basta `st==0x10`→100%).
- **Server-connect:** antes do LocalPlayer existir, `getLocalPlayer()==0` → `pct=0` e estado vem do ramo `2/0x280`; a % só sobe quando o jogador spawna e começa o preload de chunks. Nesse intervalo o útil é o **texto** (`_getProgressMessage`). Comportamento idêntico ao nativo.