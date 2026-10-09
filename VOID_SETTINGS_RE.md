Todos os VAs e símbolos verificados por objdump + grep no SYMS. Nenhuma divergência: as 3 frentes batem. Segue o documento.

---

# VOID_SETTINGS_RE.md — Tela de Opções custom do Void Client (MCPE 0.15.10 VANILLA)

> Alvo: `libminecraftpe.so` armeabi-v7a, Thumb-2, 0.15.10 **vanilla**.
> Tudo abaixo é VA de arquivo. **Chamável** (função Thumb, thiscall, `this` em r0) = `(g_slide + VA) | 1`. **Ponteiro de dado** (`Option*`, vtable) = `g_slide + VA` **sem** o bit Thumb.
> ABI = **softfp** (AAPCS base): float passa em **registrador de núcleo** (r1, r2…), não em VFP. Confirmado no `setGamma` (`vmov d0,r1,r1 ; vstr s0,...`).
> Status de verificação nesta RE: ✅ = conferido por `llvm-objdump`/`grep` no binário nesta sessão. (a confirmar) = inferência ou pendente de teste no device.
> Estes offsets/VA **não valem na 1.1.5** nem em outra versão.

## 0. Macros base (copiar pro libmodclient)

```c
// Thumb function pointer (thiscall: this em r0; demais args r1,r2,...; float em registrador de núcleo)
#define VC_CALL(va)  ((void*)(((uintptr_t)g_slide + (uintptr_t)(va)) | 1u))
// Ponteiro de DADO: Option*/vtable (.bss/.data) — SEM o bit Thumb
#define VC_DATA(va)  ((void*)((uintptr_t)g_slide + (uintptr_t)(va)))
```

---

## 1. Como chegar no objeto `Options` a partir do `g_mc`

✅ `MinecraftClient::getOptions()` @ **0x6c1554** é literalmente `ldr.w r0,[r0,#0x13c] ; bx lr` (conferido: a função termina em `bx lr` @0x6c1558, logo antes de `teardownRenderer` @0x6c155c). Não precisa chamar função:

```c
void* opts = *(void**)((char*)g_mc + 0x13c);   // Options*  (== getOptions())
```

**Gate de VR** (crítico para todos os campos com variante): ✅ `setGamma`/`getGamma` ramificam no byte `opts+0x4c`. Vários setters/getters (gamma, sensibilidade, GUI scale, view distance, auto-jump) escolhem o offset conforme esse byte:

```c
int is_vr = *(uint8_t*)((char*)opts + 0x4c) != 0;   // esperado 0 no A71 (não-VR)
```

- `+0x4c == 0` (celular/normal) → usar os offsets da **coluna "normal"**. (a confirmar no device que é 0)
- `+0x4c != 0` (VR) → gamma `+0x9c`, sens `+0x94`, viewDist `+0xa0`, autoJump `+0xa8`; `getGuiScale` retorna 0.
- Byte `+0xd1` = VR living-room (idem). **Contorno universal:** usar os getters/setters tipados ou `Options::set()`, que tratam a flag sozinhos.

---

