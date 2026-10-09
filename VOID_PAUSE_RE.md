All load-bearing claims verified against the binary this session (popScreen byte-exact, renderGameBehind/isPauseScreen return 1, PauseScreen::render has zero calls into the level-renderer range, vtable addresses, getScreenChooser=+0x198). Producing the synthesis.

---

# VOID_PAUSE_RE.md — Tela de PAUSE custom (MCPE 0.15.10 VANILLA, armeabi-v7a / Thumb-2)

> Alvo: `libminecraftpe.so` em `C:\modulo\minecraft\_emu32\mcpe-vanilla\lib\armeabi-v7a\`. SYMS: `C:\modulo\minecraft\_launcher\re\syms_0151.txt`.
> Objetivo: suprimir o menu de pause NATIVO (não desenhar), deixar a **gameplay aparecer atrás**, e por cima a nossa UI de pause semi-transparente, com 3 botões religados: **Voltar ao Jogo**, **Opções**, **Sair do Mundo**.
> Convenção: só fato aterrado (VA/símbolo real). Inferência marcada `(a confirmar)`.
> **Verificado nesta sessão por `llvm-objdump` + grep nos SYMS:** `popScreen` byte-a-byte, `renderGameBehind`/`isPauseScreen` retornam 1, `PauseScreen::render` sem nenhuma chamada ao `LevelRenderer`, endereços de vtable, `getScreenChooser = *(mc+0x198)`.

---

## 0. Pré-requisitos / helpers (já existem no launcher)

```c
// g_mc    : MinecraftClient*  (cacheado no hook de MinecraftClient::update @0x6c9c9c)
// g_slide : base de carga da libminecraftpe.so
#define VC_CALL(va)   ((void*)(((uintptr_t)g_slide + (va)) | 1u))   // bit Thumb

// getScreenChooser(mc) = *(mc+0x198)   [confirmado: MinecraftClient::getScreenChooser @0x6cc6b4]
static inline void* vc_chooser(void* mc){ return *(void**)((char*)mc + 0x198); }

// topScreen(mc) = *( *(mc+0x84) - 8 )  [confirmado: MinecraftClient::getScreen @0x6cd680]
static inline void* topScreen(void* mc){
    void* fin = *(void**)((char*)mc + 0x84);
    return fin ? *(void**)((char*)fin - 8) : 0;
}
```

---

## 1. Detectar o pause

### Qual tela a 0.15.10 usa (provado por RE)
O pause é escolhido em `ScreenChooser::pushPauseScreen` @0x872474 (e na variante `pushPausePrevScreen` @0x872c38), que **ramifica em `GameStore::isTrial()`** (PLT 0x598130, GOT 0x1682a70):

- `isTrial()==0` → **jogo pago/full (caso do Allan)** → fábrica `make_shared<PauseScreen>(client,bool,bool)` (GOT 0x1688364 / PLT 0x5a8c0c) → **PauseScreen CLÁSSICA**.
- `isTrial()!=0` → trial/demo → `createScreen<MinecraftScreenModel,PauseScreenController>` @0x872808 (GOT 0x1688360) → **pause MVC** (`PauseScreenController`).

Ambos empilham via `ScreenChooser::_pushScreen` @0x864080 **por cima** do `InGamePlayScreen` (stack, não replace).

**Conclusão:** no APK vanilla completo, o pause in-game é a **PauseScreen clássica**. O caminho MVC só ocorre em trial → tratar como *fallback*.
`(a confirmar no device)` que `GameStore::isTrial()==0` no aparelho do Allan — logar `*(void**)topScreen(mc)` quando o pause abrir (esperado `g_slide+0x1605954`); se der `g_slide+0x160681c` (ScreenView), é build trial e cai no MVC.

### vptr runtime (grounded nos SYMS)

| Símbolo | vtable @ | vptr runtime (+8) |
|---|---|---|
| `vtable for PauseScreen` | 0x160594c | **0x1605954** (clássico) |
| `vtable for ScreenView` | 0x1606814 | **0x160681c** (shell MVC) |
| `vtable for PauseScreenController` | 0x1602b7c | **0x1602b84** (controller MVC) |

### Teste C

```c
#define PAUSE_CLASSIC_VPTR 0x1605954u  // PROVÁVEL: pause clássico (jogo full)
#define SV_VPTR            0x160681cu  // shell MVC (ScreenView)
#define PSC_VPTR           0x1602b84u  // controller MVC (só trial)

