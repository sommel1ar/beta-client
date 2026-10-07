# beta-client — parte do puunish

Nossa contribuição pro client/launcher de **MCPE 0.15.10**. Cada dev faz a sua parte na sua branch (`puunish`), merge no fim.

## Escopo (nossa parte)
Client **legítimo** estilo Lunar/Badlion — **UI custom + HUD + QoL + cosmetics**, **sem cheat**. Foco inicial:
- **Backend nativo 32-bit** (jogo roda nativo via loader estilo self-contained; hooks por Cydia Substrate).
- **Interface custom** nas telas principais (menu, opções, pause, chat) — desenhar por cima + religar as ações no jogo.
- **Feature 1 — scroll no chat** (backport da 0.16, que a 0.15 não tem).

## Princípios
- **FPS-neutro:** o client NÃO pode custar FPS. Nada roda na render thread no jogo normal; hooks só agem quando necessário (ex.: o hook do chat só com o chat aberto).
- **Dual-backend (futuro):** 32-bit = native-load; 64-bit-only = runtime próprio; W10 = depois. ~90% do código (UI/HUD/features) é compartilhado; só a casca (render/input/hook/offsets) muda por plataforma.
- **Sem binário do Mojang no repo.** Cada um traz o `libminecraftpe.so` 0.15.10 por conta própria (ver `.gitignore`).

## Estrutura
```
native/jni/launcher.cpp   backend nativo: harness (JNI_OnLoad -> Substrate -> hook por nome) + features
build_test.ps1            compila + empacota o APK de teste (paths locais; ajustar)
re/                       notas de RE (offsets) — NAO versionar binario do Mojang
```

## Build (resumo)
NDK r27c clang (armeabi-v7a), JDK 21 p/ assinar. Precisa de: `libminecraftpe.so` 0.15.10 + Substrate, um APK-base que carregue a lib do client via `System.loadLibrary`.
```
clang++ --target=armv7a-linux-androideabi21 -fPIC -shared -O2 -s -nostdlib++ -fno-exceptions -fno-rtti -o liblauncher.so native/jni/launcher.cpp -llog -ldl
```

## Status (2026-10-05) — "Void Client"
- **App Void Client funcionando no A71:** carrega o MCPE 0.15.10 instalado (`loadFromPackage`) e desenha um **menu lateral 100% custom** (dark+roxo, fonte própria JetBrains Mono) por cima, substituindo o menu da Mojang. Gate (só no menu) + input (botões respondem) + toggle, sem crash. Projeto em `voidclient/`.
- **Overlay GLES2 próprio** (shader/fonte/estilo nossos) via hook no `swapBuffers` do jogo, com save/restore de estado GL.
- Docs: `VOID_MENU_BUILD.md` (as-built), `VOID_OVERLAY_IMPL.md` (spec), `HOST_ARCH.md`, `NATIVE_LOAD.md`, `INTERFACES_RE.md`.
- Scroll no chat: **parkado** (`re/CHAT_SCROLL_RE.md`).
- **Próximo:** religar os botões nas ações reais (Jogar/Mundos/Opções via navegação do jogo) + input in-game seguro. Ver `VOID_MENU_BUILD.md` §5.