## 1.5 GROUND TRUTH — opções REAIS da vanilla 0.15.10 (lidas na tela do A71, 2026-10-06)
A lista "player-facing" inferida mais abaixo estava ERRADA (tinha campos da struct que NAO aparecem na UI). O que a vanilla REALMENTE mostra, em 3 abas (Allan confirmou olhando o jogo):
- **GERAL (picareta):** Nome(texto)*, Entrar no Xbox Live(botão)†, **Volume do Som**(slider), **Dificuldade**(slider 0-3), **Visão 3ª pessoa**(slider), Pacotes de textura(botão "Gerenciar"), [Multijogador:] **Partida multijogador**(toggle), **Transmitir para LAN**(toggle), Transmitir para Xbox Live(toggle)†, **Usar dados de conexão móvel**(toggle).
- **CONTROLES (controle):** **Sensibilidade**(slider), **Inverter Eixo Y**(toggle), **Canhoto**(toggle), **Dividir Controles**(toggle), **Trocar saltar/agachar**(toggle), **Tamanho do botão**(slider), **Pulo Automático**(toggle), Layout do Teclado(botão), Layout do controle(botão), + Comentários.
- **GRÁFICOS (minério):** **Brilho**(slider), **Distância de Renderização**(slider), **Escala de GUI**(slider), **Campo de Visão**(slider), **Gráficos Caprichados**(toggle), **Detalhes do Céu**(toggle), **Movimentos na Visão**(toggle), [Experimental:] **Ocultar GUI**(toggle).
- NAO existe na vanilla: Limite de FPS, Folhas Transparentes, TexelAA, MSAA, Câmera Suave, Vibração ao destruir, Música separada, Fullscreen (eram campos da struct, nao opções da UI).
- `*` Nome vai pra ÁREA VISUAL nossa (skins/cosméticos), nao nas opções. `†` Xbox = EXCLUÍDO (debloat); Realms tbm fora. Os botões (texturas/layouts) = depois, religar pra tela nativa.
- Void Client = 3 abas (Geral/Controles/Gráficos) idênticas, SÓ os toggles/sliders em negrito acima (sem Xbox, sem botões por ora).

## 2. Tabela de settings (base = objeto `Options`)

Offset confirmado em triplo (setter tipado + getter tipado + getter genérico). Prioridade do Allan em **negrito**.

| Setting | Offset (normal / VR) | Tipo | Range | `Option*` descriptor | set/get tipado |
|---|---|---|---|---|---|
| **FOV** (fieldOfView) | `+0xe4` | float (graus) | 30.0–110.0 ✅ (.rodata 0x1546638/0x154663c) | `FIELD_OF_VIEW` 0x16b2248 ✅ | 0x928e60 / 0x928e68 ✅ |
| **Brilho** (gamma) | `+0xe0` / `+0x9c` | float | 0.0–1.0 (a confirmar; sem símbolo MIN/MAX) | `GAMMA` 0x16b21e0 ✅ | 0x928e34 / 0x928e4c ✅ |
| **GUI scale** (tam. botão) | `+0xf8` | int (índice) | 0=Auto, 1..4 (GUI_SCALE_VALUES 0x1546284) | `GUI_SCALE` 0x16b2050 ✅ | 0x928f08 / 0x928f10 ✅ |
| **Sensibilidade** | `+0x58` / `+0x94` | float | 0.0–1.0 (.rodata 0x1546620/0x1546624) | `SENSITIVITY` 0x16b2010 ✅ | 0x927934 / 0x92795c |
| ↳ gameSensitivity (derivada) | `+0x5c` / `+0x98` | float | computada pelo `set()` a partir do slider | — | 0x927978 / 0x927990 |
| **Render distance** (chunks) | `+0x64` / `+0xa0` | int | min ~4; max = `getMaxViewDistanceChunks()` 0x9279d8 ✅ | `VIEW_DISTANCE` 0x16b2018 ✅ | 0x9279b4 / 0x9279c4 |
| **VSync/limite FPS** (limitFramerate) | `+0x6d` | bool (1B) | 0/1 (não há vsync nativo) | `LIMIT_FRAMERATE` 0x16b2030 ✅ | 0x928d04 / 0x928d0c |
| Música | `+0x50` | float | 0.0–1.0 (.rodata 0x1546618/0x154661c) | `MUSIC` 0x16b1ff8 ✅ | 0x927924 / 0x927928 |
| Som | `+0x54` | float | 0.0–1.0 (.rodata 0x1546610/0x1546614) | `SOUND` 0x16b2000 ✅ | 0x92792c / 0x927930 |
| Dificuldade | `+0x88` | int | 0–3 (DIFFICULTY_NAMES 0x16a3064) | `DIFFICULTY` 0x16b2038 ✅ | 0x928df4 / 0x928dfc |
| Perspectiva (1ª/3ª pessoa) | `+0x90` | int | 0/1/2 | `THIRD_PERSON` 0x16b2058 ✅ | 0x928e14 / 0x928e1c |
| Fullscreen | `+0x75` | bool | 0/1 (desktop) | `FULLSCREEN` 0x16b2230 ✅ | 0x928db0 / 0x928db8 |
| Fancy graphics | `+0x6e` | bool | 0/1 | `GRAPHICS` 0x16b2040 ✅ | 0x928d14 / 0x928d1c |
| Inverter Y | `+0x60` | bool | 0/1 | `INVERT_MOUSE` 0x16b2008 ✅ | 0x9279a4 / 0x9279ac |
| Auto-jump | `+0x74` / `+0xa8` | bool | 0/1 | `AUTO_JUMP` 0x16b21e8 ✅ | 0x928d74 / 0x928d90 |
| Esconder GUI | `+0x8c` | bool | 0/1 | `HIDE_GUI` 0x16b2060 ✅ | 0x928e04 / 0x928e0c |
| Câmera suave | `+0xee` | bool | 0/1 | — | 0x928ec8 / 0x928ed0 |
| Canhoto | `+0x72` | bool | 0/1 | `LEFT_HANDED` 0x16b2080 ✅ | 0x928d54 / 0x928d5c |
| Vibração ao destruir | `+0x73` | bool | 0/1 | `DESTROY_VIBRATION` 0x16b2098 ✅ | 0x928d64 / 0x928d6c |
| Folhas transparentes | `+0x6f` | bool | 0/1 | `TRANSPARENTLEAVES` 0x16b2048 ✅ | — |
| **MSAA** ⚠ global extra | `+0xe8` (+ renderer global +0xc) | int | — | `MSAA` 0x16b2250 ✅ | 0x928e70 / 0x928e8c |
| **TexelAA** ⚠ global extra | `+0xec` (+ renderer global +0x31) | bool | 0/1 | `TEXEL_AA` 0x16b2258 ✅ | 0x928e94 / 0x928eb0 |
| Layout de teclado | `+0x78` | int (enum) | — | `KEYBOARD_LAYOUT` 0x16b2220 ✅ | 0x928dc0 / 0x928dc4 |
| Fly speed | `+0xf0` | float | — | — | 0x928ee8 / 0x928ef0 |
| Camera speed | `+0xf4` | float | — | — | 0x928ef8 / 0x928f00 |
| Language | `+0x84` | std::string (gnustl COW) | — | — | setLanguage 0x928ddc |
| Username | `+0xfc` | std::string | — | `NAME` (a confirmar) | setUsername 0x928f20 / 0x928f28 |
| SkinId | `+0x100` | std::string | — | — | 0x928f38 / 0x928f40 |
| [infra] flag VR | `+0x4c` (e `+0xd1`) | byte | 0 = normal | — | — |

