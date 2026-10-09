All facts are grounded against the real SYMS and infra. Key confirmations: `glPixelStorei` is genuinely absent from the game's imports (so `-lGLESv2` is mandatory, not optional); `launcher.cpp` compiles as a **single** TU with `g_mcpe`/`MSHookFunction` as `static`; both build scripts use the identical `-llog -ldl` link line. Here is the synthesized spec.

---

# VOID_OVERLAY_IMPL.md — Overlay GLES2 próprio do Void Client (MCPE 0.15.10, armeabi-v7a / Thumb-2)

> Spec pronto-pra-codar. Alvo: `C:\modulo\minecraft\_launcher\native\jni\launcher.cpp` (+ build `build_test.ps1` / `build_stock.ps1`).
> Binário de RE: `C:\modulo\minecraft\_emu32\mcpe-vanilla\lib\armeabi-v7a\libminecraftpe.so`. Símbolos: `C:\modulo\minecraft\_launcher\re\syms_0151.txt`.
> Regra de ouro: **tudo NOSSO** — shader, quad, ortho, blend, fonte e estilo. Não reusamos `ScreenRenderer`, `Tessellator`, `Font` nem a projeção de GUI do jogo.
> Convenção de confiança: fatos com endereço/símbolo são aterrados no SYMS (conferidos nesta sessão); o que depende de layout de runtime está marcado **(a confirmar no device)**.

---

## 0. Fatos aterrados (conferidos no `syms_0151.txt` nesta sessão)

| Símbolo | Endereço (VA de arquivo) | Linkage | Papel |
|---|---|---|---|
| `eglSwapBuffers` | `U` (import libEGL) linha 48048 | import | **Ponto do hook** do overlay |
| `eglQuerySurface` | `U` linha 48047 | import | W/H reais do framebuffer |
| `eglMakeCurrent`/`eglSwapInterval` | `U` 48045/48049 | import | confirmam o caminho EGL completo |
| `AppPlatform_android::swapBuffers()` | `0x00db2438` | `T` | wrapper game-side (hook alternativo) |
| `mce::RenderContextOGL::swapBuffers()` | `0x01211db8` | `T` | **STUB `bx lr` — NÃO hookar** |
| `mce::RenderContext::swapBuffers()` | `0x0120f564` | `T` | camada intermediária (não é o call site EGL) |
| `MinecraftClient::handlePointerPressedButtonPress()` | `0x006c170c` | `T` | engolir press (4 consumidores) |
| `MinecraftClient::handlePointerPressedButtonRelease()` | `0x006c3540` | `T` | engolir release / disparar onClick |
| `MinecraftClient::handlePointerLocation(short,short)` | `0x006c3680` | `T` | move/drag; cacheia x,y |
| `MinecraftClient::getScreen() const` | `0x006cd680` | `T` | topo da pilha (sem guarda de pilha vazia) |
| `MinecraftClient::getScreenName()` | `0x006cfb04` | `T` | prova do padrão de guarda `[mc+0x80]==[mc+0x84]` |
| `MinecraftClient::getToastManager()` | `0x006cfb70` | `T` | lê MC+0x214 (1º consumidor do press) |
| `MinecraftClient::getGuiScale(int)` | `0x006cde24` | `T` | escala GUI (NÃO usar p/ nosso ortho) |
| `MinecraftClient::getScreenChooser() const` | `0x006cc6b4` | `T` | ponte p/ trocar de tela (frente de religamento) |
| `Screen::_pointerPressed(int,int)` | `0x008634f8` | `T` | **NÃO** usar como choke (coords já em GUI-space) |
| `Screen::absorbsInput() const` | `0x008639d0` | `T` | =1: menu no topo já suprime input in-game |
| `Multitouch::feed(char,char,short,short,int)` | `0x01200558` | `T` | sink global (só p/ blackout total) |
| `stbi_load_from_memory` | `0x00b55b7c` | `T` (C-linkage) | **decoder PNG de graça** via `dlsym(g_mcpe,…)` |
| `stbi_image_free` | `0x00b55914` | `T` (C-linkage) | libera buffer do stbi |
| `AppPlatform_android::getScreenWidth/Height()` | `0x00db2a7c` / `0x00db2a84` | `W` | dims em pixels de device (alternativa) |
| `GuiData::getScreenWidth/Height() const` | `0x007490ec` / `0x00749120` | `T` | dims em GUI escalada (**NÃO** p/ `glViewport`) |
| `_getScreenWidth` / `_getScreenHeight` | `0x0172ca58` / `0x0172ca5c` | `B` (.bss) | globais com dims correntes |
| GLES2 core (`glCreateShader`…`glViewport`) | `U` 48130–48211 | import | libGLESv2 **já mapeada** no processo |
| `glPixelStorei` | **ausente dos imports** (grep vazio) | — | **por isso `-lGLESv2` é obrigatório**, não opcional |
| `Font::draw` / `getFont` / `ScreenRenderer::drawString` | `0x7427e0` / `0x6cd724` / `0x74dffc` | `T` | **fronteira: NÃO reusar** |

**Infra de injeção existente** (`launcher.cpp`): `JNI_OnLoad` cria `worker` que faz `dlopen("libminecraftpe.so", RTLD_NOLOAD|RTLD_NOW)` em loop até achar (`g_mcpe`), depois `dlopen` da libmobilesubstrate e `dlsym("MSHookFunction")`. Tag de log já é `"VoidClient"`. **`g_mcpe` e `MSHookFunction` hoje são `static`** — ver §1.4.

---

## 1. Arquitetura do overlay

### 1.1 Onde engancha
- **Render:** hook **inline** (via `MSHookFunction`) no corpo de `eglSwapBuffers` **dentro da libEGL** (`dlopen("libEGL.so")` + `dlsym`). Como `MSHookFunction` patcha o corpo da função, hookar uma vez pega **todos** os chamadores do processo — inclusive o MCPE via sua PLT→GOT→libEGL. **Não** precisa tocar a GOT do libminecraftpe.
- **Input:** hooks por NOME em três símbolos exportados de `MinecraftClient` (`handlePointerLocation`, `handlePointerPressedButtonPress`, `handlePointerPressedButtonRelease`) — `dlsym(g_mcpe,…)` + `MSHookFunction`.
- **Instalação:** tudo no `worker` do `launcher.cpp`, logo após obter `g_mcpe` e `MSHookFunction`.

Por que `eglSwapBuffers` e não o nível de GUI do jogo (o `INTERFACES_RE.md` §3 desaconselhava o swap): aquela objeção valia **só** para quem queria reusar o material/projeção de GUI nativos, que no instante do swap não estão montados. Como o renderer é **100% nosso** (shader/quad/ortho/blend próprios), não dependemos de nada do jogo: no swap o contexto GL está corrente, o frame do jogo já está pronto no backbuffer (FBO 0) — é exatamente onde se compõe um overlay por cima.