static int onPauseScreen(void* mc){
    void* scr = topScreen(mc);
    if(!scr) return 0;
    void* vp = *(void**)scr;
    if(vp == (void*)((uintptr_t)g_slide + PAUSE_CLASSIC_VPTR)) return 1;   // (A) clássico
    if(vp == (void*)((uintptr_t)g_slide + SV_VPTR)){                       // (B) MVC (trial)
        void* ctrl = *(void**)((char*)scr + 0x80);                        // ScreenView::getController == *(SV+0x80)  (a confirmar o +0x80 no device)
        return ctrl && *(void**)ctrl == (void*)((uintptr_t)g_slide + PSC_VPTR);
    }
    return 0;
}
```

**Alternativa robusta** (não depende do endereço de vtable, só do ramo clássico): após confirmar que **não** é ScreenView, chamar o slot `isPauseScreen` em `vptr+0xa8` — retorna **1** na `PauseScreen` (`PauseScreen::isPauseScreen` @0x85e91c, **verificado: `movs r0,#1; bx lr`**) e **0** na base (`AbstractScreen::isPauseScreen` @0x74f068). Útil se o slide/offset da vtable precisar mudar entre builds.

---

## 2. Suprimir o render nativo do pause (mantendo o mundo)

### Qual função pular
**`PauseScreen::render(int,int,float)` @0x85d200** (slot vtable+0xdc, reloc @0x1605a30).

**Verificado nesta sessão:** desassemblei todo o corpo (0x85d200→antes de `_pointerPressed` @0x85d950) e **todas** as `bl/blx` resolvem para stubs PLT (`0x597xxx`–`0x5a8xxx`) ou saltos indiretos (`blx r1/r2/r3`) — **nenhuma** chamada para a faixa `0xa0xxxx` do `LevelRenderer`. Ela desenha SÓ UI 2D:
- a **dim** semi-transparente via `vtable[+0xf4]` = `Screen::renderBackground`,
- `std::string`s de título/lista de players (PLT ctor 0x597218) desenhadas por `Font::drawString` (PLT 0x59a4c4),
- e os botões (base).

Pular `render()` → somem **dim + título + players + botões nativos**. O mundo não é tocado.

### Por que o mundo continua (confirmado)
- O pause é empilhado por `_pushScreen` @0x864080 **acima** do `InGamePlayScreen`, que fica vivo embaixo.
- O mundo 3D vem do `InGamePlayScreen::_renderLevel(float)` @0x81255c → `LevelRenderer::renderLevel` @0xa0ec18 (passe **separado**, **antes** da tela).
- `PauseScreen::renderGameBehind()` @0x85e920 **= 1** (**verificado: `movs r0,#1; bx lr`**) e `InGamePlayScreen::renderGameBehind()` @0x811bf8 = 1 → o engine mantém a(s) tela(s) de baixo renderizando atrás do pause.
- O frame roda por `GameRenderer::render` @0x9e976c sobre um render-graph (`GameRenderer::createRenderGraph` @0x9e926c) com nós **distintos** para nível 3D e UI 2D.

→ Suprimir `PauseScreen::render` remove apenas os widgets 2D do pause; **mundo + HUD** continuam vindos de baixo. A dim nativa some junto (bom: o Allan desenha a própria overlay semi-transparente por cima).

### Opção A — inline-hook no entry (RECOMENDADA)
Cobre **todos** os call paths (igual aos hooks de input já usados), imune ao GOT.

```c
typedef void (*fn_pauseRender)(void* self, int mx, int my, float dt);
static fn_pauseRender orig_pauseRender; // trampolim para g_slide+0x85d200

static void my_pauseRender(void* self, int mx, int my, float dt){
    // self É sempre uma PauseScreen (é o override dela). Se a nossa UI de pause está ativa, NÃO desenha o nativo.
    if(g_uiAtiva) return;                  // g_uiAtiva já inclui onPauseScreen() (ver §4)
    orig_pauseRender(self, mx, my, dt);
}
// hook em g_slide+0x85d200
```

### Opção B — patch de vtable (cirúrgico, só afeta PauseScreen)
Escrever um stub no-op no slot `render(int,int,float)` em `g_slide+0x1605a30`.
**Cuidado:** há também um call site via **GOT.plt em `g_slide+0x1688000`** apontando para o mesmo método; se usar patch de slot, patchear essa entrada do GOT **também**. Por isso a Opção A (entry) é mais segura. `(a confirmar)` se o orquestrador chama `PauseScreen::render` só pela vtable ou também pelo GOT.plt.

### NÃO fazer
- **Não** hookar `Screen::render(ScreenContext&)` @0x861574 (wrapper base de TODAS as telas clássicas — `setupForRendering` + `this->render(int,int,float)[+0xdc]` + `cleanupForRendering`) → sumiria toda tela.
- **Não** hookar `renderBackground` genérico. Usar o override próprio da PauseScreen @0x85d200.