> **Descritores genéricos extras** confirmados no SYMS (expansão futura): `PARTICLE_VIEW_DISTANCE` 0x16b2020, `VIEW_BOBBING` 0x16b2028, `FANCY_SKIES` 0x16b20a0, `DPAD_SCALE` 0x16b20a8, `SPLIT_CONTROLS` 0x16b2090, `SWAP_JUMP_AND_SNEAK` 0x16b2228, `USE_TOUCHSCREEN` 0x16b2088, `SERVER_VISIBLE` 0x16b2070, `MULTIPLAYER_GAME` 0x16b2068, `XBOX_LIVE_VISIBLE` 0x16b2078. (offsets de campo dessas = a confirmar)

---

## 3. LER e ESCREVER + aplicar

### 3.1 LER (para posicionar o thumb do slider / estado do toggle)

**Via campo direto** (mais rápido; usar os offsets "normal" após checar `+0x4c==0`):

```c
float fov   = *(float*)  ((char*)opts + 0xe4);
float gamma = *(float*)  ((char*)opts + 0xe0);
int   gui   = *(int*)    ((char*)opts + 0xf8);
float sens  = *(float*)  ((char*)opts + 0x58);
int   rdist = *(int*)    ((char*)opts + 0x64);
int   limitfps = *(uint8_t*)((char*)opts + 0x6d);
int   persp = *(int*)    ((char*)opts + 0x90);
```

**Via getter tipado** (trata a flag VR sozinho — preferir se `+0x4c` incerto):

