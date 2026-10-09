# Design de Alteração das Interfaces — Launcher MCPE 0.15.10 (VANILLA, armeabi-v7a / Thumb-2)

> **Binário de referência:** `C:\modulo\minecraft\_emu32\mcpe-vanilla\lib\armeabi-v7a\libminecraftpe.so`
> **Fonte dos endereços:** `C:\modulo\minecraft\_launcher\re\syms_0151.txt` + objdump (síntese das 6 frentes de RE).
> **Convenção:** todo endereço é VA. Em Thumb, ponteiro de função chamável = **endereço + 1** (ex.: `popScreen` = `0x863f0c` → `0x863f0d` para `blx`/ponteiro). vptr do objeto = símbolo `vtable for X` **+ 8**.
> **Marcação:** endereços sem anotação vieram aterrados dos achados; o que é inferência está marcado **(a confirmar)**.

---

## 1. Abordagem geral

A estratégia é **sobreposição opaca com religamento por função real** — não reescrever o engine de UI, e sim pintar a NOSSA interface por cima da tela nativa e, nos cliques, chamar as mesmas funções que o jogo chamaria.

Três pilares:

1. **Detectar qual tela está no topo** da pilha de telas do `MinecraftClient` (seção 2).
2. **Desenhar por cima** reaproveitando o renderer 2D nativo (`ScreenRenderer`), hookando o `render` da própria tela (seção 3).
3. **Engolir o toque** nos pontos de entrada do `MinecraftClient` e **religar** nos handlers reais (`_buttonClicked` clássico / `navigateTo*` MVC / `ScreenChooser`) (seções 4 e 5).

### Por que é FPS-neutro

A garantia não é "gated", é **custo zero real** fora da UI:

- O engine só chama `render(int,int,float)` / `setupAndRender` **da tela que está no TOPO da pilha**. Em jogo (sem menu aberto), `PauseScreen::render`/`OptionsScreen::render` **nunca são chamadas** → nosso código literalmente não executa na render thread.
- Os hooks de **input** (`handlePointer*`) só disparam quando há evento de toque — nunca por frame. O guarda é um único load de bool: `if(!g_uiAtiva) return orig(args);`.
- **Não** hookamos `eglSwapBuffers` (seção 3) nem um render global por-frame para a UI de menu — ambos rodariam todo frame e exigiriam gate, além de, no swap, o estado GL não estar na projeção/material de GUI.
- Telas de menu já setam `absorbsInput` (`Screen::absorbsInput` @`0x8639d0`), então o jogo já suprime input in-game enquanto a tela está ativa.

Para overlay **em jogo** (HUD sempre-ligado), que é o único caso que roda por-frame, há duas opções neutras (seção 3): empurrar uma tela própria só quando aberta, ou hook com early-out de 1 bool em `InGamePlayScreen::render` @`0x811afc`.

---

## 2. Detecção da tela ativa

### 2.1 Pilha de telas e ponteiro do topo

`MinecraftClient` guarda `vector<shared_ptr<AbstractScreen>>`:
- `MC+0x80` = `_M_start`, `MC+0x84` = `_M_finish` (stride 8 por entrada: `[0]`=ptr cru, `[4]`=control block).
- **Obter o topo:** `MinecraftClient::getScreen() const` @`0x6cd680` faz `ldr r0,[MC+0x84]; ldr r0,[r0,#-8]; bx lr`. Overload não-const em @`0x6c175c` (idêntico). Ambos retornam o `AbstractScreen*` do topo.
- **Guarda obrigatória:** antes de desreferenciar, checar `MC+0x80 == MC+0x84` (pilha vazia) — é exatamente o que `getScreenName` @`0x6cfb04` faz.

### 2.2 Detector universal — `getScreenName()` virtual

- `getScreenName()` é **virtual no slot vtable +0xCC** (provado no dispatch de `MinecraftClient::getScreenName` @`0x6cfb04`: `ldr r2,[topo]; ldr r2,[r2,#0xcc]; blx r2`).
- Funciona para telas **clássicas E MVC** (o `ScreenView` MVC tem seu próprio `getScreenName` @`0x8a7190`).
- Strings identificadoras na `.rodata`:

| Tela | String | Addr |
|---|---|---|
| Screen (base) | `"screen"` | `0x1523aa3` |
| ChatScreen | `"chat_screen"` | `0x151f4b7` |
| PauseScreen | `"pause_screen"` | `0x1523a5b` |
| OptionsScreen | `"options_screen"` | `0x1523965` |
| BaseScreen (fallback MVC) | `"base_screen"` | `0x151f3f2` |

- **Menu principal:** **(a confirmar)** — não foi achada literal `"start_menu"`/`"main_menu"` na `.rodata`; o nome vem do controller via `ScreenView::getScreenName` @`0x8a7190` (`[SV+0x80]`→`vtable[+0x4c]`). Confirmar logando `getScreen()->getScreenName()` no device.

### 2.3 Detector por vtable (mais rápido, sem alocar string)

Comparar `*(void**)screen` com o endereço de runtime da vtable. As vtables são símbolos exportados (`D vtable for X`); pegar via `dlsym` **+ 8**. Os slots ficam zerados no `.so` (relocs resolvidos no load), mas o endereço-base serve para comparação de identidade.

