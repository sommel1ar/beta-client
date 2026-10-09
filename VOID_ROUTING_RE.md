Tudo confirmado no binário. Segue o documento.

---

# VOID_ROUTING_RE.md

**Void Client — MCPE 0.15.10 VANILLA (armeabi-v7a, Thumb-2)**
Spec pronto-pra-codar: religar os botões do menu lateral (Jogar / Mundos / Opções / Voltar) nas ações REAIS do jogo, chamando funções do `libminecraftpe.so` direto — sem passthrough de toque.

- **LIB:** `C:\modulo\minecraft\_emu32\mcpe-vanilla\lib\armeabi-v7a\libminecraftpe.so`
- **SYMS:** `C:\modulo\minecraft\_launcher\re\syms_0151.txt`
- **Pré-requisitos já prontos no launcher:** `g_mc` (`MinecraftClient*`, cacheado no hook de `MinecraftClient::update` @`0x6c9c9c`), `g_slide` (viés de carga da lib), `topScreen(mc)`.
- **ABI:** Thumb-2, thiscall (this em `r0`, demais em `r1/r2/...`). Endereço chamável = `(g_slide + VA) | 1` (bit Thumb).

> **Nota de procedência.** Todos os VA/opcodes abaixo marcados com ✔RE foram re-conferidos por `llvm-objdump` + grep no `syms_0151.txt` nesta sessão (não é só repasse do relatório). Inferências estão marcadas `(a confirmar)`.

---

## 0. Macro de chamada e endereçamento

```c
#include <stdint.h>
#include <stdbool.h>

// Endereço Thumb chamável a partir do VA de arquivo.
#define VC_CALL(va) ((void*)(((uintptr_t)g_slide + (uintptr_t)(va)) | 1u))
```

- `g_slide` já é derivado de um símbolo `.text` (`dlsym` de `MinecraftClient::update` mascarando o bit Thumb) e o loader Android aplica **um único viés** a todos os `PT_LOAD` — portanto o MESMO `g_slide` vale para `.text` (funções) e para `.data` (vtables). Já comprovado no device (o gate `ScreenView` em `g_slide+0x160681c` funciona).
- **Alternativa** (opcional, mais robusta se o símbolo estiver no `.dynsym`): `dlsym(g_mcpe, mangled)` já retorna com o bit Thumb setado — nesse caso **não** aplicar `| 1`.

---

## 1. Como trocar de tela (Jogar/Mundos → PlayScreen; Opções → OptionsScreen)

### 1.1 Ponto de entrada de TODA navegação: o `ScreenChooser`

```c
// MinecraftClient::getScreenChooser() const  @0x6cc6b4
//   ✔RE corpo literal:  ldr.w r0,[r0,#0x198] ; bx lr   -> return *(mc+0x198)
static inline void* vc_chooser(void* g_mc){
    return *(void**)((char*)g_mc + 0x198);   // == getScreenChooser(g_mc)
}
```

Não precisa chamar a função — o campo pode ser lido direto. `_ZNK15MinecraftClient16getScreenChooserEv` @`0x6cc6b4` confirmado no SYMS.

### 1.2 As três primitivas de navegação (todas AUTO-CONTIDAS)

Cada uma constrói a tela inteira (new + ctor) e empilha via `ScreenChooser::_pushScreen`. **Nada de alocar/`new` do nosso lado.**

| Ação | Mangled | VA | this / args |
|---|---|---|---|
| Jogar / Mundos | `_ZN13ScreenChooser19pushLocalPlayScreenEb` | `0x86feac` | `(chooser, bool anim)` |
| Opções | `_ZN13ScreenChooser17pushOptionsScreenEbi` | `0x8706c8` | `(chooser, bool, int)` |
| Voltar ao menu | `_ZN13ScreenChooser18setStartMenuScreenEv` | `0x866bd0` | `(chooser)` |
| Sair do mundo | `_ZN13ScreenChooser19setLeaveLevelScreenEv` | `0x87530c` | `(chooser)` |