```c
float fov = ((float(*)(void*))VC_CALL(0x928e68))(opts);   // getFieldOfView
```

**Via API genérica** (dá range + label + estado num só lugar; precisa do `Option*`):

```c
typedef float (*fn_fval)(void* opts, const void* option);
typedef int   (*fn_ival)(void* opts, const void* option);
float v   = ((fn_fval)VC_CALL(0x92b1d4))(opts, VC_DATA(0x16b2248)); // getProgressValue(FIELD_OF_VIEW)
float vmn = ((fn_fval)VC_CALL(0x92a994))(opts, VC_DATA(0x16b2248)); // getProgressMin  ✅ 0x92a994
float vmx = ((fn_fval)VC_CALL(0x92a8fc))(opts, VC_DATA(0x16b2248)); // getProgressMax  ✅ 0x92a8fc
int   iv  = ((fn_ival)VC_CALL(0x92b324))(opts, VC_DATA(0x16b2050)); // getIntValue(GUI_SCALE) ✅
```

Outros acessores genéricos (todos recebem `Option*`): `getBooleanValue` 0x92aa80 ✅, `getStringValue` 0x92b18c, `getValues` 0x92a1ac, `canModify` 0x92a8b8, `getMessage` 0x92a188, `getDescription` 0x92a8ec. Teto do render distance: `getMaxViewDistanceChunks()` 0x9279d8 ✅ (varia por RAM/tier — ler em runtime para limitar o slider).

### 3.2 ESCREVER + APLICAR — caminho recomendado (fiel ao controle nativo)

Os setters tipados são **escrita pura do campo** (✅ `setFieldOfView = str.w r1,[r0,#0xe4]`, `setGuiScale = str.w r1,[r0,#0xf8]`): **não** notificam observer, **não** salvam. O controle nativo (Slider/OptionButton) usa a **API genérica** `Options::set()/toggle()`, que escreve o campo **e** varre o vetor de observers do tipo e dispara o callback do subsistema (áudio/renderer/UI). **Para aplicar como o jogo aplica, use `set()`.**

```c
typedef void (*fn_set_i)(void* opts, const void* opt, int   v);  // Options::set(Option*,int)    @0x92c0cc ✅
typedef void (*fn_set_f)(void* opts, const void* opt, float v);  // Options::set(Option*,float)  @0x92c2dc ✅ (float em r2, softfp)
typedef void (*fn_set_b)(void* opts, const void* opt, int   v);  // Options::set(Option*,bool)   @0x92c240 ✅
typedef void (*fn_set_s)(void* opts, const void* opt, const void* stdstr); // set(Option*,std::string&) @0x92be44 ✅
typedef void (*fn_toggle)(void* opts, const void* opt, int numValues);     // Options::toggle(Option*,int) @0x92b45c ✅

#define SET_I(va,v)  ((fn_set_i)VC_CALL(0x92c0cc))(opts, VC_DATA(va), (v))
#define SET_F(va,v)  ((fn_set_f)VC_CALL(0x92c2dc))(opts, VC_DATA(va), (v))
#define SET_B(va,v)  ((fn_set_b)VC_CALL(0x92c240))(opts, VC_DATA(va), (v))

SET_F(0x16b2248, 85.0f); // FOV           -> +0xe4 (graus)
SET_F(0x16b21e0, 0.5f);  // GAMMA/brilho  -> +0xe0
SET_I(0x16b2050, 2);     // GUI_SCALE     -> +0xf8 (+ relayout via observer)
SET_F(0x16b2010, 0.6f);  // SENSITIVITY   -> +0x58 E recomputa gameSensitivity +0x5c (transform do slider)
SET_I(0x16b2018, 8);     // VIEW_DISTANCE -> +0x64 (OBRIGATÓRIO p/ recarregar chunks)
SET_B(0x16b2030, limitfps); // LIMIT_FRAMERATE -> +0x6d
SET_B(0x16b2230, fscr);     // FULLSCREEN      -> +0x75
SET_I(0x16b2058, persp);    // THIRD_PERSON    -> +0x90
SET_F(0x16b1ff8, music);    // MUSIC -> +0x50 (SoundEngine aplica via observer)
SET_F(0x16b2000, sound);    // SOUND -> +0x54 (idem)
// MSAA/TexelAA: use set() ou o setter tipado (0x928e70/0x928e94) — eles também escrevem um global do renderer.
```