| Classe | `vtable for X` (VA) | vptr do objeto (+8) |
|---|---|---|
| AbstractScreen | `0x16013c8` | `0x16013d0` |
| Screen | `0x1605dbc` | `0x1605dc4` |
| BaseScreen | `0x16019cc` | `0x16019d4` |
| ScreenView | `0x1606814` | `0x160681c` |
| ChatScreen | `0x1601c3c` | `0x1601c44` |
| **PauseScreen** | `0x160594c` | `0x1605954` |
| **OptionsScreen** | `0x160571c` | `0x1605724` |
| **StartMenuScreenController** | `0x1603234` | `0x160323c` |

### 2.4 Caso especial: MENU PRINCIPAL é MVC

Não existe classe `StartMenuScreen` — o objeto no topo é um **`ScreenView`** (vtable única para TODAS as telas MVC), então não dá para distinguir por vtable da view. A identidade vem do **controller**. Três opções:

- **(a)** ler `[ScreenView+0x80]` (= controller) e comparar sua vtable com `_ZTV25StartMenuScreenController`+8 = `0x160323c`;
- **(b)** comparar `getScreenName`;
- **(c) [recomendado p/ design por-símbolo]** hookar métodos do próprio `StartMenuScreenController` (`tick` @`0x7e09b8` / `_registerBindings` @`0x7e01ac`) — só rodam quando o menu está vivo.

### 2.5 Detector barato de Pause

`AbstractScreen::isPauseScreen() const` @`0x74f068` (virtual, retorna false); `PauseScreen` sobrescreve @`0x85e91c` (retorna true).

### 2.6 Hierarquia (resumo)

```
AbstractScreen (vtable 0x16013c8)
├── Screen (vtable 0x1605dbc)  ── telas CLÁSSICAS (render imperativo)
│     ├── PauseScreen, OptionsScreen, ChatScreen, ChestScreen, InventoryScreen, ...
└── BaseScreen (vtable 0x16019cc)  ── shell MVC
      └── ScreenView (vtable 0x1606814)  ── carrega {ScreenController + MinecraftScreenModel}
            └── StartMenu / Play / Store / SkinPicker / Achievement / Invite / Language (controllers)
```
> **(a confirmar)** ScreenView deriva de BaseScreen (deduzido de `createScreen` construir ScreenView e devolver `shared_ptr<BaseScreen>`). Offsets `[ScreenView+0x80]=controller` / `[ScreenView+0x88]=model/NameRegistry` lidos do disasm — validar no device.

> **ATENÇÃO (0.15.10 em migração):** `Settings` → `OptionsScreen` **clássica** (ainda `GuiElement`/`Button`/`_buttonClicked`); `Pause` existe na forma **clássica** (`PauseScreen` com `_buttonClicked` @`0x85dda4`) **e** há `PauseScreenController` (createScreen @`0x872808`, vtable `0x1602b7c`). **Confirmar em runtime** qual está viva lendo o vptr em `*(MC+0x84)-8` — existe toggle de debug `handleToggleEnableNewScreensDebugButtonPress` @`0x6c234c`. O ENGOLIR (seção 4) funciona nos dois casos; o RELIGAR muda.

---

## 3. Ponto de desenho (reuso do renderer nativo)

### 3.1 Onde hookar

| Alvo | Hook de render | Observação |
|---|---|---|
| **PAUSE** (clássica) | `PauseScreen::render(int,int,float)` @`0x85d200` | hook por-tela, FPS-neutro |
| **OPÇÕES** (clássica) | `OptionsScreen::render(int,int,float)` @`0x8526a4` | hook por-tela, FPS-neutro |
| **MENU PRINCIPAL** (MVC) | `ScreenView::render(ScreenContext&)` @`0x89e1b0` ou `setupAndRender(UIScreenContext&)` @`0x89e2d0` | filtrar pelo controller StartMenu |
| HUD em jogo (opcional) | `InGamePlayScreen::render(ScreenContext&)` @`0x811afc` | por-frame; early-out `if(!g_overlay)` |
| base clássica | `Screen::render(ScreenContext&)` @`0x861574` (chama o `render(int,int,float)` da subclasse) | **(a confirmar)** finding paralelo cita base `Screen::render` @`0x86159c` |

No hook: **(A)** chamar o original e desenhar por cima (nativo por baixo), ou **(B)** pular o original e desenhar 100% nosso (substituição total — continua 1 passe de UI/frame, igual ao que havia).

### 3.2 Por que dá para reusar o renderer sem GL próprio

`PauseScreen::render` @`0x85d200` lê `MinecraftClient*` de `[this+0x14]`, fontes de `[this+0x60]`/`[this+0x5c]`, layout de `[this+0x0C]`/`[this+0x10]` e chama os helpers de texto/fill — **provando que o material de GUI + projeção ortográfica já estão montados** quando `render(int,int,float)` roda. Por isso o hook deve ser no render de tela, **nunca em `eglSwapBuffers`** (import `U` da libEGL; no swap o estado GL não é o de GUI).

### 3.3 `ScreenRenderer` — primitivas prontas

Singleton @`0x74cd0c` (ponteiro cacheado em `0x16aee48`). **Os métodos de desenho NÃO usam o `this`** — operam sobre `Tessellator::instance` (`0x16b58a8`) e `ScreenRenderer::mScreenMaterials` (`0x16aee4c`) — logo são chamáveis mesmo sem `ScreenRenderer*` válido, **desde que dentro do passe de render de GUI**.