Todos confirmados no SYMS (`0086feac`, `008706c8`, `00866bd0`, `0087530c`). Primitivo interno `ScreenChooser::_pushScreen(shared_ptr<BaseScreen>,bool)` @`0x864080` — **não chamar direto**.

### 1.3 Prova de que replicamos EXATAMENTE o botão nativo

`MinecraftScreenModel::navigateToPlayScreen()` @`0x83818c` ✔RE disassembly:

```
83818c: ldr   r0,[r0,#0xc]          ; r0 = *(model+0xc) == MinecraftClient*
838190: blx   0x59f4c8 (.plt)       ; -> MinecraftClient::getScreenChooser(client)
838196: movs  r1,#0x0               ; bool = false
838198: pop   {r11,lr}
83819c: b.w   <veneer>              ; tail-call -> ScreenChooser::pushLocalPlayScreen
```

Ou seja: **`navigateToPlayScreen == pushLocalPlayScreen(getScreenChooser(client), false)`**. Como já temos `g_mc`, chamar `pushLocalPlayScreen(vc_chooser(g_mc), false)` é **byte-idêntico** ao botão Play nativo. Idêntico para `navigateToOptionsScreen(bool,int)` @`0x8381a0` → `pushOptionsScreen` e `navigateToStartScreen` @`0x838108` → `setStartMenuScreen` (os três no SYMS).

> **Correção do `INTERFACES_RE.md`:** o doc dizia "`MinecraftScreenModel+0xc == ScreenChooser*`". ERRADO. `model+0xc == MinecraftClient*`; o chooser sai de `getScreenChooser(client)`. Não há telemetria escondida.

### 1.4 Qual é a tela de "mundos" na 0.15.10

- **PlayScreen MVC** (abas Worlds/Friends/Servers): é um `ScreenView` hospedando `PlayScreenController` (vtable `0x1602bf0`, vptr `0x1602bf8`) + `PlayScreenModel`. Fábrica: `createScreen<PlayScreenModel,PlayScreenController>` @`0x870128` (SYMS). **"Jogar" e "Mundos" abrem a MESMA PlayScreen** — não existe tela "só-mundos" separada.
- `ChooseLevelScreen` (lista clássica legada, vtable `0x1601f50`) existe no binário mas o menu MVC **NÃO a usa**.
- `PlaySpaceScreen` @`0x85ff88` é VR/holográfico — **descartado**.
- **OptionsScreen** é tela CLÁSSICA (`Screen`), vtable `0x160571c`. `pushOptionsScreen` já faz o `new`+ctor internamente — não precisa do ctor `_ZN13OptionsScreenC2ER15MinecraftClientbi` @`0x850c74`.

### 1.5 Código C de navegação (drop-in)

```c
typedef void (*fn_pushPlay)(void* sc, bool anim);     // 0x86feac
typedef void (*fn_pushOpts)(void* sc, bool b, int i); // 0x8706c8
typedef void (*fn_setStart)(void* sc);                // 0x866bd0
typedef void (*fn_setLeave)(void* sc);                // 0x87530c

// Botão JOGAR e botão MUNDOS -> mesma PlayScreen MVC
void vc_open_play(void* g_mc){
    ((fn_pushPlay)VC_CALL(0x86feac))(vc_chooser(g_mc), false);  // false = igual ao nativo
}
// Botão OPÇÕES (do menu inicial)
void vc_open_options(void* g_mc){
    ((fn_pushOpts)VC_CALL(0x8706c8))(vc_chooser(g_mc), false, 0); // menu:(false,0) | pause:(true,0)
}
// Voltar ao menu inicial (p/ botão "Voltar" das telas que empilharmos)
void vc_back_to_menu(void* g_mc){
    ((fn_setStart)VC_CALL(0x866bd0))(vc_chooser(g_mc));
}
```

**Regra de thread:** chamar SEMPRE na **thread do jogo** (contexto dos hooks de `update` / `press` / `release`), NUNCA na thread de render (`swapBuffers`). Disparar **1x por clique** — a troca pode ser aplicada no próximo frame pelo engine (`MinecraftClient::updateScheduledScreen` @`0x6cc280`); não re-chamar.