### 1.2 Fluxo por frame
```
render thread do jogo:
  ... jogo desenha o mundo/HUD no FBO 0 ...
  chama eglSwapBuffers(dpy, surf)
    -> NOSSO my_eglSwapBuffers:
         if (!g_uiAtiva) return orig(dpy,surf);        // early-out: FPS-neutro
         if (!g_glReady) overlay_init_gl();            // lazy-init (1ª vez, contexto já existe)
         eglQuerySurface -> W,H
         gl_save(&s)                                    // salva estado GL do jogo
         overlay_frame(W,H)                             // nosso UI: build + flush (quads/texto)
         gl_restore(&s)                                 // devolve estado EXATO ao jogo
         return orig(dpy,surf);                         // apresenta frame + overlay juntos
```

Input roda em **evento**, nunca por frame:
```
input thread:
  handlePointerLocation(mc,x,y) -> cacheia g_mc, g_touchX/Y; se g_uiAtiva, engole o move
  handlePointerPressedButtonPress(mc) -> hit-test; se acertou widget nosso: engole e marca gesto; senão repassa orig
  handlePointerPressedButtonRelease(mc) -> se o gesto era nosso: dispara onClick e engole; senão repassa
```

### 1.3 FPS-neutro quando inativo
- `my_eglSwapBuffers` tem como **primeira linha** `if(!g_uiAtiva) return orig(dpy,surf);` → 1 load de `volatile` + branch + tail-call por frame (sub-microsegundo). Nenhum trabalho de GL, nenhum `glGetError`, nada antes do guard.
- Hooks de input só disparam por **toque**, não por frame. Com `g_uiAtiva=0` o custo por toque é ~1 `isStartMenu()` (≈4 loads) + `return orig`.
- `Screen::absorbsInput()` @`0x8639d0` retorna 1: com uma tela de menu no topo, o jogo **já** suprime o input in-game; nossa única supressão extra é a tela nativa (ver §5).

### 1.4 Modelo de threads / unidade de compilação
- **Tudo GL só vale na render thread com contexto corrente.** Lazy-init (`overlay_init_gl`) acontece **dentro** do 1º `my_eglSwapBuffers`, nunca no `JNI_OnLoad` nem no `worker` (lá não há contexto GL).
- `g_uiAtiva` cruza threads (input escreve, render lê) → `volatile` (pior caso: 1 frame de defasagem, aceitável para gate visual).
- **Build compila UM .cpp** (`$src = launcher.cpp`). Duas opções:
  - **(A, recomendada)** colar todo o código do overlay dentro de `launcher.cpp` (um só TU). Zero mudança estrutural no build.
  - **(B)** criar `ui_gl.cpp` e **adicionar à linha do clang** nos dois scripts, **e** mudar `g_mcpe`/`MSHookFunction` de `static` para global + `extern`. Só vale se o arquivo crescer muito.

---

## 2. Hook de `eglSwapBuffers` + tamanho da tela

```c
#include <dlfcn.h>
#include <GLES2/gl2.h>
#include <EGL/egl.h>
#include <android/log.h>
#define LOG(...) __android_log_print(ANDROID_LOG_INFO,"VoidClient",__VA_ARGS__)

// de launcher.cpp (ver §1.4: tornar global se for TU separado)
extern void* g_mcpe;
typedef void (*MSHookFunction_t)(void*,void*,void**);

static volatile int g_uiAtiva = 0;              // gate; v0 do passo 1 = 1 fixo
static int          g_glReady = 0;

typedef EGLBoolean (*eglSwap_t)(EGLDisplay,EGLSurface);
static eglSwap_t orig_eglSwapBuffers = 0;

#define EGL_HEIGHT 0x3056
#define EGL_WIDTH  0x3057

static void overlay_init_gl(void);              // §3
static void overlay_frame(int W,int H);         // §3/§4 (build + flush)
static void gl_save(void*); static void gl_restore(const void*); // §3

static EGLBoolean my_eglSwapBuffers(EGLDisplay dpy, EGLSurface surf){
    if(!g_uiAtiva) return orig_eglSwapBuffers(dpy,surf);   // FPS-neutro: 1ª linha
    if(!g_glReady) overlay_init_gl();                      // contexto GL existe AQUI

    EGLint W=0,H=0;
    eglQuerySurface(dpy,surf,EGL_WIDTH,&W);
    eglQuerySurface(dpy,surf,EGL_HEIGHT,&H);
    if(W>0 && H>0){
        GLSaved s; gl_save(&s);
        overlay_frame(W,H);
        gl_restore(&s);
    }
    return orig_eglSwapBuffers(dpy,surf);                  // frame + overlay vão juntos
}

static void install_swap_hook(MSHookFunction_t MSHookFunction){
    void* egl = dlopen("libEGL.so", RTLD_NOW|RTLD_NOLOAD);
    if(!egl) egl = dlopen("libEGL.so", RTLD_NOW);
    void* p = dlsym(egl, "eglSwapBuffers");                // resolver por dlsym da libEGL, não RTLD_DEFAULT
    if(!p){ LOG("eglSwapBuffers nao resolvido"); return; }
    MSHookFunction(p,(void*)my_eglSwapBuffers,(void**)&orig_eglSwapBuffers);
    LOG("hook eglSwapBuffers @%p orig=%p", p, (void*)orig_eglSwapBuffers);
}
```

**Tamanho da tela:** vem dos próprios args do hook via `eglQuerySurface(dpy,surf,EGL_WIDTH/HEIGHT)` = **pixels físicos do framebuffer**, exatamente o que `glViewport` e o nosso ortho querem. Não usar `GuiData::getScreenWidth/Height` (coords de GUI escalada). `eglGetCurrentSurface` não é importado pela lib, mas é irrelevante — os args já são `dpy/surf`, e resolvemos nossos símbolos EGL/GLES via `-lEGL -lGLESv2`.

**Alternativa game-side** (se o inline-hook na libEGL do fabricante falhar — (a confirmar no device)): hookar `AppPlatform_android::swapBuffers()` @`0x00db2438` por nome mangled `_ZN19AppPlatform_android11swapBuffersEv`. É `void(this)`, sem args EGL; obter `ctx=*(void**)(this+0xC0)`, `dpy=*(EGLDisplay*)(ctx+0x14)`, `surf=*(EGLSurface*)(ctx+0x1C)` **(offsets lidos do disasm — a confirmar no device)**, desenhar, depois chamar `orig(self)`. **Nunca** hookar `mce::RenderContextOGL::swapBuffers()` @`0x01211db8` (é `bx lr`, stub vazio — o overlay nunca apareceria).