| Primitiva | Addr | Uso |
|---|---|---|
| `fillGradient(int,int,int,int,Color&,Color&)` | `0x74e914` | **retângulo sólido** (c1==c2, alpha=1 = fill opaco) |
| `fillGradient(float,...)` | `0x74e9c4` | versão float |
| `fillHorizontalGradient` | `0x74ea44` | gradiente horizontal |
| `drawRect(int,int,int,int,Color&,int)` | `0x74eb8c` | **(a confirmar)** último `int` é somado a y0 — pode ser contorno/espessura, não fill. Preferir `fillGradient` para preencher |
| `drawRect(...Color×4,int)` | `0x74ed84` | gradiente 2D por canto |
| `drawString(Font*,string&,int,int,Color&)` | `0x74dffc` | texto (tail-call p/ Font::draw) |
| `drawCenteredString(Font*,string&,int,int,Color&)` | `0x74dfac` | texto centralizado em x |
| `blit(TexturePtr&,int×8,MaterialPtr*)` | `0x74e108` | textura (coords int) |
| `blit(TexturePtr&,float...)` | `0x74e334` | textura (coords float) |
| `blitRaw(TexturePtr&,...)` | `0x74ef60` | blit com UVs normalizadas |
| `reloadResources(TextureGroup&)` | `0x74cd40` | se formos registrar textura própria |

Atlases já carregados: `guiTex` `0x16aeea0`, `touchGuiTex` `0x16aeeb0`, `touchGui2Tex` `0x16aeec0`, `spritesheetTex` `0x16aeed0`.

### 3.4 Fonte, dimensões e cor

- **Font*:** `MinecraftClient::getFont()` @`0x6cd724` = `*(Font**)(client+0x70)` (runeFont = `+0x74`). Também em `screen+0x60` (e `screen+0x5c`). Baixo nível: `Font::draw(string&,float,float,Color&,bool)` @`0x7427e0`, `drawShadow` @`0x742804`.
- **Dimensões (coords GUI):** `GuiData::getScreenWidth()` @`0x7490ec`, `getScreenHeight()` @`0x749120`, `getGuiScale()` @`0x749714`; `MinecraftClient::getGuiScale(int)` @`0x6cde24`. **(a confirmar)** cadeia client→GuiData fora de uma tela; dentro de uma tela clássica use os campos de tamanho da própria Screen.
- **Color** = struct `{float r,g,b,a}` (16 bytes; `Color::toARGB` @`0x11f4fd0`). Globais prontos: `WHITE` `0x1732d20`, `BLACK` `0x1732d40`, `GREY` `0x1732d30`, `RED` `0x1732d50`.

### 3.5 Receita concreta (painel opaco + título)

```c
// dentro de um hook de render de tela:
ScreenRenderer::fillGradient(0,0, W,H, &Color::BLACK, &Color::BLACK); // W/H de GuiData
Font* f = *(Font**)(client+0x70);  // ou *(Font**)(screen+0x60)
ScreenRenderer::drawCenteredString(f, titulo, W/2, y, &Color::WHITE);
ScreenRenderer::blit(guiTex, dstx,dsty,w,h, srcx,srcy,sw,sh, nullptr); // arte de botão
```

### 3.6 Caminho MVC (menu principal)

No `ScreenView::render`/`setupAndRender` há `UIRenderContext*` disponível: `MinecraftUIRenderContext::fillRectangle(RectangleArea&)` @`0xa25dec`, `drawImage` @`0xa254d8`. Alternativa: reusar as mesmas primitivas de `ScreenRenderer` da seção 3.3.

---

## 4. Roteamento de input (engolir + religar)

### 4.1 Cadeia do toque (sistema clássico, usado por Chat/Pause/Options)

```
MotionEvent (app glue) → Multitouch::feed @0x1200558 → InputHandler::tick @0x11fd0d8
  → MinecraftClient (handlePointer*) → Screen ativa (vtable) → _pointerPressed/Released
  → Button::clicked → _buttonClicked(Button&) = AÇÃO REAL
```

### 4.2 ENGOLIR — hookar no nível MinecraftClient (recomendado)

Três funções exportadas, hookáveis por **NOME** via `MSHookFunction`:

| Função | Addr | Papel |
|---|---|---|
| `handlePointerLocation(short,short)` | `0x6c3680` | move/drag; guarda x,y em `MC+0x230`/`+0x234` (float) |
| `handlePointerPressedButtonPress()` | `0x6c170c` | toque desce (primário) |
| `handlePointerPressedButtonRelease()` | `0x6c3540` | toque sobe (primário) |

No hook: `if(!g_uiAtiva) return orig(args);`. Com UI ativa, ler x,y (em *location* vêm nos args; em *press/release* ler `MC+0x230`/`+0x234`), fazer hit-test da NOSSA UI e **retornar sem chamar orig** — assim nem a tela nativa (vtable+0x58), nem o in-game (`MC+0x134`), nem o InputHandler (`MC+0x128`) recebem o toque.

**ENGOLIR TOTAL (cinto de segurança p/ pausa com mundo atrás / multi-dedo):** hook em `Multitouch::feed(char,char,short,short,int)` @`0x1200558` (sink mais baixo, pointerId 0..11). Com UI ativa, não chamar orig → zero toque no engine. Custo: perde o tracking nativo, faça o seu. Para menu/options puros é dispensável (a tela já faz `absorbsInput`).

### 4.3 Dispatch dentro da tela clássica (para entender o caminho)

