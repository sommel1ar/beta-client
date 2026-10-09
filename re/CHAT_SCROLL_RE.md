# Chat scroll na 0.15.10 — RE completa (2026-10-04)

> ⏸️ **PARKADO (2026-10-05):** Allan pediu pra NÃO usar o scroll de chat por enquanto. Removido do código ativo (`launcher.cpp` virou só o harness de injeção, sem feature). Esta RE fica **documentada** para retomar depois. (O incremento 1 chegou a ser instrumentado e validado no device; detalhe no histórico abaixo.)

Objetivo: adicionar **scroll no chat** (subir pra ver mensagens antigas), feature que só veio na 0.16. Parte do projeto **launcher 0.15.10**.

Binários: 0.15.10 `minecraft/_emu32/mcpe-vanilla/lib/armeabi-v7a/libminecraftpe.so` (23.770.524 B) · 0.16.2 `minecraft/_launcher/re/libminecraftpe_0.16.2.so` (29.398.636 B). Ambos armeabi-v7a (Thumb-2). Objdump: `tools/ndk/.../llvm-objdump.exe -d --triple=thumbv7-linux-androideabi --start-address=0x.. --stop-address=0x..`.

## Achado 1 — a 0.16 REESCREVEU o chat (scroll NÃO é portável como patch)
0.16 moveu o chat pra um framework MVC novo: `ChatScreenController`, `MinecraftScreenModel`, `ScreenView`/`VisualTree`/`UIControlFactory`, `GuiData::getNewChatScreenMessages`, `GuiMessage::hasOldFlag/setOldFlag(OldMessageFlag)`, `ChatScreenController::mSentMessages`, tab-complete/intellisense. O scroll é um controle de lista scrollável desse framework — que a 0.15 não tem. => não copiar código da 0.16; implementar na 0.15.

## Achado 2 — a 0.15.10 JÁ guarda o histórico; só falta a janela de scroll
### GuiData (o histórico)
- **`GuiData+0x90` = `std::vector<GuiMessage>`** = histórico completo. Layout vetor gnustl: `+0x90 _M_start`, `+0x94 _M_finish`, `+0x98 _M_end_of_storage`. (Provado em `getNewChatMessages @0x749978`: `ldr [r5,#0x90]`/`[r5,#0x94]`.)
- `GuiData::_insertGuiMessage @0x74834c` e `_splitAddChatMessage @0x748544` adicionam no `GuiData+0x90` (split de linhas longas). `GuiData+0x84` = outra estrutura (fila de "novas"?). `GuiData+0xA5` = flag bool.
- Cap: `ChatScreen::MAX_SAVED_MESSAGES @0x1546438`.

### GuiMessage (stride 0x18)
```
+0x00 int    ticks            (getTicks)
+0x04 int    maxTicks         (getMaxTicks; isDead = ticks>maxTicks)
+0x08 std::string message     (getMessage; COW: campo=char*; isCommand = *msg=='/')
+0x0C std::string user        (getUser)
+0x10 std::string string      (getString = LINHA COMPLETA p/ exibir)
+0x14 bool   forceVisible     (isForceVisible)
+0x15 bool   isNew            (isNew; setOld zera)
```
std::string gnustl = 1 ponteiro (COW _Rep); len em `[ptr-12]`, refcount `[ptr-4]`.

### ChatScreen (o render)
- `ChatScreen+0x14` = **MinecraftClient*** (cadeia p/ chegar no GuiData).
- `ChatScreen+0xBC` = cópia própria do vetor (`{0xBC start, 0xC0 finish, 0xC4 cap}`).
- `ChatScreen+0x60` = fonte/renderer. `ChatScreen+0x0C` = valor de layout (y).
- `_updateGuiMessages @0x762a9c`: `[ChatScreen+0x14]`(cliente) → getters (plt 0x59aac4, 0x5a0908) → vetor do GuiData → `operator=` copia pro `+0xBC`.
- `_guiMessagesUpdated @0x762a14`: compara tamanho/conteúdo do GuiData vs `+0xBC` → dispara update.
- **`_drawChatMessages(int) @0x7630ac`**: loop `r6=[+0xBC]`→`r8=[+0xC0]`, `r6+=0x18`; desenha cada GuiMessage; a posição-y usa o param `int` (r5) + `[ChatScreen+0xC]`. Desenha de baixo pra cima; antigas saem acima da tela (sem clip aparente).

## Duas implementações do scroll (ambas aterradas)
1. **Leve/nativo:** hook em `_drawChatMessages` → somar `scroll_offset` na base-y → antigas aparecem. + input de arraste na área do chat + clamp `[0, n-visíveis]` + auto-stick no fim. Mínimo código, sensação nativa.
2. **Custom (launcher):** UI própria lê `GuiData+0x90` direto (itera stride 0x18, lê +0x10) e desenha lista scrollável própria. Controle total.
MVP: (1) primeiro; evoluir p/ (2) com a UI custom, reusando a leitura do `GuiData+0x90`.

## Pendência pequena (confirmar no build)
- Cadeia exata cliente→GuiData fora do ChatScreen (pra UI custom): `ChatScreen+0x14`=cliente; os getters plt 0x59aac4/0x5a0908 resolvem o vetor. Alternativa: GuiData via offset conhecido do cliente (memória emu32: `MinecraftClient+0x230`, `GuiData+0x0C` em handlePointerLocation). Confirmar o offset cliente→GuiData.

## Incremento 2 — INPUT do scroll (RE 2026-10-04)
Achado-chave: **a 0.15.10 JA tem scroll no engine** — `ScrollingPane @0x6e9208`, `ScrollingPane::calculateAndSetCurrentMouseScrollT @0x6e96f0`, e `handleScrollWheel(float)` em `ChestScreen @0x76957c`/`FurnaceScreen @0x80bf28`/`OptionsScreen @0x856f28`. ChatScreen NAO tem handleScrollWheel (nunca ligaram). Reusavel no futuro.
Handlers de ponteiro p/ capturar o arraste (touch):
- `ScreenView::handlePointerLocation(glm::tvec2<float>) @0x8a08fc` + `_handlePointerLocation(tvec2,bool) @0x8a0904` + `_sendPointerHeldEvents @0x89db98` — posicao do ponteiro (move/held) no nivel da ScreenView.
- `Screen::_pointerPressed @0x8634f8` (base); `_pointerReleased(int,int)` por tela (PauseScreen 0x85db6c, Options 0x854ac4, Anvil 0x7582c8). ChatScreen usa a base (nao sobrescreve pointer).
- Raw: `Multitouch::feed(char,char,short,short,int) @0x1200558`, `Multitouch::_pointers @0x1733368`. `MouseDevice::feed/getDY @0x11ffaa4`.
PLANO inc2: hook `ScreenView::handlePointerLocation` (+ press via _pointerPressed / release) → filtrar **ChatScreen ativa** (getScreen vtable 0x1601c3c) + **arraste na area do chat** → delta-Y vira `g_chat_scroll`. Inc3: clamp [0, (n_msgs-visiveis)*alt_linha] + auto-stick no fim (n_msgs = tamanho do vector GuiData+0x90; alt_linha de ChatScreen+0xC/fonte).
NOTA: so escrever o codigo do inc2 DEPOIS de validar o inc1 (render-shift + sinal) no A71 — nao construir em cima de suposicao.

## Outras QoL de chat que a 0.16 tem e dá pra backportar depois
Histórico de enviadas (`ChatScreen::sentMessages @0x16af134`, cap MAX_SAVED_MESSAGES) p/ seta-pra-cima; tab-complete/intellisense (reescrever, não portar).