> **Fora de escopo de "trocar de tela":** se "Mundos" um dia for ENTRAR direto num mundo, isso é ação do model (`PlayScreenModel::_startLocalWorld(int)` @`0x8416e8` / `startWorld` @`0x84139c`) — exige o `PlayScreenModel` vivo e o índice do mundo, não é navegação.

---

## 2. Como ler as coords de toque (sem hookar `handlePointerLocation`)

### 2.1 Caminho PRINCIPAL — ler 2 floats de `g_mc` (recomendado)

`MinecraftClient::handlePointerLocation(short x, short y)` @`0x6c3680` grava as coords, **sem escala**, em dois campos float do próprio MC. ✔RE disassembly do final da função:

```
6c36ac: vmov d16, r5, r5          ; r5 = 2o short (y)
6c36b0: vmov d17, r6, r6          ; r6 = 1o short (x)
6c36b4: vcvt.f32.s32 d1, d17      ; s2 = (float)x
6c36b8: vcvt.f32.s32 d0, d16      ; s0 = (float)y
6c36bc: vstr s2, [r4,#560]        ; mc+0x230 = (float)X   (560 = 0x230)
6c36c0: vstr s0, [r4,#564]        ; mc+0x234 = (float)Y   (564 = 0x234)
```

Ordem **X em `mc+0x230`, Y em `mc+0x234`** confirmada (1º short→x, 2º short→y).

```c
// coords do ponteiro corrente, em PIXELS de cliente (raw, sem GuiScale)
float tx = *(float*)((char*)g_mc + 0x230);  // X
float ty = *(float*)((char*)g_mc + 0x234);  // Y
```

**Validação forte — o próprio jogo lê esses campos no press.** `MinecraftClient::handlePointerPressedButtonPress()` @`0x6c170c` ✔RE:

```
6c1714: ldr.w r0,[r4,#0x214]
6c1718: vldr  s0,[r4,#560]        ; lê mc+0x230 (X)
6c171c: vldr  s2,[r4,#564]        ; lê mc+0x234 (Y)
6c1720: vstr  s0,[sp]             ; monta glm::vec2{x,y} na pilha
6c1724: vstr  s2,[sp,#4]
6c1728: blx   0x597fc8 (.plt)     ; consumidor (picking) em mc+0x214
```

Logo `mc+0x230/0x234` **são a coord autoritativa** que o jogo usa no clique. Ler no nosso `h_press` = exatamente onde/quando o jogo vai agir.

- **Unidade = PIXELS de cliente (raw).** Prova: `ScreenViewAdapter::getScreenPosFromClient` @`0x8ac0ac` pega os mesmos shorts e multiplica por GuiScale para virar coord de UI ("ScreenPos"); o MC guarda o valor "Client" sem escala. Se o overlay desenha em pixels de tela, comparar direto; se desenha em unidades de UI, aplicar GuiScale.
- **Sem clobber:** `mc+0x230/0x234` só é escrito em `_initMinecraftClient()` @`~0x6bff7e` (zera 1x) e em `handlePointerLocation` @`0x6c36bc` (a cada move/location, que precede cada press). No `h_press` já está atualizado.
- **NUNCA chamar o orig de `handlePointerLocation`** (crasha). O caminho principal é só leitura — nenhuma chamada necessária.

### 2.2 Caminho ALTERNATIVO — global `Multitouch::_pointers` (só se precisar de multitouch por id)

`Multitouch::_pointers` @`0x1733368` (`.bss`) = array de 12 `MouseDevice`, passo `0x28` (40 bytes). Layout de cada `MouseDevice` (de `getX`/`getY`/`feed`): `+0x04`=X atual (short px), `+0x06`=Y atual (short px), `+0x0c/+0x0e`=anteriores, `+0x10..0x13`=botões (índice 1 = dedo/left).