- `Screen::handlePointerPressed(bool)` @`0x863ac4` (vtable **+0x58**) → `Screen::_handlePointerAction(x,y,pressed)` @`0x863430` (converte coords brutas→GUI via escala em `screen+0x0c`/`+0x10`) → `vtable[+0x124]`=`_pointerPressed` ou `vtable[+0x128]`=`_pointerReleased`.
- `Screen::_pointerPressed` @`0x8634f8`: varre GuiElements, hit-test, grava o elemento pressionado em `screen+0x64`.
- `Screen::_pointerReleased` @`0x86370c`: para o elemento == `screen+0x64`, chama `Button::clicked` (`elem vtable[+0x6c]` @`0x6da8d0`); se true → `vtable[+0x11c]`=`_buttonClicked(Button&)`. **Aqui a ação dispara.**
- **Não** hookar `Button::pointerReleased` @`0x6dac78` — é VAZIO (`bx lr`).

### 4.4 Slots de vtable

| Slot | Método |
|---|---|
| +0x54 | `handlePointerLocation(short,short)` |
| +0x58 | `handlePointerPressed(bool)` |
| +0xCC | `getScreenName()` **(provado por dispatch)** |
| +0x104 | `supppressedBySubWindow()` (escolhe lista de elementos a varrer) |
| +0x11c | `_buttonClicked(Button&)` |
| +0x120 | `_guiElementClicked(GuiElement&)` |
| +0x124 | `_pointerPressed(int,int)` |
| +0x128 | `_pointerReleased(int,int)` |

> **Discrepância entre frentes (a confirmar):** a frente de input reporta esses slots como *confirmados por relocação R_ARM_ABS32*; a frente de framework reporta os slots como *zerados no `.so` (relocs packed, não lidos estaticamente)*, com **apenas +0xCC provado por dispatch**. **Resolução de design:** usar **hook por NOME de símbolo** (`MSHookFunction`), que dispensa índices de vtable inteiramente. Só resolver o mapa completo de slots se optarmos por vtable-swizzle em runtime — e, nesse caso, ler a vtable já relocada no device.

### 4.5 RELIGAR — chamar a ação real

**Opção 1 (mais fiel, clássico):** a partir do nosso botão, pegar a tela viva e chamar `_buttonClicked` passando um `Button` que a própria tela já possui:

1. `screen = getScreen()` (@`0x6cd680` / `0x6c175c`);
2. confirmar o tipo (comparar `*(void**)screen` com `vtable+8`, ex. Pause = `0x1605954`);
3. pegar um `Button*` membro da tela (ex. PauseScreen `+0xa4`=resume, `+0xac`, `+0xb4`, …);
4. chamar `screen->vtable[+0x11c](screen, *button)` = `_buttonClicked(Button&)`. Ele casa pelo ID em `Button+0x64` e tail-calla o handler exato (reproduz o tap, incluindo gating e guard nativos).

> Estrutura `Button` (ctor @`0x6da390`): `+0x60`=msg (`std::string` COW), `+0x64`=ID (int), `+0x68`=bool. `GuiElement+0x04`=mActive.

**Opção 2 (botão sintético):** construir `Button` com o ID desejado (`Button::Button(int,string,bool)` @`0x6da390`) e passar p/ `_buttonClicked`. Evitar — exige saber IDs numéricos por tela.

**Opção 3 (navegação / MVC):** quando o botão deve TROCAR de tela, usar `ScreenChooser` (seção 5.4) ou, no menu MVC, as `navigateTo*` do model (seção 5.1).

### 4.6 Ações diretas úteis (atalhos do MinecraftClient)

- `handlePauseButtonPress()` @`0x6c1770` — abrir pause
- `handleInventoryButtonPress()` @`0x6c1908` — abrir inventário
- `handleChatButtonRelease()` @`0x6c1834` — abrir chat
- `handleBack(bool)` @`0x6cbdc8` — botão Voltar (Android back)
- `_popScreen(bool)` @`0x6cd22c` — fechar tela atual

---

## 5. Por tela

### 5.1 MENU PRINCIPAL — prioridade 1

**É MVC (data-driven), não clássico.** Fabricado por `createScreen<MinecraftScreenModel,StartMenuScreenController>` @`0x874edc` e posto na tela por `ScreenChooser::setStartMenuScreen()` @`0x866bd0`. **Não existe `_buttonClicked`** — os botões são ligados por NOME HASHEADO em `_registerBindings`, e cada handler chama uma `MinecraftScreenModel::navigateTo*`.

**Descartadas** (NÃO são o menu): `PlaySpaceScreen` (VR, ctor @`0x85ff88`), `ChooseLevelScreen` (lista clássica de mundo, ctor @`0x769c40`), `CubemapBackgroundScreen` (fundo panorâmico, ctor @`0x7f6100`, `renderCubemap` @`0x7f7488`).

**Símbolos do controller:**

| Símbolo | Addr | Papel |
|---|---|---|
| ctor `StartMenuScreenController(shared_ptr<MinecraftScreenModel>)` | `0x7df568` | guarda o model* |
| `_registerBindings()` | `0x7e01ac` | liga botões por hash |
| `_registerEventHandlers()` | `0x7df724` | handlers de evento |
| `tick()` | `0x7e09b8` | "menu ativo" (detecção) |
| `_fetchInviteCount()` | `0x7e0c18` | contador de convites |
| vtable | `0x1603234` | identidade do menu |

**Religamento (alvos `MinecraftScreenModel::navigateTo*`):** cada uma faz `ldr r0,[this+0xc]` (= `ScreenChooser*`) e tail-branch. Logo **`MinecraftScreenModel+0xc == ScreenChooser*`**.