### Fallback MVC (trial, improvável)
Suprimir `ScreenView::render(ScreenContext&)` @0x89e1b0 (ou `ScreenView::setupAndRender(UIScreenContext&)` @0x89e2d0) **gateado** por `*(SV+0x80)->vptr == g_slide+0x1602b84`, senão sumiria toda tela MVC. `(a confirmar)` que `ScreenView::renderGameBehind` @0x8a2b80 retorna 1 para o pause (senão a supressão tiraria o mundo). Irrelevante no jogo full.

---

## 3. Resume / Opções / Sair (sequência C, dado `g_mc`)

### Voltar ao Jogo (RESUME)
**Primitiva confirmada byte-a-byte** — `MinecraftClient::popScreen(int)` @0x6cd664:
```
ldr.w r2,[r0,#0x1cc] ; add r1,r2 ; str.w r1,[r0,#0x1cc] ; bx lr
```
Ou seja `mc->[0x1cc] += n` — **contador de pops diferido**, aplicado no próximo frame por `updateScheduledScreen` @0x6cc280 → `_popScreen(bool)` @0x6cd22c. **Universal** (opera na pilha do MC, serve clássico E MVC).

Prova de que é o botão nativo: `PauseScreen::_buttonClicked` @0x85dda4, handler do botão em `this+0xa4`, faz `popScreen(getScreenChooser(mc), this, 1)` via `ScreenChooser::popScreen(AbstractScreen&,int)` @0x863f0c — que é um shim fino que **descarta a &tela** e cai em `MinecraftClient::popScreen(mc,1)`. Confirmação cruzada: `LocalPlayer::closeScreen` @0x93bd88 e `handleBackEvent` @0x85e014 (BACK → `_buttonClicked(field_a4)`).

```c
// RESUME recomendado (direto, dispensa chooser e ponteiro da tela):
typedef void (*fn_mcPop)(void* mc, int n);
static void vc_resume(void* g_mc){ ((fn_mcPop)VC_CALL(0x6cd664))(g_mc, 1); }

// Alternativa fiel ao botão nativo (equivalente):
typedef void (*fn_scPop)(void* sc, void* absScreen, int n);
static void vc_resume_fiel(void* g_mc){
    ((fn_scPop)VC_CALL(0x863f0c))(vc_chooser(g_mc), topScreen(g_mc), 1);
}
```

### Opções (nossa tela de Opções, contexto de pause)
`ScreenChooser::pushOptionsScreen(bool,int)` @0x8706c8, chamado **(chooser, true, 0)**.
O `bool=true` (≠ do menu inicial, que usa `false,0`) sinaliza "há jogo atrás / renderGameBehind" → a OptionsScreen também renderiza o jogo atrás, fiel ao nativo.
```c
typedef void (*fn_pushOpts)(void* sc, int b, int i);  // bool b
static void vc_options(void* g_mc){
    ((fn_pushOpts)VC_CALL(0x8706c8))(vc_chooser(g_mc), 1, 0);
}
```

### Sair do Mundo
`ScreenChooser::setLeaveLevelScreen()` @0x87530c — **sem diálogo de confirmação**. Constrói uma `LeaveLevelScreen` (tela opaca de transição, `renderGameBehind` @0x832fd8 = 0) e substitui a tela. `LeaveLevelScreen::tick` @0x83301c, após 1 frame, descarrega o nível (`[level+0x208]=1`) e tail-calls `setStartMenuScreen` @0x866bd0 → mundo descarregado → menu inicial.
```c
typedef void (*fn_setLeave)(void* sc);
static void vc_quit_world(void* g_mc){ ((fn_setLeave)VC_CALL(0x87530c))(vc_chooser(g_mc)); }
```

### Mapa completo dos botões nativos (referência — `PauseScreen::_buttonClicked` @0x85dda4)
id clicado = `[button+0x64]`, comparado contra `[this+0xNN]`:

| Slot | Ação | Chamada |
|---|---|---|
| `+0xa4` | **Voltar ao Jogo** | `popScreen(chooser, this, 1)` → `popScreen(mc,1)` |
| `+0xac` | **Sair do Mundo** | `setLeaveLevelScreen()` @0x87530c |
| `+0xb4` | **Opções** | `pushOptionsScreen(chooser, true, 0)` @0x8706c8 |
| `+0xbc` | Convidar (MP) | `pushInviteScreen()` |
| `+0xc4` | Comprar (só `isTrial`) | `GameStore::purchaseGame` |
| `+0xcc` | Exportar mundo | `PauseScreen::_exportLevel()` @0x85dec0 |
| `+0xd4` | Conquistas (se flag `[this+0x9e]`) | `pushAchievementScreen()` |

---

## 4. Input no pause (clássico vs MVC) e cobertura do swallow/gate