```c
typedef int (*fn_firstId)(void);   // Multitouch::getFirstActivePointerIdEx @0x1200688 (SYMS)
int id = ((fn_firstId)VC_CALL(0x1200688))();   // -1 se nenhum dedo
if (id >= 0) {
    char* p = (char*)(g_slide + 0x1733368) + id * 40;  // &_pointers[id]
    short x = *(short*)(p + 0x04);   // == MouseDevice::getX @0x11ffa74
    short y = *(short*)(p + 0x06);   // == MouseDevice::getY @0x11ffa7c
    // dedo ativo tambem: *(uint8_t*)(p + 0x11) != 0
}
// Sem chamar funcao: varrer id=0..11; se *(uint8_t*)(p+0x11)!=0 -> ler p+0x04 / p+0x06.
```

`getFirstActivePointerIdEx` @`0x1200688`, `getX` @`0x11ffa74`, `getY` @`0x11ffa7c` confirmados no SYMS. Coord short = mesmo espaço de pixel que o float do MC.

**Recomendação:** use o caminho **2.1** (leitura de `g_mc+0x230/0x234`). O 2.2 só se o produto exigir distinguir dedos por id.

---

## 3. Gate refinado — StartMenu-only

### 3.1 Base confirmada (✔RE)

- `*(ScreenView+0x80)` = o controller (ponteiro cru). `ScreenView::getController()` @`0x8a3048` ✔RE corpo literal: `ldr.w r0,[r0,#0x80] ; bx lr`.
- vtable `ScreenView` @`0x1606814` → **vptr = +8 = `0x160681c`** (gate atual, já validado no device).
- vtable `StartMenuScreenController` @`0x1603234` → **vptr = +8 = `0x160323c`**.
- Cadeia provada: `createScreen<MinecraftScreenModel,StartMenuScreenController>` @`0x874edc` + `new_allocator<ScreenView>::construct<...,shared_ptr<StartMenuScreenController>&,...>` @`0x880bc4` → o topo do menu inicial é um `ScreenView` com `*(SV+0x80)->vtable == StartMenuScreenController`.
- A "lista de mundos após Jogar" que o gate atual captura por engano é **MVC PlayScreen** (também `ScreenView`), controller `PlayScreenController` vptr `0x1602bf8` (fábrica `createScreen<PlayScreenModel,PlayScreenController>` @`0x870128` + `construct<...,shared_ptr<PlayScreenController>&,...>` @`0x884534`). É a tela que o refino precisa EXCLUIR.

> **Cuidado:** `SV+0x80`=controller e `SV+0x84`=ctrl-block do `shared_ptr` **não têm relação** com `mc+0x80`/`mc+0x84` (que são `_M_start`/`_M_finish` do vector de telas do `MinecraftClient`, usados pelo `topScreen`).

### 3.2 Gate de 2 níveis (drop-in; substitui `onMenu()`)

```c
#define SV_VPTR   0x160681cu   // vtable ScreenView + 8        (shell MVC)
#define SMC_VPTR  0x160323cu   // vtable StartMenuScreenController + 8

static int onStartMenu(void* mc) {
    void* scr = topScreen(mc);                                   // = ScreenView* se for MVC
    if (!scr) return 0;
    if (*(void**)scr != (void*)(g_slide + SV_VPTR)) return 0;    // (1) topo e ScreenView (shell MVC)
    void* ctrl = *(void**)((char*)scr + 0x80);                  // (2) getController() == *(scr+0x80)
    if (!ctrl) return 0;
    return *(void**)ctrl == (void*)(g_slide + SMC_VPTR);         // (3) controller == StartMenu
}
// No my_update: trocar  g_uiAtiva = onMenu(mc);  por  g_uiAtiva = onStartMenu(mc);
```

### 3.3 Log de confirmação no device (expandir o LOG existente)