| Botão | Função (model) | Addr | Destino low-level |
|---|---|---|---|
| **Play** | `navigateToPlayScreen()` | `0x83818c` | PlayScreen (`createScreen<PlayScreenModel,PlayScreenController>` @`0x870128`; `pushLocalPlayScreen(bool)` @`0x86feac`) |
| **Settings/Opções** | `navigateToOptionsScreen(bool,int)` | `0x8381a0` | `pushOptionsScreen(bool,int)` @`0x8706c8` → OptionsScreen **clássica** |
| Store | `navigateToStoreScreen()` | `0x8382d4` | `pushStoreScreen()` @`0x871ee4` |
| Skins/Perfil | `navigateToSkinPickerScreen()` | `0x8382c0` | `pushSkinPickerScreen()` @`0x871954` |
| Achievements | `navigateToAchievementScreen()` | `0x838ddc` | `pushAchievementScreen()` @`0x86cdcc` |
| Sign-in Xbox | `navigateToSignInScreen(fn)` | `0x838438` | (`attemptSignIn` @`0x83bac0`, `silentSignin` @`0x83ba50`) |
| Convidar/Amigos | `navigateToInviteScreen()` | `0x8382e8` | `pushInviteScreen()` @`0x86b0f4` |
| Idioma | `navigateToLanguageScreen()` | `0x83836c` | `pushLanguageScreen()` @`0x86aaa0` |
| Help/link | `openUriLink(string&)` | `0x8383a8` | abre URL |
| Sair | `quit()` | `0x838b08` | confirmação: `pushQuitConfirmationModalScreen(fn)` @`0x838a00` |
| Comprar (trial) | `purchaseGame()` / `navigateToPurchaseOfferScreen` | `0x838b18` / `0x8381d0` | — |
| Voltar ao menu | `navigateToStartScreen()` | `0x838108` | tail-call `setStartMenuScreen` @`0x866bd0` |

**Dois níveis de religamento:** (A) chamar `navigateTo*(model*)` — nível alto, inclui telemetria/`fireEventScreenChanged`, precisa do `MinecraftScreenModel*` vivo (guardado pelo controller via ctor @`0x7df568`); (B) chamar `ScreenChooser::push*/set*(chooser*)` direto — nível baixo.

**Desenho:** hookar `ScreenView::render`/`setupAndRender` filtrando pelo controller StartMenu (seção 3.6). Fundo panorâmico (Cubemap) renderiza atrás; não precisamos hooká-lo.

**(a confirmar):** nomes legíveis e layout dos botões nativos estão no **JSON UI do APK** (`assets/ui/`, provável `start_screen.json`), não no `.so` — extrair para espelhar posições. Hashes de `_registerBindings` @`0x7e01ac` (ordem): `0xc471ccde, 0x1cc33348, 0x7911b930, 0xd7efb462, 0xa7258aa4, 0xc0818aa3, 0x0882ffe8` (+2 bindings por string via helpers `0x5a0f74`/`0x5a0fb0`; helpers de clique/evento `0x5a0f2c`/`0x5a0f5c`). Função de hash não revertida. Ambiguidade do destino de `navigateToPlayScreen` (veneers PIC) — destino certo é a PlayScreen nova.

### 5.2 OPÇÕES — clássica (`GuiElement`/`Button`)

**Ciclo de vida:**

| Símbolo | Addr |
|---|---|
| ctor `OptionsScreen(MinecraftClient&,bool,int)` | `0x850c74` |
| `init()` | `0x851ca8` |
| `tick()` | `0x854ce4` |
| `render(int,int,float)` | `0x8526a4` |
| `getScreenName()` | `0x857d74` |
| `renderGameBehind()` (retorna 1) | `0x856f94` |
| vtable | `0x160571c` |

**Handlers / navegação:**

| Símbolo | Addr | Papel |
|---|---|---|
| `_buttonClicked(Button&)` | `0x852f80` | Done→fechar; ids 2..6→`selectCategory(id - idPrimeiraCat)` |
| `closeScreen()` | `0x852fd8` | **VOLTAR**: telemetria + `getScreenChooser`→`popScreen(*this,1)` |
| `handleBackEvent(bool)` | `0x85630c` | arg=true retorna 1; arg=false fecha teclado + `closeScreen` |
| `selectCategory(int)` | `0x852210` | troca aba; `_selectCategory(StickDirection)` @`0x856e58` |
| `_pointerPressed/_pointerReleased` | `0x85478c` / `0x854ac4` | roteio de toque |
| `handleScrollWheel(float)` | `0x856f28` | scroll do pane |
| `setTextboxText` / `handleTextChar` | `0x8578cc` / `0x856f00` | IME/textbox (`onSetKeyboardHeight` @`0x8578dc`) |
| `_rebuildGameOptions` / `_generateOptionScreensDefault` / `generateOptionScreens` | `0x854d28` / `0x85303c` / `0x853008` | montagem de panes/itens |
| `setupPositions` | `0x852394` | layout |
| `createCategoryButtons` / `createCategoryButton` | `0x856f98` / `0x857410` | botões de aba |

> Offsets de instância (de `_buttonClicked`): `OptionsScreen+0xc0`=Done, `+0xd0`=container de categorias, `+0xdc`=objeto IME/edição. Button::id em `Button+0x64`.

**Religar os controles — via API genérica de `Options` (independe do layout nativo):**

