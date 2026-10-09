# Void Client — overlay/menu AS-BUILT (MCPE 0.15.10, armeabi-v7a)

Registro do que foi **de fato construído e validado no A71** (não é o spec; o spec é `VOID_OVERLAY_IMPL.md`). Tudo confirmado no device salvo nota.

Arquivo: `native/jni/launcher.cpp` (TU único). Build: `-lEGL -lGLESv2` além de `-llog -ldl`, `-nostdlib++ -fno-exceptions -fno-rtti`. APK montado via `apktool b` sobre `voidclient/` (ver `HOST_ARCH.md`/`NATIVE_LOAD.md`).

---

## 1. Cadeia completa (injeção → overlay → gate → input)

```
LoaderActivity (Void Client) -> loadFromPackage(com.mojang.minecraftpe instalado)
  -> System.loadLibrary("modclient")  (nosso)
    -> JNI_OnLoad -> worker thread:
        dlopen("libminecraftpe.so", RTLD_NOLOAD)  -> g_mcpe
        dlopen("libmobilesubstrate.so") -> MSHookFunction
        install_swap_hook():
          hook AppPlatform_android::swapBuffers   (render: desenha overlay)
          hook MinecraftClient::update            (gate: cacheia g_mc, seta g_uiAtiva)
          hook handlePointerLocation/Press/Release (input)
```

Render roda na thread de render (dentro do swapBuffers do jogo); gate+input rodam na thread do jogo (update/pointer). `g_uiAtiva` é `volatile` (cruza threads).

---

## 2. Símbolos/offsets usados (VA de arquivo, mangled, CONFIRMADOS no device)

| O quê | Símbolo mangled | VA | Nota |
|---|---|---|---|
| Swap (render hook) | `_ZN19AppPlatform_android11swapBuffersEv` | 0xdb2438 | **NÃO** hookar `eglSwapBuffers` do sistema (ver §4) |
| Gate (per-frame, this=MC) | `_ZN15MinecraftClient6updateEv` | 0x6c9c9c | cacheia `g_mc`; base do `g_slide` |
| Input location | `_ZN15MinecraftClient21handlePointerLocationEss` | 0x6c3680 | só CACHEIA coords; **NÃO chamar orig** (ver §4) |
| Input press | `_ZN15MinecraftClient31handlePointerPressedButtonPressEv` | 0x6c170c | orig OK |
| Input release | `_ZN15MinecraftClient33handlePointerPressedButtonReleaseEv` | 0x6c3540 | orig OK |
| PNG decoder (de graça) | `stbi_load_from_memory` / `stbi_image_free` | 0xb55b7c / 0xb55914 | via `dlsym(g_mcpe,...)` (não usado ainda; p/ texturas) |
| vtable ScreenView (+8) | — | 0x160681c | gate: top screen == este (confirmado device) |
| vtable StartMenuScreenController (+8) | — | 0x160323c | refinar gate p/ só menu inicial (a usar) |
| Navegação (a usar) | `_ZNK15MinecraftClient16getScreenChooserEv` | 0x6cc6b4 | religar botões (próximo passo) |

`g_slide = (dlsym(g_mcpe,"_ZN15MinecraftClient6updateEv") & ~1) - 0x6c9c9c`. vptr de runtime = `g_slide + VA_de_arquivo`.

**Gate:** `topScreen(mc)` = com guarda `*(mc+0x80)==*(mc+0x84)` (pilha vazia) senão `*(*(mc+0x84) - 8)`. `onMenu` = `*(void**)topScreen == g_slide+0x160681c` (ScreenView). Confirmado `vptr=0x160681c onMenu=1` no menu.

---

## 3. Render GLES2 próprio (resumo do que está no código)