Toggles podem usar `toggle(opt, N)` (cicla N valores) — é o que `OptionButton::toggle` @0x6df3d8 faz (chama `Options::toggle(opt,1)`).

### 3.3 Atalho (escrita direta do campo) — só preview de 2 settings

O jogo relê **FOV** e **gamma** por frame (câmera: `LevelRenderer::getFov` 0xa0d594 ✅ via `tickFov` 0xa067c0 ✅, consumido em `setupCamera` 0xa0b804 ✅; iluminação relê gamma). Então, **só** para esses dois, escrever o campo cru aplica em ≤1 frame:

```c
*(float*)((char*)opts + 0xe4) = novoFov;    // OK preview
*(float*)((char*)opts + 0xe0) = novoGamma;  // OK preview
```

**NÃO** usar escrita direta para (campo cru não basta):
- **Sensibilidade** → o valor que a câmera usa é `gameSensitivity` (+0x5c), que só o `set()` recomputa a partir do slider. Escrever +0x58 sozinho **não** altera a mira.
- **Render distance** → precisa do observer do `LevelRenderer` para rebuild de chunks. Só `set(&VIEW_DISTANCE)`.
- **GUI scale** → precisa relayout (ver 3.4).
- **Música/Som** → `SoundEngine` só atualiza via observer.
- **MSAA/TexelAA** → setter também escreve global do renderer (+0xc / +0x31).

### 3.4 GUI scale (caso especial) — MECANISMO CONFIRMADO

**O guiScale EFETIVO é um GLOBAL, não um campo do HUD.** ✅ Toda a matemática de coordenada do HUD lê dois globais:
- `GuiData::GuiScale` @ **0x16a300c** (`.data`, float) = escala efetiva (1.0/2.0/3.0/4.0/5.0…). GOT GLOB_DAT 0x167d36c.
- `GuiData::InvGuiScale` @ **0x16aecf4** (`.bss`, float) = 1.0/escala. GOT GLOB_DAT 0x167d368.

`GuiData::getGuiScale()` 0x749714 ✅ = `return *GuiData::GuiScale` (ignora o `this`). `getInvGuiScale()` 0x7496c4, `getScreenWidth()` 0x7490ec e `getScreenHeight()` 0x749120 ✅ todos multiplicam por `InvGuiScale`. Ou seja: o `Options::set(GUI_SCALE,idx)` escreve `opts+0xf8` mas **NÃO toca nesses globais** → o HUD segue desenhando na escala velha. É por isso que "muda muito pouco".

**Cadeia que recomputa (do option até o global):** ✅ confirmada por desmontagem + varredura de xref (toda chamada passa por PLT):
1. `MinecraftClient::setUISizeAndScale(int w, int h, float scaleArg)` @ **0x6cdf64** (override virtual de `App::setUISizeAndScale`; é o que a plataforma chama em resize/criação de contexto gráfico). Grava `w→mc+0x40`, `h→mc+0x44`.
2. Se `scaleArg == 0.0f`: lê `Options::getGuiScale(opts)` 0x928f10 ✅ (= `opts+0xf8`, ou 0 se VR `opts+0x4c`) e chama `MinecraftClient::calculateGuiScale(idx)` @ **0x6ce124**. (Se `scaleArg != 0`, pula o option e faz `setGuiScale(scaleArg)` direto.)
3. `calculateGuiScale` ✅ lê `mc+0x40`/`mc+0x44` (tela em px), calcula um índice-base automático por `AppPlatform::getUIScalingRules()` + limiares de tela, **soma o valor do option como offset** (`finalIdx = baseAuto + idxOption`, clamp 0..7, grava baseAuto em `mc+0x48`), indexa a tabela `GUI_SCALE_VALUES` (idx→float) e **chama `GuiData::setGuiScale(float)` @0x749e64 internamente** (6ce352).
4. `GuiData::setGuiScale(scale)` ✅ (float em **r0**, NÃO é thiscall — é função estática sobre globais): `*GuiData::GuiScale = scale; *GuiData::InvGuiScale = 1.0f/scale`.
5. De volta no `setUISizeAndScale`: monta um `Config` via `createConfig(mc)` (6ce034) e dispara o relayout dos subsistemas — `GuiData::onConfigChanged(Config&)` 0x749eb4 no `mc+0x134` (= `getGuiData()`), idem `mc+0x128`, `MobEffectsLayout::onConfigChanged` no `mc+0x14c`, `Options::onScreenSizeChanged` 0x927264, `PixelCalc::setPixelsPerMillimeter` e `forEachVisibleScreen→Screen::setSize`. **Cada alvo tem guarda de null**, então a função é segura fora do jogo (no menu só atualiza os globais e pula os subsistemas inexistentes).