- **Ponteiro Options:** `MinecraftClient::getOptions()` @`0x6c1554` = `*(Options**)(client+0x13C)`. O `MinecraftClient*` sai de `OptionsScreen+0x14` (base Screen).
- **Ler:** `getBooleanValue` @`0x92aa80`, `getIntValue` @`0x92b324`, `getProgressValue` @`0x92b1d4` (+`getProgressMin` @`0x92a994` / `getProgressMax` @`0x92a8fc`), `getStringValue` @`0x92b18c`, `getMessage` @`0x92a188` (rótulo do valor), `getDescription` @`0x92a8ec`.
- **Gates:** `canModify` @`0x92a8b8` (desabilitar), `hideOption` @`0x92c4fc` (esconder).
- **Gravar:** `set(Option,bool)` @`0x92c240`, `set(Option,int)` @`0x92c0cc`, `set(Option,float)` @`0x92c2dc`, `set(Option,string&)` @`0x92be44`, `set(Option,ControllerType,string)` @`0x92c08c`, `toggle(Option,int dir)` @`0x92b45c`.
- **Persistir:** `Options::save()` @`0x927c74` ao sair.

**Descritores `Options::Option` (passar o ENDEREÇO para a API acima):**

| Setting | Addr | Tipo provável |
|---|---|---|
| MUSIC | `0x16b1ff8` | slider |
| SOUND | `0x16b2000` | slider |
| INVERT_MOUSE | `0x16b2008` | bool |
| SENSITIVITY | `0x16b2010` | slider float |
| VIEW_DISTANCE | `0x16b2018` | step int |
| VIEW_BOBBING | `0x16b2028` | bool |
| DIFFICULTY | `0x16b2038` | enum int |
| GRAPHICS | `0x16b2040` | bool/enum |
| GUI_SCALE | `0x16b2050` | step int |
| SPLIT_CONTROLS | `0x16b2090` | bool |
| NAME | `0x16b20b0` | textbox string |
| AUTO_JUMP | `0x16b21e8` | bool |
| SWAP_JUMP_AND_SNEAK | `0x16b2228` | bool |
| FIELD_OF_VIEW | `0x16b2248` | slider float |

> Faixa completa de descritores em `.bss` `0x16b1ff8..0x16b2290`. **(a confirmar)** o campo `mType` (offset 0 do descritor) e min/max são **zero-init no `.so`** e preenchidos em runtime por `Options::_initDefaultValues` @`0x924538` / `Options::Options` @`0x924118` — não legíveis estaticamente; ler no device ou desmontar `_initDefaultValues`. Pistas de tipo: ranges float em `.rodata` `0x1546610..0x1546644`; tabelas enum `DIFFICULTY_NAMES` @`0x16a3064`, `RENDER_DISTANCE_NAMES` @`0x16a3054`, `DIFFICULTY_LEVELS` @`0x16b229c`, `CAMERA_MODES` @`0x16b2290`.

**Widgets nativos (se optarmos por reusar em vez de desenhar os nossos):** `OptionButton` (toggle): ctor @`0x6df02c`, `isSet` @`0x6df4c8`, `toggle` @`0x6df3d8`, `setValue` @`0x6df300`, `pointerPressed` @`0x6df4a0`, vtable `0x15ff80c`, layout `+0xb8`=Option*. `Slider`: `setOption` @`0x6ecc14`, ctor step @`0x6ec594`, ctor progress @`0x6ec4e4`, render @`0x6ec76c`, layout `+0x60`=Option*. `OptionsGroup` (fábrica): `addOptionItem` @`0x6e4768`, `createToggle` @`0x6e4af8`, `createStepSlider` @`0x6e5310`, `createProgressSlider` @`0x6e509c`, `createTextBox` @`0x6e47cc`, vtable `0x15ffc58`.

**Religar os 3 pontos da tela:** (a) Done/Voltar → `closeScreen()` @`0x852fd8`; (b) aba → `selectCategory(indice)` @`0x852210`; (c) toggles/sliders/textbox → API genérica de `Options` + `save()`.

> **(a confirmar):** lista exata de Options por aba (General/Controls/Graphics/Audio) e rótulos nativos (referenciados via pools PIC — exigem decodificar ou inspeção em runtime). `renderGameBehind` retorna 1; para fundo opaco, hookar para retornar 0 e desenhar nosso fundo.

### 5.3 PAUSE — clássica

**Ciclo de vida:**

| Símbolo | Addr |
|---|---|
| ctor `PauseScreen(MinecraftClient&,bool,bool)` | `0x859938` |
| `init()` (cria botões + gating) | `0x85a39c` |
| `tick()` | `0x85d1ec` |
| `render(int,int,float)` | `0x85d200` |
| `setupPositions()` | `0x85cbc0` |
| `renderGameBehind()` | `0x85e920` |
| `isPauseScreen()` (override, true) | `0x85e91c` |
| `getScreenName()` | `0x85ead4` |
| `_pointerPressed` / `_pointerReleased` | `0x85d950` / `0x85db6c` |
| `handleBackEvent` / `handleButtonRelease` | `0x85e014` / `0x85e0e4` |
| vtable | `0x160594c` |

**`_buttonClicked(Button&)` @`0x85dda4`** — despacho linear: lê ID em `Button+0x64`, compara com botões-membro, obtém `chooser = mClient->getScreenChooser()` (`mClient` em `pause+0x14`) e tail-calla a ação.