**Build:** acrescentar `-lEGL -lGLESv2` à linha do clang nos **dois** scripts (`build_test.ps1` e `build_stock.ps1`, ambos linha ~18/20 — hoje `-llog -ldl`). Adicionar `-landroid` só se for pela via `AAssetManager` (§4). Manter `-nostdlib++ -fno-exceptions -fno-rtti` (C puro, sem STL).

---

## 3. Renderizador GLES2 próprio

**Decisão de arquitetura (merge coerente das duas frentes de render):** **UM** programa cobre sólido + ícone + texto, com batch de quads em arrays estáticos (sem STL). O fragment é `texture2D(uTex,vUV) * vColor`:
- **sólido** → amostra uma textura branca 1×1 (`vColor` domina);
- **ícone/arte** → atlas PNG RGBA (decodificado pelo `stbi` do jogo);
- **texto** → atlas da fonte em `GL_LUMINANCE_ALPHA` (luminância=255, alpha=cobertura) → `(1,1,1,cov)*vColor` = texto tingido com alpha de cobertura (ver §4).

Três texturas, três draw-calls por passe (ordem = painter: sólidos → ícones → texto), **um** set de estado.

### 3.1 Shaders (fonte completa, ESSL 1.00 / `#version 100` implícito)

```c
static const char* VS =
"attribute vec2 aPos; attribute vec2 aUV; attribute vec4 aColor;"
"uniform vec2 uInvScreen;"                // (2/W, 2/H) -> ortho sem matriz
"varying vec2 vUV; varying vec4 vColor;"
"void main(){"
"  vUV=aUV; vColor=aColor;"
"  gl_Position=vec4(aPos.x*uInvScreen.x-1.0, 1.0-aPos.y*uInvScreen.y, 0.0, 1.0);" // origem top-left, y p/ baixo
"}";

static const char* FS =
"precision mediump float;"
"uniform sampler2D uTex;"
"varying vec2 vUV; varying vec4 vColor;"
"void main(){ gl_FragColor = texture2D(uTex,vUV) * vColor; }";
```

### 3.2 Objetos, vértice e compilação

```c
#include <stddef.h>   // offsetof

typedef struct { float x,y; float u,v; unsigned char r,g,b,a; } UIVert; // 20 bytes

#define MAX_V 4096
static UIVert g_vSolid[MAX_V]; static int g_nSolid;
static UIVert g_vTex  [MAX_V]; static int g_nTex;
static UIVert g_vText [MAX_V]; static int g_nText;

static GLuint g_prog, g_vbo, g_white, g_atlas, g_font;   // g_font: ver §4
static GLint  g_uInvScreen, g_uTex;

static GLuint compile(GLenum t,const char* s){
    GLuint sh=glCreateShader(t); glShaderSource(sh,1,&s,0); glCompileShader(sh);
    GLint ok=0; glGetShaderiv(sh,GL_COMPILE_STATUS,&ok);
    if(!ok){ char l[512]; glGetShaderInfoLog(sh,512,0,l); LOG("shader: %s",l); }
    return sh;
}
static GLuint link_prog(void){
    GLuint p=glCreateProgram(), v=compile(GL_VERTEX_SHADER,VS), f=compile(GL_FRAGMENT_SHADER,FS);
    glAttachShader(p,v); glAttachShader(p,f);
    glBindAttribLocation(p,0,"aPos"); glBindAttribLocation(p,1,"aUV"); glBindAttribLocation(p,2,"aColor");
    glLinkProgram(p);
    GLint ok=0; glGetProgramiv(p,GL_LINK_STATUS,&ok);
    if(!ok){ char l[512]; glGetProgramInfoLog(p,512,0,l); LOG("link: %s",l); }
    glDeleteShader(v); glDeleteShader(f);
    return p;
}

static GLuint make_tex_rgba(const unsigned char* rgba,int w,int h){
    GLuint t; glGenTextures(1,&t); glActiveTexture(GL_TEXTURE0); glBindTexture(GL_TEXTURE_2D,t);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_CLAMP_TO_EDGE);
    glPixelStorei(GL_UNPACK_ALIGNMENT,1);
    glTexImage2D(GL_TEXTURE_2D,0,GL_RGBA,w,h,0,GL_RGBA,GL_UNSIGNED_BYTE,rgba);
    return t;
}

// stb_image EMPRESTADO do jogo (C-linkage, por dlsym) — decoder PNG sem linkar nada nosso
typedef unsigned char* (*stbi_load_mem_t)(const unsigned char*,int,int*,int*,int*,int);
typedef void           (*stbi_free_t)(void*);
static stbi_load_mem_t p_stbi_load_mem;   // dlsym(g_mcpe,"stbi_load_from_memory") @0xb55b7c
static stbi_free_t     p_stbi_free;       // dlsym(g_mcpe,"stbi_image_free")       @0xb55914

extern const unsigned char g_uiPng[]; extern const unsigned int g_uiPng_len; // bin2c (§4/build)
static GLuint load_png(const unsigned char* b,int len){
    int w,h,ch; unsigned char* px=p_stbi_load_mem(b,len,&w,&h,&ch,4);  // força RGBA
    if(!px){ LOG("png decode falhou"); return 0; }
    GLuint t=make_tex_rgba(px,w,h); p_stbi_free(px); return t;
}

static void overlay_init_gl(void){
    p_stbi_load_mem=(stbi_load_mem_t)dlsym(g_mcpe,"stbi_load_from_memory");
    p_stbi_free    =(stbi_free_t)    dlsym(g_mcpe,"stbi_image_free");
    g_prog=link_prog();
    g_uInvScreen=glGetUniformLocation(g_prog,"uInvScreen");
    g_uTex      =glGetUniformLocation(g_prog,"uTex");
    glGenBuffers(1,&g_vbo);
    const unsigned char wht[4]={255,255,255,255}; g_white=make_tex_rgba(wht,1,1);
    g_atlas=load_png(g_uiPng,(int)g_uiPng_len);   // arte de UI (logo etc.) — opcional no passo 1
    g_font = vc_font_init();                        // §4 (atlas da fonte)
    g_glReady=1;
    LOG("overlay GL pronto prog=%u vbo=%u white=%u atlas=%u font=%u",g_prog,g_vbo,g_white,g_atlas,g_font);
}
```

### 3.3 Construção de quads (CPU) — `draw_rect` / `draw_tex`