```c
if ((g_upd++ % 120) == 0) {
    void* scr   = topScreen(mc);
    unsigned v  = scr ? (unsigned)((uintptr_t)*(void**)scr - g_slide) : 0;
    void* ctrl  = (v == 0x160681cu && scr) ? *(void**)((char*)scr + 0x80) : 0;
    unsigned cv = ctrl ? (unsigned)((uintptr_t)*(void**)ctrl - g_slide) : 0;
    LOG("update scr=%p vptr=0x%x ctrl=0x%x start=%d", scr, v, cv, g_uiAtiva);
}
// Esperado: no menu inicial -> ctrl=0x160323c. Play -> 0x1602bf8.
```

### 3.4 Tabela de identidade de telas (futuro: desenhar UI própria em cada uma)

**Telas MVC** (vptr do topo == `0x160681c`; discriminar pelo controller em `scr+0x80`):

| Controller | vptr runtime | Tela |
|---|---|---|
| StartMenuScreenController | `g_slide+0x160323c` | menu inicial |
| PlayScreenController | `g_slide+0x1602bf8` | lista de mundos (Jogar) |
| GeneralSettingsScreenController | `g_slide+0x16027f8` | ajustes MVC |
| PauseScreenController | `g_slide+0x1602b84` | pause MVC |

(vtables no SYMS: `0x16027f0`, `0x1602b7c`; +8 = vptr.)

**Telas CLÁSSICAS** (o vptr do TOPO já é o próprio — comparar `*(void**)topScreen` direto):

| Tela | vptr runtime |
|---|---|
| OptionsScreen (ajustes clássico) | `g_slide+0x1605724` |
| ChooseLevelScreen (lista clássica) | `g_slide+0x1601f58` |
| PauseScreen (pause clássico) | `g_slide+0x1605954` |

(vtables no SYMS: `0x160571c`, `0x1601f50`, `0x160594c`.)

**Alternativa robusta** (sem ler offsets): hookar `StartMenuScreenController::tick()` @`0x7e09b8` ou `::_registerBindings()` @`0x7e01ac` e marcar/desmarcar `g_uiAtiva` pela janela de vida do controller.

---

## 4. Plano de integração — `onClick` por botão + como o gate some ao navegar

### 4.1 No `h_press` (thread do jogo), por clique

```c
// Pseudo-fluxo no hook de press:
if (g_uiAtiva) {                                   // so com StartMenu vivo (gate do item 3)
    float tx = *(float*)((char*)g_mc + 0x230);     // item 2.1
    float ty = *(float*)((char*)g_mc + 0x234);
    int btn = vc_hit_test(tx, ty);                 // rects do nosso overlay (pixels de cliente)
    if (btn != VC_BTN_NONE) {
        switch (btn) {
            case VC_BTN_JOGAR:
            case VC_BTN_MUNDOS: vc_open_play(g_mc);    break;  // 1.5
            case VC_BTN_OPCOES: vc_open_options(g_mc); break;
            case VC_BTN_VOLTAR: vc_back_to_menu(g_mc); break;
        }
        return; // NAO repassar o toque ao jogo (evita o crash do passthrough)
    }
}
// senao: deixa o press original seguir
```

- **Jogar** e **Mundos** → `vc_open_play` (mesma PlayScreen; abas Worlds/Friends/Servers).
- **Opções** → `vc_open_options` com `(false, 0)`.
- **Voltar** (nas telas que empilharmos) → `vc_back_to_menu`.
- Disparar **1x** e **retornar** (consumir o toque); não chamar o orig de `handlePointerLocation`.

### 4.2 Como o gate "some" ao navegar — automático

Depois de `vc_open_play` / `vc_open_options`, o topo deixa de satisfazer `onStartMenu()`:

- **Play (MVC):** topo continua `ScreenView` (nível 1 passa), mas o controller em `scr+0x80` vira `PlayScreenController` (`0x1602bf8`) → nível 3 falha → `onStartMenu()` = 0.
- **Options (clássica):** o próprio vptr do topo vira `OptionsScreen` (`0x1605724`) ≠ `ScreenView` → nível 1 falha → `onStartMenu()` = 0.