| Campo | Botão | Ação real | Addr | Gate |
|---|---|---|---|---|
| +0xa4 | `menu.returnToGame` RESUME | `ScreenChooser::popScreen(*this,1)` | `0x863f0c` | — |
| +0xac | `pauseScreen.quit` SAIR DO MUNDO | `ScreenChooser::setLeaveLevelScreen()` | `0x87530c` | — |
| +0xb4 | `pauseScreen.options` OPÇÕES | `ScreenChooser::pushOptionsScreen(true,0)` | `0x8706c8` | — |
| +0xbc | `pauseScreen.invite` CONVIDAR | `ScreenChooser::pushInviteScreen()` | `0x86b0f4` | byte `pause+0x9d != 0` |
| +0xd4 | `gui.achievements` CONQUISTAS | `ScreenChooser::pushAchievementScreen()` | `0x86cdcc` | byte `pause+0x9e != 0` |
| +0xc4 | `trial.pauseScreen.buyGame` COMPRAR | `GameStore::purchaseGame(fn)` | `0xb2f708` | só trial (`getGameStore` @`0x6cffb0` + `isTrial` @`0xb30134`) |
| +0xcc | EXPORTAR mundo | `PauseScreen::_exportLevel()` | `0x85dec0` | **DORMENTE** — `+0xcc` nunca escrito nesta build |

**Guard de entrada:** `_buttonClicked` lê `pause+0x9f` no início; se `!= 0` ignora TODO clique (flag de transição/fechamento). O overlay deve respeitar esse byte. Elementos não-clicáveis: `+0xdc`=header ("Menu do jogo"), `+0xe4`=texto de trial.

**Religar (receita única):** ler `MinecraftClient*` em `pause+0x14` → `getScreenChooser()` @`0x6cc6b4` (r0=mClient) → invocar o método de `ScreenChooser`. Chamadas prontas: RESUME = `popScreen(chooser,(AbstractScreen*)pause,1)`; OPTIONS = `pushOptionsScreen(chooser,true,0)`; QUIT = `setLeaveLevelScreen(chooser)`; INVITE = `pushInviteScreen(chooser)`; ACHIEVEMENTS = `pushAchievementScreen(chooser)`; EXPORT = `_exportLevel(pause)`. BUY exige montar `std::function<void(PurchaseResult)>` — provavelmente nem exibir.

**Alternativa de menor risco:** segurar o `Button*` vivo (ex. `*(void**)(pause+0xa4)`) e chamar `_buttonClicked(pause, *button)` — reusa gating e guard nativos.

**Desenho:** hook `PauseScreen::render` @`0x85d200`. `renderGameBehind` @`0x85e920` confirma que a tela já é overlay sobre o jogo (mundo atrás). Para UI opaca: cobrir com `fillGradient` tela cheia ou ocultar os ButtonElement nativos; posições nativas em `setupPositions` @`0x85cbc0`.

> **(a confirmar):** botão Exportar — origem do campo `+0xcc` (nunca escrito em init/ctor); `createScreen<MinecraftScreenModel,PauseScreenController>` @`0x872808` existe — confirmar se a build viva é a clássica ou o controller. Semântica do 2º arg de `popScreen(*this,1)`. Campo `pause+0x114` (0/1/2, fluxo de quit).

### 5.4 Navegação programática (ScreenChooser) — comum a todas

`MinecraftClient::getScreenChooser() const` @`0x6cc6b4` (= `[MC+0x198]`). Primitivos: `pushScreen(shared_ptr<AbstractScreen>,bool)` @`0x6cccdc`, `popScreen(int)` @`0x6cd664`, `_popScreen(bool)` @`0x6cd22c`; `ScreenChooser::_pushScreen` @`0x864080`, `popScreen(AbstractScreen&,int)` @`0x863f0c`.

| Ação | Símbolo | Addr |
|---|---|---|
| Menu principal | `setStartMenuScreen()` | `0x866bd0` |
| Abrir pause | `pushPauseScreen()` | `0x872474` |
| Abrir opções | `pushOptionsScreen(bool,int)` | `0x8706c8` |
| Abrir chat | `pushChatScreen()` | `0x86499c` |
| Voltar ao jogo | `setGameplayScreen()` | `0x87a830` |
| Sair do mundo | `setLeaveLevelScreen()` | `0x87530c` |
| Desconexão | `setDisconnectScreen()` | `0x86699c` |
| PlayScreen | `pushLocalPlayScreen(bool)` / `getPlayScreen()` | `0x86feac` / `0x87b8cc` |
| Inventário | `pushInventoryScreen(CraftingType)` | `0x869f00` |

> **Troca DIFERIDA:** empilhar não troca na hora. Fila em `MC+0x1c0`/`+0x1c4`, contador `MC+0x1cc`, aplicada por `MinecraftClient::updateScheduledScreen` @`0x6cc280` no loop → efetiva no **próximo frame**.

---

## 6. Plano incremental (começar pelo MENU PRINCIPAL)

O menu é prioridade 1: **menor risco** (não há mundo/estado em jogo, o pior caso é voltar ao boot) e **mais visível** (primeira tela, mostra o produto). Passos concretos:

1. **Injeção base.** Carregar `libmodclient` no native-load 32-bit; resolver símbolos por nome e instalar `MSHookFunction`. Validar com um hook no-op (log em `StartMenuScreenController::tick` @`0x7e09b8`) que dispara só no menu.

2. **Detecção "menu ativo".** Implementar `getScreen()` @`0x6cd680` + guarda de pilha vazia (`MC+0x80==MC+0x84`). No device, logar `getScreen()->getScreenName()` para **fixar a string do StartMenu** (open question 2.2/5.1) e confirmar `[ScreenView+0x80]`=controller comparando com `0x160323c`.