```c
static void push(UIVert* buf,int* n,float x,float y,float w,float h,
                 float u0,float v0,float u1,float v1,unsigned argb){
    if(*n+6>MAX_V) return;
    unsigned char a=argb>>24,r=argb>>16,g=argb>>8,b=argb;
    UIVert q0={x,  y,  u0,v0,r,g,b,a}, q1={x+w,y,  u1,v0,r,g,b,a},
           q2={x+w,y+h,u1,v1,r,g,b,a}, q3={x,  y+h,u0,v1,r,g,b,a};
    UIVert* o=&buf[*n]; o[0]=q0;o[1]=q1;o[2]=q2; o[3]=q0;o[4]=q2;o[5]=q3; *n+=6;
}
// retângulo sólido (cor AARRGGBB), em PIXELS, origem top-left
static void draw_rect(float x,float y,float w,float h,unsigned argb){
    push(g_vSolid,&g_nSolid,x,y,w,h, .5f,.5f,.5f,.5f, argb);   // tex branca -> vColor domina
}
// quad texturizado do atlas de arte (UVs 0..1), tint AARRGGBB
static void draw_tex(float x,float y,float w,float h,float u0,float v0,float u1,float v1,unsigned tint){
    push(g_vTex,&g_nTex,x,y,w,h,u0,v0,u1,v1,tint);
}
// draw_text: ver §4 (empurra em g_vText com UVs por glifo)
```

### 3.4 Passe de desenho (`overlay_frame` → `ui_flush`)

```c
static void ui_build(int W,int H);   // monta o frame de UI (passo 1/2/3) — §6

static void segment(UIVert* buf,int n,GLuint tex){
    if(n<=0) return;
    glBufferData(GL_ARRAY_BUFFER,(GLsizeiptr)(n*(int)sizeof(UIVert)),buf,GL_STREAM_DRAW);
    glBindTexture(GL_TEXTURE_2D,tex);
    glDrawArrays(GL_TRIANGLES,0,n);
}

static void overlay_frame(int W,int H){
    g_nSolid=g_nTex=g_nText=0;
    ui_build(W,H);
    if(!g_nSolid && !g_nTex && !g_nText) return;

    glUseProgram(g_prog);
    glBindBuffer(GL_ARRAY_BUFFER,g_vbo);
    // attribs apontam p/ offsets no VBO; permanecem válidos entre glBufferData do mesmo buffer
    glEnableVertexAttribArray(0); glVertexAttribPointer(0,2,GL_FLOAT,        GL_FALSE,sizeof(UIVert),(void*)offsetof(UIVert,x));
    glEnableVertexAttribArray(1); glVertexAttribPointer(1,2,GL_FLOAT,        GL_FALSE,sizeof(UIVert),(void*)offsetof(UIVert,u));
    glEnableVertexAttribArray(2); glVertexAttribPointer(2,4,GL_UNSIGNED_BYTE,GL_TRUE, sizeof(UIVert),(void*)offsetof(UIVert,r));

    glBindFramebuffer(GL_FRAMEBUFFER,0);          // garante que pintamos no backbuffer apresentado
    glViewport(0,0,W,H);
    glDisable(GL_DEPTH_TEST); glDepthMask(GL_FALSE);
    glDisable(GL_CULL_FACE);  glDisable(GL_SCISSOR_TEST);
    glColorMask(GL_TRUE,GL_TRUE,GL_TRUE,GL_TRUE);
    glEnable(GL_BLEND); glBlendFunc(GL_SRC_ALPHA,GL_ONE_MINUS_SRC_ALPHA);
    glUniform2f(g_uInvScreen, 2.0f/(float)W, 2.0f/(float)H);
    glActiveTexture(GL_TEXTURE0); glUniform1i(g_uTex,0);

    segment(g_vSolid,g_nSolid,g_white);   // 1) painéis/barras
    segment(g_vTex,  g_nTex,  g_atlas);   // 2) ícones/logo
    segment(g_vText, g_nText, g_font);    // 3) texto (por cima)
}
```

### 3.5 Lista de SAVE/RESTORE do estado GL (contrato exato)

A render thread do jogo assume **persistência** de estado entre frames. Tudo que tocamos tem de voltar idêntico. GLES2 **não tem VAO** → o estado de vertex-attrib é global e precisa ser salvo por índice.

Estado a salvar/restaurar:
1. `GL_CURRENT_PROGRAM`
2. `GL_ARRAY_BUFFER_BINDING`, `GL_ELEMENT_ARRAY_BUFFER_BINDING`
3. `GL_ACTIVE_TEXTURE` + `GL_TEXTURE_BINDING_2D` da unidade 0 (sempre fixar `GL_TEXTURE0` antes de ler/escrever)
4. `GL_BLEND` (enable) + `GL_BLEND_SRC_RGB/DST_RGB/SRC_ALPHA/DST_ALPHA` + `GL_BLEND_EQUATION_RGB/ALPHA`
5. `GL_DEPTH_TEST` (enable) + `GL_DEPTH_WRITEMASK`
6. `GL_CULL_FACE` (enable)
7. `GL_SCISSOR_TEST` (enable) + `GL_SCISSOR_BOX`
8. `GL_COLOR_WRITEMASK`
9. `GL_VIEWPORT`
10. Por atributo 0/1/2: `ARRAY_ENABLED`, `ARRAY_BUFFER_BINDING`, `SIZE`, `TYPE`, `NORMALIZED`, `STRIDE`, `POINTER`