`calculateGuiScale` só é chamada por `setUISizeAndScale` (em Thumb, xref único). `setGuiScale` só por `setUISizeAndScale` e `calculateGuiScale`. **Logo o único gatilho real é `setUISizeAndScale`** — a tela nativa de opções não tem observer de GUI_SCALE que recompute; ela reescala porque a transição/rebuild da tela dispara o resize. Nossa UI custom não dispara nada → precisa forçar.

**FORÇAR (após nosso `SET_I(GUI_SCALE, idx)`), caminho fiel ao resize nativo:**

```c
// Options::set(GUI_SCALE, idx) já escreveu opts+0xf8 e disparou observers.
typedef void (*fn_setui)(void* mc, int w, int h, float scaleArg); // MinecraftClient::setUISizeAndScale @0x6cdf64
void apply_gui_scale_live(void* g_mc){
    int w = *(int*)((char*)g_mc + 0x40);   // largura de tela em px (gravada pelo último resize)
    int h = *(int*)((char*)g_mc + 0x44);   // altura  de tela em px
    // scaleArg = 0.0f => recomputa a partir do option (passo 2 acima). Thread do jogo (hook update/press).
    ((fn_setui)VC_CALL(0x6cdf64))(g_mc, w, h, 0.0f);
}
```

Isto atualiza os globais `GuiScale`/`InvGuiScale` E redispara `GuiData::onConfigChanged` → o HUD in-game reescala na hora. Vale no menu também (sem efeito visível de HUD, mas deixa o global já correto para quando entrar no mundo).

**Alternativa mais enxuta** (só o cálculo + `setSize` das telas visíveis, sem `onConfigChanged`/`onScreenSizeChanged`): `((void(*)(void*,int))VC_CALL(0x6ce124))(g_mc, idxOption);`. Prefira `setUISizeAndScale` (faz tudo que o resize faz).

**Ler a escala efetiva atual:** `float s = *(float*)VC_DATA(0x16a300c);` (GuiData::GuiScale).

> Atenção: o option é **offset sobre o auto**, não valor absoluto — o tamanho final depende da resolução da tela (via `getUIScalingRules` + limiares em `calculateGuiScale`). Idx 0 = puro auto.
> **Entrar num mundo:** a criação do `GuiData` (ctor 0x746a88) **não** recomputa o global (não chama a cadeia acima); o global persiste do último `setUISizeAndScale` (startup/menu/último resize). Então, mudando o option sem forçar, a escala nova só "pega" num resize/recriação de contexto seguinte. Com a chamada forçada acima o valor fica correto e o próximo mundo já herda o global certo.

### 3.5 Persistir em disco

`Options::save()` @ **0x927c74** ✅ serializa **todos** os campos em `options.txt`. Não dispara observer; não é necessário para aplicar em tela. Chamar **1x ao fechar nossa tela de opções**:

```c
((void(*)(void*))VC_CALL(0x927c74))(opts);   // Options::save()
```

**Resumo por tipo:** APLICAR = `set()/toggle()` (campo + observer); PERSISTIR = `save()`. Os setters tipados individuais são só write cru (equivalem ao `set()` **sem** observer) — não precisa chamá-los, exceto MSAA/TexelAA.