**Caminho CLÁSSICO** (o do jogo full):
- `MinecraftClient::handlePointerPressedButtonPress` @0x6c170c lê **X=`*(float*)(mc+0x230)`, Y=`*(float*)(mc+0x234)`**, monta vec2, tenta roteador em `mc+0x214`; se não consumir, despacha ao topo via `topScreen->vtable[0x58](1)`.
- A `PauseScreen` clássica tem `_pointerPressed(int,int)` @0x85d950 e `_pointerReleased(int,int)` @0x85db6c (Screen clássica).
- O hook MVC `ScreenViewAdapter::handlePointerLocation` @0x8ac05c **não** entra no caminho da pause clássica.

→ **O swallow atual já cobre o input do pause** (os hooks em `handlePointerPressedButtonPress/Release` já existem; coords `mc+0x230/0x234` seguem válidas, setadas por `handlePointerLocation` independente da tela). **Falta só ampliar o gate** para incluir a PauseScreen clássica:

```c
// no my_update (thread do jogo):
g_uiAtiva = onStartMenu(mc) || onPauseScreen(mc) || onOptionsScreen(mc);
```

Com `g_uiAtiva` cobrindo o pause, os toques são engolidos (não vazam pro jogo nem pros botões nativos) e ficam disponíveis pra nossa UI de pause.

---

## 5. Plano de implementação + riscos + open questions

### Plano
1. **Gate:** adicionar `onPauseScreen(mc)` a `g_uiAtiva` (§1 + §4). É o que ativa swallow de input e a condição de supressão/overlay.
2. **Supressão do render nativo:** inline-hook em `g_slide+0x85d200` (`PauseScreen::render`); quando `g_uiAtiva`, `return` sem chamar orig (Opção A, §2). Resultado: mundo + HUD continuam atrás (confirmado), some todo o pause nativo (incl. a dim).
3. **Overlay próprio:** no nosso passe GLES2 (o mesmo do menu/opções), quando `onPauseScreen(mc)`, desenhar:
   - um quad **semi-transparente** full-screen (dim nossa, no lugar da nativa que foi suprimida) — gameplay vaza por baixo;
   - os 3 botões (Voltar ao Jogo / Opções / Sair do Mundo), estilo dark+roxo/JetBrains Mono como o resto do Void.
4. **Religar os botões** (hit-test nas coords `mc+0x230/0x234`, 1 ação por clique, consumindo o toque):
   - Voltar ao Jogo → `vc_resume(g_mc)` (`popScreen(mc,1)` @0x6cd664);
   - Opções → `vc_options(g_mc)` (`pushOptionsScreen(chooser,true,0)` @0x8706c8) — cai na nossa tela de Opções já existente;
   - Sair do Mundo → `vc_quit_world(g_mc)` (`setLeaveLevelScreen` @0x87530c).

### Regras de chamada (iguais às da navegação — VOID_ROUTING_RE)
- Chamar tudo na **thread do jogo** (contexto `update`/`press`), **nunca** no `swapBuffers`/render.
- **1 disparo por clique** e retornar/consumir o toque. `popScreen` **soma** no contador `mc+0x1cc`: chamar N vezes = pop de N telas (saltaria o jogo).
- Nada de `new`/`delete` nosso; o engine aplica push/pop.
- Após `vc_resume`/`vc_quit_world`, no frame seguinte `onPauseScreen(mc)` para de casar → overlay some sozinho e o tick retoma.

### Riscos
- **Vtable patch (Opção B)** quebraria se o GOT.plt `0x1688000` não for patcheado junto → usar inline-hook (A).
- **Clique duplo** no Resume poderia estourar a pilha (`mc+0x1cc += 2`) → debounce/consumir o toque. `(a confirmar)` se `updateScheduledScreen` faz clamp de `n > pilha`.
- **Sair sem confirmação:** `setLeaveLevelScreen` descarrega o mundo direto. Se quisermos um "tem certeza?", é UI nossa antes de chamar.

### Open questions (a confirmar no device)
1. `GameStore::isTrial()==0` no APK do Allan (esperado full → pause clássico). Logar `*(void**)topScreen(mc)` quando o pause abrir: esperado `g_slide+0x1605954`.
2. Offset `ScreenView::getController == *(SV+0x80)` e `ScreenView::renderGameBehind` @0x8a2b80 → 1, **só** relevantes se cair no MVC (trial).
3. Com `PauseScreen::render` pulado, confirmar que o **HUD/hotbar** de baixo aparece como desejado (é efeito do `InGamePlayScreen`). Se o Allan quiser esconder o HUD também, é tratamento separado — **não** é efeito automático da supressão do pause.
4. Semântica do `int=1` em `popScreen` confirmada como contador (`+=`); validar resume limpo (não fecha telas demais) no device.
5. Caminho exato do tick single-player que congela na presença de tela não-gameplay não foi desassemblado (só o mecanismo push/pop simétrico). Irrelevante pro fluxo (nós chamamos as primitivas), mas `(a confirmar)` o VA do gate se precisarmos replicar o freeze. Em multiplayer não há freeze real (overlay local).