```c
typedef struct {
    GLint prog, arrBuf, elemBuf, activeTex, texU0, vp[4], scBox[4];
    GLint bSrcRGB,bDstRGB,bSrcA,bDstA,bEqRGB,bEqA;
    GLboolean blend,depth,cull,scissor,depthMask,colMask[4];
    GLint vaOn[3],vaBuf[3],vaSz[3],vaTy[3],vaNrm[3],vaStr[3]; void* vaPtr[3];
} GLSaved;

static void gl_save(void* vp_){
    GLSaved* s=(GLSaved*)vp_;
    glGetIntegerv(GL_CURRENT_PROGRAM,&s->prog);
    glGetIntegerv(GL_ARRAY_BUFFER_BINDING,&s->arrBuf);
    glGetIntegerv(GL_ELEMENT_ARRAY_BUFFER_BINDING,&s->elemBuf);
    glGetIntegerv(GL_ACTIVE_TEXTURE,&s->activeTex);
    glActiveTexture(GL_TEXTURE0); glGetIntegerv(GL_TEXTURE_BINDING_2D,&s->texU0);
    s->blend=glIsEnabled(GL_BLEND); s->depth=glIsEnabled(GL_DEPTH_TEST);
    s->cull =glIsEnabled(GL_CULL_FACE); s->scissor=glIsEnabled(GL_SCISSOR_TEST);
    glGetIntegerv(GL_BLEND_SRC_RGB,&s->bSrcRGB); glGetIntegerv(GL_BLEND_DST_RGB,&s->bDstRGB);
    glGetIntegerv(GL_BLEND_SRC_ALPHA,&s->bSrcA); glGetIntegerv(GL_BLEND_DST_ALPHA,&s->bDstA);
    glGetIntegerv(GL_BLEND_EQUATION_RGB,&s->bEqRGB); glGetIntegerv(GL_BLEND_EQUATION_ALPHA,&s->bEqA);
    glGetBooleanv(GL_DEPTH_WRITEMASK,&s->depthMask); glGetBooleanv(GL_COLOR_WRITEMASK,s->colMask);
    glGetIntegerv(GL_VIEWPORT,s->vp); glGetIntegerv(GL_SCISSOR_BOX,s->scBox);
    for(int i=0;i<3;i++){
        glGetVertexAttribiv(i,GL_VERTEX_ATTRIB_ARRAY_ENABLED,&s->vaOn[i]);
        glGetVertexAttribiv(i,GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING,&s->vaBuf[i]);
        glGetVertexAttribiv(i,GL_VERTEX_ATTRIB_ARRAY_SIZE,&s->vaSz[i]);
        glGetVertexAttribiv(i,GL_VERTEX_ATTRIB_ARRAY_TYPE,&s->vaTy[i]);
        glGetVertexAttribiv(i,GL_VERTEX_ATTRIB_ARRAY_NORMALIZED,&s->vaNrm[i]);
        glGetVertexAttribiv(i,GL_VERTEX_ATTRIB_ARRAY_STRIDE,&s->vaStr[i]);
        glGetVertexAttribPointerv(i,GL_VERTEX_ATTRIB_ARRAY_POINTER,&s->vaPtr[i]);
    }
}
static void gl_restore(const void* vp_){
    const GLSaved* s=(const GLSaved*)vp_;
    for(int i=0;i<3;i++){                                   // reatar o buffer ANTES de reemitir o pointer
        glBindBuffer(GL_ARRAY_BUFFER,s->vaBuf[i]);
        if(s->vaOn[i]){ glVertexAttribPointer(i,s->vaSz[i],s->vaTy[i],(GLboolean)s->vaNrm[i],s->vaStr[i],s->vaPtr[i]); glEnableVertexAttribArray(i); }
        else glDisableVertexAttribArray(i);
    }
    glBindBuffer(GL_ARRAY_BUFFER,s->arrBuf); glBindBuffer(GL_ELEMENT_ARRAY_BUFFER,s->elemBuf);
    glActiveTexture(GL_TEXTURE0); glBindTexture(GL_TEXTURE_2D,s->texU0); glActiveTexture(s->activeTex);
    if(s->blend)glEnable(GL_BLEND);else glDisable(GL_BLEND);
    glBlendFuncSeparate(s->bSrcRGB,s->bDstRGB,s->bSrcA,s->bDstA); glBlendEquationSeparate(s->bEqRGB,s->bEqA);
    if(s->depth)glEnable(GL_DEPTH_TEST);else glDisable(GL_DEPTH_TEST); glDepthMask(s->depthMask);
    if(s->cull)glEnable(GL_CULL_FACE);else glDisable(GL_CULL_FACE);
    if(s->scissor)glEnable(GL_SCISSOR_TEST);else glDisable(GL_SCISSOR_TEST);
    glScissor(s->scBox[0],s->scBox[1],s->scBox[2],s->scBox[3]);
    glColorMask(s->colMask[0],s->colMask[1],s->colMask[2],s->colMask[3]);
    glViewport(s->vp[0],s->vp[1],s->vp[2],s->vp[3]);
    glUseProgram(s->prog);
}
```

> O protótipo de `my_eglSwapBuffers` em §2 usa `GLSaved s;` — a struct está definida aqui; em um TU único, mover a definição de `GLSaved` para antes de §2, ou declará-la no topo.

---

## 4. Fonte custom (não-Minecraft)

### 4.1 Abordagem escolhida
- **MVP (passo 1–3): atlas de cobertura** gerado offline com `stb_truetype` (`stbtt_PackFontRange`, oversampling 2×2), fonte **OFL** (ex.: **Rajdhani SemiBold** ou **Chakra Petch** p/ títulos; **Inter** p/ corpo) — estética dark/techy "Void", nada de pixel-art do MC. **Nunca** empacotar Segoe/SegoeWP (proprietárias Microsoft).
- **Upload como `GL_LUMINANCE_ALPHA`** (luminância=255, alpha=cobertura), para o texto entrar no **mesmo programa unificado** (`texture2D*vColor` → `(1,1,1,cov)*vColor` = texto tingido). Isso evita um segundo shader e mantém 1 set de estado por passe.
- **Evolução (premium): SDF** (`stbtt_GetCodepointSDF`) → nitidez em qualquer escala + contorno/glow de graça; exige FS dedicado (não unificado) — opcional, documentado abaixo.

### 4.2 Fonte NÃO reutilizada (fronteira)
`Font::draw` @`0x7427e0`, `MinecraftClient::getFont()` @`0x6cd724`, `ScreenRenderer::drawString` @`0x74dffc` — ficam de fora. Desenhamos nossos glifos com nosso shader.

### 4.3 Formato do blob (o que o gerador offline produz)
```c
typedef struct { unsigned short x,y,w,h; float xoff,yoff,xadvance; } Glyph; // casa 1:1 com stbtt_packedchar
typedef struct {
    char magic[4];                 // "VCF1"
    unsigned short atlas_w, atlas_h;
    float bake_px;                 // tamanho de bake (px) -> base da escala
    float line_height;             // (ascent-descent+linegap)*scale
    unsigned short first_cp;       // 32 (' ')
    unsigned short count;          // 95 (ASCII imprimível) ; +Latin-1 depois
    // segue no blob: Glyph glyphs[count]; depois atlas_w*atlas_h bytes R8 (cobertura)
} VcFontHeader;
typedef struct { GLuint tex; int atlas_w,atlas_h; float bake_px,line_height; int first_cp,count; const Glyph* glyphs; } VcFont;
static VcFont g_fontInfo;
```

### 4.4 Carregar o blob embutido + subir o atlas (LA)
```c
#include <string.h>
extern const unsigned char font_blob[];   // de font_blob.h (xxd -i)

static GLuint vc_upload_font(const unsigned char* cov,int w,int h){
    // expandir R8(cobertura) -> LUMINANCE_ALPHA(255,cov) p/ o FS unificado tingir
    unsigned char* la=(unsigned char*)malloc((size_t)w*h*2);
    for(int i=0;i<w*h;i++){ la[2*i]=255; la[2*i+1]=cov[i]; }
    GLuint t; glGenTextures(1,&t); glActiveTexture(GL_TEXTURE0); glBindTexture(GL_TEXTURE_2D,t);
    glPixelStorei(GL_UNPACK_ALIGNMENT,1);
    glTexImage2D(GL_TEXTURE_2D,0,GL_LUMINANCE_ALPHA,w,h,0,GL_LUMINANCE_ALPHA,GL_UNSIGNED_BYTE,la);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MIN_FILTER,GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_MAG_FILTER,GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_S,GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D,GL_TEXTURE_WRAP_T,GL_CLAMP_TO_EDGE);
    free(la);
    return t;
}
static GLuint vc_font_init(void){
    const unsigned char* p=font_blob;
    VcFontHeader h; memcpy(&h,p,sizeof h);
    if(memcmp(h.magic,"VCF1",4)!=0){ LOG("font magic ruim"); return 0; }
    const Glyph* g=(const Glyph*)(p+sizeof h);
    const unsigned char* pix=(const unsigned char*)(g+h.count);
    g_fontInfo.tex=vc_upload_font(pix,h.atlas_w,h.atlas_h);
    g_fontInfo.atlas_w=h.atlas_w; g_fontInfo.atlas_h=h.atlas_h;
    g_fontInfo.bake_px=h.bake_px; g_fontInfo.line_height=h.line_height;
    g_fontInfo.first_cp=h.first_cp; g_fontInfo.count=h.count; g_fontInfo.glyphs=g;
    return g_fontInfo.tex;
}
```