Em ambos os casos `g_uiAtiva` cai sozinho no próximo `update` — o menu lateral **não cobre** a tela nova, sem código extra de teardown. Ao voltar (`setStartMenuScreen` ou o botão nativo), o topo volta a ser `ScreenView`+`StartMenuScreenController` e `g_uiAtiva` volta a 1.

> Como a troca pode ser diferida ao próximo frame (`updateScheduledScreen` @`0x6cc280`), o `g_uiAtiva` pode levar 1 frame para cair — aceitável (overlay recalcula todo frame).

---

## 5. Riscos + open questions (a confirmar no device)

1. **Semântica do `bool` de `pushLocalPlayScreen`:** `navigateToPlayScreen` passa `false` (✔RE). Provável "animar entrada" ou "mostrar Realms". Usar `false` (fiel ao nativo). *(a confirmar)*
2. **Args `(bool,int)` de `pushOptionsScreen` do menu inicial:** pause usa `(true,0)`; `bool` provavelmente "renderGameBehind / há jogo atrás", `int` = categoria inicial. Do menu, usar `(false,0)`. *(a confirmar)*
3. **"Jogar" vs "Mundos":** na 0.15 MVC ambos caem na MESMA PlayScreen. Se o produto quiser "Mundos" entrando direto num mundo, é `PlayScreenModel::_startLocalWorld(int)` @`0x8416e8` / `startWorld` @`0x84139c` (exige o model vivo + índice) — fora do escopo de navegação. *(decisão de produto)*
4. **Timing do empilhamento:** `_pushScreen` pode aplicar no mesmo frame ou enfileirar (`updateScheduledScreen`). Não muda a chamada, só o timing do redraw e do gate cair. Disparar 1x por clique. *(a confirmar)*
5. **Gate após navegar:** validar no device o log `ctrl=0x160323c` no menu inicial e `ctrl=0x1602bf8` na PlayScreen (confirma a aritmética `g_slide` aplicada a `.data` de ponta a ponta — já comprovada para `ScreenView`). *(a confirmar)*
6. **UI de Pause viva na 0.15.10:** clássica (`PauseScreen` vptr `0x1605954`) ou MVC (`PauseScreenController` vptr `0x1602b84`). Só importa quando formos desenhar UI no pause — ler o vptr do topo ao abrir o pause resolve. *(a confirmar)*
7. **Caller de `handlePointerLocation`:** não há `BL` direto no `.text` (dispatch indireto/virtual). Irrelevante para ler a coord — o jogo LÊ `mc+0x230/0x234` no press (✔RE), garantindo que o campo está atualizado por toque. *(a confirmar por sanidade: que em toque, não só mouse, o campo atualiza — esperado por design, pois `MinecraftClient` é o único client e toque é a única fonte de ponteiro no 0.15 Android)*
8. **`.dynsym` para `dlsym+8`:** verificar se as vtables (`_ZTV*`) estão no `.dynsym` para permitir `dlsym(g_mcpe, "_ZTV25StartMenuScreenController")+8` em vez da aritmética de slide. Se não estiverem, manter o slide (já comprovado). *(opcional)*

---

**Resumo de símbolos (todos no SYMS / ✔RE nesta sessão):** `getScreenChooser`@`0x6cc6b4` · `pushLocalPlayScreen`@`0x86feac` · `pushOptionsScreen`@`0x8706c8` · `setStartMenuScreen`@`0x866bd0` · `setLeaveLevelScreen`@`0x87530c` · `navigateToPlayScreen`@`0x83818c` · `handlePointerLocation`@`0x6c3680` (grava `mc+0x230/0x234`) · `handlePointerPressedButtonPress`@`0x6c170c` (lê `mc+0x230/0x234`) · `ScreenView::getController`@`0x8a3048` (`*(SV+0x80)`) · vtables `ScreenView`@`0x1606814`, `StartMenuScreenController`@`0x1603234`, `PlayScreenController`@`0x1602bf0` · `Multitouch::getFirstActivePointerIdEx`@`0x1200688` · `MouseDevice::getX/getY`@`0x11ffa74`/`0x11ffa7c` · `Multitouch::_pointers`@`0x1733368`.