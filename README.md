# beta-client (Void Client) — parte do puunish

Client **legítimo** estilo Lunar/Badlion pra **Minecraft PE 0.15.10** — UI custom + HUD +
QoL + cosméticos, **sem cheat**. O app carrega o MCPE 0.15.10 **instalado** no device
(`loadFromPackage`) e desenha uma interface própria (overlay GLES2, dark + roxo, fonte
JetBrains Mono) por cima, com um **sistema de módulos** pra adicionar features.

## Como contribuir (devs)
As features são **módulos**. Você escreve **um arquivo** `.cpp`, builda, testa e abre um PR.

- **Como escrever um módulo (API):** [`DOCUMENTATION.md`](DOCUMENTATION.md)
- **Fluxo (clonar → criar → buildar → testar → PR):** [`CONTRIBUTING.md`](CONTRIBUTING.md)
- **Ponto de partida:** copie [`native/jni/modules/_template.cpp`](native/jni/modules/_template.cpp)

```powershell
# 1. cria seu módulo a partir do template
copy native\jni\modules\_template.cpp native\jni\modules\meu_modulo.cpp
# 2. builda + instala no device (precisa NDK r27c + MCPE 0.15.10 instalado no celular)
.\build.ps1 -Install -Device <ip>:5555
# 3. abre o Void Client -> Launch -> MODULOS  (seu card aparece sozinho)
```

O build pega **todo** `modules/*.cpp` automaticamente (menos `_*`); o `VOID_MODULE(...)`
registra o módulo e o card + painel de config aparecem sem mexer em mais nada.

## Estrutura
```
native/jni/
  void_sdk.h         API do autor de módulo (inclua nos seus módulos)
  launcher.cpp       o client + framework de módulos  (NÃO mexer no PR)
  font_blob.h        atlas da fonte
  modules/
    _template.cpp    copie este (arquivos _* são ignorados no build)
    fps_counter.cpp  exemplo: HUD de FPS
    fullbright.cpp   exemplo: gamma alto (acesso raw a offset)
voidclient/          skeleton do APK (empacotado pelo apktool)
build.ps1            build de 1 comando (compila + empacota + assina; -Install instala)
DOCUMENTATION.md     a API dos módulos
CONTRIBUTING.md      o fluxo de contribuição + pré-requisitos
```

## Princípios
- **Legítimo, não cheat.** Features = HUD, visual, QoL, cosméticos. **Nada** de
  reach/hitbox/anti-knockback.
- **FPS-neutro.** O overlay desenha por frame só quando precisa; nada pesado na render
  thread do jogo normal.
- **O framework é do mantenedor.** Módulos vão em `modules/`; mudança no `launcher.cpp`/
  `void_sdk.h` (ex.: tipo de setting novo) combina antes (seção 9 da doc).

## Status
- Overlay GLES2 próprio + menu custom + telas (opções/mundos/servidores/pause/loading) +
  **sistema de módulos** (tela MODULOS + bolha in-game + config + persistência) — rodando
  no A71. Backend 32-bit native-load; 64-bit (emu32)/W10 = futuro.