### 4.5 `draw_text` (empurra glifos em `g_vText`; 1 segmento/passe)
```c
// x = pen inicial; y = BASELINE; px = tamanho em pixels; argb = AARRGGBB
static void draw_text(float x,float y,const char* s,float px,unsigned argb){
    const VcFont* f=&g_fontInfo; if(!f->tex) return;
    float sc=px/f->bake_px, iw=1.0f/f->atlas_w, ih=1.0f/f->atlas_h, penx=x;
    for(const unsigned char* p=(const unsigned char*)s; *p; ++p){
        unsigned cp=*p;  // MVP: ASCII. UTF-8/acentos -> decodificar codepoint (ver pitfall)
        if(cp<(unsigned)f->first_cp || cp>=(unsigned)(f->first_cp+f->count)) continue;
        const Glyph* g=&f->glyphs[cp-f->first_cp];
        float x0=penx+g->xoff*sc, y0=y+g->yoff*sc;      // yoff é NEGATIVO (glifo sobe acima da baseline)
        float u0=g->x*iw, v0=g->y*ih, u1=(g->x+g->w)*iw, v1=(g->y+g->h)*ih;
        push(g_vText,&g_nText, x0,y0, g->w*sc,g->h*sc, u0,v0,u1,v1, argb);
        penx += g->xadvance*sc;
    }
}
static float text_width(const char* s,float px){
    const VcFont* f=&g_fontInfo; float w=0, sc=px/f->bake_px;
    for(const unsigned char* p=(const unsigned char*)s; *p; ++p){
        unsigned cp=*p; if(cp<(unsigned)f->first_cp||cp>=(unsigned)(f->first_cp+f->count)) continue;
        w += f->glyphs[cp-f->first_cp].xadvance*sc;
    }
    return w;
}
```

### 4.6 Gerar/empacotar o atlas no build
Passo **de host** (não entra no .so), roda uma vez no PC:
1. `gen_font.c` com `#define STB_TRUETYPE_IMPLEMENTATION` + `stb_truetype.h` (domínio público). Lê `Rajdhani-SemiBold.ttf` (OFL).
2. `stbtt_PackBegin(&spc,bmp,W,H,0,1,0)`; `stbtt_PackSetOversampling(&spc,2,2)`; `stbtt_PackFontRange(&spc,ttf,0,bake_px /*ex 48*/,32,95,pc)`; `stbtt_PackEnd`.
3. `stbtt_GetFontVMetrics` + `stbtt_ScaleForPixelHeight` → `line_height`.
4. Preencher `Glyph[]` a partir de `stbtt_packedchar` (x0/y0/x1/y1/xoff/yoff/xadvance).
5. `fwrite` header + glyphs + `bmp` (R8) → `font_blob.bin`.
6. **Embutir:** `xxd -i font_blob.bin > font_blob.h` (gera `const unsigned char font_blob[]={…}; unsigned int font_blob_len;`). Idem p/ a arte `ui.png` → `g_uiPng[]`.

Embutir via bin2c é o recomendado: zero I/O, não depende de caminho no APK, não esbarra no ABI de `std::string`. **Alternativa** (ler asset do APK): NDK `AAssetManager_fromJava(env,assetMgr)` (`libandroid` já no processo; add `-landroid`) + `AAssetManager_open("voidclient/ui.png",AASSET_MODE_BUFFER)` + `AAsset_getBuffer/Length` → `stbi`. **Não** usar `AppPlatform::readAssetFile` @`0xb13b00` (usa `std::string` COW, perigoso sob `-nostdlib++`).

> PowerShell: bin2c pode ser `$b=[IO.File]::ReadAllBytes("…\ui.png")` gerando o array — mas **nunca** empacotar o APK via zip do PowerShell (memória `feedback_empacota_modulo`: quebra em silêncio). O empacotamento continua pelo `apktool b` dos scripts.

### 4.7 (Opcional) FS SDF — upgrade premium
```c
static const char* FS_SDF =
"#extension GL_OES_standard_derivatives : enable\n"
"precision mediump float; uniform sampler2D uTex; uniform vec4 uColor; varying vec2 vUV;"
"void main(){ float d=texture2D(uTex,vUV).a; float aa=fwidth(d);"
"  float a=smoothstep(0.5-aa,0.5+aa,d); gl_FragColor=vec4(uColor.rgb,uColor.a*a); }";
// sem GL_OES_standard_derivatives: passar softness fixo (= 0.7*bake_px/px) como uniform.
```
Exige programa próprio (não unificado) e atlas SDF (byte = distância, 0.5 = borda). Confirmar `GL_OES_standard_derivatives` no A71 via `glGetString(GL_EXTENSIONS)` **(a confirmar no device)**.

---

## 5. Input: hook de toque + hit-test + supressão + gate

Nível recomendado = **`MinecraftClient`** (3 símbolos exportados → `dlsym` direto, sem swizzle de vtable). Coords de toque chegam em **pixels** no `handlePointerLocation(short x, short y)`; cacheamos no nosso lado (robusto, não depende do offset `MC+0x230`).