> **Thread:** sempre chamar na **thread do jogo** (hooks `update`/`press`), nunca na de render.

---

## 4. Detecção da tela de Opções + controles a replicar

### 4.1 Detecção (teste C)

✅ `OptionsScreen` é tela **CLÁSSICA** (`Screen`), **não** MVC. `ScreenChooser::pushOptionsScreen(bool,int)` @0x8706c8 empilha `make_shared<OptionsScreen>` + `_pushScreen` — o topo da pilha é a própria OptionsScreen. ✅ `vtable for OptionsScreen` @ **0x160571c**; vptr de runtime = `g_slide + 0x1605724` (vtable+8, confirmado pelo ctor @0x850c74: `add r1,r0,#8 ; str r1,[r4]`).

```c
#define OPTS_VPTR 0x1605724u   // vtable 0x160571c + 8
static int onOptionsScreen(void* mc){
    void* scr = topScreen(mc);                 // mesmo topScreen do menu lateral
    return scr && *(void**)scr == (void*)((uintptr_t)g_slide + OPTS_VPTR);
}
```

Para abrir a nativa a partir do nosso menu (se quiser): `pushOptionsScreen(chooser, false, 0)` — o `int` é a categoria inicial (0 = primeira aba; a confirmar).

Ciclo/refs da tela nativa (hook/estudo): `render` 0x8526a4, `_buttonClicked` 0x852f80 ✅ (só roteia categoria/ids 2..5; **não** mexe em setting), `ctor` 0x850c74, `init` 0x851ca8, `selectCategory` 0x852210 ✅, `generateOptionScreens` 0x853008 ✅, `_generateOptionScreensDefault` 0x85303c, `_rebuildGameOptions` 0x854d28 ✅, `createCategoryButtons` 0x856f98 ✅, `createCategoryButton` 0x857410, `getScreenName` 0x857d74, `handleTextChar` 0x856f00, `_pointerPressed` 0x85478c.

### 4.2 Controles que a tela nativa mostra (p/ replicar)

Construídos por categoria em `_generateOptionScreensDefault` 0x85303c via `OptionsGroup::createProgressSlider` 0x6e509c / `createStepSlider` 0x6e5310 / `createToggle` 0x6e4af8 / `createTextBox` 0x6e47cc. Widget = tipo do valor; offset/accessor confirmados; **agrupamento por aba = a confirmar** (não desmontei a função inteira). Lista player-facing:

- **Controls:** Sensibilidade (progress, +0x58) · Inverter Y (toggle, +0x60) · Auto-jump (toggle, +0x74) · SwapJumpAndSneak (toggle) · SplitControls (toggle) · Canhoto (toggle, +0x72) · DestroyVibration (toggle, +0x73) · UseTouchScreen (toggle) · KeyboardLayout (step/enum, +0x78).
- **Vídeo/Graphics:** **FOV** (progress 30–110, +0xe4) · **Brilho** (progress, +0xe0) · **GUI scale** (step int, +0xf8) · **Render distance** (step int, +0x64) · FancyGraphics (toggle, +0x6e) · FancySkies (toggle) · ViewBobbing (toggle) · TransparentLeaves (toggle, +0x6f) · AnimateTextures (toggle) · (Fullscreen/HideGUI podem não aparecer no pocket).
- **Áudio:** Música (progress 0–1, +0x50) · Som (progress 0–1, +0x54).
- **Geral/Game:** Dificuldade (enum 0–3, +0x88) · Language (textbox/picker, +0x84) · (Perspectiva +0x90 costuma ser gesto in-game, não item de menu).
- **Multiplayer:** Username (textbox, +0xfc) · ServerVisible/MultiplayerGame/XboxLiveVisible (toggles).

Strings de rótulo confirmadas no SYMS (`OptionStrings::Graphics_FieldOfView`, `Graphics_Gamma`, `Graphics_GuiScale`, `Controls_Sensitivity`, etc., 0x16b2318–0x16b2494) — úteis para casar nossos labels com os nativos.

---