3. **Desenho "hello overlay".** Hook em `ScreenView::render`/`setupAndRender` (@`0x89e1b0`/`0x89e2d0`) filtrando pelo controller StartMenu. Desenhar 1 retângulo opaco + título com `ScreenRenderer::fillGradient` @`0x74e914` + `drawCenteredString` @`0x74dfac`, fonte de `*(Font**)(client+0x70)`, dimensões de `GuiData::getScreenWidth/Height`. Validar FPS-neutralidade: em jogo o hook não dispara.

4. **Engolir o toque.** Hooks em `handlePointerPressedButtonPress` @`0x6c170c` / `Release` @`0x6c3540` / `Location` @`0x6c3680` com `if(!g_uiAtiva) return orig(...)`. Com a UI do menu ativa, ler x,y e fazer hit-test da nossa UI; retornar sem orig quando o toque cair sobre nossos botões. **(a confirmar)** avaliar se é preciso engolir também o consumidor primário em `MC+0x214` (open question).

5. **Religar 1 botão (Play).** Botão custom → obter `MinecraftScreenModel*` (do controller, ctor @`0x7df568`) e chamar `navigateToPlayScreen()` @`0x83818c`; **ou** low-level `ScreenChooser::pushLocalPlayScreen(false)` @`0x86feac`. Lembrar da troca diferida (seção 5.4). Validar que entra na PlayScreen real.

6. **Completar o menu.** Religar os demais botões (Settings → `navigateToOptionsScreen` @`0x8381a0`; Skins, Store, Achievements, Invite, Language, Quit → tabela 5.1), respeitando gates/trial. Espelhar posições extraindo `assets/ui/start_screen.json` do APK.

7. **Expandir p/ PAUSE e OPÇÕES.** Mesma mecânica com hooks por-tela (`PauseScreen::render` @`0x85d200`, `OptionsScreen::render` @`0x8526a4`) e religamento das tabelas 5.3/5.2. Opções é a mais trabalhosa (muitos controles) mas tem a API genérica de `Options` já mapeada.

---

## 7. Riscos e open questions

**Riscos de design:**

- **Qual UI está viva na 0.15.10** (clássico vs novo data-driven) para **Pause**: existem `PauseScreen` clássica (`_buttonClicked` @`0x85dda4`) e `PauseScreenController` (createScreen @`0x872808`, vtable `0x1602b7c`). O ENGOLIR (nível MinecraftClient) funciona nos dois; o **RELIGAR muda**. **Resolver em runtime** lendo o vptr em `*(MC+0x84)-8` (toggle de debug: `handleToggleEnableNewScreensDebugButtonPress` @`0x6c234c`).
- **Troca diferida** (`updateScheduledScreen` @`0x6cc280`): empilhar tela efetiva só no próximo frame — não assumir efeito síncrono ao religar.
- **Guard de clique do Pause** (`pause+0x9f`): disparar nosso religamento durante a animação de saída pode causar ação indevida — respeitar o byte.
- **Deploy de `.phar`/lib no ar** não se aplica aqui, mas vale a cautela da frente: validar hook por hook (passo 1 do plano) antes de empilhar funcionalidade.

**Open questions (confirmar no binário/device):**

1. **Mapa completo de slots da vtable** — discrepância entre frentes (seção 4.4): só `+0xCC` é consenso; os demais (`+0x54/+0x58/+0x104/+0x11c/+0x120/+0x124/+0x128`) foram reportados como confirmados por reloc por uma frente e como não-legíveis por outra. **Mitigação:** hook por NOME dispensa índices; só resolver se formos fazer vtable-swizzle (ler vtable relocada em runtime).
2. **String de `getScreenName` do StartMenu** — não há literal na `.rodata`; vem do controller via `ScreenView::getScreenName` @`0x8a7190` (`[SV+0x80]`→`vtable[+0x4c]`). Logar no device.
3. **`[ScreenView+0x80]`=controller / `+0x88`=model** — lidos do disasm; validar. Confirmar ScreenView ⊂ BaseScreen.
4. **`mType` de cada setting de Opções** (toggle/step/progress/textbox) — zero-init no `.so`, preenchido por `_initDefaultValues` @`0x924538`. Ler descritor em runtime ou desmontar.
5. **Lista/ordem de Options por aba** e rótulos nativos — referenciados via pools PIC; extrair em runtime ou do APK.
6. **`drawRect` @`0x74eb8c`** — último `int` somado a y0 (pode ser contorno, não fill). Preferir `fillGradient`; confirmar no device antes de usar `drawRect` para preenchimento.
7. **Identidade de `MC+0x214`** (consumidor primário de toque, chamado 1º em `handlePointerPressedButtonPress` via PLT `0x597fc8`) — provável entrada de toque da UI nova/HUD; confirmar se precisa ser engolido quando nossa UI cobre o HUD in-game.
8. **Destino exato de `navigateToPlayScreen`** (veneers PIC Thumb→ARM) — destino certo é a PlayScreen nova; aritmética final não resolvida.
9. **Botão Exportar do Pause** (`+0xcc` dormente) — origem do campo não localizada; chamar `_exportLevel` @`0x85dec0` direto resolve se quisermos a feature.
10. **Carregar textura própria** (`mce::TexturePtr`) para arte de botões — provável via `ResourceLocation` + `mce::TextureGroup` (`TextureAtlas` @`0xa26890`) ou reaproveitar atlases já carregados (`guiTex` `0x16aeea0`). Chamada de registro/lookup por nome não mapeada.
11. **Função de hash da UI** (mapear hash↔nome de controle do `_registerBindings`) — não identificada (candidato FNV-1a).
12. **Nomes/layout dos botões nativos** — no JSON UI do APK (`assets/ui/`), não no `.so`.