```c
#include <stdint.h>
#include <stdbool.h>

#define FV_handlePress    0x6c170cu
#define FV_handleRelease  0x6c3540u
#define FV_handleLoc      0x6c3680u
#define FVPTR_SCREENVIEW  0x160681cu   // "vtable for ScreenView" + 8   (INTERFACES_RE §2.3) — a confirmar
#define FVPTR_STARTMENU   0x160323cu   // StartMenuScreenController     — a confirmar

typedef void (*fnVoidMC)(void*);
typedef void (*fnLoc)(void*,short,short);
static fnVoidMC o_press,o_release; static fnLoc o_loc;

static uintptr_t g_slide=0;
static void*     g_mc=0;              // cacheado dos hooks (r0 = MinecraftClient*)
static float     g_touchX=0,g_touchY=0;
static bool      g_weOwnGesture=false;
static int       g_pressedIdx=-1;

// --- GATE ---
static inline void* topScreen(void* mc){        // getScreen() @0x6cd680 + a guarda que ele NÃO tem
    if(!mc) return 0;
    void* s=*(void**)((char*)mc+0x80);          // _M_start
    void* e=*(void**)((char*)mc+0x84);          // _M_finish
    if(s==e) return 0;                           // pilha vazia
    return *(void**)((char*)e-8);
}
static bool isStartMenu(void* mc){
    void* scr=topScreen(mc); if(!scr) return false;
    if(*(void**)scr!=(void*)(g_slide+FVPTR_SCREENVIEW)) return false;
    void* ctrl=*(void**)((char*)scr+0x80);      // ScreenView+0x80 = controller — a confirmar
    return ctrl && *(void**)ctrl==(void*)(g_slide+FVPTR_STARTMENU);
}
static inline void refreshGate(void* mc){
    g_mc=mc;
    // v0 (passo 1): manter g_uiAtiva=1 fixo (ligar no install).
    // v1 (passo 3): g_uiAtiva = isStartMenu(mc);
}

// --- WIDGETS (espaço de PIXEL, igual ao draw) ---
typedef struct { float x,y,w,h; void(*onClick)(void); const char* label; } VWidget;
static void onVoidTab(void){ /* abrir nosso painel / getScreenChooser @0x6cc6b4 p/ religamento */ }
static VWidget g_widgets[]={ {24,24,220,64,onVoidTab,"Void Client"} };
enum { NW = (int)(sizeof(g_widgets)/sizeof(g_widgets[0])) };

static int hitTest(float x,float y){
    for(int i=0;i<NW;i++){ VWidget*w=&g_widgets[i];
        if(x>=w->x&&x<w->x+w->w&&y>=w->y&&y<w->y+w->h) return i; }
    return -1;
}

// --- HOOKS ---
static void h_loc(void* mc,short x,short y){
    refreshGate(mc);
    g_touchX=(float)x; g_touchY=(float)y;       // cache próprio
    if(!g_uiAtiva){ o_loc(mc,x,y); return; }
    // UI ativa: engole move/drag (hover opcional). NÃO chama orig.
}
static void h_press(void* mc){
    refreshGate(mc);
    if(!g_uiAtiva){ g_weOwnGesture=false; o_press(mc); return; }
    int idx=hitTest(g_touchX,g_touchY);
    if(idx<0){ g_weOwnGesture=false; o_press(mc); return; }   // fora dos nossos: deixa a tela nativa
    g_pressedIdx=idx; g_weOwnGesture=true;                      // consumido -> engole (NÃO chama orig)
}
static void h_release(void* mc){
    refreshGate(mc);
    if(!g_uiAtiva || !g_weOwnGesture){ o_release(mc); return; } // gesto não-nosso: repassa
    int idx=hitTest(g_touchX,g_touchY);
    if(idx>=0 && idx==g_pressedIdx && g_widgets[idx].onClick) g_widgets[idx].onClick();
    g_pressedIdx=-1; g_weOwnGesture=false;                      // consumido (NÃO chama orig)
}

// --- INSTALAÇÃO (no worker do launcher.cpp, junto do resto) ---
static void install_input_hooks(MSHookFunction_t MSHookFunction){
    void* h=g_mcpe; // já é o handle RTLD_NOLOAD de libminecraftpe
    void* pPress=dlsym(h,"_ZN15MinecraftClient31handlePointerPressedButtonPressEv");
    g_slide=((uintptr_t)pPress & ~1u) - FV_handlePress;        // mascarar bit Thumb
    MSHookFunction(pPress,(void*)h_press,(void**)&o_press);
    MSHookFunction(dlsym(h,"_ZN15MinecraftClient33handlePointerPressedButtonReleaseEv"),(void*)h_release,(void**)&o_release);
    MSHookFunction(dlsym(h,"_ZN15MinecraftClient21handlePointerLocationEss"),(void*)h_loc,(void**)&o_loc);
    // opcional (blackout total p/ pausa-com-mundo/multi-dedo): hook Multitouch::feed @0x1200558
    // void* f=dlsym(h,"_ZN10Multitouch4feedEccssi"); MSHookFunction(f,(void*)h_feed,(void**)&o_feed);
}
```

**Supressão (como engole):** hookar `handlePointerPressedButtonPress` @`0x6c170c` e **não** chamar `orig` bloqueia os 4 consumidores em cadeia (MC+0x214 ToastManager/consumidor primário, tela do topo `vtable+0x58`, handler in-game MC+0x134, InputHandler MC+0x128). Release @`0x6c3540` é simétrico. **Pareamento obrigatório:** se o press foi engolido, o release também precisa ser (`g_weOwnGesture`), senão chega um release órfão na tela nativa.

**Por que esse nível:** `Screen::absorbsInput()` @`0x8639d0` já retorna 1 (menu suprime input in-game); nossa única supressão extra é a tela nativa (perna 2). **Não** usar `Screen::_pointerPressed` @`0x8634f8` (virtual por-tela, coords já em GUI-space, e o StartMenu MVC nem passa por ele) nem o nível Android (`AInputQueue`, coords de MotionEvent cru).

**Gate de ativação:** `g_uiAtiva` é escrito pelo input (`refreshGate`) e lido pelo render. Para o passo 1, `=1` fixo. Para o passo 3, `isStartMenu(mc)` (compare de **vptr**, sem alocar string). `g_mc` é cacheado no 1º evento de toque; antes disso o render usa o default — ver open questions.

---

## 6. Plano incremental

### Passo 1 — prova do pipeline: retângulo + "Void Client" por cima do jogo
Objetivo: ver **nossos pixels** compostos sobre o frame do jogo, provando hook+contexto+estado GL.
```c
static void ui_build(int W,int H){
    (void)W;(void)H;
    draw_rect(16,16, 300,72, 0xE6141018);                 // painel translúcido (AARRGGBB)
    draw_rect(16,16, 300, 3, 0xFF7A3CFF);                 // faixa roxa "Void"
    draw_text(34, 58, "Void Client", 34.0f, 0xFFE8E8FF);  // y = baseline
}
```
- `g_uiAtiva=1` fixo no install.
- Build: `-lEGL -lGLESv2` nos dois scripts; embutir `font_blob.h` (e `g_uiPng` se usar logo).
- Critério: painel + texto visíveis, **sem** travar o jogo e **sem** corromper o frame seguinte (prova do save/restore).