## 5. Plano: UI custom por cima + riscos + open questions

### 5.1 Plano de implementação (no overlay GLES2 que já substitui o menu)

1. **Abrir:** detectar clique em "Opções" no nosso menu lateral e desenhar nosso painel (não precisa instanciar Slider/OptionButton nativos). A tela nativa pode continuar existindo ou não — nossa UI lê/escreve o objeto `Options` direto.
2. **Montar os controles:** no `onEnter` do nosso painel, `opts = *(void**)(g_mc+0x13c)`; checar `+0x4c==0`; para cada setting, ler o valor atual (3.1) para posicionar thumb/estado. Para ranges de slider, ler `getProgressMin/Max` do `Option*` (FOV 30–110 vem daí; não chumbar).
3. **Interação:** enquanto arrasta FOV/gamma → escrita direta do campo (preview ao vivo, 3.3). **Ao soltar** → chamar `set()` com o `Option*` certo (3.2) para disparar o observer e, em sensibilidade/render dist/áudio/GUI scale/MSAA, efetivar de verdade. Para toggles/steps/enums → `set()`/`toggle()` no clique.
4. **Fechar:** `Options::save()` 1x.
5. **GUI scale:** após `set()`, se o layout não reescalar sozinho, chamar `setUISizeAndScale` ou re-push.

### 5.2 Riscos

- **Thread errada:** chamar `set()`/`save()` fora da thread do jogo corrompe estado. Amarrar aos hooks `update`/input.
- **Flag VR `+0x4c`:** se for != 0 (improvável no A71), todos os offsets "normal" lidos cru estão errados. Mitigação já embutida: usar getters/setters tipados ou `set()`.
- **Escrita direta de sensibilidade** não altera a mira (gameSensitivity +0x5c não recomputa) — bug silencioso clássico. Usar `set()`.
- **`g_slide` em `Option*`:** descritores são `.bss` construídos no static-init; `g_slide+VA` **sem** `|1`. Sanidade rápida: comparar `&Option` passado vs o que o `set()` carrega do GOT.
- **MSAA/TexelAA:** campo cru perde o global do renderer → sem efeito. Usar setter/`set()`.

### 5.3 Open questions (teste no device)

1. Confirmar `*(uint8_t*)(opts+0x4c) == 0` no A71 (valida os offsets "normal": sens +0x58, gamma +0xe0, viewDist +0x64, autoJump +0x74, guiScale +0xf8).
2. Range do **gamma/brilho**: sem símbolo MIN/MAX no .rodata (ao contrário de FOV/sens/som). Assumido 0.0–1.0; ler `getProgressMin/Max` do `Option* GAMMA` em runtime para o range real.
3. **GUI scale:** ✅ RESOLVIDO (ver 3.4). Não há observer de GUI_SCALE que recompute; o único gatilho é `setUISizeAndScale` 0x6cdf64 → `calculateGuiScale` 0x6ce124 → `GuiData::setGuiScale` (globais `GuiData::GuiScale` 0x16a300c / `InvGuiScale` 0x16aecf4). Forçar com `setUISizeAndScale(mc, *(mc+0x40), *(mc+0x44), 0.0f)`. Semântica: option é OFFSET sobre um índice-auto derivado da tela (0=auto puro), não valor absoluto.
4. **Volumes:** confirmar que `set(MUSIC/SOUND)` aplica ao vivo via SoundEngine (esperado) — se não, investigar `registerFloatObserver`.
5. **Save:** gatilho nativo exato (por mudança vs ao fechar) não fixado por xref; nosso `save()` ao fechar é idempotente e seguro.
6. **Agrupamento por aba** fiel exige desmontar `_generateOptionScreensDefault` 0x85303c inteiro resolvendo cada `Option*` via GOT (R_ARM_GLOB_DAT); a lista por tipo/offset (seção 4.2) está confirmada, só a categoria de cada item é (a confirmar).
7. **Strings** (username/language): editar direto exige respeitar layout gnustl `_Rep` (len em `data-12`); preferir `setUsername` 0x928f20 / `setLanguage` 0x928ddc (fazem o assign COW correto).