- Hook em `AppPlatform_android::swapBuffers(self)`: se `g_uiAtiva && g_mc` → lazy `overlay_init_gl()` (1ª vez) → `eglGetCurrentDisplay/Surface(EGL_DRAW)` + `eglQuerySurface(W/H)` → `gl_save` → `overlay_frame(W,H)` → `gl_restore` → `orig_apSwap(self)`.
- Programa GLES2 único: VS (ortho por `uInvScreen=2/W,2/H`, origem top-left) + FS (`texture2D(uTex,vUV)*vColor`). Batch em arrays estáticos (`-nostdlib++`, sem STL): `g_vSolid` (sólidos, textura branca 1x1) e `g_vText` (glifos, atlas LA).
- `draw_rect(x,y,w,h,AARRGGBB)` e `draw_text(x,y,str,px,AARRGGBB)` (y=baseline). `gl_save/gl_restore` = contrato exato de estado GL (program/VBO/blend-separate/depth/cull/scissor/viewport/colormask/3 vertex-attribs) — crítico: GLES2 sem VAO. (Detalhe em `VOID_OVERLAY_IMPL.md` §3.5.)

## 3.1 Fonte (pipeline de build)
- `native/gen_font.py` (Python+Pillow; instalei Pillow) assa **JetBrains Mono Bold** (OFL, de `controle/panda-teardown/.../jetbrains_mono_bold.ttf`), bake 48px → atlas 512x244, 95 glifos ASCII → `native/jni/font_blob.h` (array C embutido, formato `VCF1`: header 20B + Glyph[95] 20B `{x,y,w,h u16; xoff,yoff,xadvance f}` + atlas R8). Em runtime `vc_font_init` expande R8→`GL_LUMINANCE_ALPHA(255,cov)` (texto tingido por `vColor`).

## 3.2 Layout do menu (ui_build)
Sidebar esquerda (W*0.30) opaca cobrindo tudo: "VOID CLIENT" + divisor roxo + 5 itens (Jogar/Mundos/Opcoes/Cosmeticos/Mods) com acento roxo + feedback de press (cor muda) + "v0.15.10". Fundo direito escuro com "VOID" watermark. Toggle: `g_menuHidden` → desenha só um chip "VOID" no canto.

---

## 4. ★★★ Armadilhas CONFIRMADAS no device (não repetir)

1. **NÃO hookar `eglSwapBuffers` da libEGL do SISTEMA (A71/Adreno).** O inline-hook do Substrate na libEGL do fabricante crasha SIGBUS BUS_ADRALN em `libEGL.so+0x275d2`. **Solução:** hookar `AppPlatform_android::swapBuffers` @0xdb2438 (dentro da libminecraftpe) + pegar dims por `eglGetCurrentDisplay/Surface`.
2. **NÃO chamar o `orig` de `handlePointerLocation`.** O trampolim do MSHookFunction volta no modo ARM/Thumb errado pra ESSA função (o prólogo chama um PLT @0x5983c4 cedo) → `orig_loc()` crasha SIGBUS BUS_ADRALN no PLT. **Solução:** `h_loc` só CACHEIA `g_tx/g_ty`, nunca repassa. Consequência: location não pode ser repassada → in-game perderia o look; o fix p/ in-game é ler coords de um global do MC (não hookar location) — a fazer.
3. **Device trava (lock seguro) sem carga** — `svc power stayon true` só segura a tela carregando. Pra testar: plugar carregador. adb não destrava lock seguro.
4. **PowerShell `>` corrompe binário** (PNG do screencap) — usar `adb shell screencap -p /sdcard/x.png` + `adb pull`.
5. **Sem comentário no código** (regra do Allan, `feedback_codigo_limpo`).

---

## 5. Estado / próximo passo

**FEITO e validado (A71):** menu lateral custom substitui o menu da Mojang; gate (só no menu); input captando (botão pisca); toggle do painel; tudo sem crash.

**PRÓXIMO — religar os botões (RE de navegação):**
1. Jogar/Mundos → empilhar a tela de mundos via `getScreenChooser` @0x6cc6b4 (achar o método de push/criar tela).
2. Opções → abrir `OptionsScreen` real.
3. Refinar gate p/ `StartMenuScreenController`-only (vptr 0x160323c via `*(ScreenView+0x80)`), senão a UI cobre a lista de mundos após navegar.
4. Input in-game seguro: ler coords de um campo/global do MC (sem hookar location), e chamar as ações do jogo DIRETO (não por passthrough de toque).
5. Cosméticos/Mods → painéis próprios (sem RE de jogo).

Guard-rail de sempre: nada de binário Mojang/keystore/emu32-privado versionado; código sem comentário.