### Passo 2 — primeiro painel/botão custom interativo
- Adicionar o hit-test de input (§5) com `g_widgets[0]` casando **em pixels** com o `draw_rect` do passo 1.
- `onVoidTab` muda um estado nosso (ex.: abre/fecha um sub-painel) e re-desenha.
- Validar: toque dentro do botão dispara `onClick` e **não** vaza para o jogo; toque fora passa normal; press/release pareados.
- Confirmar alinhamento do espaço de toque (pixels do `handlePointerLocation`) com o espaço de draw (pixels do `eglQuerySurface`) — **(a confirmar no device)**.

### Passo 3 — menu principal custom inteiro
- Trocar o gate para `g_uiAtiva = isStartMenu(mc)` (só desenha/engole no StartMenu).
- Montar o menu Void completo em `ui_build` (painéis, lista de botões, logo do atlas, título SDF opcional).
- Religamento: `onClick` navega via `MinecraftClient::getScreenChooser()` @`0x6cc6b4` (push/pop de telas) — frente separada.
- Confirmar FPS-neutro **com número** fora do menu (overlay inativo).

---

## 7. Riscos / pitfalls + open questions

### Pitfalls (estado GL, thread, timing)
- **Save/restore é o contrato nº 1.** GLES2 não tem VAO → salvar os 3 atributos (enable+buffer+size+type+norm+stride+pointer) e reatar o buffer **antes** de reemitir cada `glVertexAttribPointer` no restore. Esquecer qualquer item corrompe o frame seguinte do jogo.
- **`GL_TEXTURE_BINDING_2D` é por unidade ativa:** sempre fixar `GL_TEXTURE0` antes de ler/escrever e devolver `GL_ACTIVE_TEXTURE` por último (o jogo pode estar em `GL_TEXTURE3`).
- **Depth:** o jogo quase certamente deixa `GL_DEPTH_TEST` e/ou `GL_DEPTH_WRITEMASK=TRUE` no swap; sem desligar, nossos quads z=0 somem; sem restaurar `DEPTH_WRITEMASK`, corrompe o próximo frame.
- **Blend pode ser Separate/EquationSeparate:** salvar os 4 fatores + 2 equações; restaurar com `glBlendFuncSeparate`/`glBlendEquationSeparate`.
- **`COLOR_WRITEMASK`/`SCISSOR`:** se o jogo deixou canal mascarado ou scissor ativo, a UI some parcial; forçar colorMask TRUE + scissor OFF no draw e restaurar exato.
- **`glBindFramebuffer(0)`** antes de desenhar (caso o jogo tenha deixado um FBO interno ligado).
- **Lazy-init só na render thread** (dentro do 1º `my_eglSwapBuffers`); nunca em `JNI_OnLoad`/`worker` (sem contexto GL → objetos nasceriam no contexto errado).
- **Early-out literal:** `if(!g_uiAtiva) return orig(...)` tem de ser a **primeira** linha; qualquer trabalho antes (até `glGetError`) mata o FPS-neutro. `glGetError` só em debug.
- **Resolver `eglSwapBuffers` por `dlopen("libEGL.so")+dlsym`**, não `RTLD_DEFAULT` (pode pegar um wrapper).
- **Não** hookar `mce::RenderContextOGL::swapBuffers` @`0x1211db8` (stub `bx lr`).
- **`getScreen()` @`0x6cd680` não valida pilha vazia** → sempre checar `[mc+0x80]==[mc+0x84]` antes (`topScreen`).
- **Mascarar bit Thumb** no cálculo de `g_slide`: `(addr & ~1u) - fileVA`; esquecer desalinha todos os vptr/offsets por 1.
- **Pareamento press/release** por `g_weOwnGesture` (release órfão quebra a tela nativa).
- **UTF-8/PT-BR:** `*p` como byte só cobre ASCII; acentos são multibyte → decodificar codepoint e bakear Latin-1 (0xC0–0xFF). MVP ASCII, evoluir depois.
- **Formato de textura:** usar `GL_RGBA` (arte) e `GL_LUMINANCE_ALPHA` (fonte); **não** `GL_R8/GL_RED` (GLES3). `glPixelStorei(GL_UNPACK_ALIGNMENT,1)` antes de upload de atlas não-múltiplo-de-4 (senão linhas "rasgam").
- **`-nostdlib++`:** proibido `std::string/std::vector/new/try`. Batch em arrays estáticos; `malloc/free/memcpy/memcmp` da libc estão OK.
- **Build dependência:** reconstruir o `.so` sempre que mudar struct/offset (memória `feedback_build_dependencia`); empacotar só via `apktool b` (nunca zip do PowerShell).

### Open questions (a confirmar no device)
1. O MCPE compõe o frame final no **FBO 0** no instante do swap? `glBindFramebuffer(0)` cobre, mas logar `glGetIntegerv(GL_FRAMEBUFFER_BINDING)` na 1ª execução.
2. A **libEGL do fabricante** (duchamp/Mali ou A71) permite inline-hook do `eglSwapBuffers` pelo Substrate? Se não, usar a via game-side `AppPlatform_android::swapBuffers` @`0xdb2438` (confirmar offsets `ctx+0x14`/`+0x1c`).
3. **Alinhamento de espaços:** os pixels do `handlePointerLocation` == pixels do `eglQuerySurface`? Se houver escala/rotação, ajustar o hit-test. Logar W/H de ambos.
4. **vptr relocados** `ScreenView`/`StartMenuScreenController` (slide) e `*(ScreenView+0x80)==StartMenuController` na build viva (INTERFACES_RE marca como "a confirmar"). Logar `getScreen()->getScreenName()` p/ fixar.
5. Como obter `MinecraftClient*` **na render thread antes de qualquer toque** (p/ o painel aparecer já no menu sem interação). Via `screen+0x14 = MinecraftClient*` (render frente) — a validar; senão depender do cache do 1º input.
6. Existe VAO ligado no swap? Ler `GL_VERTEX_ARRAY_BINDING_OES`; se != 0, ligar VAO 0 e restaurar (0.15 é GLES2 puro → risco baixo).
7. `GL_VIEWPORT` no swap cobre a surface inteira (`vp[2]==W,vp[3]==H`)? Sempre setamos `glViewport(0,0,W,H)` com W/H de `eglQuerySurface`.
8. `GL_OES_standard_derivatives` no A71 (p/ o SDF com `fwidth`) — define SDF-com-fwidth vs SDF-com-softness-fixo.
9. Custo real do branch por-frame com overlay inativo (medir p/ bater "FPS-neutro" com número).
10. Identidade de MC+0x214 (1º consumidor do press) — ToastManager (`getToastManager` @`0x6cfb70` lê o mesmo offset) ou input da UI nova? Só importa p/ overlay **in-game** com supressão seletiva; p/ menu, engolimos no topo e não precisamos resolver.
11. Multi-dedo em telas de menu: dedos secundários podem atingir botões nativos não-cobertos; se a UI for 100% opaca, decidir ligar `Multitouch::feed` @`0x1200558` (com gate `if(g_uiAtiva)`).