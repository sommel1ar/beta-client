#include <jni.h>
#include <android/log.h>
#include <dlfcn.h>
#include <pthread.h>
#include <unistd.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <stdio.h>
#include <time.h>
#include <sys/mman.h>
#include <GLES2/gl2.h>
#include <EGL/egl.h>
#include "font_blob.h"
#include "icons_blob.h"
#include "void_sdk.h"

#define LOG(...) __android_log_print(ANDROID_LOG_INFO, "VoidClient", __VA_ARGS__)

// -nostdlib++: fornecemos new/delete nos mesmos (classes com dtor virtual referenciam
// operator delete via o deleting-destructor da vtable, mesmo sem a gente dar `delete`).
void* operator new(size_t n) { return malloc(n); }
void* operator new[](size_t n) { return malloc(n); }
void operator delete(void* p) noexcept { free(p); }
void operator delete[](void* p) noexcept { free(p); }
void operator delete(void* p, size_t) noexcept { free(p); }
void operator delete[](void* p, size_t) noexcept { free(p); }
extern "C" void __cxa_pure_virtual() {}

typedef void (*MSHookFunction_t)(void*, void*, void**);

static void* g_mcpe = nullptr;
static MSHookFunction_t MSHookFunction = nullptr;

static volatile int g_uiAtiva = 0;
static int g_glReady = 0;
static EGLContext g_ctx = EGL_NO_CONTEXT;
static void* g_mc = nullptr;
static uintptr_t g_slide = 0;
static long g_upd = 0;
typedef void (*fnVoidMC)(void*);
static fnVoidMC orig_update = nullptr;
static fnVoidMC orig_press = nullptr, orig_release = nullptr;
typedef void (*fn_svLoc)(void*, short, short);
static fn_svLoc orig_svLoc = nullptr;
typedef void (*fn_pauseRender)(void*, int, int, float);
static fn_pauseRender orig_pauseRender = nullptr;
typedef bool (*fn_handleBack)(void*, bool);
static fn_handleBack orig_handleBack = nullptr;
typedef bool (*fn_btnEvt)(void*, short, int);
static fn_btnEvt orig_btnEvt = nullptr;
typedef void (*fn_svRender)(void*, void*);
static fn_svRender orig_svRender = nullptr;
typedef void (*fn_jniBack)(void*, void*);
static fn_jniBack orig_nativeBack = nullptr;
typedef void (*fn_jniStr)(void*, void*, void*);
static fn_jniStr orig_nTypeChar = nullptr, orig_nSetText = nullptr;
static fn_jniBack orig_nReturn = nullptr, orig_nBksp = nullptr;
static unsigned g_lastVptr = 0;
static volatile int g_backReq = 0;
static int g_press_region = -1, g_activeIdx = -1;
static volatile int g_menuHidden = 0;
static int g_lastW = 0, g_lastH = 0;
static int g_pixelH = 1080;
static float g_optMult = 1.0f;
static int g_loadPct = 0;
static char g_loadMsg[64] = {0};
static int g_screen = 0;
static int g_menuT0 = 0, g_wasMenu = 0;
static int g_igMenu = 0; static int g_igMenuT0 = 0;   // timestamp do ultimo abrir/fechar (animacao de slide)
static unsigned g_ourPtrs = 0;
static int g_drag = -1;
static float g_dragVal = 0.0f;
static int g_tab = 0;
static void* g_worldsModel = nullptr;
static char g_worldNames[32][48];
static int g_worldCount = 0;
typedef struct { int id; char name[48]; char host[64]; int port; } VcServer;
static VcServer g_servers[64];
static int g_serverCount = 0;
typedef struct { int id; char motd[80]; int players; int maxp; int online; int pingMs; } VcPing;
static VcPing g_ping[64];
static int g_pingN = 0;
static void* g_srvLoc = nullptr;
static int g_pingCur = 0;
static int g_pingT0 = 0;
static int g_pingInFlight = 0;
static volatile int g_lastRtt = -1;
static char g_langCode[64][16];
static char g_langName[64][64];
static int g_langCount = 0;
static int g_langCur = -1;
static char g_fields[3][64];
static int g_fieldCount = 0;
static volatile int g_activeField = 0;
static volatile int g_submitReq = 0;
static int g_editServerId = 0;
static int g_srvFormErr = 0;
static int g_cwMode = 0, g_cwType = 0, g_cwDiff = 2, g_editWorldIdx = -1;
static pthread_mutex_t g_fieldMtx = PTHREAD_MUTEX_INITIALIZER;

static void ui_build_options(int W, int H);
static int hitTestOptions(float x, float y);
static int onPauseScreen(void* mc);
static int onProgress(void* mc);
static int onHud(void* mc);
static void ui_build_ingame(int W, int H);
static void vc_ig_initpos();
static void vc_ig_panel(float* ppx, float* ppy, float* ppw, float* pph);
static void vc_hud_dim();
static void ui_build_pause(int W, int H);
static void ui_build_loading(int W, int H);
static void ui_build_modules(int W, int H);
static int hitTestModules(float x, float y);
static void ui_build_modcfg(int W, int H);
static int hitTestModCfg(float x, float y);
static void vc_modules_render_hud(VoidCanvas& g);
static void vc_modules_tick(void* mc);
static void vc_modules_load();
static void vc_modules_save();
static int g_fps = 0;
static int g_cfgModule = -1;   // qual modulo tem o config aberto (g_screen==9)
static int g_modTextEdit = -1; // qual setting de texto esta sendo editado no teclado
static int hitTestPause(float x, float y);
static void ui_build_worlds(int W, int H);
static void ui_build_servers(int W, int H);
static int hitTestWorlds(float x, float y);
static int hitTestServers(float x, float y);
static void ui_build_createworld(int W, int H);
static int hitTestCreateWorld(float x, float y);
static void ui_build_srvform(int W, int H);
static int hitTestSrvForm(float x, float y);
static void ui_build_langs(int W, int H);
static int hitTestLangs(float x, float y);
static void ui_build_editworld(int W, int H);
static int hitTestEditWorld(float x, float y);
static void vc_kb_open(int fieldIdx);
static void vc_kb_close();
#define R_NONE -1
#define R_HEADER -2
#define R_CHIP -3

typedef struct { float x, y; float u, v; unsigned char r, g, b, a; } UIVert;

#define MAX_V 8192
static UIVert g_vSolid[MAX_V]; static int g_nSolid;
static UIVert g_vText[MAX_V]; static int g_nText;
static UIVert g_vIcon[MAX_V]; static int g_nIcon;

static GLuint g_prog, g_vbo, g_white, g_font, g_iconTex;
static GLint g_uInvScreen, g_uTex;
static GLuint g_blurProg, g_capTex;
static GLint g_uBlurInv, g_uBlurTex, g_uBlurTexel;
static GLuint g_roundProg; static GLint g_uRInv, g_uRHalf, g_uRRad, g_uRCol;
struct RoundRect { float x, y, w, h, r; unsigned argb; };
static RoundRect g_round[128]; static int g_nRound;
static UIVert g_vQuad[6];
static GLuint g_loFbo, g_loTex; static int g_loW, g_loH;
// motion blur acumulado (efeito GL; controlado pelo modulo motion_blur via vc_mb_config)
#define MB_MAX 6
static GLuint g_mbTex[MB_MAX]; static int g_mbReady = 0, g_mbCount = 0, g_mbHead = 0, g_mbW = 0, g_mbH = 0;
static int g_mbOn = 0, g_mbN = 3, g_mbDyn = 1; static float g_mbAlpha = 0.25f, g_mbBleed = 0.95f;
// zoom (efeito FOV + botao in-game; controlado pelo modulo zoom via vc_zoom_config)
static int g_zoomOn = 0, g_zoomSmooth = 1, g_zoomHeld = 0, g_zoomPid = -1, g_zoomActive = 0, g_zoomToggle = 0;
static float g_zoomMult = 3.0f, g_zoomUserFov = 0.0f, g_zoomCur = 0.0f;
static float g_zbx = -1.0f, g_zby = -1.0f;   // centro do botao Z: FRACAO (0..1); <0 = posicao-padrao
#define ZB_R 44.0f
// perspectiva (botao in-game cicla a visao 1a/3a, tipo F5; controlado pelo modulo perspective)
static int g_perspOn = 0, g_perspPid = -1, g_perspReq = 0, g_perspSkip = 0;
static float g_pbx = -1.0f, g_pby = -1.0f;   // centro do botao de perspectiva: FRACAO (0..1); <0 = padrao
// HUD arrastavel: origem do modulo atual + medicao de bbox + modo editar + arraste
static float g_hudOX = 0.0f, g_hudOY = 0.0f;
static int   g_hudMeasuring = 0;
static float g_mMinX, g_mMinY, g_mMaxX, g_mMaxY;
static float g_hudRX[64], g_hudRY[64], g_hudRW[64], g_hudRH[64];
static int   g_hudEdit = 0, g_hudMode = 0, g_hudDragPid = -1, g_dragActive = 0, g_dragCenter = 0;  // g_hudMode: 0=Mover 1=Redimensionar
static float* g_dragFx = nullptr; static float* g_dragFy = nullptr; static float* g_dragFs = nullptr;
static float g_dragW = 0.0f, g_dragH = 0.0f, g_etOX = 0.0f, g_etOY = 0.0f, g_dragStartScale = 1.0f, g_dragStartFy = 0.0f;
static float g_rzCX = 0.0f, g_rzCY = 0.0f, g_rzD0 = 1.0f;   // resize: centro do elemento + distancia inicial (Chebyshev)
static float g_hudScale = 1.0f;
// lista GENERICA de elementos editaveis (HUD + botoes da launcher). center=1 -> fx/fy e o CENTRO; fsc = escala (ou null).
struct EditTarget { float rx, ry, rw, rh, w, h; float* fx; float* fy; float* fsc; int center; const char* name; };
static EditTarget g_et[80]; static int g_etCount = 0;
static float g_snapLineX = -1.0f, g_snapLineY = -1.0f;   // linha-guia azul ativa (snap), <0 = nenhuma
#define SNAP_T 14.0f
// hotbar: rect real do jogo (via HotBarRenderer::render). RectangleArea = {x0@0,x1@4,y0@8,y1@12} em PIXELS.
static float g_hbPxL = 0, g_hbPxR = 0, g_hbPxT = 0, g_hbPxB = 0; static int g_hbValid = 0;
static float g_hbVL = -1.0f, g_hbVR = -1.0f, g_hbVT = -1.0f, g_hbVB = -1.0f;   // mesmo rect em coords VIRTUAIS (snap/linhas/dim)
typedef void (*fn_hotbar)(void*, void*, void*, int, void*);
static fn_hotbar orig_hotbar = nullptr;
typedef void (*fn_turntick)(void*, void*, void*, int);
static fn_turntick orig_turntick = nullptr;   // TouchTurnInteractControl::tick (camera/ataque = area do jogo)
// "A bola" = anel de toque (HudProgressRenderer). Suprimimos o anel nativo e
// redesenhamos o nosso no overlay, na posicao do dedo: tamanho continuo AO VIVO,
// 0 = invisivel, sem tocar densidade/GUI Scale (ao contrario do metodo do BlockLauncher).
static int      g_ballOn    = 0;
static float    g_ballSize  = 1.0f;          // 0 = invisivel ; 1 ~ nativo ; >1 maior
static unsigned g_ballColor = 0xFFB8A8FFu;   // lavanda (ARGB)
static volatile float g_ptrX[12], g_ptrY[12];   // posicao de cada dedo (espaco virtual do overlay)
static volatile int   g_interactPid = -1;        // dedo de interacao (camera/ataque) via TouchTurnInteractControl+0x34; -1 = nenhum (NUNCA o joystick/botao)
typedef int (*fn_rpi)(void*, void*, int, int, float);
static fn_rpi orig_rpi = nullptr;            // HudProgressRenderer::_renderProgressIndicator @0x70ad68
static float g_ringPatched = -1.0f;          // ultimo fator aplicado no imm de escala do anel (3.5*fator)
static float g_hbAccL = 1e9f, g_hbAccR = -1e9f, g_hbAccT = 1e9f, g_hbAccB = -1e9f;   // acumula os slots (1 frame)

typedef struct { unsigned short x, y, w, h; float xoff, yoff, xadvance; } Glyph;
typedef struct {
    char magic[4];
    unsigned short atlas_w, atlas_h;
    float bake_px, line_height;
    unsigned short first_cp, count;
} VcFontHeader;
typedef struct {
    int atlas_w, atlas_h; float bake_px, line_height; int first_cp, count; const Glyph* glyphs;
} VcFont;
static VcFont g_fontInfo;

typedef struct { unsigned short x, y, w, h; } IconRect;
typedef struct { int atlas_w, atlas_h, count; const IconRect* rects; } VcIcons;
static VcIcons g_iconInfo;
#define IC_GEAR 0
#define IC_GLOBE 1
#define IC_DOOR 2
#define IC_DISC 3
#define IC_EYE 14

static const char* VS =
    "attribute vec2 aPos; attribute vec2 aUV; attribute vec4 aColor;"
    "uniform vec2 uInvScreen;"
    "varying vec2 vUV; varying vec4 vColor;"
    "void main(){ vUV=aUV; vColor=aColor;"
    "  gl_Position=vec4(aPos.x*uInvScreen.x-1.0, 1.0-aPos.y*uInvScreen.y, 0.0, 1.0); }";

static const char* FS =
    "precision mediump float;"
    "uniform sampler2D uTex;"
    "varying vec2 vUV; varying vec4 vColor;"
    "void main(){ gl_FragColor = texture2D(uTex,vUV) * vColor; }";

// blur 13-tap (frosted glass) do framebuffer capturado
static const char* BLUR_FS =
    "precision mediump float;"
    "uniform sampler2D uTex; uniform vec2 uTexel;"
    "varying vec2 vUV; varying vec4 vColor;"
    "void main(){"
    "  vec2 s = uTexel * 4.0;"
    "  vec3 c = texture2D(uTex,vUV).rgb * 0.14;"
    "  c += (texture2D(uTex,vUV+vec2(s.x,0.0)).rgb + texture2D(uTex,vUV-vec2(s.x,0.0)).rgb) * 0.10;"
    "  c += (texture2D(uTex,vUV+vec2(0.0,s.y)).rgb + texture2D(uTex,vUV-vec2(0.0,s.y)).rgb) * 0.10;"
    "  c += (texture2D(uTex,vUV+s).rgb + texture2D(uTex,vUV-s).rgb) * 0.07;"
    "  c += (texture2D(uTex,vUV+vec2(s.x,-s.y)).rgb + texture2D(uTex,vUV-vec2(s.x,-s.y)).rgb) * 0.07;"
    "  c += (texture2D(uTex,vUV+vec2(s.x*2.0,0.0)).rgb + texture2D(uTex,vUV-vec2(s.x*2.0,0.0)).rgb) * 0.05;"
    "  c += (texture2D(uTex,vUV+vec2(0.0,s.y*2.0)).rgb + texture2D(uTex,vUV-vec2(0.0,s.y*2.0)).rgb) * 0.04;"
    "  gl_FragColor = vec4(c, 1.0);"
    "}";

// painel arredondado via SDF (smoothstep de borda, estilo Flarial). aUV = coord local [-1,1].
static const char* ROUND_FS =
    "precision mediump float;"
    "uniform vec2 uHalf; uniform float uRadius; uniform vec4 uColor;"
    "varying vec2 vUV;"
    "void main(){"
    "  vec2 p = vUV * uHalf;"
    "  vec2 d = abs(p) - (uHalf - vec2(uRadius));"
    "  float dist = min(max(d.x,d.y),0.0) + length(max(d,0.0)) - uRadius;"
    "  float a = clamp(0.5 - dist, 0.0, 1.0);"
    "  gl_FragColor = vec4(uColor.rgb, uColor.a * a);"
    "}";

typedef struct {
    GLint prog, arrBuf, elemBuf, activeTex, texU0, vp[4], scBox[4];
    GLint bSrcRGB, bDstRGB, bSrcA, bDstA, bEqRGB, bEqA;
    GLboolean blend, depth, cull, scissor, stencil, depthMask, colMask[4];
    GLint vaOn[3], vaBuf[3], vaSz[3], vaTy[3], vaNrm[3], vaStr[3];
    void* vaPtr[3];
} GLSaved;

typedef void (*swapAP_t)(void*);
static swapAP_t orig_apSwap = nullptr;

static GLuint compile_sh(GLenum t, const char* s) {
    GLuint sh = glCreateShader(t);
    glShaderSource(sh, 1, &s, nullptr);
    glCompileShader(sh);
    GLint ok = 0;
    glGetShaderiv(sh, GL_COMPILE_STATUS, &ok);
    if (!ok) { char l[512]; glGetShaderInfoLog(sh, 512, nullptr, l); LOG("shader: %s", l); }
    return sh;
}

static GLuint link_prog_fs(const char* fs) {
    GLuint p = glCreateProgram();
    GLuint v = compile_sh(GL_VERTEX_SHADER, VS);
    GLuint f = compile_sh(GL_FRAGMENT_SHADER, fs);
    glAttachShader(p, v); glAttachShader(p, f);
    glBindAttribLocation(p, 0, "aPos");
    glBindAttribLocation(p, 1, "aUV");
    glBindAttribLocation(p, 2, "aColor");
    glLinkProgram(p);
    GLint ok = 0;
    glGetProgramiv(p, GL_LINK_STATUS, &ok);
    if (!ok) { char l[512]; glGetProgramInfoLog(p, 512, nullptr, l); LOG("link: %s", l); }
    glDeleteShader(v); glDeleteShader(f);
    return p;
}

static GLuint make_tex_rgba(const unsigned char* rgba, int w, int h) {
    GLuint t;
    glGenTextures(1, &t);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, t);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, rgba);
    return t;
}

static GLuint vc_font_init() {
    const unsigned char* p = font_blob;
    VcFontHeader h;
    memcpy(&h, p, sizeof h);
    if (memcmp(h.magic, "VCF1", 4) != 0) { LOG("font magic ruim"); return 0; }
    const Glyph* g = (const Glyph*)(p + sizeof h);
    const unsigned char* cov = (const unsigned char*)(g + h.count);
    int w = h.atlas_w, hh = h.atlas_h;
    unsigned char* la = (unsigned char*)malloc((size_t)w * hh * 2);
    for (int i = 0; i < w * hh; i++) { la[2 * i] = 255; la[2 * i + 1] = cov[i]; }
    GLuint t;
    glGenTextures(1, &t);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, t);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_LUMINANCE_ALPHA, w, hh, 0, GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, la);
    free(la);
    g_fontInfo.atlas_w = w; g_fontInfo.atlas_h = hh;
    g_fontInfo.bake_px = h.bake_px; g_fontInfo.line_height = h.line_height;
    g_fontInfo.first_cp = h.first_cp; g_fontInfo.count = h.count; g_fontInfo.glyphs = g;
    return t;
}

static GLuint vc_icons_init() {
    const unsigned char* p = icons_blob;
    if (memcmp(p, "VCI1", 4) != 0) { LOG("icons magic ruim"); return 0; }
    unsigned short aw, ah, n;
    memcpy(&aw, p + 4, 2); memcpy(&ah, p + 6, 2); memcpy(&n, p + 8, 2);
    const IconRect* rects = (const IconRect*)(p + 10);
    const unsigned char* cov = (const unsigned char*)(rects + n);
    unsigned char* la = (unsigned char*)malloc((size_t)aw * ah * 2);
    for (int i = 0; i < aw * ah; i++) { la[2 * i] = 255; la[2 * i + 1] = cov[i]; }
    GLuint t;
    glGenTextures(1, &t);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, t);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glPixelStorei(GL_UNPACK_ALIGNMENT, 1);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_LUMINANCE_ALPHA, aw, ah, 0, GL_LUMINANCE_ALPHA, GL_UNSIGNED_BYTE, la);
    free(la);
    g_iconInfo.atlas_w = aw; g_iconInfo.atlas_h = ah; g_iconInfo.count = n; g_iconInfo.rects = rects;
    return t;
}

static void overlay_init_gl() {
    g_prog = link_prog_fs(FS);
    g_uInvScreen = glGetUniformLocation(g_prog, "uInvScreen");
    g_uTex = glGetUniformLocation(g_prog, "uTex");
    g_blurProg = link_prog_fs(BLUR_FS);
    g_uBlurInv = glGetUniformLocation(g_blurProg, "uInvScreen");
    g_uBlurTex = glGetUniformLocation(g_blurProg, "uTex");
    g_uBlurTexel = glGetUniformLocation(g_blurProg, "uTexel");
    g_roundProg = link_prog_fs(ROUND_FS);
    g_uRInv  = glGetUniformLocation(g_roundProg, "uInvScreen");
    g_uRHalf = glGetUniformLocation(g_roundProg, "uHalf");
    g_uRRad  = glGetUniformLocation(g_roundProg, "uRadius");
    g_uRCol  = glGetUniformLocation(g_roundProg, "uColor");
    glGenBuffers(1, &g_vbo);
    const unsigned char wht[4] = { 255, 255, 255, 255 };
    g_white = make_tex_rgba(wht, 1, 1);
    g_font = vc_font_init();
    g_iconTex = vc_icons_init();
    glGenTextures(1, &g_capTex);
    glBindTexture(GL_TEXTURE_2D, g_capTex);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    g_loFbo = 0; g_loTex = 0; g_loW = 0; g_loH = 0;  // forca recriar o FBO lo-res no contexto novo
    g_mbReady = 0; g_mbCount = 0; g_mbHead = 0; g_mbW = 0; g_mbH = 0;  // ring do motion blur: recria no contexto novo
    g_glReady = 1;
    LOG("overlay GL pronto prog=%u vbo=%u white=%u font=%u icons=%u", g_prog, g_vbo, g_white, g_font, g_iconTex);
}

static float g_clipTop = -1e9f, g_clipBot = 1e9f;   // recorte vertical dos quads (default: sem recorte)
static float g_drawAlpha = 1.0f;                    // multiplicador global de alpha (fade-in/out do painel)
static void push(UIVert* buf, int* n, float x, float y, float w, float h,
                 float u0, float v0, float u1, float v1, unsigned argb) {
    if (*n + 6 > MAX_V) return;
    if (g_hudMeasuring) {                              // mede a bbox do modulo HUD atual (p/ editar/arrastar)
        if (x < g_mMinX) g_mMinX = x; if (y < g_mMinY) g_mMinY = y;
        if (x + w > g_mMaxX) g_mMaxX = x + w; if (y + h > g_mMaxY) g_mMaxY = y + h;
    }
    float oy0 = y, oy1 = y + h, ny0 = y, ny1 = y + h, nv0 = v0, nv1 = v1;
    if (oy1 <= g_clipTop || oy0 >= g_clipBot) return;          // quad inteiro fora do recorte
    if (oy1 > oy0) {                                            // recorta a parte que passa da borda (ajusta V)
        if (oy0 < g_clipTop) { float t = (g_clipTop - oy0) / (oy1 - oy0); ny0 = g_clipTop; nv0 = v0 + (v1 - v0) * t; }
        if (oy1 > g_clipBot) { float t = (g_clipBot - oy0) / (oy1 - oy0); ny1 = g_clipBot; nv1 = v0 + (v1 - v0) * t; }
    }
    unsigned char a = (unsigned char)((float)((argb >> 24) & 0xFFu) * g_drawAlpha), r = argb >> 16, g = argb >> 8, b = argb;
    UIVert q0 = { x, ny0, u0, nv0, r, g, b, a }, q1 = { x + w, ny0, u1, nv0, r, g, b, a },
           q2 = { x + w, ny1, u1, nv1, r, g, b, a }, q3 = { x, ny1, u0, nv1, r, g, b, a };
    UIVert* o = &buf[*n];
    o[0] = q0; o[1] = q1; o[2] = q2; o[3] = q0; o[4] = q2; o[5] = q3;
    *n += 6;
}

static void draw_icon(int idx, float x, float y, float sz, unsigned argb) {
    if (!g_iconTex || idx < 0 || idx >= g_iconInfo.count) return;
    const IconRect* r = &g_iconInfo.rects[idx];
    float iw = 1.0f / g_iconInfo.atlas_w, ih = 1.0f / g_iconInfo.atlas_h;
    push(g_vIcon, &g_nIcon, x, y, sz, sz, r->x * iw, r->y * ih, (r->x + r->w) * iw, (r->y + r->h) * ih, argb);
}

static void draw_rect(float x, float y, float w, float h, unsigned argb) {
    push(g_vSolid, &g_nSolid, x, y, w, h, .5f, .5f, .5f, .5f, argb);
}

static inline unsigned vc_fade(unsigned argb) {   // aplica o alpha global (os paineis nao passam pelo push)
    if (g_drawAlpha >= 0.999f) return argb;
    unsigned a = (unsigned)((float)((argb >> 24) & 0xFFu) * g_drawAlpha);
    return (a << 24) | (argb & 0x00FFFFFFu);
}
// painel arredondado (SDF). Desenhado no passo vc_draw_rounds (apos o blur, ABAIXO dos accents/texto).
// r <= 0 => retangulo nitido (serve pro tint de fundo tela-cheia). Ordem = ordem de chamada.
static void draw_round(float x, float y, float w, float h, float r, unsigned argb) {
    if (g_hudMeasuring) {
        if (x < g_mMinX) g_mMinX = x; if (y < g_mMinY) g_mMinY = y;
        if (x + w > g_mMaxX) g_mMaxX = x + w; if (y + h > g_mMaxY) g_mMaxY = y + h;
    }
    if (y + h <= g_clipTop || y >= g_clipBot) return;                                // fora do recorte do scroll
    if (y < g_clipTop || y + h > g_clipBot) { draw_rect(x, y, w, h, argb); return; }  // cruza a borda -> rect recortado
    if (g_nRound >= 128) { draw_rect(x, y, w, h, argb); return; }
    float m = (w < h ? w : h) * 0.5f; if (r > m) r = m; if (r < 0.0f) r = 0.0f;
    g_round[g_nRound++] = { x, y, w, h, r, vc_fade(argb) };
}

// --- "A bola" (anel de toque) desenhada no overlay, sem libm ---
// tabela de circulo unitario (1024 pts) gerada 1x por rotacao incremental em double.
#define BALL_N 1024
static float g_ballCos[BALL_N + 1], g_ballSin[BALL_N + 1];
static int   g_ballTbl = 0;
static void ball_init_table() {
    const double d  = 6.283185307179586 / BALL_N;   // passo ~0.00614 rad
    const double d2 = d * d;
    const double cd = 1.0 - d2 / 2.0 + d2 * d2 / 24.0;              // cos(d) Taylor (converge imediato)
    const double sd = d - d * d2 / 6.0 + d * d2 * d2 / 120.0;      // sin(d)
    double c = 1.0, s = 0.0;
    for (int i = 0; i <= BALL_N; i++) {
        g_ballCos[i] = (float)c; g_ballSin[i] = (float)s;
        double nc = c * cd - s * sd, ns = s * cd + c * sd;
        c = nc; s = ns;
    }
    g_ballTbl = 1;
}
static void draw_ball() {
    if (!g_ballOn) return;
    int p = g_interactPid;
    if (p < 0 || p > 11) return;                 // so o dedo de interacao (camera/ataque), NUNCA joystick/botao
    float r = 26.0f * g_ballSize;                // raio-base (virtual) * tamanho
    if (r < 1.0f) return;                        // 0 / minusculo -> invisivel
    if (!g_ballTbl) ball_init_table();
    float thick = r * 0.08f; if (thick < 5.0f) thick = 5.0f;   // espessura PROPORCIONAL (banda, nao fio)
    int n = (int)(r * 2.5f) + 24;                // pontos p/ banda lisa (sem buraco)
    if (n < 48) n = 48; if (n > BALL_N) n = BALL_N;
    float cx = g_ptrX[p], cy = g_ptrY[p];
    for (int i = 0; i < n; i++) {
        int idx = (int)((long)i * BALL_N / n);
        float px = cx + r * g_ballCos[idx], py = cy + r * g_ballSin[idx];
        draw_rect(px - thick * 0.5f, py - thick * 0.5f, thick, thick, g_ballColor);
    }
}

// decodifica 1 codepoint UTF-8 e avanca o ponteiro. 3/4 bytes (CJK/etc) -> 0xFFFFFFFF (fora da fonte).
static inline unsigned vc_u8(const unsigned char** pp) {
    const unsigned char* p = *pp; unsigned cp = *p;
    if (cp < 0x80) { *pp = p + 1; return cp; }
    if ((cp & 0xE0) == 0xC0 && p[1]) { *pp = p + 2; return ((cp & 0x1Fu) << 6) | (p[1] & 0x3Fu); }
    if ((cp & 0xF0) == 0xE0 && p[1] && p[2]) { *pp = p + 3; return 0xFFFFFFFFu; }
    if ((cp & 0xF8) == 0xF0 && p[1] && p[2] && p[3]) { *pp = p + 4; return 0xFFFFFFFFu; }
    *pp = p + 1; return 0xFFFFFFFFu;
}

static void draw_text(float x, float y, const char* s, float px, unsigned argb) {
    const VcFont* f = &g_fontInfo;
    if (!g_font) return;
    float sc = px / f->bake_px, iw = 1.0f / f->atlas_w, ih = 1.0f / f->atlas_h, penx = x;
    for (const unsigned char* p = (const unsigned char*)s; *p; ) {
        unsigned cp = vc_u8(&p);
        if (cp < (unsigned)f->first_cp || cp >= (unsigned)(f->first_cp + f->count)) continue;
        const Glyph* g = &f->glyphs[cp - f->first_cp];
        if (g->w) {
            float x0 = penx + g->xoff * sc, y0 = y + g->yoff * sc;
            float u0 = g->x * iw, v0 = g->y * ih, u1 = (g->x + g->w) * iw, v1 = (g->y + g->h) * ih;
            push(g_vText, &g_nText, x0, y0, g->w * sc, g->h * sc, u0, v0, u1, v1, argb);
        }
        penx += g->xadvance * sc;
    }
}

static float text_width(const char* s, float px) {
    const VcFont* f = &g_fontInfo;
    float w = 0, sc = px / f->bake_px;
    for (const unsigned char* p = (const unsigned char*)s; *p; ) {
        unsigned cp = vc_u8(&p);
        if (cp < (unsigned)f->first_cp || cp >= (unsigned)(f->first_cp + f->count)) continue;
        w += f->glyphs[cp - f->first_cp].xadvance * sc;
    }
    return w;
}

static void draw_text_c(float cx, float y, const char* s, float px, unsigned argb) {
    draw_text(cx - text_width(s, px) * 0.5f, y, s, px, argb);
}

// desenha encolhendo a fonte se o texto nao couber em maxW (traducoes variam de tamanho).
static void draw_text_fit(float x, float y, const char* s, float px, float maxW, unsigned argb) {
    float w = text_width(s, px);
    if (w > maxW && w > 0.0f) px *= maxW / w;
    draw_text(x, y, s, px, argb);
}
static void draw_text_fit_c(float cx, float y, const char* s, float px, float maxW, unsigned argb) {
    float w = text_width(s, px);
    if (w > maxW && w > 0.0f) px *= maxW / w;
    draw_text(cx - text_width(s, px) * 0.5f, y, s, px, argb);
}

static unsigned mc_code_color(unsigned char code, unsigned def) {
    switch (code | 0x20u) {
        case '0': return 0xFF000000u; case '1': return 0xFF0000AAu; case '2': return 0xFF00AA00u; case '3': return 0xFF00AAAAu;
        case '4': return 0xFFAA0000u; case '5': return 0xFFAA00AAu; case '6': return 0xFFFFAA00u; case '7': return 0xFFAAAAAAu;
        case '8': return 0xFF555555u; case '9': return 0xFF5555FFu; case 'a': return 0xFF55FF55u; case 'b': return 0xFF55FFFFu;
        case 'c': return 0xFFFF5555u; case 'd': return 0xFFFF55FFu; case 'e': return 0xFFFFFF55u; case 'f': return 0xFFFFFFFFu;
        case 'r': return def;
        default: return 0u;
    }
}
static void draw_text_mc(float x, float y, const char* s, float px, unsigned def) {
    unsigned col = def;
    char run[96]; int rl = 0;
    float cx = x;
    const unsigned char* p = (const unsigned char*)s;
    while (*p) {
        const unsigned char* codep = nullptr;
        if (p[0] == 0xC2u && p[1] == 0xA7u) codep = p + 2;
        else if (p[0] == 0xA7u) codep = p + 1;
        if (codep && *codep) {
            if (rl) { run[rl] = 0; draw_text(cx, y, run, px, col); cx += text_width(run, px); rl = 0; }
            unsigned nc = mc_code_color(*codep, def);
            if (nc) col = nc;
            p = codep + 1;
            continue;
        }
        if (rl < 95) run[rl++] = (char)*p;
        p++;
    }
    if (rl) { run[rl] = 0; draw_text(cx, y, run, px, col); }
}

static const char* vc_tr(const char* key);
static const char* g_menu[3] = { "SINGLEPLAYER", "MULTIPLAYER", "Mods" };
static const char* g_menuKey[3] = { "menu.singleplayer", "menu.multiplayer", nullptr };
#define N_MENU 3
// botoes de icone (lateral direita do menu): 0=engrenagem(opcoes), 1=globo(idiomas), 2=porta(sair)
static const int IC_BTN[3] = { IC_GEAR, IC_GLOBE, IC_DOOR };
static const int IC_REG[3] = { -60, -61, -62 };
static void vc_icobtn(int i, float fw, float fh, float* bx, float* by, float* bs) {
    *bs = 76.0f; *bx = fw - 40.0f - *bs; *by = fh * 0.30f + i * (*bs + 18.0f);
}

static int hitTest(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH, cx = fw * 0.5f;
    float pw = 640.0f, px = cx - pw * 0.5f, ph = 70.0f, gap = 20.0f;
    float py = fh * 0.46f;
    for (int i = 0; i < N_MENU; i++) {
        if (x >= px && x <= px + pw && y >= py && y <= py + ph) return i;
        py += ph + gap;
    }
    for (int i = 0; i < 3; i++) {
        float bx, by, bs; vc_icobtn(i, fw, fh, &bx, &by, &bs);
        if (x >= bx && x <= bx + bs && y >= by && y <= by + bs) return IC_REG[i];
    }
    return R_NONE;
}

static int vc_now_ms() { struct timespec t; clock_gettime(CLOCK_MONOTONIC, &t); return (int)(t.tv_sec * 1000 + t.tv_nsec / 1000000); }

// ---- animacao do menu lateral (easing sem libm) ----
static float vc_smooth(float t) {                 // smootherstep (C2): lento no inicio E no fim = sem "pulo"
    if (t < 0.0f) t = 0.0f; if (t > 1.0f) t = 1.0f;
    return t * t * t * (t * (t * 6.0f - 15.0f) + 10.0f);
}
static float vc_ease_out_back(float t) {          // ease-out com overshoot (reveal estilo Flarial)
    if (t < 0.0f) t = 0.0f; if (t > 1.0f) t = 1.0f;
    const float s = 1.70158f; float x = t - 1.0f;
    return 1.0f + (s + 1.0f) * x * x * x + s * x * x;
}
static float vc_ig_open() {                       // 0 = fechado, 1 = aberto (smootherstep)
    float e = vc_smooth((float)(vc_now_ms() - g_igMenuT0) / 260.0f);
    return g_igMenu ? e : (1.0f - e);
}
static int vc_ig_panel_shown() { return g_igMenu == 1 || vc_ig_open() > 0.003f; }
static float vc_ig_slidex(float px, float pw) {   // deslocamento X do slide (0 aberto; fora da tela fechado)
    float side = (px + pw * 0.5f <= (float)g_lastW * 0.5f) ? -1.0f : 1.0f;
    float margin = (float)g_lastH * 0.035f;
    return side * (1.0f - vc_ig_open()) * (pw + margin);
}
static unsigned lerp_color(unsigned a, unsigned b, float t) {
    if (t < 0.0f) t = 0.0f; if (t > 1.0f) t = 1.0f;
    int aa = (a >> 24) & 0xFF, ar = (a >> 16) & 0xFF, ag = (a >> 8) & 0xFF, ab = a & 0xFF;
    int ba = (b >> 24) & 0xFF, br = (b >> 16) & 0xFF, bg = (b >> 8) & 0xFF, bb = b & 0xFF;
    unsigned ra = (unsigned)(aa + (int)((ba - aa) * t)), rr = (unsigned)(ar + (int)((br - ar) * t));
    unsigned rg = (unsigned)(ag + (int)((bg - ag) * t)), rb = (unsigned)(ab + (int)((bb - ab) * t));
    return (ra << 24) | (rr << 16) | (rg << 8) | rb;
}

// =========================== FRAMEWORK DE MODULOS ============================
static VoidModule* g_modules[64];
static int g_moduleCount = 0;
static int g_modAnimT0[64] = { 0 };   // timestamp do ultimo toggle de cada modulo (animacao do switch)
static int g_modCat = 0;
static int g_catCollapsed[CAT_COUNT] = { 0 };   // secoes colapsadas no painel in-game (persistido)
static int g_catAnimT0[CAT_COUNT] = { 0 };      // timestamp do ultimo colapsar/expandir (accordion)
static int g_modExpanded[64] = { 0 };           // card expandido (config inline)
static int g_modExpT0[64] = { 0 };              // timestamp do ultimo expandir/recolher (animacao)
static int g_setDragMod = -1, g_setDragSet = -1, g_setDragPid = -1; static float g_setDragTX = 0.0f, g_setDragTW = 1.0f;  // arraste de slider inline
struct SetHit { int mod, set, kind; float x, y, w, h, tx, tw; };   // kind: 1=slider 2=toggle 3=color
static SetHit g_setR[96]; static int g_nSetR = 0;   // zonas de toque das settings (gravadas no render)
static const char* CAT_NAMES[CAT_COUNT] = { "HUD", "Combat", "Visual", "Player", "World", "Utility", "Misc" };

void vc_register_module(VoidModule* m) {
    if (g_moduleCount < 64 && m) g_modules[g_moduleCount++] = m;
}

// ---- VoidCanvas ----
void VoidCanvas::rect(float x, float y, float w, float h, unsigned a) { draw_rect(x, y, w, h, a); }
void VoidCanvas::text(float x, float y, const char* s, float px, unsigned a) { draw_text(x, y, s, px, a); }
void VoidCanvas::textC(float cx, float y, const char* s, float px, unsigned a) { draw_text_c(cx, y, s, px, a); }
void VoidCanvas::textMC(float x, float y, const char* s, float px, unsigned d) { draw_text_mc(x, y, s, px, d); }
float VoidCanvas::textW(const char* s, float px) { return text_width(s, px); }
int VoidCanvas::fps() { return g_fps; }
int VoidCanvas::screenW() { return g_lastW; }
int VoidCanvas::screenH() { return g_lastH; }
float VoidCanvas::hudX() { return g_hudOX; }
float VoidCanvas::hudY() { return g_hudOY; }
float VoidCanvas::hudScale() { return g_hudScale; }

// ---- VoidModule: settings ----
static VSetting* vc_find_set(VoidModule* m, const char* key) {
    for (int i = 0; i < m->settingCount; i++) if (!strcmp(m->settings[i].key, key)) return &m->settings[i];
    return nullptr;
}
void VoidModule::addToggle(const char* k, const char* l, bool d) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = k; s.label = l; s.type = VS_TOGGLE; s.value = d ? 1.0f : 0.0f; s.names = nullptr; s.nameCount = 0;
}
void VoidModule::addSlider(const char* k, const char* l, float d, float lo, float hi) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = k; s.label = l; s.type = VS_SLIDER; s.value = d; s.lo = lo; s.hi = hi; s.names = nullptr; s.nameCount = 0;
}
void VoidModule::addInt(const char* k, const char* l, int d, int lo, int hi) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = k; s.label = l; s.type = VS_INT; s.value = (float)d; s.lo = (float)lo; s.hi = (float)hi; s.names = nullptr; s.nameCount = 0;
}
void VoidModule::addDropdown(const char* k, const char* l, const char* const* names, int count, int d) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = k; s.label = l; s.type = VS_DROPDOWN; s.value = (float)d; s.names = names; s.nameCount = count;
}
void VoidModule::addColor(const char* k, const char* l, unsigned d) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = k; s.label = l; s.type = VS_COLOR; s.color = d; s.names = nullptr; s.nameCount = 0;
}
void VoidModule::addHeader(const char* l) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = ""; s.label = l; s.type = VS_HEADER; s.names = nullptr; s.nameCount = 0;
}
void VoidModule::addInfo(const char* l) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = ""; s.label = l; s.type = VS_INFO; s.names = nullptr; s.nameCount = 0;
}
void VoidModule::addText(const char* k, const char* l, const char* def, const char* ph) {
    if (settingCount >= 16) return;
    VSetting& s = settings[settingCount++]; s.key = k; s.label = l; s.type = VS_TEXT; s.placeholder = ph; s.names = nullptr; s.nameCount = 0;
    s.textBuf[0] = 0; if (def) snprintf(s.textBuf, sizeof(s.textBuf), "%s", def);
}
bool VoidModule::getToggle(const char* k) { VSetting* s = vc_find_set(this, k); return s && s->value >= 0.5f; }
float VoidModule::getSlider(const char* k) { VSetting* s = vc_find_set(this, k); return s ? s->value : 0.0f; }
int VoidModule::getInt(const char* k) { VSetting* s = vc_find_set(this, k); return s ? (int)(s->value + 0.5f) : 0; }
int VoidModule::getDropdown(const char* k) { VSetting* s = vc_find_set(this, k); return s ? (int)(s->value + 0.5f) : 0; }
unsigned VoidModule::getColor(const char* k) { VSetting* s = vc_find_set(this, k); return s ? s->color : 0xFFFFFFFFu; }
const char* VoidModule::getText(const char* k) { VSetting* s = vc_find_set(this, k); return s ? s->textBuf : ""; }

// ---- acesso RAW ----
extern "C" uintptr_t vc_slide() { return g_slide; }
extern "C" void* vc_game() { return g_mc; }
extern "C" void vc_hook_sym(const char* sym, void* repl, void** orig) {
    if (!g_mcpe || !MSHookFunction) return;
    void* p = dlsym(g_mcpe, sym);
    if (p) MSHookFunction(p, repl, orig);
}
extern "C" void vc_hook_va(unsigned va, void* repl, void** orig) {
    if (!g_slide || !MSHookFunction) return;
    MSHookFunction((void*)((g_slide + va) | 1u), repl, orig);
}
extern "C" void vc_log(const char* tag, const char* msg) { __android_log_print(ANDROID_LOG_INFO, tag ? tag : "VoidClient", "%s", msg ? msg : ""); }

// ---- persistencia ----
#define VC_MOD_CFG "/sdcard/voidclient_modules.cfg"
static void vc_modules_save() {
    FILE* f = fopen(VC_MOD_CFG, "w");
    if (!f) return;
    for (int i = 0; i < g_moduleCount; i++) {
        VoidModule* m = g_modules[i];
        fprintf(f, "%s.enabled=%d\n", m->id, m->enabled ? 1 : 0);
        if (m->category == CAT_HUD) { fprintf(f, "%s.hudx=%g\n", m->id, m->x); fprintf(f, "%s.hudy=%g\n", m->id, m->y); fprintf(f, "%s.huds=%g\n", m->id, m->scale); }
        for (int j = 0; j < m->settingCount; j++) {
            VSetting& s = m->settings[j];
            if (s.type == VS_HEADER || s.type == VS_INFO) continue;
            if (s.type == VS_COLOR) fprintf(f, "%s.%s=%u\n", m->id, s.key, s.color);
            else if (s.type == VS_TEXT) fprintf(f, "%s.%s=%s\n", m->id, s.key, s.textBuf);
            else fprintf(f, "%s.%s=%g\n", m->id, s.key, s.value);
        }
    }
    if (g_zbx >= 0.0f) fprintf(f, "_zoombtn.x=%g\n", g_zbx);   // posicao do botao Z (fracao do centro)
    if (g_zby >= 0.0f) fprintf(f, "_zoombtn.y=%g\n", g_zby);
    if (g_pbx >= 0.0f) fprintf(f, "_perspbtn.x=%g\n", g_pbx);   // posicao do botao de perspectiva
    if (g_pby >= 0.0f) fprintf(f, "_perspbtn.y=%g\n", g_pby);
    { unsigned cmask = 0; for (int c = 0; c < CAT_COUNT; c++) if (g_catCollapsed[c]) cmask |= (1u << c);
      fprintf(f, "_collapsed.mask=%u\n", cmask); }                                      // secoes colapsadas
    fclose(f);
}
static void vc_modules_load() {
    for (int i = 0; i < g_moduleCount; i++) g_modules[i]->enabled = g_modules[i]->defaultEnabled;
    FILE* f = fopen(VC_MOD_CFG, "r");
    if (!f) return;
    char line[256];
    while (fgets(line, sizeof(line), f)) {
        char* eq = strchr(line, '='); if (!eq) continue;
        char* dot = strchr(line, '.'); if (!dot || dot > eq) continue;
        *dot = 0; *eq = 0;
        const char* mid = line; const char* key = dot + 1; char* val = eq + 1;
        for (char* p = val; *p; p++) { if (*p == '\n' || *p == '\r') { *p = 0; break; } }
        if (!strcmp(mid, "_zoombtn")) { if (!strcmp(key, "x")) g_zbx = (float)atof(val); else if (!strcmp(key, "y")) g_zby = (float)atof(val); continue; }
        if (!strcmp(mid, "_perspbtn")) { if (!strcmp(key, "x")) g_pbx = (float)atof(val); else if (!strcmp(key, "y")) g_pby = (float)atof(val); continue; }
        if (!strcmp(mid, "_collapsed")) { if (!strcmp(key, "mask")) { unsigned cm = (unsigned)strtoul(val, nullptr, 10); for (int c = 0; c < CAT_COUNT; c++) g_catCollapsed[c] = (int)((cm >> c) & 1u); } continue; }
        for (int i = 0; i < g_moduleCount; i++) {
            VoidModule* m = g_modules[i];
            if (strcmp(m->id, mid)) continue;
            if (!strcmp(key, "enabled")) { m->enabled = atoi(val) != 0; break; }
            if (!strcmp(key, "hudx")) { m->x = (float)atof(val); break; }
            if (!strcmp(key, "hudy")) { m->y = (float)atof(val); break; }
            if (!strcmp(key, "huds")) { m->scale = (float)atof(val); break; }
            VSetting* s = vc_find_set(m, key);
            if (s) {
                if (s->type == VS_COLOR) s->color = (unsigned)strtoul(val, nullptr, 10);
                else if (s->type == VS_TEXT) snprintf(s->textBuf, sizeof(s->textBuf), "%s", val);
                else s->value = (float)atof(val);
            }
            break;
        }
    }
    fclose(f);
    for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->enabled) g_modules[i]->onEnable();
}

// ---- dispatch ----
static void vc_modules_tick(void* mc) {
    for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->enabled) g_modules[i]->onTick(mc);
}
static void vc_modules_render_hud(VoidCanvas& g) {
    for (int i = 0; i < g_moduleCount; i++) {
        VoidModule* m = g_modules[i];
        if (!m->enabled) continue;
        if (m->category == CAT_HUD) {                  // ancora na posicao (fracao) + escala + mede a bbox
            g_hudOX = m->x * (float)g_lastW; g_hudOY = m->y * (float)g_lastH; g_hudScale = m->scale;
            g_mMinX = 1e9f; g_mMinY = 1e9f; g_mMaxX = -1e9f; g_mMaxY = -1e9f;
            g_hudMeasuring = 1; m->onRender(g); g_hudMeasuring = 0;
            if (g_mMaxX > g_mMinX) { g_hudRX[i] = g_mMinX; g_hudRY[i] = g_mMinY; g_hudRW[i] = g_mMaxX - g_mMinX; g_hudRH[i] = g_mMaxY - g_mMinY; }
            else { g_hudRW[i] = 0.0f; g_hudRH[i] = 0.0f; }
        } else {
            m->onRender(g);
        }
    }
}
static void vc_modules_click(int button) {
    for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->enabled) g_modules[i]->onClick(button);
}
static void vc_mod_set_enabled(VoidModule* m, bool on) {
    if (m->enabled == on) return;
    m->enabled = on;
    for (int i = 0; i < g_moduleCount; i++) if (g_modules[i] == m) { g_modAnimT0[i] = vc_now_ms(); break; }
    if (on) m->onEnable(); else m->onDisable();
    vc_modules_save();
}

// ---- tela de Modulos (cards por categoria) ----
static void ui_build_modules(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(40.0f, 74.0f, "Mods", 44.0f, 0xFFF2F2FFu);
    draw_rect(40.0f, 90.0f, 150.0f, 4.0f, 0xFF7A3CFFu);
    // tabs de categoria
    float tx = 40.0f, ty = 120.0f, th = 54.0f;
    for (int c = 0; c < CAT_COUNT; c++) {
        float tw = text_width(vc_tr(CAT_NAMES[c]), 24.0f) + 36.0f;
        unsigned bg = (c == g_modCat) ? 0xFF7A3CFFu : 0xCC1A1A26u;
        draw_round(tx, ty, tw, th, th * 0.5f, bg);
        draw_text(tx + 18.0f, ty + 35.0f, vc_tr(CAT_NAMES[c]), 24.0f, 0xFFEAEAF6u);
        tx += tw + 10.0f;
    }
    // cards (linhas) da categoria selecionada
    float cardY = ty + th + 24.0f, cardH = 96.0f, gap = 16.0f, cardX = 40.0f, cardW = fw - 80.0f;
    for (int i = 0; i < g_moduleCount; i++) {
        VoidModule* m = g_modules[i];
        if (m->category != g_modCat) continue;
        if (cardY + cardH > fh - 100.0f) break;
        draw_round(cardX, cardY, cardW, cardH, 16.0f, 0xEE141420u);
        draw_round(cardX, cardY + 14.0f, 6.0f, cardH - 28.0f, 3.0f, m->enabled ? 0xFF7A3CFFu : 0xFF3A3A4Au);
        draw_text(cardX + 28.0f, cardY + 40.0f, m->name, 28.0f, 0xFFF2F2FFu);
        if (m->description[0]) draw_text(cardX + 28.0f, cardY + 72.0f, m->description, 20.0f, 0xFF9A9ABF);
        if (m->settingCount > 0) draw_text(cardX + cardW - 320.0f, cardY + cardH * 0.5f + 8.0f, vc_tr("Configurar"), 22.0f, 0xFF8A8AB0u);
        // toggle pill a direita
        float pw = 120.0f, px = cardX + cardW - pw - 20.0f, pyy = cardY + cardH * 0.5f - 24.0f, ph = 48.0f;
        draw_round(px, pyy, pw, ph, ph * 0.5f, m->enabled ? 0xFF2E7D32u : 0xFF3A2A2Au);
        draw_text_c(px + pw * 0.5f, pyy + 32.0f, m->enabled ? "ON" : "OFF", 24.0f, 0xFFFFFFFFu);
        cardY += cardH + gap;
    }
    draw_round(40.0f, fh - 78.0f, 200.0f, 54.0f, 14.0f, 0xCC1A1A26u);
    draw_text(68.0f, fh - 42.0f, vc_tr("gui.back"), 26.0f, 0xFFEAEAF6u);
}
static int hitTestModules(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH;
    if (x >= 40.0f && x <= 240.0f && y >= fh - 78.0f && y <= fh - 24.0f) return -10;
    float tx = 40.0f, ty = 120.0f, th = 54.0f;
    for (int c = 0; c < CAT_COUNT; c++) {
        float tw = text_width(vc_tr(CAT_NAMES[c]), 24.0f) + 36.0f;
        if (x >= tx && x <= tx + tw && y >= ty && y <= ty + th) return 100 + c;
        tx += tw + 10.0f;
    }
    float cardY = ty + th + 24.0f, cardH = 96.0f, gap = 16.0f, cardX = 40.0f, cardW = fw - 80.0f;
    for (int i = 0; i < g_moduleCount; i++) {
        VoidModule* m = g_modules[i];
        if (m->category != g_modCat) continue;
        if (cardY + cardH > fh - 100.0f) break;
        float pw = 120.0f, px = cardX + cardW - pw - 20.0f, pyy = cardY + cardH * 0.5f - 24.0f, ph = 48.0f;
        if (x >= px && x <= px + pw && y >= pyy && y <= pyy + ph) return 2000 + i;           // toggle
        if (x >= cardX && x <= cardX + cardW && y >= cardY && y <= cardY + cardH) return 1000 + i; // configurar
        cardY += cardH + gap;
    }
    return R_NONE;
}

// ---- painel de config de 1 modulo ----
static void vc_modcfg_fmt(VSetting& s, char* buf, int n) {
    if (s.type == VS_TOGGLE) snprintf(buf, n, "%s", s.value >= 0.5f ? "ON" : "OFF");
    else if (s.type == VS_DROPDOWN) snprintf(buf, n, "%s", (s.names && (int)s.value < s.nameCount) ? s.names[(int)s.value] : "?");
    else if (s.type == VS_INT) snprintf(buf, n, "%d", (int)(s.value + 0.5f));
    else if (s.type == VS_COLOR) snprintf(buf, n, "#%06X", s.color & 0xFFFFFFu);
    else snprintf(buf, n, "%.2f", s.value);
}
static void ui_build_modcfg(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    VoidModule* m = (g_cfgModule >= 0 && g_cfgModule < g_moduleCount) ? g_modules[g_cfgModule] : nullptr;
    if (!m) return;
    draw_text(40.0f, 74.0f, m->name, 40.0f, 0xFFF2F2FFu);
    draw_rect(40.0f, 90.0f, 150.0f, 4.0f, 0xFF7A3CFFu);
    if (m->description[0]) draw_text(40.0f, 120.0f, m->description, 22.0f, 0xFF9A9ABF);
    float ry = 150.0f, rh = 70.0f, rx = 40.0f, rw = fw - 80.0f;
    for (int i = 0; i < m->settingCount; i++) {
        VSetting& s = m->settings[i];
        if (s.type == VS_HEADER) {
            if (ry + 54.0f > fh - 100.0f) break;
            draw_text(rx + 4.0f, ry + 36.0f, s.label, 24.0f, 0xFF7A3CFFu);
            draw_rect(rx + 4.0f, ry + 46.0f, rw - 8.0f, 2.0f, 0xFF2A2A3Au);
            ry += 56.0f; continue;
        }
        if (s.type == VS_INFO) {
            if (ry + 40.0f > fh - 100.0f) break;
            draw_text(rx + 8.0f, ry + 30.0f, s.label, 20.0f, 0xFF9A9ABF);
            ry += 42.0f; continue;
        }
        if (ry + rh > fh - 100.0f) break;
        draw_round(rx, ry, rw, rh - 10.0f, 16.0f, 0xEE141420u);
        draw_text(rx + 24.0f, ry + 40.0f, s.label, 26.0f, 0xFFEAEAF6u);
        if (s.type == VS_TEXT) {
            bool ed = (g_modTextEdit == i && g_activeField == 1);
            const char* shown = ed ? g_fields[0] : (s.textBuf[0] ? s.textBuf : (s.placeholder ? s.placeholder : "..."));
            unsigned tc = (ed || s.textBuf[0]) ? 0xFFEAEAF6u : 0xFF6A6A80u;
            draw_rect(rx + rw - 360.0f, ry + 8.0f, 330.0f, 44.0f, ed ? 0xFF2A2A3Au : 0xCC14141Eu);
            draw_text(rx + rw - 348.0f, ry + 38.0f, shown, 22.0f, tc);
        } else if (s.type == VS_SLIDER || s.type == VS_INT) {
            char vb[32]; vc_modcfg_fmt(s, vb, sizeof(vb));
            draw_rect(rx + rw - 220.0f, ry + 8.0f, 44.0f, 44.0f, 0xFF2A2A3Au); draw_text_c(rx + rw - 220.0f + 22.0f, ry + 38.0f, "-", 30.0f, 0xFFFFFFFFu);
            draw_text_c(rx + rw - 120.0f, ry + 38.0f, vb, 24.0f, 0xFFF0F0FFu);
            draw_rect(rx + rw - 64.0f, ry + 8.0f, 44.0f, 44.0f, 0xFF2A2A3Au); draw_text_c(rx + rw - 64.0f + 22.0f, ry + 38.0f, "+", 30.0f, 0xFFFFFFFFu);
        } else if (s.type == VS_COLOR) {
            draw_rect(rx + rw - 140.0f, ry + 8.0f, 100.0f, 44.0f, 0xFF000000u | s.color);
        } else {
            char vb[32]; vc_modcfg_fmt(s, vb, sizeof(vb));
            unsigned pc = (s.type == VS_TOGGLE && s.value >= 0.5f) ? 0xFF2E7D32u : 0xFF3A2A2Au;
            if (s.type == VS_DROPDOWN) pc = 0xFF2A2A3Au;
            draw_rect(rx + rw - 200.0f, ry + 8.0f, 170.0f, 44.0f, pc);
            draw_text_c(rx + rw - 200.0f + 85.0f, ry + 38.0f, vb, 22.0f, 0xFFFFFFFFu);
        }
        ry += rh;
    }
    draw_round(40.0f, fh - 78.0f, 200.0f, 54.0f, 14.0f, 0xCC1A1A26u);
    draw_text(68.0f, fh - 42.0f, vc_tr("gui.back"), 26.0f, 0xFFEAEAF6u);
}
static const unsigned VC_PALETTE[8] = { 0xFF7A3CFFu, 0xFFFFFFFFu, 0xFFFF5555u, 0xFF55FF55u, 0xFF55AAFFu, 0xFFFFFF55u, 0xFFFF9A3Cu, 0xFF000000u };
static int hitTestModCfg(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH;
    if (x >= 40.0f && x <= 240.0f && y >= fh - 78.0f && y <= fh - 24.0f) return -10;
    VoidModule* m = (g_cfgModule >= 0 && g_cfgModule < g_moduleCount) ? g_modules[g_cfgModule] : nullptr;
    if (!m) return R_NONE;
    float ry = 150.0f, rh = 70.0f, rx = 40.0f, rw = fw - 80.0f;
    for (int i = 0; i < m->settingCount; i++) {
        VSetting& s = m->settings[i];
        if (s.type == VS_HEADER) { if (ry + 54.0f > fh - 100.0f) break; ry += 56.0f; continue; }
        if (s.type == VS_INFO)   { if (ry + 40.0f > fh - 100.0f) break; ry += 42.0f; continue; }
        if (ry + rh > fh - 100.0f) break;
        if (y >= ry && y <= ry + rh - 10.0f) {
            if (s.type == VS_TEXT) { if (x >= rx + rw - 360.0f) return 6000 + i; return R_NONE; }
            if (s.type == VS_SLIDER || s.type == VS_INT) {
                if (x >= rx + rw - 220.0f && x <= rx + rw - 176.0f) return 4000 + i; // -
                if (x >= rx + rw - 64.0f && x <= rx + rw - 20.0f) return 5000 + i;   // +
            } else if (x >= rx + rw - 220.0f) return 3000 + i;                        // toggle/dropdown/color
            return R_NONE;
        }
        ry += rh;
    }
    return R_NONE;
}
static void vc_modcfg_action(int r) {
    VoidModule* m = (g_cfgModule >= 0 && g_cfgModule < g_moduleCount) ? g_modules[g_cfgModule] : nullptr;
    if (!m) return;
    int i = r % 1000;
    if (i < 0 || i >= m->settingCount) return;
    VSetting& s = m->settings[i];
    if (r >= 5000) { float st = (s.type == VS_INT) ? 1.0f : (s.hi - s.lo) / 20.0f; s.value += st; if (s.value > s.hi) s.value = s.hi; }
    else if (r >= 4000) { float st = (s.type == VS_INT) ? 1.0f : (s.hi - s.lo) / 20.0f; s.value -= st; if (s.value < s.lo) s.value = s.lo; }
    else { // 3000: toggle/dropdown/color
        if (s.type == VS_TOGGLE) s.value = (s.value >= 0.5f) ? 0.0f : 1.0f;
        else if (s.type == VS_DROPDOWN) { int v = (int)(s.value + 0.5f) + 1; if (v >= s.nameCount) v = 0; s.value = (float)v; }
        else if (s.type == VS_COLOR) { int k = 0; for (; k < 8; k++) if ((VC_PALETTE[k] & 0xFFFFFFu) == (s.color & 0xFFFFFFu)) break; s.color = VC_PALETTE[(k + 1) % 8]; }
    }
    m->onSettingChanged(s.key);
    vc_modules_save();
}

static void vc_modtext_commit() {
    if (g_modTextEdit < 0) return;
    VoidModule* m = (g_cfgModule >= 0 && g_cfgModule < g_moduleCount) ? g_modules[g_cfgModule] : nullptr;
    if (m && g_modTextEdit < m->settingCount) {
        snprintf(m->settings[g_modTextEdit].textBuf, 64, "%s", g_fields[0]);
        m->onSettingChanged(m->settings[g_modTextEdit].key);
        vc_modules_save();
    }
    g_modTextEdit = -1;
}
static void vc_modtext_open(int i) {
    VoidModule* m = (g_cfgModule >= 0 && g_cfgModule < g_moduleCount) ? g_modules[g_cfgModule] : nullptr;
    if (!m || i < 0 || i >= m->settingCount) return;
    if (g_modTextEdit >= 0 && g_modTextEdit != i) vc_modtext_commit();
    g_modTextEdit = i;
    snprintf(g_fields[0], 64, "%s", m->settings[i].textBuf);
    g_fieldCount = 1;
    vc_kb_open(0);
}

static void ui_build(int W, int H) {
    if (g_screen == 8) { ui_build_modules(W, H); return; }
    if (g_screen == 9) { ui_build_modcfg(W, H); return; }
    if (g_screen == 1) { ui_build_options(W, H); return; }
    if (g_screen == 2) { ui_build_worlds(W, H); return; }
    if (g_screen == 3) { ui_build_servers(W, H); return; }
    if (g_screen == 4) { ui_build_createworld(W, H); return; }
    if (g_screen == 5) { ui_build_srvform(W, H); return; }
    if (g_screen == 6) { ui_build_langs(W, H); return; }
    if (g_screen == 7) { ui_build_editworld(W, H); return; }
    if (onProgress(g_mc)) { ui_build_loading(W, H); return; }
    if (onPauseScreen(g_mc)) { ui_build_pause(W, H); return; }
    if (onHud(g_mc)) { VoidCanvas g; if (g_hudEdit) vc_hud_dim(); if (!g_igMenu) vc_modules_render_hud(g); ui_build_ingame(W, H); return; }  /* painel aberto -> esconde HUD; editar -> tela escura sob o HUD; a bola = anel NATIVO escalado via hooks */
    float fw = (float)W, fh = (float)H, cx = fw * 0.5f;
    int mel = g_menuT0 ? (vc_now_ms() - g_menuT0) : 0;
    unsigned ma;
    if (mel < 1000) ma = 0xFFu;
    else if (mel < 1500) ma = 0xFFu - (unsigned)((mel - 1000) * 0x7F / 500);
    else ma = 0x80u;
    draw_round(0, 0, fw, fh, 0.0f, (ma << 24) | 0x100A1Cu);
    draw_text_c(cx, fh * 0.26f, "VOID CLIENT", 54.0f, 0xFFF2F2FFu);
    draw_rect(cx - 90.0f, fh * 0.26f + 20.0f, 180.0f, 4.0f, 0xFF7A3CFFu);
    float pw = 640.0f, px = cx - pw * 0.5f, ph = 70.0f, gap = 20.0f;
    float py = fh * 0.46f;
    for (int i = 0; i < N_MENU; i++) {
        unsigned bg = (i == g_press_region) ? 0xEE2A2A3Au : 0xCC12121Bu;
        draw_round(px, py, pw, ph, 16.0f, bg);
        draw_round(px, py + 14.0f, 6.0f, ph - 28.0f, 3.0f, 0xFF7A3CFFu);
        draw_text_c(cx + 3.0f, py + ph * 0.5f + 10.0f, g_menuKey[i] ? vc_tr(g_menuKey[i]) : g_menu[i], 30.0f, 0xFFEAEAF6u);
        py += ph + gap;
    }
    for (int i = 0; i < 3; i++) {
        float bx, by, bs; vc_icobtn(i, fw, fh, &bx, &by, &bs);
        draw_round(bx, by, bs, bs, 16.0f, (g_press_region == IC_REG[i]) ? 0xEE2A2A3Au : 0xCC12121Bu);
        draw_rect(bx, by, bs, 5.0f, 0xFF7A3CFFu);
        float pad = bs * 0.22f;
        draw_icon(IC_BTN[i], bx + pad, by + pad, bs - 2.0f * pad, 0xFFEAEAF6u);
    }
    draw_text(48.0f, fh - 48.0f, "v0.15.10", 26.0f, 0xFF8A6ABFu);
}

static void segment(UIVert* buf, int n, GLuint tex) {
    if (n <= 0) return;
    glBufferData(GL_ARRAY_BUFFER, (GLsizeiptr)(n * (int)sizeof(UIVert)), buf, GL_STREAM_DRAW);
    glBindTexture(GL_TEXTURE_2D, tex);
    glDrawArrays(GL_TRIANGLES, 0, n);
}

// desenha os paineis arredondados (apos o blur, antes dos accents/texto). Mantem g_vbo + attribs.
static void vc_draw_rounds() {
    if (g_nRound <= 0) return;
    glUseProgram(g_roundProg);
    glUniform2f(g_uRInv, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    for (int i = 0; i < g_nRound; i++) {
        RoundRect& q = g_round[i];
        float x0 = q.x, y0 = q.y, x1 = q.x + q.w, y1 = q.y + q.h;
        UIVert* v = g_vQuad;
        v[0] = { x0, y0, -1, -1, 0, 0, 0, 0 }; v[1] = { x1, y0, 1, -1, 0, 0, 0, 0 }; v[2] = { x1, y1, 1, 1, 0, 0, 0, 0 };
        v[3] = { x0, y0, -1, -1, 0, 0, 0, 0 }; v[4] = { x1, y1, 1, 1, 0, 0, 0, 0 }; v[5] = { x0, y1, -1, 1, 0, 0, 0, 0 };
        unsigned a = q.argb >> 24, r = (q.argb >> 16) & 0xFF, g = (q.argb >> 8) & 0xFF, b = q.argb & 0xFF;
        glUniform2f(g_uRHalf, q.w * 0.5f, q.h * 0.5f);
        glUniform1f(g_uRRad, q.r);
        glUniform4f(g_uRCol, r / 255.0f, g / 255.0f, b / 255.0f, a / 255.0f);
        glBufferData(GL_ARRAY_BUFFER, 6 * (int)sizeof(UIVert), g_vQuad, GL_STREAM_DRAW);
        glDrawArrays(GL_TRIANGLES, 0, 6);
    }
    glUseProgram(g_prog);
    glUniform2f(g_uInvScreen, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    glUniform1i(g_uTex, 0);
}

// frosted glass: captura o framebuffer do jogo e desenha MUITO borrado por baixo da UI.
static void vc_blur_ensure(int LW, int LH) {
    if (g_loW == LW && g_loH == LH && g_loFbo) return;
    if (g_loTex) glDeleteTextures(1, &g_loTex);
    if (g_loFbo) glDeleteFramebuffers(1, &g_loFbo);
    glGenTextures(1, &g_loTex);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, g_loTex);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, LW, LH, 0, GL_RGBA, GL_UNSIGNED_BYTE, nullptr);
    glGenFramebuffers(1, &g_loFbo);
    glBindFramebuffer(GL_FRAMEBUFFER, g_loFbo);
    glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, g_loTex, 0);
    g_loW = LW; g_loH = LH;
}
static void vc_blur_quad(float w, float h, float v0, float v1) {
    int n = 0;
    push(g_vQuad, &n, 0.0f, 0.0f, w, h, 0.0f, v0, 1.0f, v1, 0xFFFFFFFFu);
    glBufferData(GL_ARRAY_BUFFER, (GLsizeiptr)(6 * (int)sizeof(UIVert)), g_vQuad, GL_STREAM_DRAW);
    glDrawArrays(GL_TRIANGLES, 0, 6);
}
// faixa borrada arbitraria (p/ deixar um BURACO na hotbar: so borra ao redor dela)
static void vc_blur_strip(float x, float y, float w, float h, float W, float H) {
    if (w <= 0.0f || h <= 0.0f) return;
    int n = 0;
    push(g_vQuad, &n, x, y, w, h, x / W, y / H, (x + w) / W, (y + h) / H, 0xFFFFFFFFu);
    glBufferData(GL_ARRAY_BUFFER, (GLsizeiptr)(6 * (int)sizeof(UIVert)), g_vQuad, GL_STREAM_DRAW);
    glDrawArrays(GL_TRIANGLES, 0, 6);
}
static void vc_blur_bg(int W, int H) {
    int LW = W / 4, LH = H / 4;
    if (LW < 1) LW = 1;
    if (LH < 1) LH = 1;
    // captura o FB do jogo (FB0 ligado) ANTES de criar/ligar o FBO lo-res
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, g_capTex);
    glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, 0, 0, W, H, 0);
    vc_blur_ensure(LW, LH);
    glUseProgram(g_blurProg);
    glUniform1i(g_uBlurTex, 0);
    glDisable(GL_BLEND);
    // passe 1: captura (full) -> FBO 1/4, borra enquanto reduz
    glBindFramebuffer(GL_FRAMEBUFFER, g_loFbo);
    glViewport(0, 0, LW, LH);
    glUniform2f(g_uBlurInv, 2.0f / (float)LW, 2.0f / (float)LH);
    glUniform2f(g_uBlurTexel, 1.0f / (float)W, 1.0f / (float)H);
    glBindTexture(GL_TEXTURE_2D, g_capTex);
    vc_blur_quad((float)LW, (float)LH, 0.0f, 1.0f);
    // passe 2: FBO 1/4 -> tela, borra de novo ao ampliar (flip V)
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glViewport(0, 0, W, H);
    glUniform2f(g_uBlurInv, 2.0f / (float)W, 2.0f / (float)H);
    glUniform2f(g_uBlurTexel, 1.0f / (float)LW, 1.0f / (float)LH);
    glBindTexture(GL_TEXTURE_2D, g_loTex);
    if (g_hudEdit && g_hbValid) {                 // buraco na hotbar: so borra AO REDOR (hotbar original fica nitida)
        float hl = g_hbPxL, hr = g_hbPxR, ht = g_hbPxT, hb = g_hbPxB;
        if (hl < 0) hl = 0; if (ht < 0) ht = 0; if (hr > (float)W) hr = (float)W; if (hb > (float)H) hb = (float)H;
        vc_blur_strip(0.0f, 0.0f, (float)W, ht, (float)W, (float)H);                 // topo
        vc_blur_strip(0.0f, hb, (float)W, (float)H - hb, (float)W, (float)H);        // base
        vc_blur_strip(0.0f, ht, hl, hb - ht, (float)W, (float)H);                    // esquerda
        vc_blur_strip(hr, ht, (float)W - hr, hb - ht, (float)W, (float)H);           // direita
    } else {
        vc_blur_quad((float)W, (float)H, 0.0f, 1.0f);
    }
    glEnable(GL_BLEND);
    glUseProgram(g_prog);
    glUniform2f(g_uInvScreen, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    glUniform1i(g_uTex, 0);
}

// frosted do painel lateral in-game: borra SO a regiao do painel (jogo em volta fica nitido,
// da pra ver a bola/jogo enquanto ajusta). Inset de 7px -> cantos do blur ficam dentro do painel arredondado.
static void vc_blur_panel(int W, int H) {
    vc_ig_initpos();
    float px, py, pw, ph; vc_ig_panel(&px, &py, &pw, &ph);   // virtual
    px += vc_ig_slidex(px, pw);                               // acompanha o slide do painel
    float s = (float)H / (float)g_lastH;                      // virtual -> pixel
    float rx = (px + 7.0f) * s, ry = (py + 7.0f) * s, rw = (pw - 14.0f) * s, rh = (ph - 14.0f) * s;
    if (rw <= 0.0f || rh <= 0.0f) return;
    int LW = W / 4, LH = H / 4; if (LW < 1) LW = 1; if (LH < 1) LH = 1;
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, g_capTex);
    glCopyTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, 0, 0, W, H, 0);
    vc_blur_ensure(LW, LH);
    glUseProgram(g_blurProg);
    glUniform1i(g_uBlurTex, 0);
    glDisable(GL_BLEND);
    glBindFramebuffer(GL_FRAMEBUFFER, g_loFbo);
    glViewport(0, 0, LW, LH);
    glUniform2f(g_uBlurInv, 2.0f / (float)LW, 2.0f / (float)LH);
    glUniform2f(g_uBlurTexel, 1.0f / (float)W, 1.0f / (float)H);
    glBindTexture(GL_TEXTURE_2D, g_capTex);
    vc_blur_quad((float)LW, (float)LH, 0.0f, 1.0f);
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glViewport(0, 0, W, H);
    glUniform2f(g_uBlurInv, 2.0f / (float)W, 2.0f / (float)H);
    glUniform2f(g_uBlurTexel, 1.0f / (float)LW, 1.0f / (float)LH);
    glBindTexture(GL_TEXTURE_2D, g_loTex);
    vc_blur_strip(rx, ry, rw, rh, (float)W, (float)H);
    glEnable(GL_BLEND);
    glUseProgram(g_prog);
    glUniform2f(g_uInvScreen, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    glUniform1i(g_uTex, 0);
}

// motion blur acumulado: desenha os ultimos N quadros por cima da cena (FB0) com alpha
// decrescente (mais antigo = mais forte, estilo Flarial), depois captura o quadro atual pro ring.
static void vc_mb_ensure(int W, int H) {
    if (g_mbReady && g_mbW == W && g_mbH == H) return;
    if (!g_mbReady) glGenTextures(MB_MAX, g_mbTex);
    for (int i = 0; i < MB_MAX; i++) {                              // aloca 1x (ou na troca de resolucao)
        glBindTexture(GL_TEXTURE_2D, g_mbTex[i]);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, W, H, 0, GL_RGB, GL_UNSIGNED_BYTE, nullptr);
    }
    g_mbReady = 1; g_mbW = W; g_mbH = H; g_mbCount = 0; g_mbHead = 0;
}
extern "C" void vc_mb_config(int on, int frames, float alpha, float bleed, int dynamic) {
    g_mbOn = on;
    g_mbN = frames < 1 ? 1 : (frames > MB_MAX ? MB_MAX : frames);
    g_mbAlpha = alpha; g_mbBleed = bleed; g_mbDyn = dynamic;
    if (!on) { g_mbCount = 0; g_mbHead = 0; }
}
static void vc_mb_frame(int W, int H) {
    vc_mb_ensure(W, H);
    int n = g_mbN;
    if (g_mbDyn) {                                                  // N dinamico: so corta em stutter REAL (base 60)
        int f = g_fps;
        if (f > 0) { if (f < 30) n = 1; else if (f < 45 && n > 2) n = 2; }
    }
    if (n < 1) n = 1; if (n > MB_MAX) n = MB_MAX;
    if (g_mbCount > n) g_mbCount = n;
    if (g_mbHead >= n) g_mbHead = 0;

    // captura o quadro atual PRIMEIRO (entra na mistura deste frame; sem realocar)
    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glActiveTexture(GL_TEXTURE0);
    glBindTexture(GL_TEXTURE_2D, g_mbTex[g_mbHead]);
    glCopyTexSubImage2D(GL_TEXTURE_2D, 0, 0, 0, 0, 0, W, H);
    g_mbHead = (g_mbHead + 1) % n;
    if (g_mbCount < n) g_mbCount++;

    glViewport(0, 0, W, H);
    glUseProgram(g_prog);
    glUniform2f(g_uInvScreen, 2.0f / (float)W, 2.0f / (float)H);  // quad em espaco de PIXEL
    glUniform1i(g_uTex, 0);
    glEnable(GL_BLEND); glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); glBlendEquation(GL_FUNC_ADD);
    // over-blend (metodo do Flarial): a cena atual (FB0) fica NITIDA por baixo e os
    // quadros anteriores entram como ecos fracos com alpha decrescente.
    float a = g_mbAlpha;
    for (int k = 0; k < g_mbCount; k++) {                           // ordem cronologica (mais antigo -> mais novo)
        int idx = ((g_mbHead - g_mbCount + k) % n + n) % n;
        unsigned col = ((unsigned)(a * 255.0f + 0.5f) << 24) | 0x00FFFFFFu;
        glBindTexture(GL_TEXTURE_2D, g_mbTex[idx]);
        int nn = 0; push(g_vQuad, &nn, 0.0f, 0.0f, (float)W, (float)H, 0.0f, 1.0f, 1.0f, 0.0f, col); // V invertido (FB->tex)
        glBufferData(GL_ARRAY_BUFFER, (GLsizeiptr)(6 * (int)sizeof(UIVert)), g_vQuad, GL_STREAM_DRAW);
        glDrawArrays(GL_TRIANGLES, 0, 6);
        a *= g_mbBleed;
    }
    glUseProgram(g_prog);                                          // restaura escala virtual pros segmentos
    glUniform2f(g_uInvScreen, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    glUniform1i(g_uTex, 0);
}

// zoom: botao "Z" fixo na direita (segura=zoom). FOV em opts+0xe4 (o jogo rele por frame).
static float vc_zoom_bx() { return (g_zbx < 0.0f) ? ((float)g_lastW - ZB_R - 30.0f) : (g_zbx * (float)g_lastW); }
static float vc_zoom_by() { return (g_zby < 0.0f) ? ((float)g_lastH * 0.62f) : (g_zby * (float)g_lastH); }
static int vc_zoom_hit(float vx, float vy) {
    if (!g_zoomOn) return 0;
    float dx = vx - vc_zoom_bx(), dy = vy - vc_zoom_by();
    return (dx * dx + dy * dy <= ZB_R * ZB_R) ? 1 : 0;
}
static void vc_zoom_apply() {
    void* opts = g_mc ? *(void**)((char*)g_mc + 0x13c) : nullptr;   // getOptions (mc+0x13c)
    if (!opts) { g_zoomActive = 0; return; }
    float* pf = (float*)((char*)opts + 0xe4);                       // FOV (graus)
    int want = (g_zoomOn && g_zoomHeld);
    if (want && !g_zoomActive) { g_zoomUserFov = *pf; g_zoomCur = *pf; g_zoomActive = 1; }  // salva FOV do usuario
    if (!g_zoomActive) return;
    float mult = g_zoomMult < 1.1f ? 1.1f : g_zoomMult;
    float target = want ? (g_zoomUserFov / mult) : g_zoomUserFov;
    if (target < 10.0f) target = 10.0f;
    if (g_zoomSmooth) g_zoomCur += (target - g_zoomCur) * 0.25f; else g_zoomCur = target;
    if (!want && g_zoomCur >= g_zoomUserFov - 0.3f) { *pf = g_zoomUserFov; g_zoomActive = 0; }  // voltou ao normal
    else *pf = g_zoomCur;
}
extern "C" void vc_zoom_config(int on, float mult, int smooth, int toggle) {
    g_zoomOn = on; g_zoomMult = mult; g_zoomSmooth = smooth; g_zoomToggle = toggle;
    if (!on) g_zoomHeld = 0;   // a animacao de volta ao FOV do usuario termina sozinha em vc_zoom_apply
}
// perspectiva: botao fixo (abaixo do Z). Cada toque cicla a visao (o ciclo = _toggleThirdPersonView, o F5 nativo).
static float vc_persp_bx() { return (g_pbx < 0.0f) ? ((float)g_lastW - ZB_R - 30.0f) : (g_pbx * (float)g_lastW); }
static float vc_persp_by() { return (g_pby < 0.0f) ? ((float)g_lastH * 0.76f) : (g_pby * (float)g_lastH); }
static int vc_persp_hit(float vx, float vy) {
    if (!g_perspOn) return 0;
    float dx = vx - vc_persp_bx(), dy = vy - vc_persp_by();
    return (dx * dx + dy * dy <= ZB_R * ZB_R) ? 1 : 0;
}
extern "C" void vc_persp_config(int on, int skip) { g_perspOn = on; g_perspSkip = skip; if (!on) { g_perspPid = -1; g_perspReq = 0; } }

static void overlay_frame(int W, int H) {
    g_pixelH = H;
    if (g_hbAccR > g_hbAccL) {                        // finaliza a hotbar do frame: GUI -> pixel (GuiScale)
        float gs = ((float (*)(void*))vc_call(0x749714u))(nullptr);   // GuiData::getGuiScale (ignora o this)
        if (gs < 0.5f) gs = 1.0f;
        g_hbPxL = g_hbAccL * gs; g_hbPxR = g_hbAccR * gs; g_hbPxT = g_hbAccT * gs; g_hbPxB = g_hbAccB * gs;
        float sw = (g_hbPxR - g_hbPxL) / 9.0f;        // 1 slot; estende pra cobrir o botao de inventario (10o, a direita)
        g_hbPxR += sw * 1.1f;
        g_hbValid = 1;
        static int lg = 0; if (!lg) { lg = 1; LOG("hotbar px L=%.0f R=%.0f T=%.0f B=%.0f gs=%.2f H=%d", g_hbPxL, g_hbPxR, g_hbPxT, g_hbPxB, gs, H); }
    }
    g_hbAccL = 1e9f; g_hbAccR = -1e9f; g_hbAccT = 1e9f; g_hbAccB = -1e9f;
    if (g_hbValid && g_pixelH > 0) {                 // hotbar em coords VIRTUAIS (snap + dim com buraco)
        float k = (1080.0f / (float)g_pixelH) / g_optMult;
        g_hbVL = g_hbPxL * k; g_hbVR = g_hbPxR * k; g_hbVT = g_hbPxT * k; g_hbVB = g_hbPxB * k;
    }
    { static int t0 = 0, fr = 0; int now = vc_now_ms(); fr++; if (!t0) t0 = now; if (now - t0 >= 500) { g_fps = fr * 1000 / (now - t0); fr = 0; t0 = now; } }
    float vh = 1080.0f / g_optMult, vw = vh * (float)W / (float)H;
    g_lastW = (int)(vw + 0.5f); g_lastH = (int)vh;
    g_nSolid = 0; g_nText = 0; g_nIcon = 0; g_nRound = 0;
    ui_build(g_lastW, g_lastH);
    int doBlur = ((g_screen >= 1 && g_screen <= 9) || onPauseScreen(g_mc));   // (sem blur no Editar HUD)
    int doMB = (g_mbOn && onHud(g_mc));
    if (!doMB) { g_mbCount = 0; g_mbHead = 0; }   // limpa ring fora do jogo (evita salto ao voltar)
    vc_zoom_apply();                              // anima/aplica o FOV do zoom todo frame in-game
    if (g_hudEdit && g_mc && !onHud(g_mc)) { g_hudEdit = 0; vc_modules_save(); }   // saiu do jogo -> fecha edicao
    if (!g_nSolid && !g_nText && !g_nIcon && !g_nRound && !doBlur && !doMB && !(onHud(g_mc) && vc_ig_panel_shown() && !g_hudEdit)) return;

    glUseProgram(g_prog);
    glBindBuffer(GL_ARRAY_BUFFER, g_vbo);
    glEnableVertexAttribArray(0); glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, sizeof(UIVert), (void*)offsetof(UIVert, x));
    glEnableVertexAttribArray(1); glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, sizeof(UIVert), (void*)offsetof(UIVert, u));
    glEnableVertexAttribArray(2); glVertexAttribPointer(2, 4, GL_UNSIGNED_BYTE, GL_TRUE, sizeof(UIVert), (void*)offsetof(UIVert, r));

    glBindFramebuffer(GL_FRAMEBUFFER, 0);
    glViewport(0, 0, W, H);
    glDisable(GL_DEPTH_TEST); glDepthMask(GL_FALSE);
    glDisable(GL_CULL_FACE); glDisable(GL_SCISSOR_TEST);
    glColorMask(GL_TRUE, GL_TRUE, GL_TRUE, GL_TRUE);
    glDisable(GL_STENCIL_TEST);
    glEnable(GL_BLEND); glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA); glBlendEquation(GL_FUNC_ADD);
    glUniform2f(g_uInvScreen, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    glActiveTexture(GL_TEXTURE0); glUniform1i(g_uTex, 0);

    if (doBlur) vc_blur_bg(W, H);                 // (no modo editar, deixa buraco na hotbar = ela fica nitida)
    if (doMB) vc_mb_frame(W, H);

    vc_draw_rounds();                             // paineis arredondados (frosted) entre o blur e os accents/texto
    segment(g_vSolid, g_nSolid, g_white);
    segment(g_vIcon, g_nIcon, g_iconTex);
    segment(g_vText, g_nText, g_font);
}

static void gl_save(GLSaved* s) {
    glGetIntegerv(GL_CURRENT_PROGRAM, &s->prog);
    glGetIntegerv(GL_ARRAY_BUFFER_BINDING, &s->arrBuf);
    glGetIntegerv(GL_ELEMENT_ARRAY_BUFFER_BINDING, &s->elemBuf);
    glGetIntegerv(GL_ACTIVE_TEXTURE, &s->activeTex);
    glActiveTexture(GL_TEXTURE0); glGetIntegerv(GL_TEXTURE_BINDING_2D, &s->texU0);
    s->blend = glIsEnabled(GL_BLEND); s->depth = glIsEnabled(GL_DEPTH_TEST);
    s->cull = glIsEnabled(GL_CULL_FACE); s->scissor = glIsEnabled(GL_SCISSOR_TEST);
    s->stencil = glIsEnabled(GL_STENCIL_TEST);
    glGetIntegerv(GL_BLEND_SRC_RGB, &s->bSrcRGB); glGetIntegerv(GL_BLEND_DST_RGB, &s->bDstRGB);
    glGetIntegerv(GL_BLEND_SRC_ALPHA, &s->bSrcA); glGetIntegerv(GL_BLEND_DST_ALPHA, &s->bDstA);
    glGetIntegerv(GL_BLEND_EQUATION_RGB, &s->bEqRGB); glGetIntegerv(GL_BLEND_EQUATION_ALPHA, &s->bEqA);
    glGetBooleanv(GL_DEPTH_WRITEMASK, &s->depthMask); glGetBooleanv(GL_COLOR_WRITEMASK, s->colMask);
    glGetIntegerv(GL_VIEWPORT, s->vp); glGetIntegerv(GL_SCISSOR_BOX, s->scBox);
    for (int i = 0; i < 3; i++) {
        glGetVertexAttribiv(i, GL_VERTEX_ATTRIB_ARRAY_ENABLED, &s->vaOn[i]);
        glGetVertexAttribiv(i, GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING, &s->vaBuf[i]);
        glGetVertexAttribiv(i, GL_VERTEX_ATTRIB_ARRAY_SIZE, &s->vaSz[i]);
        glGetVertexAttribiv(i, GL_VERTEX_ATTRIB_ARRAY_TYPE, &s->vaTy[i]);
        glGetVertexAttribiv(i, GL_VERTEX_ATTRIB_ARRAY_NORMALIZED, &s->vaNrm[i]);
        glGetVertexAttribiv(i, GL_VERTEX_ATTRIB_ARRAY_STRIDE, &s->vaStr[i]);
        glGetVertexAttribPointerv(i, GL_VERTEX_ATTRIB_ARRAY_POINTER, &s->vaPtr[i]);
    }
}

static void gl_restore(const GLSaved* s) {
    for (int i = 0; i < 3; i++) {
        glBindBuffer(GL_ARRAY_BUFFER, s->vaBuf[i]);
        if (s->vaOn[i]) { glVertexAttribPointer(i, s->vaSz[i], s->vaTy[i], (GLboolean)s->vaNrm[i], s->vaStr[i], s->vaPtr[i]); glEnableVertexAttribArray(i); }
        else glDisableVertexAttribArray(i);
    }
    glBindBuffer(GL_ARRAY_BUFFER, s->arrBuf); glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, s->elemBuf);
    glActiveTexture(GL_TEXTURE0); glBindTexture(GL_TEXTURE_2D, s->texU0); glActiveTexture(s->activeTex);
    if (s->blend) glEnable(GL_BLEND); else glDisable(GL_BLEND);
    glBlendFuncSeparate(s->bSrcRGB, s->bDstRGB, s->bSrcA, s->bDstA); glBlendEquationSeparate(s->bEqRGB, s->bEqA);
    if (s->depth) glEnable(GL_DEPTH_TEST); else glDisable(GL_DEPTH_TEST); glDepthMask(s->depthMask);
    if (s->cull) glEnable(GL_CULL_FACE); else glDisable(GL_CULL_FACE);
    if (s->scissor) glEnable(GL_SCISSOR_TEST); else glDisable(GL_SCISSOR_TEST);
    if (s->stencil) glEnable(GL_STENCIL_TEST); else glDisable(GL_STENCIL_TEST);
    glScissor(s->scBox[0], s->scBox[1], s->scBox[2], s->scBox[3]);
    glColorMask(s->colMask[0], s->colMask[1], s->colMask[2], s->colMask[3]);
    glViewport(s->vp[0], s->vp[1], s->vp[2], s->vp[3]);
    glUseProgram(s->prog);
}

static int onMenu(void* mc);

static void my_apSwap(void* self) {
    if (g_mcpe && g_mc && (onMenu(g_mc) || onPauseScreen(g_mc) || onProgress(g_mc) || onHud(g_mc))) {
        EGLContext cur = eglGetCurrentContext();
        if (cur == EGL_NO_CONTEXT) { orig_apSwap(self); return; }
        if (cur != g_ctx) { g_ctx = cur; g_glReady = 0; }
        if (!g_glReady) overlay_init_gl();
        EGLDisplay dpy = eglGetCurrentDisplay();
        EGLSurface surf = eglGetCurrentSurface(EGL_DRAW);
        EGLint W = 0, H = 0;
        if (dpy != EGL_NO_DISPLAY && surf != EGL_NO_SURFACE) {
            eglQuerySurface(dpy, surf, EGL_WIDTH, &W);
            eglQuerySurface(dpy, surf, EGL_HEIGHT, &H);
        }
        if (W > 0 && H > 0) {
            GLSaved s; gl_save(&s);
            overlay_frame(W, H);
            gl_restore(&s);
        }
    }
    orig_apSwap(self);
}

static void* topScreen(void* mc) {
    if (!mc) return nullptr;
    void* s = *(void**)((char*)mc + 0x80);
    void* e = *(void**)((char*)mc + 0x84);
    if (s == e) return nullptr;
    return *(void**)((char*)e - 8);
}

static int onMenu(void* mc) {
    void* scr = topScreen(mc);
    if (!scr) return 0;
    if (*(void**)scr != (void*)(g_slide + 0x160681cu)) return 0;
    void* ctrl = *(void**)((char*)scr + 0x80);
    if (!ctrl) return 0;
    return *(void**)ctrl == (void*)(g_slide + 0x160323cu);
}

static int onPauseScreen(void* mc) {
    void* scr = topScreen(mc);
    if (!scr) return 0;
    return *(void**)scr == (void*)(g_slide + 0x1605954u);
}

static int onHud(void* mc) {
    void* scr = topScreen(mc);
    if (!scr) return 0;
    if (*(void**)scr != (void*)(g_slide + 0x160681cu)) return 0;
    void* ctrl = *(void**)((char*)scr + 0x80);
    if (!ctrl) return 0;
    return *(void**)ctrl == (void*)(g_slide + 0x1602924u);
}

static int onProgress(void* mc) {
    void* scr = topScreen(mc);
    if (!scr) return 0;
    if (*(void**)scr != (void*)(g_slide + 0x160681cu)) return 0;
    void* ctrl = *(void**)((char*)scr + 0x80);
    if (!ctrl) return 0;
    return *(void**)ctrl == (void*)(g_slide + 0x1602ce0u);
}

static void my_pauseRender(void* self, int a, int b, float c) {
    if (g_mc && onPauseScreen(g_mc)) return;
    orig_pauseRender(self, a, b, c);
}

#define VC_CALL(va) ((void*)(((uintptr_t)g_slide + (uintptr_t)(va)) | 1u))
typedef void (*fn_pushPlay)(void*, bool);
typedef void (*fn_pushOpts)(void*, bool, int);

static void vc_open_play(void* mc) {
    void* sc = mc ? *(void**)((char*)mc + 0x198) : nullptr;
    if (sc) ((fn_pushPlay)VC_CALL(0x86feacu))(sc, false);
}

static void vc_open_options(void* mc) {
    void* sc = mc ? *(void**)((char*)mc + 0x198) : nullptr;
    if (sc) ((fn_pushOpts)VC_CALL(0x8706c8u))(sc, false, 0);
}

typedef void (*fn_pushAddSrv)(void*);
static void vc_open_multiplayer(void* mc) {
    void* sc = mc ? *(void**)((char*)mc + 0x198) : nullptr;
    if (sc) ((fn_pushAddSrv)VC_CALL(0x863f18u))(sc);
}

typedef void (*fn_mcPop)(void*, int);
typedef void (*fn_setLeave)(void*);

static void vc_resume(void* mc) {
    if (mc) ((fn_mcPop)VC_CALL(0x6cd664u))(mc, 1);
}

static void vc_quit_world(void* mc) {
    void* sc = mc ? *(void**)((char*)mc + 0x198) : nullptr;
    if (sc) ((fn_setLeave)VC_CALL(0x87530cu))(sc);
}

static float vc_game_guiscale() {
    float gs = *(float*)((uintptr_t)g_slide + 0x16a300cu);
    if (gs < 1.0f || gs > 8.0f) gs = 4.0f;
    return gs;
}

static inline const char* str_data(const void* s) { return *(const char* const*)s; }

typedef void (*fn_str_cstr)(void*, const char*, const void*);
typedef void (*fn_str_dtor)(void*);
static fn_str_cstr Str_ctor = nullptr;
static fn_str_dtor Str_dtor = nullptr;
static void (*Op_delete)(void*) = nullptr;

static void vc_str_init() {
    void* g = dlopen("libgnustl_shared.so", RTLD_NOW | RTLD_NOLOAD);
    void* h = g ? g : RTLD_DEFAULT;
    Str_ctor = (fn_str_cstr)dlsym(h, "_ZNSsC1EPKcRKSaIcE");
    if (!Str_ctor) Str_ctor = (fn_str_cstr)dlsym(h, "_ZNSsC2EPKcRKSaIcE");
    Str_dtor = (fn_str_dtor)dlsym(h, "_ZNSsD1Ev");
    if (!Str_dtor) Str_dtor = (fn_str_dtor)dlsym(h, "_ZNSsD2Ev");
    Op_delete = (void (*)(void*))dlsym(h, "_ZdlPv");
    LOG("gnustl str ctor=%p dtor=%p opdel=%p", (void*)Str_ctor, (void*)Str_dtor, (void*)Op_delete);
}
static inline void vc_mkstr(void** slot, const char* c) { char a; *slot = nullptr; if (Str_ctor) Str_ctor((void*)slot, c, &a); }
static inline void vc_delstr(void** slot) { if (Str_dtor) Str_dtor((void*)slot); }

// i18n: traduz uma chave .lang via I18n::get@0xa97ee4 (igual a vanilla, em todos os idiomas).
// Cache por ponteiro-de-chave, invalidado quando o idioma muda (I18n::mCurrentLanguage@0x16b63d8).
// Fallback = a propria chave (chaves custom sem traducao). NAO usar p/ texto de marca/modulos.
// idioma atual == portugues? (cacheado; Localization::getLanguageCode@0xa983f1 no idioma atual)
static int vc_lang_pt() {
    static void* clang = (void*)1; static int cpt = 0;
    if (!g_slide || !Str_ctor) return 0;
    void* loc = *(void**)(g_slide + 0x16b63d8u);
    if (loc != clang) {
        clang = loc; cpt = 0;
        if (loc) {
            void* cs = nullptr;
            ((void(*)(void*, void*))VC_CALL(0xa983f1u))(&cs, loc);
            const char* c = str_data(&cs);
            cpt = (c && c[0] == 'p' && c[1] == 't') ? 1 : 0;
            vc_delstr(&cs);
        }
    }
    return cpt;
}
// textos NOSSOS sem chave .lang vanilla: PT (a propria string) + EN. Fallback de outros idiomas = EN.
static const struct { const char* pt; const char* en; } g_cust[] = {
    { "1a Pessoa", "First Person" }, { "3a Pessoa", "Third Person" }, { "3a Frente", "Front View" },
    { "Nenhum mundo local", "No local worlds" }, { "Nenhum servidor salvo", "No saved servers" },
    { "Nenhum idioma", "No languages" }, { "Nenhum modulo", "No modules" },
    { "Editar Mundo", "Edit World" }, { "EDITAR MUNDO", "EDIT WORLD" },
    { "EDITAR SERVIDOR", "EDIT SERVER" }, { "ADICIONAR SERVIDOR", "ADD SERVER" },
    { "Informe ao menos o Endereco / IP", "Enter at least the Address / IP" },
    { "Configurar", "Configure" }, { "Expandir", "Expand" },
    { "Jogabilidade", "Gameplay" }, { "Cosmeticos", "Cosmetics" }, { "Perfil", "Profile" },
};
static const char* vc_tr(const char* key) {
    static const char* ckey[192];
    static char ctext[192][80];
    static int cn = 0;
    static void* clang = (void*)1;
    if (!g_slide || !Str_ctor || !key) return key;
    void* lang = *(void**)(g_slide + 0x16b63d8u);
    if (lang != clang) { clang = lang; cn = 0; }
    for (int i = 0; i < cn; i++) if (ckey[i] == key) return ctext[i];
    char tmp[80];
    const char* out = key;
    int custom = 0;
    if (!vc_lang_pt()) {   // idioma != PT: nossos textos custom viram EN
        for (int i = 0; i < (int)(sizeof(g_cust) / sizeof(g_cust[0])); i++)
            if (!strcmp(g_cust[i].pt, key)) { out = g_cust[i].en; custom = 1; break; }
    }
    if (!custom) {         // chave vanilla (ou PT: literal custom volta inalterado de I18n::get)
        void* ks = nullptr; void* os = nullptr;
        vc_mkstr(&ks, key);
        ((void(*)(void*, const void*))VC_CALL(0xa97ee4u))(&os, &ks);
        const char* s = str_data(&os);
        if (s && s[0]) { snprintf(tmp, sizeof tmp, "%s", s); out = tmp; }
        vc_delstr(&os); vc_delstr(&ks);
    }
    const char* ret;
    if (cn < 192) { ckey[cn] = key; snprintf(ctext[cn], 80, "%s", out); ret = ctext[cn]; cn++; }
    else { static char t2[80]; snprintf(t2, 80, "%s", out); ret = t2; }
    return ret;
}

typedef void (*fn_psm_ctor)(void*, void*);
typedef void (*fn_psm_dtor)(void*);
typedef void (*fn_psm_pop)(void*);
typedef void* (*fn_psm_at)(void*, int);
typedef void (*fn_psm_start)(void*, int, int, int);
typedef void (*fn_join)(void*, void*, int);

static void vc_worlds_open() {
    if (g_worldsModel || !g_mc) return;
    if (!*(void**)((char*)g_mc + 0x50)) return;
    void* m = calloc(1, 0x100);
    ((fn_psm_ctor)VC_CALL(0x83fb30u))(m, g_mc);
    ((fn_psm_pop)VC_CALL(0x8405c8u))(m);
    g_worldsModel = m;
}
static void vc_worlds_close() {
    if (!g_worldsModel) return;
    ((fn_psm_dtor)VC_CALL(0x83fc10u))(g_worldsModel);
    free(g_worldsModel);
    g_worldsModel = nullptr;
}
static void vc_cache_worlds() {
    g_worldCount = 0;
    if (!g_worldsModel) return;
    void* s = *(void**)((char*)g_worldsModel + 0x1c);
    void* f = *(void**)((char*)g_worldsModel + 0x20);
    int n = (int)(((uintptr_t)f - (uintptr_t)s) / 0x40);
    for (int i = 0; i < n && g_worldCount < 32; i++) {
        void* w = ((fn_psm_at)VC_CALL(0x8404f8u))(g_worldsModel, i);
        const char* nm = w ? str_data((char*)w + 0x10) : nullptr;
        snprintf(g_worldNames[g_worldCount], 48, "%s", nm ? nm : "?");
        g_worldCount++;
    }
}
static void vc_world_launch(int i) {
    if (g_worldsModel) ((fn_psm_start)VC_CALL(0x84139cu))(g_worldsModel, i, 0, 0);
}

static void vc_list_servers() {
    g_serverCount = 0;
    void* f = g_mc ? *(void**)((char*)g_mc + 0x64) : nullptr;
    if (!f) return;
    void* node = *(void**)((char*)f + 0x08);
    for (; node && g_serverCount < 64; node = *(void**)node) {
        void* s = *(void**)((char*)node + 0x08);
        if (!s) continue;
        VcServer* o = &g_servers[g_serverCount];
        o->id = *(int*)((char*)s + 0x08);
        o->port = *(int*)((char*)s + 0x0c);
        const char* nm = str_data((char*)s + 0x1c);
        const char* ho = str_data((char*)s + 0x28);
        snprintf(o->name, sizeof o->name, "%s", nm ? nm : "?");
        snprintf(o->host, sizeof o->host, "%s", ho ? ho : "?");
        g_serverCount++;
    }
}
static void vc_connect_index(int i) {
    if (i < 0 || i >= g_serverCount || !g_mc) return;
    if (!*(void**)((char*)g_mc + 0x18c)) return;
    void* chooser = ((void* (*)(void*))VC_CALL(0x6cc6b4u))(g_mc);
    if (chooser) {
        void* nm; vc_mkstr(&nm, g_servers[i].name[0] ? g_servers[i].name : g_servers[i].host);
        ((void (*)(void*, const void*))VC_CALL(0x873f60u))(chooser, &nm);
        vc_delstr(&nm);
    }
    void* hs; vc_mkstr(&hs, g_servers[i].host);
    if (hs) { ((fn_join)VC_CALL(0x6cfc30u))(g_mc, &hs, g_servers[i].port & 0xFFFF); vc_delstr(&hs); }
}

static VcPing* ping_for(int id) {
    for (int i = 0; i < g_pingN; i++) if (g_ping[i].id == id) return &g_ping[i];
    if (g_pingN >= 64) return nullptr;
    VcPing* p = &g_ping[g_pingN++];
    p->id = id; p->motd[0] = 0; p->players = -1; p->maxp = -1; p->online = 0; p->pingMs = -1;
    return p;
}
static void* vc_locator() {
    if (!g_mc) return nullptr;
    void* game = *(void**)((char*)g_mc + 0x50);
    if (!game) return nullptr;
    void* nh = *(void**)((char*)game + 0x4c);
    if (!nh) return nullptr;
    return *(void**)((char*)nh + 0x8);
}
static void vc_ping_open() {
    if (g_srvLoc) return;
    void* loc = vc_locator();
    if (!loc) return;
    ((void (*)(void*, int))VC_CALL(0xab824cu))(loc, 1);
    ((void (*)(void*))VC_CALL(0xab865cu))(loc);
    g_srvLoc = loc; g_pingCur = 0; g_pingInFlight = 0; g_pingN = 0;
}
static void vc_ping_close() {
    if (!g_srvLoc) return;
    ((void (*)(void*))VC_CALL(0xab8604u))(g_srvLoc);
    ((void (*)(void*))VC_CALL(0xab865cu))(g_srvLoc);
    g_srvLoc = nullptr;
}
static void vc_ping_tick() {
    if (!g_srvLoc || g_serverCount == 0) return;
    ((void (*)(void*))VC_CALL(0xab736cu))(g_srvLoc);
    struct timespec vcts; clock_gettime(CLOCK_MONOTONIC, &vcts);
    int now = (int)(vcts.tv_sec * 1000 + vcts.tv_nsec / 1000000);
    if (g_pingCur >= g_serverCount) g_pingCur = 0;
    if (!g_pingInFlight) {
        ((void (*)(void*))VC_CALL(0xab865cu))(g_srvLoc);
        g_lastRtt = -1;
        void* hs; vc_mkstr(&hs, g_servers[g_pingCur].host);
        if (hs) { ((void (*)(void*, const void*, int))VC_CALL(0xab85e4u))(g_srvLoc, &hs, g_servers[g_pingCur].port & 0xFFFF); vc_delstr(&hs); }
        g_pingT0 = now; g_pingInFlight = 1;
        return;
    }
    void* start = *(void**)((char*)g_srvLoc + 0x0c);
    void* finish = *(void**)((char*)g_srvLoc + 0x10);
    if ((uintptr_t)finish > (uintptr_t)start) {
        void* e = start;
        VcPing* p = ping_for(g_servers[g_pingCur].id);
        if (p) {
            const char* motd = str_data((char*)e + 0x00);
            snprintf(p->motd, sizeof p->motd, "%s", motd ? motd : "");
            p->players = *(int*)((char*)e + 0x0c);
            p->maxp = *(int*)((char*)e + 0x10);
            p->online = 1;
            int d = now - g_pingT0; if (d < 0) d = 0;
            p->pingMs = (g_lastRtt >= 0) ? g_lastRtt : d;
            LOG("PONG %s motd='%s' %d/%d %dms", g_servers[g_pingCur].name, p->motd, p->players, p->maxp, p->pingMs);
        }
        g_pingCur = (g_pingCur + 1) % g_serverCount; g_pingInFlight = 0;
        return;
    }
    if (now - g_pingT0 > 2000) {
        VcPing* p = ping_for(g_servers[g_pingCur].id);
        if (p) { p->online = 0; p->players = -1; p->maxp = -1; p->pingMs = -2; p->motd[0] = 0; }
        g_pingCur = (g_pingCur + 1) % g_serverCount; g_pingInFlight = 0;
    }
}

typedef void (*fn_pong)(void*, const void*, const void*, int);
static fn_pong orig_pong = nullptr;
static void my_pong(void* self, const void* motd, const void* pkt, int b) {
    if (pkt) {
        unsigned char* data = *(unsigned char**)((char*)pkt + 0x30);
        if (data) {
            unsigned echoed; memcpy(&echoed, data + 1, 4);
            unsigned now = ((unsigned (*)(void))VC_CALL(0x11be3f8u))();
            int rtt = (int)(now - echoed);
            if (rtt >= 0 && rtt < 100000) g_lastRtt = rtt;
        }
    }
    orig_pong(self, motd, pkt, b);
}

static void vc_kb_open(int fieldIdx) {
    void* ap = *(void**)((uintptr_t)g_slide + 0x16b6cbcu);
    if (!ap) return;
    void** vt = *(void***)ap;
    void* initText; vc_mkstr(&initText, g_fields[fieldIdx]);
    struct { float x, y; } pos = { 0.0f, 0.0f };
    ((void (*)(void*, const void*, int, int, int, const void*))vt[9])(ap, &initText, 0, 0, 0, &pos);
    vc_delstr(&initText);
    g_activeField = fieldIdx + 1;
}
static void vc_kb_close() {
    g_activeField = 0;
    void* ap = *(void**)((uintptr_t)g_slide + 0x16b6cbcu);
    if (ap) { void** vt = *(void***)ap; ((void (*)(void*))vt[10])(ap); }
}

static void my_nSetText(JNIEnv* env, jobject thiz, jstring s) {
    if (g_activeField) {
        const char* u = s ? env->GetStringUTFChars(s, nullptr) : nullptr;
        pthread_mutex_lock(&g_fieldMtx);
        char* dst = g_fields[g_activeField - 1];
        snprintf(dst, 64, "%s", u ? u : "");
        int n = (int)strlen(dst);
        while (n > 0 && (dst[n - 1] == '\n' || dst[n - 1] == '\r')) dst[--n] = 0;
        pthread_mutex_unlock(&g_fieldMtx);
        if (u) env->ReleaseStringUTFChars(s, u);
        return;
    }
    orig_nSetText(env, thiz, s);
}
static void my_nTypeChar(JNIEnv* env, jobject thiz, jstring s) {
    if (g_activeField) {
        const char* u = s ? env->GetStringUTFChars(s, nullptr) : nullptr;
        if (u) {
            pthread_mutex_lock(&g_fieldMtx);
            char* dst = g_fields[g_activeField - 1];
            int n = (int)strlen(dst);
            snprintf(dst + n, (size_t)(64 - n), "%s", u);
            pthread_mutex_unlock(&g_fieldMtx);
        }
        if (u) env->ReleaseStringUTFChars(s, u);
        return;
    }
    orig_nTypeChar(env, thiz, s);
}
static void my_nBksp(JNIEnv* env, jobject thiz) {
    if (g_activeField) {
        pthread_mutex_lock(&g_fieldMtx);
        char* dst = g_fields[g_activeField - 1];
        int n = (int)strlen(dst);
        if (n > 0) {
            int i = n - 1;
            while (i > 0 && ((unsigned char)dst[i] & 0xc0) == 0x80) i--;
            dst[i] = 0;
        }
        pthread_mutex_unlock(&g_fieldMtx);
        return;
    }
    orig_nBksp(env, thiz);
}
static void my_nReturn(JNIEnv* env, jobject thiz) {
    if (g_activeField) { g_submitReq = 1; return; }
    orig_nReturn(env, thiz);
}

static void* vc_extfile() { return g_mc ? *(void**)((char*)g_mc + 0x64) : nullptr; }
typedef bool (*fn_add)(void*, void*, void*, int);
typedef void* (*fn_edit)(void*, int, void*, void*, int);
typedef void (*fn_savef)(void*);

static bool vc_srv_add(const char* name, const char* host, int port) {
    void* f = vc_extfile();
    if (!f) return false;
    void *ns, *as; vc_mkstr(&ns, name); vc_mkstr(&as, host);
    bool ok = ((fn_add)VC_CALL(0x6bd4f0u))(f, &ns, &as, port & 0xFFFF);
    vc_delstr(&ns); vc_delstr(&as);
    if (ok) ((fn_savef)VC_CALL(0x6bd450u))(f);
    return ok;
}
static void vc_srv_edit(int id, const char* name, const char* host, int port) {
    void* f = vc_extfile();
    if (!f) return;
    void *ns, *as; vc_mkstr(&ns, name); vc_mkstr(&as, host);
    ((fn_edit)VC_CALL(0x6bd620u))(f, id, &ns, &as, port & 0xFFFF);
    vc_delstr(&ns); vc_delstr(&as);
    ((fn_savef)VC_CALL(0x6bd450u))(f);
}
static void vc_srv_remove(int id) {
    void* f = vc_extfile();
    if (!f) return;
    ((void (*)(void*, int))VC_CALL(0x6bd6a0u))(f, id);
    ((fn_savef)VC_CALL(0x6bd450u))(f);
}

static void vc_create_and_enter_world(const char* nome, unsigned seed, int aleatorio, int gameType, int generator, int difficulty) {
    if (!g_mc || !*(void**)((char*)g_mc + 0x198)) return;
    void* opts = *(void**)((char*)g_mc + 0x13c);
    if (opts) *(int*)((char*)opts + 0x88) = difficulty & 3;
    void* name; vc_mkstr(&name, (nome && *nome) ? nome : "World");
    void* levelId = nullptr;
    ((void (*)(void*, const void*))VC_CALL(0xd22390u))(&levelId, &name);
    char ls[0x34];
    ((void (*)(void*))VC_CALL(0xd794ecu))(ls);
    *(unsigned*)(ls + 0x00) = aleatorio ? ((unsigned (*)(void))VC_CALL(0xd22440u))() : seed;
    *(int*)(ls + 0x04) = gameType;
    *(int*)(ls + 0x0c) = generator;
    *(int*)(ls + 0x14) = 0;
    memcpy(ls + 0x28, (void*)((uintptr_t)g_slide + 0x1708a58u), 12);
    ((void (*)(void*, const void*, const void*, const void*))VC_CALL(0x6c985cu))(g_mc, &levelId, &name, ls);
    vc_delstr(&levelId);
    vc_delstr(&name);
}

#define VC_DATA(va) ((void*)((uintptr_t)g_slide + (uintptr_t)(va)))
typedef void (*fn_set_i)(void*, const void*, int);
typedef void (*fn_set_f)(void*, const void*, float);

static void* vc_opts() { return g_mc ? *(void**)((char*)g_mc + 0x13c) : nullptr; }

enum { T_SLF = 0, T_SLI = 1, T_SLN = 2, T_TGL = 3 };
// textos abaixo sao CHAVES .lang vanilla (traduzidas por vc_tr); literais = sem chave vanilla (passam direto).
static const char* DIFF_NAMES[4] = { "options.difficulty.peaceful", "options.difficulty.easy", "options.difficulty.normal", "options.difficulty.hard" };
static const char* PERSP_NAMES[3] = { "1a Pessoa", "3a Pessoa", "3a Frente" };
static const char* TAB_NAMES[3] = { "stat.generalButton", "controls.title", "options.group.graphics" };
static const char* CW_MODE_NAMES[2] = { "createWorldScreen.gameMode.survival", "createWorldScreen.gameMode.creative" };
static const char* CW_TYPE_NAMES[3] = { "generator.infinite", "generator.flat", "generator.old" };
static const int CW_TYPE_GEN[3] = { 1, 2, 0 };

typedef struct { const char* label; unsigned off; unsigned opt; int type; float lo, hi; const char* const* names; int tab; } VOpt;
static VOpt g_opt[] = {
    { "options.sound", 0x54, 0x16b2000u, T_SLF, 0.0f, 1.0f, nullptr, 0 },
    { "options.difficulty", 0x88, 0x16b2038u, T_SLN, 0.0f, 3.0f, DIFF_NAMES, 0 },
    { "options.thirdperson", 0x90, 0x16b2058u, T_SLN, 0.0f, 2.0f, PERSP_NAMES, 0 },
    { "options.multiplayergame", 0x160, 0x16b2068u, T_TGL, 0.0f, 1.0f, nullptr, 0 },
    { "menu.shareToLan", 0x114, 0x16b2070u, T_TGL, 0.0f, 1.0f, nullptr, 0 },
    { "options.allowCellularData", 0x163, 0u, T_TGL, 0.0f, 1.0f, nullptr, 0 },
    { "options.sensitivity", 0x58, 0x16b2010u, T_SLF, 0.0f, 1.0f, nullptr, 1 },
    { "options.invertYAxis", 0x60, 0x16b2008u, T_TGL, 0.0f, 1.0f, nullptr, 1 },
    { "options.lefthanded", 0x72, 0x16b2080u, T_TGL, 0.0f, 1.0f, nullptr, 1 },
    { "options.usetouchpad", 0x115, 0x16b2090u, T_TGL, 0.0f, 1.0f, nullptr, 1 },
    { "options.swapJumpAndSneak", 0x116, 0x16b2228u, T_TGL, 0.0f, 1.0f, nullptr, 1 },
    { "options.buttonSize", 0x12c, 0x16b20a8u, T_SLF, 0.0f, 1.0f, nullptr, 1 },
    { "options.autojump", 0x74, 0x16b21e8u, T_TGL, 0.0f, 1.0f, nullptr, 1 },
    { "options.gamma", 0xe0, 0x16b21e0u, T_SLF, 0.0f, 1.0f, nullptr, 2 },
    { "options.renderDistance", 0x64, 0x16b2018u, T_SLI, 4.0f, 16.0f, nullptr, 2 },
    { "options.guiScale.optionName", 0xf8, 0x16b2050u, T_SLI, 0.0f, 2.0f, nullptr, 2 },
    { "options.fov", 0xe4, 0x16b2248u, T_SLF, 30.0f, 110.0f, nullptr, 2 },
    { "options.graphics", 0x6e, 0x16b2040u, T_TGL, 0.0f, 1.0f, nullptr, 2 },
    { "options.fancyskies", 0x118, 0x16b20a0u, T_TGL, 0.0f, 1.0f, nullptr, 2 },
    { "options.viewBobbing", 0x6c, 0x16b2028u, T_TGL, 0.0f, 1.0f, nullptr, 2 },
    { "options.hidegui", 0x8c, 0x16b2060u, T_TGL, 0.0f, 1.0f, nullptr, 2 },
};
#define N_OPT ((int)(sizeof(g_opt) / sizeof(g_opt[0])))

static float opt_read(int i) {
    void* o = vc_opts();
    if (!o) return g_opt[i].lo;
    VOpt* c = &g_opt[i];
    if (c->type == T_SLF) return *(float*)((char*)o + c->off);
    if (c->type == T_TGL) return (float)*(unsigned char*)((char*)o + c->off);
    return (float)*(int*)((char*)o + c->off);
}
static float opt_disp(int i) { return (g_drag == i) ? g_dragVal : opt_read(i); }

static void opt_apply(int i, float v) {
    void* o = vc_opts();
    if (!o) return;
    VOpt* c = &g_opt[i];
    if (c->opt == 0) { *(unsigned char*)((char*)o + c->off) = (unsigned char)(v + 0.5f); return; }
    if (c->type == T_SLF) ((fn_set_f)VC_CALL(0x92c2dcu))(o, VC_DATA(c->opt), v);
    else if (c->type == T_TGL) ((fn_set_i)VC_CALL(0x92b45cu))(o, VC_DATA(c->opt), 1);
    else ((fn_set_i)VC_CALL(0x92c0ccu))(o, VC_DATA(c->opt), (int)(v + 0.5f));
}
static void opt_preview(int i, float v) {
    void* o = vc_opts();
    if (o && (g_opt[i].off == 0xe4 || g_opt[i].off == 0xe0)) *(float*)((char*)o + g_opt[i].off) = v;
}

static void* vc_world_elem(int idx) {
    if (!g_worldsModel || idx < 0) return nullptr;
    return ((void* (*)(void*, int))VC_CALL(0x8404f8u))(g_worldsModel, idx);
}
static void vc_edit_read(int idx) {
    void* el = vc_world_elem(idx);
    if (!el) return;
    const char* nm = str_data((char*)el + 0x10);
    pthread_mutex_lock(&g_fieldMtx);
    snprintf(g_fields[0], 64, "%s", nm ? nm : "");
    pthread_mutex_unlock(&g_fieldMtx);
    g_fieldCount = 1;
    int gt = *(int*)((char*)el + 0x2c);
    g_cwMode = (gt == 1) ? 1 : 0;
    void* o = vc_opts();
    g_cwDiff = o ? (*(int*)((char*)o + 0x88) & 3) : 2;
    g_editWorldIdx = idx;
}
static void vc_edit_world(int idx, const char* name, int mode, int diff) {
    void* el = vc_world_elem(idx);
    if (!el || !g_mc) return;
    void* game = *(void**)((char*)g_mc + 0x50);
    if (!game) return;
    void* src = *(void**)((char*)game + 0x18);
    if (!src) return;
    void** vt = *(void***)src;
    void* levelId; vc_mkstr(&levelId, str_data((char*)el + 0x20));
    if (name && *name) {
        void* nm; vc_mkstr(&nm, name);
        ((int (*)(void*, const void*, const void*))(*(void**)((char*)vt + 0x28)))(src, &levelId, &nm);
        vc_delstr(&nm);
    }
    {
        unsigned char ldbuf[0x100] __attribute__((aligned(8)));
        memset(ldbuf, 0, sizeof ldbuf);
        ((void (*)(void*, void*, const void*))(*(void**)((char*)vt + 0x10)))(ldbuf, src, &levelId);
        ((void (*)(void*, int))VC_CALL(0xd9e220u))(ldbuf, mode);
        ((void (*)(void*, const void*, const void*))(*(void**)((char*)vt + 0x14)))(src, &levelId, ldbuf);
        unsigned char* vb = *(unsigned char**)(ldbuf + 0x88);
        unsigned char* ve = *(unsigned char**)(ldbuf + 0x8c);
        if (vb) { for (unsigned char* p = vb; p < ve; p += 4) vc_delstr((void**)p); if (Op_delete) Op_delete(vb); }
        ((void (*)(void*))VC_CALL(0xa9a2b8u))(ldbuf + 0x3c);
        vc_delstr((void**)ldbuf);
    }
    vc_delstr(&levelId);
    void* o = vc_opts();
    if (o) *(int*)((char*)o + 0x88) = diff & 3;
}

static void ui_build_options(int W, int H) {
    float fw = (float)W, fh = (float)H, cx = 80.0f, cw = fw * 0.40f;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(80.0f, 96.0f, vc_tr("options.title"), 48.0f, 0xFFF2F2FFu);
    for (int t = 0; t < 3; t++) {
        float bx = 80.0f + t * 212.0f;
        draw_rect(bx, 140.0f, 200.0f, 56.0f, (t == g_tab) ? 0xFF7A3CFFu : 0xFF1B1B26u);
        draw_text(bx + 24.0f, 177.0f, vc_tr(TAB_NAMES[t]), 28.0f, 0xFFF0F0FFu);
    }
    int count = 0;
    for (int i = 0; i < N_OPT; i++) if (g_opt[i].tab == g_tab) count++;
    float rows_top = 210.0f, voltar_y = fh - 100.0f;
    float step = (voltar_y - 30.0f - rows_top) / (count > 0 ? count : 1);
    if (step > 92.0f) step = 92.0f;
    float cs = step / 84.0f;
    if (cs > 1.0f) cs = 1.0f;
    float y = rows_top + step * 0.5f;
    for (int i = 0; i < N_OPT; i++) {
        if (g_opt[i].tab != g_tab) continue;
        VOpt* c = &g_opt[i];
        float v = opt_disp(i);
        draw_text_fit(cx, y - 7.0f * cs, vc_tr(c->label), 27.0f * cs, cw + 20.0f, 0xFFEAEAF6u);
        if (c->type == T_TGL) {
            int on = (int)(v + 0.5f);
            draw_rect(cx + cw + 40.0f, y - 21.0f * cs, 118.0f, 40.0f * cs, on ? 0xFF7A3CFFu : 0xFF2A2A3Au);
            draw_text(cx + cw + 40.0f + (on ? 34.0f : 28.0f), y + 5.0f * cs, on ? "ON" : "OFF", 24.0f * cs, 0xFFF0F0FFu);
        } else {
            float t = (v - c->lo) / (c->hi - c->lo);
            if (t < 0) t = 0;
            if (t > 1) t = 1;
            draw_rect(cx, y + 5.0f * cs, cw, 8.0f * cs, 0xFF2A2A3Au);
            draw_rect(cx, y + 5.0f * cs, cw * t, 8.0f * cs, 0xFF7A3CFFu);
            draw_rect(cx + cw * t - 11.0f * cs, y - 7.0f * cs, 22.0f * cs, 32.0f * cs, 0xFFF0F0FFu);
            char buf[28];
            if (c->type == T_SLN) {
                int idx = (int)(v + 0.5f);
                if (idx < 0) idx = 0;
                if (idx > (int)(c->hi + 0.5f)) idx = (int)(c->hi + 0.5f);
                snprintf(buf, sizeof buf, "%s", vc_tr(c->names[idx]));
            } else if (c->type == T_SLI) snprintf(buf, sizeof buf, "%d", (int)(v + 0.5f));
            else if (c->hi <= 1.5f) snprintf(buf, sizeof buf, "%.2f", v);
            else snprintf(buf, sizeof buf, "%.0f", v);
            draw_text(cx + cw + 40.0f, y + 5.0f * cs, buf, 24.0f * cs, 0xFF9A7ACFu);
        }
        y += step;
    }
    draw_rect(80.0f, voltar_y, 240.0f, 66.0f, 0xFF1B1B26u);
    draw_rect(80.0f, voltar_y, 5.0f, 66.0f, 0xFF7A3CFFu);
    draw_text(110.0f, voltar_y + 44.0f, vc_tr("gui.back"), 32.0f, 0xFFEAEAF6u);
}

static int hitTestOptions(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH, cx = 80.0f, cw = fw * 0.40f;
    for (int t = 0; t < 3; t++) {
        float bx = 80.0f + t * 212.0f;
        if (x >= bx && x <= bx + 200.0f && y >= 140.0f && y <= 196.0f) return 100 + t;
    }
    int count = 0;
    for (int i = 0; i < N_OPT; i++) if (g_opt[i].tab == g_tab) count++;
    float rows_top = 210.0f, voltar_y = fh - 100.0f;
    float step = (voltar_y - 30.0f - rows_top) / (count > 0 ? count : 1);
    if (step > 92.0f) step = 92.0f;
    float cy = rows_top + step * 0.5f, hr = step * 0.45f;
    for (int i = 0; i < N_OPT; i++) {
        if (g_opt[i].tab != g_tab) continue;
        if (g_opt[i].type == T_TGL) {
            if (x >= cx + cw + 40.0f && x <= cx + cw + 158.0f && y >= cy - hr && y <= cy + hr) return i;
        } else {
            if (x >= cx - 20.0f && x <= cx + cw + 20.0f && y >= cy - hr && y <= cy + hr) return i;
        }
        cy += step;
    }
    if (x >= 80.0f && x <= 320.0f && y >= voltar_y && y <= voltar_y + 66.0f) return -10;
    return -1;
}

static const char* PAUSE_BTN[3] = { "menu.returnToGame", "pauseScreen.options", "pauseScreen.quit" };

static void ui_build_pause(int W, int H) {
    float fw = (float)W, fh = (float)H, cx = fw * 0.5f;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060609u);
    draw_text_c(cx, fh * 0.24f, "VOID CLIENT", 44.0f, 0xFFF2F2FFu);
    draw_rect(cx - 72.0f, fh * 0.24f + 16.0f, 144.0f, 3.0f, 0xFF7A3CFFu);
    float pw = 640.0f, px = cx - pw * 0.5f, ph = 70.0f, gap = 22.0f;
    float py = fh * 0.40f;
    for (int i = 0; i < 3; i++) {
        unsigned bg = (i == g_press_region) ? 0xE62A2A3Au : 0xD214141Eu;
        draw_rect(px, py, pw, ph, bg);
        draw_rect(px, py, 5.0f, ph, 0xFF7A3CFFu);
        draw_text_fit_c(cx + 2.5f, py + ph * 0.5f + 10.0f, vc_tr(PAUSE_BTN[i]), 30.0f, pw - 60.0f, 0xFFEAEAF6u);
        py += ph + gap;
    }
}

static int hitTestPause(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH, cx = fw * 0.5f;
    float pw = 640.0f, px = cx - pw * 0.5f, ph = 70.0f, gap = 22.0f;
    float py = fh * 0.40f;
    for (int i = 0; i < 3; i++) {
        if (x >= px && x <= px + pw && y >= py && y <= py + ph) return i;
        py += ph + gap;
    }
    return R_NONE;
}

static void ui_build_worlds(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(80.0f, 96.0f, vc_tr("menu.singleplayer"), 48.0f, 0xFFF2F2FFu);
    draw_rect(80.0f, 120.0f, 320.0f, 4.0f, 0xFF7A3CFFu);
    float rows_top = 172.0f, voltar_y = fh - 100.0f, rh = 100.0f;
    int vis = (int)((voltar_y - 20.0f - rows_top) / rh);
    if (g_worldCount == 0) draw_text(84.0f, rows_top + 48.0f, vc_tr("Nenhum mundo local"), 30.0f, 0xFF8A8AA8u);
    for (int i = 0; i < g_worldCount && i < vis; i++) {
        float y = rows_top + i * rh;
        draw_rect(80.0f, y, fw - 160.0f, rh - 16.0f, (i == g_press_region) ? 0xEE2A2A3Au : 0xCC14141Eu);
        draw_rect(80.0f, y, 6.0f, rh - 16.0f, 0xFF7A3CFFu);
        draw_text(116.0f, y + (rh - 16.0f) * 0.5f + 11.0f, g_worldNames[i], 32.0f, 0xFFEAEAF6u);
        float ex = fw - 80.0f - 150.0f;
        draw_rect(ex, y + 17.0f, 140.0f, 50.0f, (g_press_region == 1000 + i) ? 0xFF3A2A5Au : 0xFF262636u);
        draw_text(ex + 26.0f, y + 50.0f, vc_tr("selectServer.edit"), 24.0f, 0xFF9A7ACFu);
    }
    if (g_worldCount > vis) { char b[24]; snprintf(b, sizeof b, "+%d mais", g_worldCount - vis); draw_text(84.0f, voltar_y - 14.0f, b, 24.0f, 0xFF8A8AA8u); }
    draw_rect(80.0f, voltar_y, 240.0f, 66.0f, 0xFF1B1B26u);
    draw_rect(80.0f, voltar_y, 5.0f, 66.0f, 0xFF7A3CFFu);
    draw_text(110.0f, voltar_y + 44.0f, vc_tr("gui.back"), 32.0f, 0xFFEAEAF6u);
    float ax = fw - 380.0f;
    draw_rect(ax, voltar_y, 300.0f, 66.0f, 0xFF2A1A4Au);
    draw_rect(ax, voltar_y, 5.0f, 66.0f, 0xFF7A3CFFu);
    char cmb[48]; snprintf(cmb, sizeof cmb, "+ %s", vc_tr("selectWorld.newWorld"));
    draw_text_fit(ax + 30.0f, voltar_y + 44.0f, cmb, 30.0f, 250.0f, 0xFFEAEAF6u);
}

static void ui_build_servers(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(80.0f, 96.0f, vc_tr("menu.multiplayer"), 48.0f, 0xFFF2F2FFu);
    draw_rect(80.0f, 120.0f, 300.0f, 4.0f, 0xFF7A3CFFu);
    float rows_top = 172.0f, voltar_y = fh - 100.0f, rh = 120.0f;
    int vis = (int)((voltar_y - 20.0f - rows_top) / rh);
    if (g_serverCount == 0) draw_text(84.0f, rows_top + 48.0f, vc_tr("Nenhum servidor salvo"), 30.0f, 0xFF8A8AA8u);
    for (int i = 0; i < g_serverCount && i < vis; i++) {
        float y = rows_top + i * rh, rb = rh - 16.0f;
        VcPing* p = ping_for(g_servers[i].id);
        draw_rect(80.0f, y, fw - 160.0f, rb, (i == g_press_region) ? 0xEE2A2A3Au : 0xCC14141Eu);
        draw_rect(80.0f, y, 6.0f, rb, 0xFF7A3CFFu);
        unsigned dotc = (p && p->pingMs >= 0) ? 0xFF3CCB5Au : (p && p->pingMs == -2) ? 0xFFCB4A4Au : 0xFF666677u;
        draw_rect(104.0f, y + 26.0f, 16.0f, 16.0f, dotc);
        draw_text(136.0f, y + 40.0f, g_servers[i].name, 30.0f, 0xFFEAEAF6u);
        char hb[88]; snprintf(hb, sizeof hb, "%s:%d", g_servers[i].host, g_servers[i].port);
        draw_text(136.0f, y + 72.0f, hb, 22.0f, 0xFF8A8AA8u);
        if (p && p->online && p->motd[0]) draw_text_mc(136.0f, y + 100.0f, p->motd, 22.0f, 0xFFBFC2D8u);
        float ex = fw - 80.0f - 150.0f;
        draw_rect(ex, y + 14.0f, 140.0f, 46.0f, (g_press_region == 1000 + i) ? 0xFF3A2A5Au : 0xFF262636u);
        draw_text(ex + 26.0f, y + 44.0f, vc_tr("selectServer.edit"), 24.0f, 0xFF9A7ACFu);
        float sx = fw - 80.0f - 150.0f - 240.0f;
        if (p && p->pingMs >= 0) {
            char pb[48];
            if (p->maxp >= 0) snprintf(pb, sizeof pb, "%d/%d online", p->players, p->maxp);
            else snprintf(pb, sizeof pb, "%d online", p->players);
            draw_text(sx, y + 44.0f, pb, 24.0f, 0xFF3CCB5Au);
            char pm[24]; snprintf(pm, sizeof pm, "ping %d ms", p->pingMs);
            draw_text(sx, y + 78.0f, pm, 22.0f, 0xFF9A7ACFu);
        } else if (p && p->pingMs == -2) {
            draw_text(sx, y + 44.0f, "Offline", 24.0f, 0xFFCB6A6Au);
        } else {
            draw_text(sx, y + 44.0f, "...", 24.0f, 0xFF8A8AA8u);
        }
    }
    if (g_serverCount > vis) { char b[24]; snprintf(b, sizeof b, "+%d mais", g_serverCount - vis); draw_text(84.0f, voltar_y - 14.0f, b, 24.0f, 0xFF8A8AA8u); }
    draw_rect(80.0f, voltar_y, 240.0f, 66.0f, 0xFF1B1B26u);
    draw_rect(80.0f, voltar_y, 5.0f, 66.0f, 0xFF7A3CFFu);
    draw_text(110.0f, voltar_y + 44.0f, vc_tr("gui.back"), 32.0f, 0xFFEAEAF6u);
    float ax = fw - 380.0f;
    draw_rect(ax, voltar_y, 300.0f, 66.0f, 0xFF2A1A4Au);
    draw_rect(ax, voltar_y, 5.0f, 66.0f, 0xFF7A3CFFu);
    char asb[48]; snprintf(asb, sizeof asb, "+ %s", vc_tr("selectServer.add"));
    draw_text_fit(ax + 30.0f, voltar_y + 44.0f, asb, 30.0f, 250.0f, 0xFFEAEAF6u);
}

static void ui_build_loading(int W, int H) {
    float fw = (float)W, fh = (float)H, cx = fw * 0.5f;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text_c(cx, fh * 0.40f, "VOID CLIENT", 52.0f, 0xFFF2F2FFu);
    draw_rect(cx - 90.0f, fh * 0.40f + 22.0f, 180.0f, 4.0f, 0xFF7A3CFFu);
    if (g_loadMsg[0]) draw_text_c(cx, fh * 0.50f, g_loadMsg, 26.0f, 0xFF9A7ACFu);
    float bw = fw * 0.42f, bx = cx - bw * 0.5f, by = fh * 0.58f, bh = 18.0f;
    draw_rect(bx - 2.0f, by - 2.0f, bw + 4.0f, bh + 4.0f, 0xFF2A2A3Au);
    draw_rect(bx, by, bw, bh, 0xFF14141Eu);
    draw_rect(bx, by, bw * ((float)g_loadPct / 100.0f), bh, 0xFF7A3CFFu);
    char b[16]; snprintf(b, sizeof b, "%d%%", g_loadPct);
    draw_text_c(cx, by + 52.0f, b, 26.0f, 0xFFEAEAF6u);
}

static int hitTestWorlds(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH, voltar_y = fh - 100.0f, rows_top = 172.0f, rh = 100.0f;
    int vis = (int)((voltar_y - 20.0f - rows_top) / rh);
    for (int i = 0; i < g_worldCount && i < vis; i++) {
        float ry = rows_top + i * rh;
        if (y >= ry && y <= ry + rh - 16.0f) {
            float ex = fw - 80.0f - 150.0f;
            if (x >= ex && x <= ex + 140.0f) return 1000 + i;
            if (x >= 80.0f && x <= fw - 80.0f) return i;
        }
    }
    if (y >= voltar_y && y <= voltar_y + 66.0f) {
        if (x >= 80.0f && x <= 320.0f) return -10;
        if (x >= fw - 380.0f && x <= fw - 80.0f) return -11;
    }
    return R_NONE;
}

static int hitTestServers(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH, voltar_y = fh - 100.0f, rows_top = 172.0f, rh = 120.0f;
    int vis = (int)((voltar_y - 20.0f - rows_top) / rh);
    for (int i = 0; i < g_serverCount && i < vis; i++) {
        float ry = rows_top + i * rh;
        if (y >= ry && y <= ry + rh - 16.0f) {
            float ex = fw - 80.0f - 150.0f;
            if (x >= ex && x <= ex + 140.0f) return 1000 + i;
            if (x >= 80.0f && x <= fw - 80.0f) return i;
        }
    }
    if (y >= voltar_y && y <= voltar_y + 66.0f) {
        if (x >= 80.0f && x <= 320.0f) return -10;
        if (x >= fw - 380.0f && x <= fw - 80.0f) return -11;
    }
    return R_NONE;
}

static void ui_build_createworld(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    int editing = (g_editWorldIdx >= 0);
    draw_text(80.0f, 96.0f, editing ? vc_tr("Editar Mundo") : vc_tr("selectWorld.newWorld"), 48.0f, 0xFFF2F2FFu);
    draw_rect(80.0f, 120.0f, 300.0f, 4.0f, 0xFF7A3CFFu);
    float fx = 80.0f, fw2 = fw - 160.0f, top = 158.0f, by = fh - 140.0f;
    float step = (by - 20.0f - top) / 5.0f;
    if (step > 98.0f) step = 98.0f;
    float rh = step - 12.0f;
    float vx = fx + fw2 - 360.0f, vw = 340.0f;
    float y0 = top;
    draw_rect(fx, y0, fw2, rh, (g_activeField == 1) ? 0xFF2A2A3Au : 0xCC14141Eu);
    draw_rect(fx, y0, 6.0f, rh, 0xFF7A3CFFu);
    draw_text(fx + 28.0f, y0 + 30.0f, vc_tr("selectWorld.enterName"), 20.0f, 0xFF8A8AA8u);
    draw_text(fx + 28.0f, y0 + rh - 18.0f, g_fields[0][0] ? g_fields[0] : "...", 28.0f, 0xFFEAEAF6u);
    float y1 = top + step;
    draw_rect(fx, y1, fw2, rh, (g_activeField == 2) ? 0xFF2A2A3Au : 0xCC14141Eu);
    draw_rect(fx, y1, 6.0f, rh, 0xFF7A3CFFu);
    draw_text(fx + 28.0f, y1 + 30.0f, vc_tr("createWorldScreen.levelSeed"), 20.0f, 0xFF8A8AA8u);
    draw_text(fx + 28.0f, y1 + rh - 18.0f, g_fields[1][0] ? g_fields[1] : "...", 28.0f, 0xFFEAEAF6u);
    const char* selLabel[3] = { "createWorldScreen.gameMode", "createWorldScreen.worldType", "options.difficulty" };
    const char* selVal[3] = { CW_MODE_NAMES[g_cwMode], CW_TYPE_NAMES[g_cwType], DIFF_NAMES[g_cwDiff] };
    int selCode[3] = { -30, -31, -32 };
    for (int i = 0; i < 3; i++) {
        float y = top + (i + 2) * step;
        draw_rect(fx, y, fw2, rh, 0xCC14141Eu);
        draw_rect(fx, y, 6.0f, rh, 0xFF7A3CFFu);
        draw_text(fx + 28.0f, y + rh * 0.5f + 9.0f, vc_tr(selLabel[i]), 24.0f, 0xFFEAEAF6u);
        int pressed = (g_press_region == selCode[i]);
        draw_rect(vx, y + 14.0f, vw, rh - 28.0f, pressed ? 0xFF3A2A5Au : 0xFF262636u);
        draw_text_c(vx + vw * 0.5f, y + rh * 0.5f + 8.0f, vc_tr(selVal[i]), 24.0f, 0xFF9A7ACFu);
    }
    draw_rect(fx, by, 300.0f, 76.0f, (g_press_region == -20) ? 0xFF3A2A5Au : 0xFF2A1A4Au);
    draw_rect(fx, by, 6.0f, 76.0f, 0xFF7A3CFFu);
    draw_text_fit(fx + 40.0f, by + 50.0f, editing ? vc_tr("controllerLayoutScreen.save") : vc_tr("gui.done"), 32.0f, 220.0f, 0xFFEAEAF6u);
    float vxb = fw - 380.0f;
    draw_rect(vxb, by, 300.0f, 76.0f, (g_press_region == -10) ? 0xFF2A2A3Au : 0xFF1B1B26u);
    draw_text(vxb + 40.0f, by + 50.0f, vc_tr("gui.back"), 32.0f, 0xFFEAEAF6u);
}

static int hitTestCreateWorld(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH;
    float fx = 80.0f, fw2 = fw - 160.0f, top = 158.0f, by = fh - 140.0f;
    float step = (by - 20.0f - top) / 5.0f;
    if (step > 98.0f) step = 98.0f;
    float rh = step - 12.0f;
    if (x >= fx && x <= fx + fw2) {
        for (int i = 0; i < 5; i++) {
            float ry = top + i * step;
            if (y >= ry && y <= ry + rh) {
                if (i == 0) return 1;
                if (i == 1) return 2;
                if (i == 2) return -30;
                if (i == 3) return -31;
                return -32;
            }
        }
    }
    if (y >= by && y <= by + 76.0f) {
        if (x >= fx && x <= fx + 300.0f) return -20;
        if (x >= fw - 380.0f && x <= fw - 80.0f) return -10;
    }
    return R_NONE;
}

static void ui_build_srvform(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(80.0f, 96.0f, g_editServerId ? vc_tr("EDITAR SERVIDOR") : vc_tr("ADICIONAR SERVIDOR"), 44.0f, 0xFFF2F2FFu);
    draw_rect(80.0f, 120.0f, 360.0f, 4.0f, 0xFF7A3CFFu);
    static const char* labs[3] = { "Nome", "Endereco / IP", "Porta" };
    float fx = 80.0f, fw2 = fw - 160.0f, fy = 180.0f, fh2 = 88.0f, gap = 18.0f;
    for (int i = 0; i < 3; i++) {
        float y = fy + i * (fh2 + gap);
        draw_rect(fx, y, fw2, fh2, (g_activeField == i + 1) ? 0xFF2A2A3Au : 0xCC14141Eu);
        draw_rect(fx, y, 6.0f, fh2, 0xFF7A3CFFu);
        draw_text(fx + 28.0f, y + 32.0f, labs[i], 20.0f, 0xFF8A8AA8u);
        draw_text(fx + 28.0f, y + 70.0f, g_fields[i][0] ? g_fields[i] : "...", 28.0f, 0xFFEAEAF6u);
    }
    if (g_srvFormErr) draw_text(fx + 4.0f, fy + 3.0f * (fh2 + gap) + 30.0f, vc_tr("Informe ao menos o Endereco / IP"), 24.0f, 0xFFCB6A6Au);
    float by = fh - 140.0f;
    draw_rect(fx, by, 300.0f, 72.0f, (g_press_region == -20) ? 0xFF3A2A5Au : 0xFF2A1A4Au);
    draw_rect(fx, by, 6.0f, 72.0f, 0xFF7A3CFFu);
    draw_text(fx + 40.0f, by + 48.0f, vc_tr("controllerLayoutScreen.save"), 30.0f, 0xFFEAEAF6u);
    if (g_editServerId) {
        float ex = fw * 0.5f - 150.0f;
        draw_rect(ex, by, 300.0f, 72.0f, (g_press_region == -30) ? 0xFF5A2A2Au : 0xFF3A1E1Eu);
        draw_rect(ex, by, 6.0f, 72.0f, 0xFFCB4A4Au);
        draw_text(ex + 40.0f, by + 48.0f, vc_tr("selectServer.delete"), 30.0f, 0xFFE89A9Au);
    }
    float vx = fw - 380.0f;
    draw_rect(vx, by, 300.0f, 72.0f, (g_press_region == -10) ? 0xFF2A2A3Au : 0xFF1B1B26u);
    draw_text(vx + 40.0f, by + 48.0f, vc_tr("gui.back"), 30.0f, 0xFFEAEAF6u);
}

static int hitTestSrvForm(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH;
    float fx = 80.0f, fw2 = fw - 160.0f, fy = 180.0f, fh2 = 88.0f, gap = 18.0f;
    for (int i = 0; i < 3; i++) {
        float yy = fy + i * (fh2 + gap);
        if (x >= fx && x <= fx + fw2 && y >= yy && y <= yy + fh2) return i + 1;
    }
    float by = fh - 140.0f;
    if (y >= by && y <= by + 72.0f) {
        if (x >= fx && x <= fx + 300.0f) return -20;
        if (g_editServerId) { float ex = fw * 0.5f - 150.0f; if (x >= ex && x <= ex + 300.0f) return -30; }
        if (x >= fw - 380.0f && x <= fw - 80.0f) return -10;
    }
    return R_NONE;
}

static void vc_cache_langs() {
    g_langCount = 0; g_langCur = -1;
    if (!g_slide) return;
    unsigned char* begin = *(unsigned char**)((uintptr_t)g_slide + 0x16b63dcu);
    unsigned char* end = *(unsigned char**)((uintptr_t)g_slide + 0x16b63dcu + 4u);
    if (!begin || !end || end < begin) return;
    char cur[16] = {0};
    void* opts = vc_opts();
    if (opts) { const char* c = str_data((char*)opts + 0x84); if (c) snprintf(cur, sizeof cur, "%s", c); }
    void* key; vc_mkstr(&key, "language.name");
    char emptyArgs[12] = {0};
    int n = (int)((end - begin) / 4);
    for (int i = 0; i < n && g_langCount < 64; i++) {
        void* loc = *(void**)(begin + i * 4);
        if (!loc) continue;
        void* codeStr = nullptr;
        ((void (*)(void*, void*))VC_CALL(0xa983e0u))(&codeStr, loc);
        const char* cc = str_data(&codeStr);
        snprintf(g_langCode[g_langCount], 16, "%s", cc ? cc : "?");
        if (cur[0] && cc && strcmp(cc, cur) == 0) g_langCur = g_langCount;
        vc_delstr(&codeStr);
        void* nameStr; vc_mkstr(&nameStr, "");
        ((void (*)(void*, const void*, void*, const void*))VC_CALL(0xa996a8u))(loc, &key, &nameStr, &emptyArgs);
        const char* nm = str_data(&nameStr);
        if (nm && nm[0] && strcmp(nm, "language.name") != 0) snprintf(g_langName[g_langCount], 64, "%s", nm);
        else snprintf(g_langName[g_langCount], 64, "%s", g_langCode[g_langCount]);
        vc_delstr(&nameStr);
        g_langCount++;
    }
    vc_delstr(&key);
}
static void vc_set_lang(int i) {
    if (i < 0 || i >= g_langCount || !g_mc) return;
    void* opts = vc_opts();
    if (!opts) return;
    void* code; vc_mkstr(&code, g_langCode[i]);
    ((void (*)(void*, const void*))VC_CALL(0x928ddcu))(opts, &code);
    vc_delstr(&code);
    ((void (*)(void*))VC_CALL(0x6c1660u))(g_mc);
    ((void (*)(void*))VC_CALL(0x927c74u))(opts);
    g_langCur = i;
}
static void ui_build_langs(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(80.0f, 96.0f, vc_tr("options.language"), 48.0f, 0xFFF2F2FFu);
    draw_rect(80.0f, 120.0f, 200.0f, 4.0f, 0xFF7A3CFFu);
    float top = 168.0f, voltar_y = fh - 100.0f, rh = 78.0f;
    int cols = (g_langCount > 22) ? 3 : 2;
    float gap = 20.0f, colW = (fw - 160.0f - gap * (cols - 1)) / cols;
    int maxRows = (int)((voltar_y - 20.0f - top) / rh);
    int maxVis = maxRows * cols;
    if (g_langCount == 0) draw_text(84.0f, top + 48.0f, vc_tr("Nenhum idioma"), 30.0f, 0xFF8A8AA8u);
    for (int i = 0; i < g_langCount && i < maxVis; i++) {
        int c = i % cols, r = i / cols;
        float x = 80.0f + c * (colW + gap), y = top + r * rh;
        int sel = (i == g_langCur);
        draw_rect(x, y, colW, rh - 12.0f, (g_press_region == i) ? 0xEE2A2A3Au : sel ? 0xCC2A1A4Au : 0xCC14141Eu);
        draw_rect(x, y, 6.0f, rh - 12.0f, sel ? 0xFF3CCB5Au : 0xFF7A3CFFu);
        draw_text(x + 22.0f, y + 30.0f, g_langName[i], 23.0f, sel ? 0xFF9AE8B0u : 0xFFEAEAF6u);
        draw_text(x + 22.0f, y + 56.0f, g_langCode[i], 18.0f, 0xFF8A8AA8u);
    }
    if (g_langCount > maxVis) { char b[24]; snprintf(b, sizeof b, "+%d mais", g_langCount - maxVis); draw_text(84.0f, voltar_y - 14.0f, b, 22.0f, 0xFF8A8AA8u); }
    draw_rect(80.0f, voltar_y, 240.0f, 66.0f, 0xFF1B1B26u);
    draw_rect(80.0f, voltar_y, 5.0f, 66.0f, 0xFF7A3CFFu);
    draw_text(110.0f, voltar_y + 44.0f, vc_tr("gui.back"), 32.0f, 0xFFEAEAF6u);
}
static int hitTestLangs(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH;
    float top = 168.0f, voltar_y = fh - 100.0f, rh = 78.0f;
    int cols = (g_langCount > 22) ? 3 : 2;
    float gap = 20.0f, colW = (fw - 160.0f - gap * (cols - 1)) / cols;
    int maxRows = (int)((voltar_y - 20.0f - top) / rh);
    int maxVis = maxRows * cols;
    for (int i = 0; i < g_langCount && i < maxVis; i++) {
        int c = i % cols, r = i / cols;
        float cxp = 80.0f + c * (colW + gap), cyp = top + r * rh;
        if (x >= cxp && x <= cxp + colW && y >= cyp && y <= cyp + rh - 12.0f) return i;
    }
    if (x >= 80.0f && x <= 320.0f && y >= voltar_y && y <= voltar_y + 66.0f) return -10;
    return R_NONE;
}

static void ui_build_editworld(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_round(0, 0, fw, fh, 0.0f, 0x99060610u);
    draw_text(80.0f, 96.0f, vc_tr("EDITAR MUNDO"), 48.0f, 0xFFF2F2FFu);
    draw_rect(80.0f, 120.0f, 320.0f, 4.0f, 0xFF7A3CFFu);
    float fx = 80.0f, fw2 = fw - 160.0f, top = 168.0f, by = fh - 140.0f;
    float step = (by - 20.0f - top) / 3.0f;
    if (step > 110.0f) step = 110.0f;
    float rh = step - 14.0f;
    float vx = fx + fw2 - 360.0f, vw = 340.0f;
    float y0 = top;
    draw_rect(fx, y0, fw2, rh, (g_activeField == 1) ? 0xFF2A2A3Au : 0xCC14141Eu);
    draw_rect(fx, y0, 6.0f, rh, 0xFF7A3CFFu);
    draw_text(fx + 28.0f, y0 + 30.0f, vc_tr("selectWorld.enterName"), 20.0f, 0xFF8A8AA8u);
    draw_text(fx + 28.0f, y0 + rh - 18.0f, g_fields[0][0] ? g_fields[0] : "...", 28.0f, 0xFFEAEAF6u);
    const char* selLabel[2] = { "createWorldScreen.gameMode", "options.difficulty" };
    const char* selVal[2] = { CW_MODE_NAMES[g_cwMode], DIFF_NAMES[g_cwDiff] };
    int selCode[2] = { -30, -32 };
    for (int i = 0; i < 2; i++) {
        float y = top + (i + 1) * step;
        draw_rect(fx, y, fw2, rh, 0xCC14141Eu);
        draw_rect(fx, y, 6.0f, rh, 0xFF7A3CFFu);
        draw_text(fx + 28.0f, y + rh * 0.5f + 9.0f, vc_tr(selLabel[i]), 24.0f, 0xFFEAEAF6u);
        int pressed = (g_press_region == selCode[i]);
        draw_rect(vx, y + 14.0f, vw, rh - 28.0f, pressed ? 0xFF3A2A5Au : 0xFF262636u);
        draw_text_c(vx + vw * 0.5f, y + rh * 0.5f + 8.0f, vc_tr(selVal[i]), 24.0f, 0xFF9A7ACFu);
    }
    draw_rect(fx, by, 300.0f, 76.0f, (g_press_region == -20) ? 0xFF3A2A5Au : 0xFF2A1A4Au);
    draw_rect(fx, by, 6.0f, 76.0f, 0xFF7A3CFFu);
    draw_text(fx + 40.0f, by + 50.0f, vc_tr("controllerLayoutScreen.save"), 32.0f, 0xFFEAEAF6u);
    float vxb = fw - 380.0f;
    draw_rect(vxb, by, 300.0f, 76.0f, (g_press_region == -10) ? 0xFF2A2A3Au : 0xFF1B1B26u);
    draw_text(vxb + 40.0f, by + 50.0f, vc_tr("gui.back"), 32.0f, 0xFFEAEAF6u);
}
static int hitTestEditWorld(float x, float y) {
    float fw = (float)g_lastW, fh = (float)g_lastH;
    float fx = 80.0f, fw2 = fw - 160.0f, top = 168.0f, by = fh - 140.0f;
    float step = (by - 20.0f - top) / 3.0f;
    if (step > 110.0f) step = 110.0f;
    float rh = step - 14.0f;
    if (x >= fx && x <= fx + fw2) {
        for (int i = 0; i < 3; i++) {
            float ry = top + i * step;
            if (y >= ry && y <= ry + rh) {
                if (i == 0) return 1;
                if (i == 1) return -30;
                return -32;
            }
        }
    }
    if (y >= by && y <= by + 76.0f) {
        if (x >= fx && x <= fx + 300.0f) return -20;
        if (x >= fw - 380.0f && x <= fw - 80.0f) return -10;
    }
    return R_NONE;
}

static void my_update(void* mc) {
    g_mc = mc;
    vc_modules_tick(mc);
    if (g_perspReq) {                                                   // perspectiva: cicla a visao
        if (g_perspSkip) { void* po = *(void**)((char*)mc + 0x13c);     // pular a 3a costas: so 1a<->3a frontal (opts+0x90)
                           if (po) { int* pp = (int*)((char*)po + 0x90); *pp = (*pp == 0) ? 2 : 0; } }
        else ((void(*)(void*))VC_CALL(0x6c210cu))(mc);                  // ciclo nativo completo (F5: 1a->3a->frontal)
        g_perspReq = 0;
    }
    int own = onMenu(mc) || onPauseScreen(mc);
    { int isM = onMenu(mc); if (isM && !g_wasMenu) g_menuT0 = vc_now_ms(); g_wasMenu = isM; }
    g_uiAtiva = own;
    if (g_screen != 0 && !own) { vc_modtext_commit(); if (g_activeField) vc_kb_close(); g_screen = 0; g_tab = 0; vc_worlds_close(); }
    if (g_backReq) {
        g_backReq = 0;
        if (own) {
            if (g_activeField) vc_kb_close();
            else if (g_screen == 1) { ((void(*)(void*))VC_CALL(0x927c74u))(vc_opts()); g_screen = 0; g_tab = 0; }
            else if (g_screen == 2) { vc_worlds_close(); g_screen = 0; }
            else if (g_screen == 3) { g_screen = 0; }
            else if (g_screen == 4) { g_screen = 2; }
            else if (g_screen == 5) { g_screen = 3; }
            else if (g_screen == 6) { g_screen = 0; }
            else if (g_screen == 7) { g_editWorldIdx = -1; g_screen = 2; }
            else if (g_screen == 8) { g_screen = 0; }
            else if (g_screen == 9) { vc_modtext_commit(); g_screen = 8; }
            else if (onPauseScreen(mc)) vc_resume(mc);
        }
    }
    if (g_submitReq) {
        g_submitReq = 0;
        if (g_modTextEdit >= 0) { vc_modtext_commit(); vc_kb_close(); }
        else {
            int nf = g_activeField;
            if (nf >= 1 && nf < g_fieldCount) vc_kb_open(nf);
            else vc_kb_close();
        }
    }
    {
        float gs = vc_game_guiscale();
        float m = gs / 4.6f;
        if (m < 0.5f) m = 0.5f;
        if (m > 1.8f) m = 1.8f;
        g_optMult = m;
    }
    if (onProgress(mc)) {
        void* pscr = topScreen(mc);
        void* pctrl = pscr ? *(void**)((char*)pscr + 0x80) : nullptr;
        if (pctrl) {
            int state = ((int (*)(void*))VC_CALL(0x7a7f60u))(pctrl);
            if (state == 0x10) g_loadPct = 100;
            else {
                void* model = *(void**)((char*)pctrl + 0x148);
                void* lp = model ? ((void* (*)(void*))VC_CALL(0x8392d0u))(model) : nullptr;
                float p = lp ? ((float (*)(void*))VC_CALL(0x93e5dcu))(lp) : 0.0f;
                int pct = (int)(p * 100.0f);
                if (pct < 0) pct = 0;
                if (pct > 100) pct = 100;
                g_loadPct = pct;
            }
            void* ms = nullptr;
            ((void (*)(void*, void*))VC_CALL(0x7a87c8u))(&ms, pctrl);
            const char* s = str_data(&ms);
            snprintf(g_loadMsg, sizeof g_loadMsg, "%s", s ? s : "");
            vc_delstr(&ms);
        }
    }
    if (g_screen == 2) vc_cache_worlds();
    else if (g_screen == 3) { vc_list_servers(); vc_ping_open(); vc_ping_tick(); }
    else vc_ping_close();
    if (g_screen == 1 && g_drag >= 0) {
        float x = *(float*)((char*)mc + 0x230) * ((1080.0f / (float)g_pixelH) / g_optMult);
        float cw = (float)g_lastW * 0.40f;
        float t = (x - 80.0f) / cw;
        if (t < 0) t = 0;
        if (t > 1) t = 1;
        g_dragVal = g_opt[g_drag].lo + t * (g_opt[g_drag].hi - g_opt[g_drag].lo);
        opt_preview(g_drag, g_dragVal);
    }
    void* scr = topScreen(mc);
    unsigned v = scr ? (unsigned)((uintptr_t)*(void**)scr - g_slide) : 0;
    if (v != g_lastVptr) {
        g_lastVptr = v;
        unsigned cv = 0;
        if (scr && v == 0x160681cu) { void* c = *(void**)((char*)scr + 0x80); if (c) cv = (unsigned)((uintptr_t)*(void**)c - g_slide); }
        LOG("SCREEN vptr=0x%x ctrl=0x%x ui=%d px=%dx%d", v, cv, g_uiAtiva, g_lastW, g_lastH);
    }
    orig_update(mc);
}

static void h_svLoc(void* self, short x, short y) {
    if (g_uiAtiva) return;
    orig_svLoc(self, x, y);
}

static bool my_handleBack(void* mc, bool down) {
    if (g_uiAtiva) { g_backReq = 1; return true; }
    return orig_handleBack(mc, down);
}

static void my_nativeBack(void* env, void* thiz) {
    if (g_uiAtiva) { g_backReq = 1; LOG("JNIback ui=%d g_screen=%d", g_uiAtiva, g_screen); return; }
    orig_nativeBack(env, thiz);
}

static bool my_btnEvt(void* self, short id, int st) {
    if (g_uiAtiva) { if (id == 123) g_backReq = 1; return true; }
    return orig_btnEvt(self, id, st);
}

static void my_svRender(void* self, void* ctx) {
    void* ctrl = *(void**)((char*)self + 0x80);
    if (ctrl) {
        void* cvp = *(void**)ctrl;
        if (cvp == (void*)(g_slide + 0x160323cu) || cvp == (void*)(g_slide + 0x1602ce0u)) return;
    }
    orig_svRender(self, ctx);
}

static void h_press(void* mc) {
    g_mc = mc;
    if (!g_uiAtiva) { orig_press(mc); return; }
    float k = (1080.0f / (float)g_pixelH) / g_optMult;
    float tx = *(float*)((char*)mc + 0x230) * k, ty = *(float*)((char*)mc + 0x234) * k;
    if (g_screen == 1) {
        int r = hitTestOptions(tx, ty);
        if (r >= 0 && r < N_OPT && g_opt[r].type != T_TGL) { g_drag = r; g_dragVal = opt_read(r); }
        g_press_region = r;
        return;
    }
    if (g_screen == 2) { g_press_region = hitTestWorlds(tx, ty); return; }
    if (g_screen == 3) { g_press_region = hitTestServers(tx, ty); return; }
    if (g_screen == 4) { g_press_region = hitTestCreateWorld(tx, ty); return; }
    if (g_screen == 5) { g_press_region = hitTestSrvForm(tx, ty); return; }
    if (g_screen == 6) { g_press_region = hitTestLangs(tx, ty); return; }
    if (g_screen == 7) { g_press_region = hitTestEditWorld(tx, ty); return; }
    if (g_screen == 8) { g_press_region = hitTestModules(tx, ty); return; }
    if (g_screen == 9) { g_press_region = hitTestModCfg(tx, ty); return; }
    if (onPauseScreen(mc)) { g_press_region = hitTestPause(tx, ty); return; }
    g_press_region = hitTest(tx, ty);
}

static void h_release(void* mc) {
    g_mc = mc;
    if (!g_uiAtiva) { orig_release(mc); return; }
    float k = (1080.0f / (float)g_pixelH) / g_optMult;
    float tx = *(float*)((char*)mc + 0x230) * k, ty = *(float*)((char*)mc + 0x234) * k;
    if (g_screen == 1) {
        if (g_drag >= 0) { opt_apply(g_drag, g_dragVal); g_drag = -1; }
        else {
            int r = hitTestOptions(tx, ty);
            if (r == g_press_region) {
                if (r >= 100) g_tab = r - 100;
                else if (r >= 0 && r < N_OPT && g_opt[r].type == T_TGL) { float cur = opt_read(r); opt_apply(r, cur < 0.5f ? 1.0f : 0.0f); }
                else if (r == -10) { ((void(*)(void*))VC_CALL(0x927c74u))(vc_opts()); g_screen = 0; g_tab = 0; }
            }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 2) {
        int r = hitTestWorlds(tx, ty);
        if (r == g_press_region) {
            if (r >= 1000) { int wi = r - 1000; if (wi < g_worldCount) { vc_edit_read(wi); g_screen = 7; } }
            else if (r >= 0) vc_world_launch(r);
            else if (r == -10) { vc_worlds_close(); g_screen = 0; }
            else if (r == -11) { g_fields[0][0] = 0; g_fields[1][0] = 0; g_fieldCount = 2; g_editServerId = 0; g_editWorldIdx = -1; g_cwMode = 0; g_cwType = 0; void* o = vc_opts(); g_cwDiff = o ? (*(int*)((char*)o + 0x88) & 3) : 2; g_screen = 4; }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 3) {
        int r = hitTestServers(tx, ty);
        if (r == g_press_region) {
            if (r >= 1000) { int i = r - 1000; if (i < g_serverCount) { g_editServerId = g_servers[i].id; snprintf(g_fields[0], 64, "%s", g_servers[i].name); snprintf(g_fields[1], 64, "%s", g_servers[i].host); snprintf(g_fields[2], 64, "%d", g_servers[i].port); g_fieldCount = 3; g_srvFormErr = 0; g_screen = 5; } }
            else if (r >= 0) { vc_ping_close(); g_screen = 0; vc_connect_index(r); }
            else if (r == -10) g_screen = 0;
            else if (r == -11) { g_editServerId = 0; g_fields[0][0] = 0; g_fields[1][0] = 0; g_fields[2][0] = 0; g_fieldCount = 3; g_srvFormErr = 0; g_screen = 5; }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 4) {
        int r = hitTestCreateWorld(tx, ty);
        if (g_activeField && r == R_NONE) { vc_kb_close(); g_press_region = R_NONE; return; }
        if (r == g_press_region) {
            if (r == 1) vc_kb_open(0);
            else if (r == 2) vc_kb_open(1);
            else if (r == -30) g_cwMode = (g_cwMode + 1) % 2;
            else if (r == -31) g_cwType = (g_cwType + 1) % 3;
            else if (r == -32) g_cwDiff = (g_cwDiff + 1) % 4;
            else if (r == -20) {
                vc_kb_close();
                unsigned seed = 0; int aleat = 1;
                if (g_fields[1][0]) {
                    char* end = nullptr;
                    long v = strtol(g_fields[1], &end, 10);
                    if (end && *end == 0) { seed = (unsigned)v; aleat = 0; }
                }
                vc_create_and_enter_world(g_fields[0], seed, aleat, g_cwMode, CW_TYPE_GEN[g_cwType], g_cwDiff);
                g_screen = 0;
            }
            else if (r == -10) { vc_kb_close(); g_screen = 2; }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 5) {
        int r = hitTestSrvForm(tx, ty);
        if (g_activeField && r == R_NONE) { vc_kb_close(); g_press_region = R_NONE; return; }
        if (r == g_press_region) {
            if (r >= 1 && r <= 3) { g_srvFormErr = 0; vc_kb_open(r - 1); }
            else if (r == -20) {
                if (g_fields[1][0] == 0) g_srvFormErr = 1;
                else {
                    int port = atoi(g_fields[2]); if (port <= 0 || port > 65535) port = 19132;
                    const char* nm = g_fields[0][0] ? g_fields[0] : g_fields[1];
                    if (g_editServerId) vc_srv_edit(g_editServerId, nm, g_fields[1], port);
                    else vc_srv_add(nm, g_fields[1], port);
                    vc_kb_close();
                    g_srvFormErr = 0;
                    g_screen = 3;
                }
            }
            else if (r == -30) { if (g_editServerId) vc_srv_remove(g_editServerId); vc_kb_close(); g_srvFormErr = 0; g_screen = 3; }
            else if (r == -10) { vc_kb_close(); g_srvFormErr = 0; g_screen = 3; }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 6) {
        int r = hitTestLangs(tx, ty);
        if (r == g_press_region) {
            if (r >= 0) vc_set_lang(r);
            else if (r == -10) g_screen = 0;
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 7) {
        int r = hitTestEditWorld(tx, ty);
        if (g_activeField && r == R_NONE) { vc_kb_close(); g_press_region = R_NONE; return; }
        if (r == g_press_region) {
            if (r == 1) vc_kb_open(0);
            else if (r == -30) g_cwMode = (g_cwMode + 1) % 2;
            else if (r == -32) g_cwDiff = (g_cwDiff + 1) % 4;
            else if (r == -20) { vc_kb_close(); vc_edit_world(g_editWorldIdx, g_fields[0], g_cwMode, g_cwDiff); g_editWorldIdx = -1; vc_worlds_close(); vc_worlds_open(); g_screen = 2; }
            else if (r == -10) { vc_kb_close(); g_editWorldIdx = -1; g_screen = 2; }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 8) {
        int r = hitTestModules(tx, ty);
        if (r == g_press_region) {
            if (r == -10) g_screen = 0;
            else if (r >= 100 && r < 100 + CAT_COUNT) g_modCat = r - 100;
            else if (r >= 2000) { int i = r - 2000; if (i < g_moduleCount) vc_mod_set_enabled(g_modules[i], !g_modules[i]->enabled); }
            else if (r >= 1000) { int i = r - 1000; if (i < g_moduleCount && g_modules[i]->settingCount > 0) { g_cfgModule = i; g_screen = 9; } }
        }
        g_press_region = R_NONE;
        return;
    }
    if (g_screen == 9) {
        int r = hitTestModCfg(tx, ty);
        if (r == g_press_region) {
            if (r == -10) { vc_modtext_commit(); if (g_activeField) vc_kb_close(); g_screen = 8; }
            else if (r >= 6000) vc_modtext_open(r - 6000);
            else if (r >= 3000) vc_modcfg_action(r);
        }
        g_press_region = R_NONE;
        return;
    }
    if (onPauseScreen(mc)) {
        int r = hitTestPause(tx, ty);
        if (r != R_NONE && r == g_press_region) {
            if (r == 0) vc_resume(mc);
            else if (r == 1) g_screen = 1;
            else if (r == 2) vc_quit_world(mc);
        }
        g_press_region = R_NONE;
        return;
    }
    int r = hitTest(tx, ty);
    if (r != R_NONE && r == g_press_region) {
        if (r == 0) { vc_worlds_open(); g_screen = 2; }
        else if (r == 1) g_screen = 3;
        else if (r == 2) g_screen = 8;
        else if (r == -60) g_screen = 1;
        else if (r == -61) { vc_cache_langs(); g_screen = 6; }
        else if (r == -62) exit(0);
    }
    g_press_region = R_NONE;
}

typedef void (*fn_feed)(char, char, short, short, int);
static fn_feed orig_feed = nullptr;

#define IG_BR 46.0f
#define IG_DRAG2 (14.0f * 14.0f)     /* limiar de arraste^2 (espaco virtual) */
static float g_igX = -1.0f, g_igY = -1.0f;   /* centro da bolha (virtual) */
static int g_dragPid = -1;                   /* dedo na bolha (pendente tap/arraste) */
static float g_dragSX = 0, g_dragSY = 0, g_dragOX = 0, g_dragOY = 0;
static int g_dragMoved = 0;
static float g_igScroll = 0.0f;              /* rolagem da lista de mods no painel */
static int g_scrollPid = -1, g_scrollMoved = 0, g_scrollHitR = -1;
static float g_scrollStartY = 0.0f, g_scrollStartScroll = 0.0f;
#define IG_RH 96.0f
#define IG_SEC_H 58.0f      // altura do header de secao (categoria)
#define IG_SEC_GAP 14.0f    // gap apos cada secao
#define IG_SET_RH 78.0f     // altura de cada setting inline no card expandido

static void vc_ig_initpos() {
    if (g_igX < 0.0f) { g_igX = IG_BR + 30.0f; g_igY = (float)g_lastH * 0.42f; }
}
static void vc_ig_clamp() {
    float w = (float)g_lastW, h = (float)g_lastH;
    if (g_igX < IG_BR) g_igX = IG_BR;
    if (g_igX > w - IG_BR) g_igX = w - IG_BR;
    if (g_igY < IG_BR) g_igY = IG_BR;
    if (g_igY > h - IG_BR) g_igY = h - IG_BR;
}
// painel RESPONSIVO (estilo Clay/percent do Flarial): tamanho = fracao da tela, ancorado na borda
// do lado da bolha, com margem (o "container"). Cresce p/ ocupar quase toda a altura -> adapta a
// qualquer resolucao/aspecto (celular e tablet).
static void vc_ig_panel(float* ppx, float* ppy, float* ppw, float* pph) {
    float W = (float)g_lastW, H = (float)g_lastH;
    float margin = H * 0.035f;                           // margem (fracao) = o container
    float ph = H - 2.0f * margin;                        // cresce: altura quase toda
    float pw = W * 0.36f;                                // ~36% da largura
    if (pw < 520.0f) pw = 520.0f;                        // piso p/ telas estreitas
    if (pw > W - 2.0f * margin) pw = W - 2.0f * margin;   // teto: nao estoura o container
    float px = (g_igX > W * 0.5f) ? (W - margin - pw) : margin;   // ancora na borda do lado da bolha
    *ppx = px; *ppy = margin; *ppw = pw; *pph = ph;
}
// bolha: aberta = "aba" na borda INTERNA do painel (nao cobre as linhas); fechada = flutua livre.
static void vc_ig_bubble(float* pbx, float* pby) {
    float op = vc_ig_open();
    if (op <= 0.003f && g_igMenu == 0) { *pbx = g_igX; *pby = g_igY; return; }
    float px, py, pw, ph; vc_ig_panel(&px, &py, &pw, &ph);   // FINAL (alvo do dock)
    bool left = (px + pw * 0.5f <= (float)g_lastW * 0.5f);
    float dbx = left ? (px + pw + IG_BR - 6.0f) : (px - IG_BR + 6.0f);
    float dby = g_igY; if (dby < py + IG_BR) dby = py + IG_BR; if (dby > py + ph - IG_BR) dby = py + ph - IG_BR;
    *pbx = g_igX + (dbx - g_igX) * op;    // lerp flutuante -> docado
    *pby = g_igY + (dby - g_igY) * op;
}
// botoes do header toolbar: 0=engrenagem(expandir) 1=monitor(editar HUD) 2=lupa(busca) 3=porta(fechar)
static void vc_ig_hbtn(int i, float px, float py, float pw, float* bx, float* by, float* bs) {
    float pad = 14.0f, gap = 14.0f, cardX = px + 16.0f, cardW = pw - 32.0f, cardY = py + 18.0f, cardH = 92.0f;
    float s = cardH - 2.0f * pad;   // botao grande dentro do card do header
    *bs = s; *by = cardY + pad;
    *bx = (i == 3) ? (cardX + cardW - pad - s) : (cardX + pad + (float)i * (s + gap));
}
// viewport das linhas de mod (entre o header toolbar e a base)
static void vc_ig_rows(float py, float ph, float* pRy0, float* pRowBottom) {
    *pRy0 = py + 124.0f; *pRowBottom = py + ph - 24.0f;
}
static float vc_cat_open(int c) {   // 0 = fechada, 1 = aberta (accordion animado)
    float e = vc_smooth((float)(vc_now_ms() - g_catAnimT0[c]) / 220.0f);
    return g_catCollapsed[c] ? (1.0f - e) : e;
}
static int vc_set_shown(int t) { return t == VS_SLIDER || t == VS_TOGGLE || t == VS_COLOR; }
static int vc_mod_nset(VoidModule* m) { int n = 0; for (int j = 0; j < m->settingCount; j++) if (vc_set_shown(m->settings[j].type)) n++; return n; }
static float vc_mod_settings_h(VoidModule* m) { int n = vc_mod_nset(m); return n > 0 ? (float)n * IG_SET_RH + 16.0f : 0.0f; }
static float vc_mod_expand(int i) {   // 0 = recolhido, 1 = expandido (animado, igual ao accordion das categorias)
    float e = vc_smooth((float)(vc_now_ms() - g_modExpT0[i]) / 220.0f);
    return g_modExpanded[i] ? e : (1.0f - e);
}
static float vc_mod_card_h(int i) { return IG_RH + vc_mod_settings_h(g_modules[i]) * vc_mod_expand(i); }
static float vc_cat_cards_h(int c) { float t = 0.0f; for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->category == c) t += vc_mod_card_h(i); return t; }
static float vc_ig_content_h() {   // altura total: headers + body animada (cards + settings expandidas)
    float y = 0.0f;
    for (int c = 0; c < CAT_COUNT; c++) {
        int cnt = 0; for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->category == c) cnt++;
        if (cnt == 0) continue;
        y += IG_SEC_H + vc_cat_cards_h(c) * vc_cat_open(c) + IG_SEC_GAP;
    }
    return y;
}
static void vc_ig_scroll_clamp() {
    float px, py, pw, ph; vc_ig_panel(&px, &py, &pw, &ph);
    float ry0, rowBottom; vc_ig_rows(py, ph, &ry0, &rowBottom);
    float maxS = vc_ig_content_h() - (rowBottom - ry0);
    if (maxS < 0.0f) maxS = 0.0f;
    if (g_igScroll < 0.0f) g_igScroll = 0.0f;
    if (g_igScroll > maxS) g_igScroll = maxS;
}
static int vc_ig_hit(float vx, float vy) {
    float bx, by; vc_ig_bubble(&bx, &by);
    float dx = vx - bx, dy = vy - by;
    if (dx * dx + dy * dy <= IG_BR * IG_BR) return 0;    /* bolha (circulo) */
    if (g_igMenu == 1) {
        float px, py, pw, ph; vc_ig_panel(&px, &py, &pw, &ph);
        if (vx >= px && vx <= px + pw && vy >= py && vy <= py + ph) {
            for (int b = 0; b < 4; b++) { float bx, by, bs; vc_ig_hbtn(b, px, py, pw, &bx, &by, &bs);
                if (vx >= bx && vx <= bx + bs && vy >= by && vy <= by + bs) return 30 + b; }   // header toolbar
            float ry0, rowBottom; vc_ig_rows(py, ph, &ry0, &rowBottom);
            if (vy >= ry0 && vy < rowBottom) {                                          // area de linhas
                float cp = vy - ry0 + g_igScroll, y = 0.0f;                             // posicao no conteudo
                for (int c = 0; c < CAT_COUNT; c++) {
                    int cnt = 0; for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->category == c) cnt++;
                    if (cnt == 0) continue;
                    if (cp >= y && cp < y + IG_SEC_H) return 200 + c;                    // header -> colapsa
                    y += IG_SEC_H;
                    float bodyH = vc_cat_cards_h(c) * vc_cat_open(c);
                    if (cp >= y && cp < y + bodyH) {                                     // body (cards)
                        float co = 0.0f;
                        for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->category == c) {
                            float chH = vc_mod_card_h(i);
                            if (cp - y >= co && cp - y < co + IG_RH) {                   // LINHA PRINCIPAL
                                if (vx > px + pw - 174.0f) return 10 + i;                // pill -> liga/desliga
                                return (vc_mod_nset(g_modules[i]) > 0) ? (400 + i) : (10 + i);  // corpo -> expande
                            }
                            co += chH;   // (regiao de settings tratada por g_setR no my_feed)
                        }
                    }
                    y += bodyH + IG_SEC_GAP;
                }
            }
            return 50;   // area do painel (gap) -> rolagem
        }
    }
    return -1;
}
static void vc_ig_item(int r) {
    if (r == 30) { return; }                                                          // engrenagem: expandir tela completa (TODO)
    if (r == 31) { g_hudEdit = 1; g_igMenu = 0; g_igMenuT0 = vc_now_ms(); return; }    // monitor -> Editar HUD
    if (r == 32) { return; }                                                          // lupa: busca (TODO)
    if (r == 33) { g_igMenu = 0; g_igMenuT0 = vc_now_ms(); return; }                   // porta -> fechar
    if (r >= 200 && r < 200 + CAT_COUNT) { int c = r - 200; g_catCollapsed[c] = !g_catCollapsed[c]; g_catAnimT0[c] = vc_now_ms(); vc_modules_save(); return; }  // colapsa/expande (anima)
    if (r >= 400 && r < 400 + g_moduleCount) { int i = r - 400; g_modExpanded[i] = !g_modExpanded[i]; g_modExpT0[i] = vc_now_ms(); return; }  // expande/recolhe config do card (anima)
    if (r >= 10 && r < 10 + g_moduleCount) vc_mod_set_enabled(g_modules[r - 10], !g_modules[r - 10]->enabled);
}
// snap de 1 eixo: tenta grudar a borda esq/centro/dir (ou topo/meio/base) do elemento
// arrastado nas guias (margem, centro e bordas da tela + bordas/centro dos OUTROS elementos).
// 'a' = ancora (origem p/ HUD, centro p/ botao). Retorna a ancora ajustada; *outLine = guia ativa (<0 nenhuma).
static float vc_snap_axis(float a, int center, float size, int horiz, float scrLen, float* outLine) {
    float off[3];
    if (center) { off[0] = -size * 0.5f; off[1] = 0.0f; off[2] = size * 0.5f; }
    else        { off[0] = 0.0f;         off[1] = size * 0.5f; off[2] = size; }
    float best = SNAP_T, bestA = a, margin = 20.0f; *outLine = -1.0f;
    float base[3] = { margin, scrLen * 0.5f, scrLen - margin };
    for (int p = 0; p < 3; p++) {
        for (int b = 0; b < 3; b++) {                              // guias da tela
            float d = a + off[p] - base[b]; if (d < 0) d = -d;
            if (d < best) { best = d; bestA = base[b] - off[p]; *outLine = base[b]; }
        }
        for (int i = 0; i < g_etCount; i++) {                      // guias dos OUTROS elementos
            EditTarget& e = g_et[i]; if (e.fx == g_dragFx) continue;
            float lo = horiz ? e.rx : e.ry, len = horiz ? e.rw : e.rh;
            float g3[3] = { lo, lo + len * 0.5f, lo + len };
            for (int b = 0; b < 3; b++) {
                float d = a + off[p] - g3[b]; if (d < 0) d = -d;
                if (d < best) { best = d; bestA = g3[b] - off[p]; *outLine = g3[b]; }
            }
        }
        float hb[2]; int hn = 0;                                   // guias da hotbar
        if (horiz) { if (g_hbVL >= 0.0f) { hb[hn++] = g_hbVL; hb[hn++] = g_hbVR; } }
        else       { if (g_hbVT >= 0.0f) { hb[hn++] = g_hbVT; } }
        for (int b = 0; b < hn; b++) {
            float d = a + off[p] - hb[b]; if (d < 0) d = -d;
            if (d < best) { best = d; bestA = hb[b] - off[p]; *outLine = hb[b]; }
        }
    }
    return bestA;
}
static void vc_hud_btn(int i, float* px, float* py, float* pw, float* ph) {   // 0=Mover 1=Resize 2=Sair (top-left)
    *pw = 150.0f; *ph = 62.0f; *py = 22.0f; *px = 22.0f + (float)i * (*pw + 12.0f);
}
static void vc_hud_dim() {                                                     // tela escura no fundo (buraco na hotbar)
    unsigned d = 0xB3000000u;
    if (g_hbVL >= 0.0f && g_hbVR > g_hbVL && g_hbVB > g_hbVT) {
        draw_rect(0.0f, 0.0f, (float)g_lastW, g_hbVT, d);
        draw_rect(0.0f, g_hbVB, (float)g_lastW, (float)g_lastH - g_hbVB, d);
        draw_rect(0.0f, g_hbVT, g_hbVL, g_hbVB - g_hbVT, d);
        draw_rect(g_hbVR, g_hbVT, (float)g_lastW - g_hbVR, g_hbVB - g_hbVT, d);
    } else {
        draw_rect(0.0f, 0.0f, (float)g_lastW, (float)g_lastH, d);
    }
}
// desenha os botoes da launcher (Z e futuros). Chamado no jogo normal E no modo editar.
static void vc_draw_ingame_buttons() {
    if (g_zoomOn) {
        float bx = vc_zoom_bx(), by = vc_zoom_by();
        draw_icon(IC_DISC, bx - ZB_R, by - ZB_R, 2.0f * ZB_R, g_zoomHeld ? 0xF07A3CFFu : 0xC01B1B26u);
        draw_text_c(bx, by + 12.0f, "Z", 40.0f, 0xFFF2F2FFu);
    }
    if (g_perspOn) {
        float bx = vc_persp_bx(), by = vc_persp_by();
        draw_icon(IC_DISC, bx - ZB_R, by - ZB_R, 2.0f * ZB_R, g_perspPid >= 0 ? 0xF07A3CFFu : 0xC01B1B26u);
        draw_icon(IC_EYE,  bx - ZB_R * 0.62f, by - ZB_R * 0.62f, ZB_R * 1.24f, 0xFFF2F2FFu);
    }
    // FUTUROS BOTOES: desenhar aqui + adicionar em vc_build_edit_targets (ja ficam arrastaveis).
}
// monta a lista de elementos editaveis: HUD (ancora top-left) + botoes (ancora centro).
static void vc_build_edit_targets() {
    g_etCount = 0;
    for (int i = 0; i < g_moduleCount && g_etCount < 80; i++) {
        VoidModule* m = g_modules[i];
        if (!m->enabled || m->category != CAT_HUD || g_hudRW[i] <= 0.0f) continue;
        EditTarget& e = g_et[g_etCount++];
        e.rx = g_hudRX[i]; e.ry = g_hudRY[i]; e.rw = g_hudRW[i]; e.rh = g_hudRH[i];
        e.w = g_hudRW[i]; e.h = g_hudRH[i]; e.fx = &m->x; e.fy = &m->y; e.fsc = &m->scale; e.center = 0; e.name = m->name;
    }
    if (g_zoomOn && g_etCount < 80) {
        EditTarget& e = g_et[g_etCount++];
        float cx = vc_zoom_bx(), cy = vc_zoom_by();
        e.rx = cx - ZB_R; e.ry = cy - ZB_R; e.rw = 2.0f * ZB_R; e.rh = 2.0f * ZB_R;
        e.w = 2.0f * ZB_R; e.h = 2.0f * ZB_R; e.fx = &g_zbx; e.fy = &g_zby; e.fsc = nullptr; e.center = 1; e.name = "Zoom";
    }
    if (g_perspOn && g_etCount < 80) {
        EditTarget& e = g_et[g_etCount++];
        float cx = vc_persp_bx(), cy = vc_persp_by();
        e.rx = cx - ZB_R; e.ry = cy - ZB_R; e.rw = 2.0f * ZB_R; e.rh = 2.0f * ZB_R;
        e.w = 2.0f * ZB_R; e.h = 2.0f * ZB_R; e.fx = &g_pbx; e.fy = &g_pby; e.fsc = nullptr; e.center = 1; e.name = "Perspective";
    }
    // FUTUROS BOTOES: mais um bloco aqui (fx/fy = fracao do CENTRO, center=1).
}
static void vc_hud_edit_overlay() {
    vc_draw_ingame_buttons();                                                // mostra os botoes p/ posicionar
    vc_build_edit_targets();                                                 // lista (apos HUD medido + botoes)
    for (int i = 0; i < g_etCount; i++) {                                    // contorno + nome de cada elemento
        EditTarget& e = g_et[i];
        float pad = 10.0f, t = 3.0f, rx = e.rx - pad, ry = e.ry - pad, rw = e.rw + 2.0f * pad, rh = e.rh + 2.0f * pad;
        unsigned col = (g_dragActive && g_dragFx == e.fx) ? 0xFF7A3CFFu : 0x99FFFFFFu;
        draw_rect(rx, ry, rw, t, col); draw_rect(rx, ry + rh - t, rw, t, col);
        draw_rect(rx, ry, t, rh, col); draw_rect(rx + rw - t, ry, t, rh, col);
        draw_text(rx, ry - 8.0f, e.name, 18.0f, 0xFFEAEAF6u);
    }
    if (g_dragActive && g_snapLineX >= 0.0f) draw_rect(g_snapLineX - 1.0f, 0.0f, 2.0f, (float)g_lastH, 0xFF4A9EFFu);  // guia azul
    if (g_dragActive && g_snapLineY >= 0.0f) draw_rect(0.0f, g_snapLineY - 1.0f, (float)g_lastW, 2.0f, 0xFF4A9EFFu);
    const char* lbl[3] = { "Move", "Resize", "Exit" };                      // 3 botoes top-left (estilo Flarial)
    for (int i = 0; i < 3; i++) {
        float bx, by, bw, bh; vc_hud_btn(i, &bx, &by, &bw, &bh);
        unsigned bg = (i == 2) ? 0xFF7A2A2Au : ((i == g_hudMode) ? 0xFF7A3CFFu : 0xFF2A1A4Au);
        draw_rect(bx, by, bw, bh, bg);
        draw_text_c(bx + bw * 0.5f, by + 40.0f, lbl[i], 26.0f, 0xFFF2F2FFu);
    }
}
static void ui_build_ingame(int W, int H) {
    if (g_hudEdit) { vc_hud_edit_overlay(); return; }   // modo editar: so o overlay de edicao (sem bolha/zoom)
    vc_ig_initpos();
    float bx, by; vc_ig_bubble(&bx, &by);
    unsigned bcol = (g_igMenu == 1) ? 0xFF7A3CFFu : 0xFF1B1B26u;
    draw_icon(IC_DISC, bx - IG_BR, by - IG_BR, 2.0f * IG_BR, bcol);
    draw_text_c(bx, by + 14.0f, "V", 46.0f, 0xFFF2F2FFu);
    if (vc_ig_panel_shown()) {
        int now = vc_now_ms();
        float px, py, pw, ph; vc_ig_panel(&px, &py, &pw, &ph);
        px += vc_ig_slidex(px, pw);                       // slide de abrir/fechar
        draw_round(px, py, pw, ph, 24.0f, 0xFF12101Au);   // fundo SOLIDO (sem blur/transparencia)
        // header: card solido com a fileira de icon-buttons dentro (estilo Flarial)
        draw_round(px + 16.0f, py + 18.0f, pw - 32.0f, 92.0f, 18.0f, 0xFF1E1B2Au);
        static const int HBIC[4] = { 0, 11, 4, 2 };   // engrenagem / monitor(editar HUD) / lupa(busca) / porta(fechar)
        for (int b = 0; b < 4; b++) {
            float bx, by, bs; vc_ig_hbtn(b, px, py, pw, &bx, &by, &bs);
            bool pr = (g_scrollPid >= 0 && g_scrollHitR == 30 + b);
            draw_round(bx, by, bs, bs, 14.0f, pr ? 0xFF3A3648u : 0xFF2A2736u);
            draw_icon(HBIC[b], bx + bs * 0.5f - 18.0f, by + bs * 0.5f - 18.0f, 36.0f, 0xFFEAEAF6u);
        }
        // linhas: agrupadas por categoria em secoes colapsaveis (estilo Flarial)
        float ry0, rowBottom; vc_ig_rows(py, ph, &ry0, &rowBottom);
        vc_ig_scroll_clamp();
        g_clipTop = ry0; g_clipBot = rowBottom;
        g_nSetR = 0;                                          // zera zonas de settings deste frame
        float cyTop = ry0 - g_igScroll;                       // topo do conteudo na tela
        float contentY = 0.0f;
        for (int c = 0; c < CAT_COUNT; c++) {
            int cnt = 0; for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->category == c) cnt++;
            if (cnt == 0) continue;                           // esconde categoria vazia
            float hy = cyTop + contentY;                      // HEADER da secao
            float hce = g_igMenu ? vc_ease_out_back((float)(now - g_igMenuT0 - (contentY / IG_RH) * 55.0f) / 260.0f) : 1.0f;
            float dhy = hy + (1.0f - hce) * 60.0f;
            if (dhy + IG_SEC_H > ry0 && dhy < rowBottom) {
                float hcy = dhy + IG_SEC_H * 0.5f;
                draw_icon(g_catCollapsed[c] ? 13 : 12, px + 22.0f, hcy - 13.0f, 26.0f, 0xFFBFBFD0u);
                draw_text(px + 58.0f, hcy + 9.0f, CAT_NAMES[c], 26.0f, 0xFFCACAD8u);
                char cb[8]; snprintf(cb, sizeof(cb), "%d", cnt);
                draw_text(px + 58.0f + text_width(CAT_NAMES[c], 26.0f) + 12.0f, hcy + 8.0f, cb, 22.0f, 0xFF6E6E84u);
            }
            contentY += IG_SEC_H;
            float ao = vc_cat_open(c);                        // 0=fechada 1=aberta (accordion)
            float bodyH = vc_cat_cards_h(c) * ao;             // body = cards + settings expandidas
            if (ao > 0.002f) {
                float bodyTop = cyTop + contentY;
                float ctop = bodyTop > ry0 ? bodyTop : ry0;
                float cbot = (bodyTop + bodyH < rowBottom) ? (bodyTop + bodyH) : rowBottom;
                g_clipTop = ctop; g_clipBot = cbot;           // recorta a body (altura animada)
                float cardY = contentY;
                for (int i = 0; i < g_moduleCount; i++) {
                    if (g_modules[i]->category != c) continue;
                    VoidModule* m = g_modules[i];
                    float chH = vc_mod_card_h(i);
                    float ry = cyTop + cardY;
                    float ce = g_igMenu ? vc_ease_out_back((float)(now - g_igMenuT0 - (cardY / IG_RH) * 55.0f) / 260.0f) : 1.0f;
                    float dry = ry + (1.0f - ce) * 60.0f;
                    cardY += chH;
                    if (dry + chH <= ctop || dry >= cbot) continue;
                    float cy = dry + IG_RH * 0.5f;            // centro da LINHA PRINCIPAL
                    float tt = (float)(now - g_modAnimT0[i]) / 220.0f; if (tt < 0.0f) tt = 0.0f; if (tt > 1.0f) tt = 1.0f;
                    float te = vc_smooth(tt);
                    float tp = m->enabled ? te : (1.0f - te);
                    float pop = 1.0f + 0.07f * (4.0f * tt * (1.0f - tt));
                    draw_round(px + 16.0f, dry + 7.0f, pw - 32.0f, chH - 14.0f, 18.0f, lerp_color(0xFF1C1A28u, 0xFF2A2440u, tp));
                    unsigned icol = lerp_color(0xFFBFBFD0u, 0xFFF2E6FFu, tp);
                    float isz = 48.0f, ix = px + 32.0f;
                    if (m->icon >= 0) draw_icon(m->icon, ix, cy - isz * 0.5f, isz, icol);
                    else { char ic[2] = { m->name[0], 0 }; draw_text_c(ix + isz * 0.5f, cy + 12.0f, ic, 36.0f, icol); }
                    draw_text(ix + isz + 22.0f, cy + 11.0f, m->name, 32.0f, 0xFFF2F2FFu);
                    if (vc_mod_nset(m) > 0) draw_icon(g_modExpanded[i] ? 12 : 13, px + pw - 198.0f, cy - 12.0f, 24.0f, 0xFF8A8AA0u);
                    float pwid = 142.0f, cxp = px + pw - 30.0f - pwid * 0.5f;
                    float spw = pwid * pop, sph = 52.0f * pop;
                    draw_round(cxp - spw * 0.5f, cy - sph * 0.5f, spw, sph, sph * 0.5f, lerp_color(0xFF33303Eu, 0xFF2E7D4Au, tp));
                    draw_text_c(cxp, cy + 10.0f, (tp >= 0.5f) ? "ON" : "OFF", 27.0f, 0xFFF4F4FFu);
                    float exf = vc_mod_expand(i);
                    if (exf > 0.002f) {                       // ----- settings inline (reveal animado) -----
                        float clipSave = g_clipBot;
                        float exClip = dry + IG_RH + vc_mod_settings_h(m) * exf;   // revela de cima p/ baixo
                        if (exClip < g_clipBot) g_clipBot = exClip;
                        float sy = dry + IG_RH;
                        for (int j = 0; j < m->settingCount; j++) {
                            VSetting& s = m->settings[j];
                            if (!vc_set_shown(s.type)) continue;
                            float lblY = sy + 32.0f;
                            draw_text(px + 36.0f, lblY, s.label, 24.0f, 0xFFB8B8CAu);
                            if (s.type == VS_SLIDER) {
                                float frac = (s.hi > s.lo) ? (s.value - s.lo) / (s.hi - s.lo) : 0.0f;
                                char vb[16];
                                if (s.lo == 0.0f && s.hi == 100.0f) snprintf(vb, sizeof(vb), "%d%%", (int)(s.value + 0.5f));
                                else snprintf(vb, sizeof(vb), "%.0f", s.value);
                                draw_text(px + pw - 36.0f - text_width(vb, 24.0f), lblY, vb, 24.0f, 0xFF9A9AB4u);
                                float tx = px + 36.0f, tw = pw - 72.0f, ty = sy + 50.0f;
                                draw_round(tx, ty, tw, 8.0f, 4.0f, 0xFF2C2A38u);
                                draw_round(tx, ty, tw * frac, 8.0f, 4.0f, 0xFF7A3CFFu);
                                draw_round(tx + tw * frac - 11.0f, ty - 9.0f, 22.0f, 26.0f, 11.0f, 0xFFF0F0FFu);
                                if (g_nSetR < 96) g_setR[g_nSetR++] = { i, j, 1, px + 30.0f, sy, pw - 60.0f, IG_SET_RH, tx, tw };
                            } else if (s.type == VS_TOGGLE) {
                                float swW = 84.0f, swH = 40.0f, swx = px + pw - 36.0f - swW, swy = sy + 18.0f;
                                int on = s.value != 0.0f;
                                draw_round(swx, swy, swW, swH, swH * 0.5f, on ? 0xFF2E7D4Au : 0xFF3A3442u);
                                float kr = swH * 0.5f - 5.0f;
                                float kx = on ? (swx + swW - 5.0f - 2.0f * kr) : (swx + 5.0f);
                                draw_round(kx, swy + 5.0f, 2.0f * kr, 2.0f * kr, kr, 0xFFF4F4FFu);
                                if (g_nSetR < 96) g_setR[g_nSetR++] = { i, j, 2, px + 30.0f, sy, pw - 60.0f, IG_SET_RH, swx, swW };
                            } else if (s.type == VS_COLOR) {
                                float cw = 120.0f, cxs = px + pw - 36.0f - cw, cys = sy + 16.0f;
                                draw_round(cxs - 2.0f, cys - 2.0f, cw + 4.0f, 48.0f, 11.0f, 0xFF4A4658u);
                                draw_round(cxs, cys, cw, 44.0f, 10.0f, 0xFF000000u | (s.color & 0x00FFFFFFu));
                                if (g_nSetR < 96) g_setR[g_nSetR++] = { i, j, 3, cxs, cys, cw, 44.0f, 0.0f, 0.0f };
                            }
                            sy += IG_SET_RH;
                        }
                        g_clipBot = clipSave;
                    }
                }
                g_clipTop = ry0; g_clipBot = rowBottom;        // restaura viewport p/ proximo header
            }
            contentY += bodyH;
            contentY += IG_SEC_GAP;
        }
        g_clipTop = -1e9f; g_clipBot = 1e9f;
        // barra de rolagem
        float viewH = rowBottom - ry0, contentH = vc_ig_content_h();
        if (contentH > viewH) {
            float th = viewH * viewH / contentH; if (th < 30.0f) th = 30.0f;
            float maxS = contentH - viewH;
            float ty = ry0 + (maxS > 0.0f ? g_igScroll / maxS : 0.0f) * (viewH - th);
            draw_round(px + pw - 12.0f, ry0, 4.0f, viewH, 2.0f, 0xFF2C2A38u);
            draw_round(px + pw - 12.0f, ty, 4.0f, th, 2.0f, 0xFF7A3CFFu);
        }
    }
    vc_draw_ingame_buttons();                       // botoes da launcher (Z etc.)
}
static void my_feed(char down, char edge, short x, short y, int pid) {
    if (pid < 0 || pid > 11 || !g_mc || g_pixelH <= 0 || !onHud(g_mc)) { if (orig_feed) orig_feed(down, edge, x, y, pid); return; }
    float k = (1080.0f / (float)g_pixelH) / g_optMult;
    float vx = (float)x * k, vy = (float)y * k;
    unsigned bit = 1u << pid;
    if (g_hudEdit) {                               /* modo editar: arrasta QUALQUER elemento (HUD + botoes); consome tudo */
        if (down && edge) {                        /* PRESS */
            for (int i = 0; i < 3; i++) {          /* 3 botoes top-left: Mover / Resize / Sair */
                float bx, by, bw, bh; vc_hud_btn(i, &bx, &by, &bw, &bh);
                if (vx >= bx && vx <= bx + bw && vy >= by && vy <= by + bh) {
                    if (i == 2) { g_hudEdit = 0; vc_modules_save(); } else g_hudMode = i;
                    return;
                }
            }
            for (int i = 0; i < g_etCount; i++) {
                EditTarget& e = g_et[i]; float pad = 14.0f;
                if (vx < e.rx - pad || vx > e.rx + e.rw + pad || vy < e.ry - pad || vy > e.ry + e.rh + pad) continue;
                float ax = e.center ? (*e.fx >= 0.0f ? *e.fx * (float)g_lastW : e.rx + e.rw * 0.5f) : (*e.fx * (float)g_lastW);
                float ay = e.center ? (*e.fy >= 0.0f ? *e.fy * (float)g_lastH : e.ry + e.rh * 0.5f) : (*e.fy * (float)g_lastH);
                g_dragActive = 1; g_hudDragPid = pid; g_dragFx = e.fx; g_dragFy = e.fy;
                g_dragCenter = e.center; g_dragW = e.w; g_dragH = e.h;
                g_dragFs = e.fsc; g_dragStartScale = (e.fsc ? *e.fsc : 1.0f); g_dragStartFy = vy;
                g_etOX = vx - ax; g_etOY = vy - ay;
                g_rzCX = e.rx + e.rw * 0.5f; g_rzCY = e.ry + e.rh * 0.5f;   // centro do elemento p/ o resize
                { float ddx = vx - g_rzCX, ddy = vy - g_rzCY; float a = ddx < 0 ? -ddx : ddx, b = ddy < 0 ? -ddy : ddy;
                  float cd = a > b ? a : b; g_rzD0 = cd < 40.0f ? 40.0f : cd; }
                break;
            }
            return;
        } else if (pid == g_hudDragPid) {          /* MOVE/RELEASE */
            if (down && !edge) { g_dragActive = 0; g_hudDragPid = -1; g_snapLineX = -1.0f; g_snapLineY = -1.0f; vc_modules_save(); return; }
            if (g_dragActive && g_dragFx && g_dragFy) {
                if (g_hudMode == 1 && g_dragFs) {  /* RESIZE: puxa pra FORA do centro = maior (como arrastar um canto) */
                    float ddx = vx - g_rzCX, ddy = vy - g_rzCY;
                    float a = ddx < 0 ? -ddx : ddx, b = ddy < 0 ? -ddy : ddy; float cd = a > b ? a : b;
                    float s = g_dragStartScale * cd / g_rzD0;
                    if (s < 0.4f) s = 0.4f; if (s > 4.0f) s = 4.0f;
                    *g_dragFs = s;
                } else {                           /* MOVER: posicao + snap magnetico */
                    float ax = vx - g_etOX, ay = vy - g_etOY;
                    ax = vc_snap_axis(ax, g_dragCenter, g_dragW, 1, (float)g_lastW, &g_snapLineX);
                    ay = vc_snap_axis(ay, g_dragCenter, g_dragH, 0, (float)g_lastH, &g_snapLineY);
                    float minAX = g_dragCenter ? g_dragW * 0.5f : 0.0f;
                    float maxAX = (float)g_lastW - (g_dragCenter ? g_dragW * 0.5f : g_dragW);
                    float minAY = g_dragCenter ? g_dragH * 0.5f : 0.0f;
                    float maxAY = (float)g_lastH - (g_dragCenter ? g_dragH * 0.5f : g_dragH);
                    if (ax < minAX) ax = minAX; if (ax > maxAX) ax = maxAX;
                    if (ay < minAY) ay = minAY; if (ay > maxAY) ay = maxAY;
                    *g_dragFx = ax / (float)g_lastW; *g_dragFy = ay / (float)g_lastH;
                }
            }
            return;
        }
        return;
    }
    vc_ig_initpos();
    if (down && edge) {                            /* PRESS */
        if (g_igMenu == 1) for (int z = 0; z < g_nSetR; z++) {   /* settings inline tem prioridade */
            SetHit& h = g_setR[z];
            if (vx < h.x || vx > h.x + h.w || vy < h.y || vy > h.y + h.h) continue;
            VoidModule* m = g_modules[h.mod]; VSetting& s = m->settings[h.set];
            if (h.kind == 1) {                     /* slider: inicia arraste + ja seta no X */
                g_ourPtrs |= bit; g_setDragPid = pid; g_setDragMod = h.mod; g_setDragSet = h.set; g_setDragTX = h.tx; g_setDragTW = h.tw;
                float f = (vx - h.tx) / h.tw; if (f < 0.0f) f = 0.0f; if (f > 1.0f) f = 1.0f;
                s.value = s.lo + f * (s.hi - s.lo); m->onSettingChanged(s.key);
            } else if (h.kind == 2) {              /* toggle: flip */
                g_ourPtrs |= bit; s.value = (s.value != 0.0f) ? 0.0f : 1.0f; m->onSettingChanged(s.key); vc_modules_save();
            } else {                               /* cor: color picker (Parte 2) */
                g_ourPtrs |= bit; /* TODO: abrir color picker */
            }
            return;
        }
        int r = vc_ig_hit(vx, vy);
        if (r == 0) {                              /* bolha: adia decisao (tap vs arraste) */
            g_ourPtrs |= bit; g_dragPid = pid; g_dragSX = vx; g_dragSY = vy;
            g_dragOX = vx - g_igX; g_dragOY = vy - g_igY; g_dragMoved = 0;
            return;
        }
        if (r != -1) {                              /* painel: gesto tap(aciona) vs arraste(rola) */
            g_ourPtrs |= bit; g_scrollPid = pid; g_scrollStartY = vy;
            g_scrollStartScroll = g_igScroll; g_scrollMoved = 0; g_scrollHitR = r;
            return;
        }
        if (vc_zoom_hit(vx, vy)) {                  /* botao de zoom */
            g_ourPtrs |= bit; g_zoomPid = pid;
            if (g_zoomToggle) g_zoomHeld = !g_zoomHeld;  /* Alternar: liga/desliga no toque (dedos livres) */
            else g_zoomHeld = 1;                         /* Segurar */
            return;
        }
        if (vc_persp_hit(vx, vy)) {                 /* botao de perspectiva: cicla a visao (F5) */
            g_ourPtrs |= bit; g_perspPid = pid; g_perspReq = 1;
            return;
        }
    } else if (g_ourPtrs & bit) {                  /* MOVE/RELEASE do nosso dedo */
        if (pid == g_setDragPid) {                 /* dedo arrastando um slider inline */
            VoidModule* m = g_modules[g_setDragMod]; VSetting& s = m->settings[g_setDragSet];
            if (down && !edge) { g_setDragPid = -1; g_setDragMod = -1; g_ourPtrs &= ~bit; vc_modules_save(); return; }  /* RELEASE */
            float f = (vx - g_setDragTX) / g_setDragTW; if (f < 0.0f) f = 0.0f; if (f > 1.0f) f = 1.0f;
            s.value = s.lo + f * (s.hi - s.lo); m->onSettingChanged(s.key);
            return;
        }
        if (pid == g_scrollPid) {                  /* dedo no painel: rola ou aciona item */
            if (down && !edge) {                   /* RELEASE */
                if (!g_scrollMoved) vc_ig_item(g_scrollHitR);  /* TAP -> aciona */
                g_scrollPid = -1; g_ourPtrs &= ~bit;
                return;
            }
            float sdy = vy - g_scrollStartY;        /* MOVE */
            if (!g_scrollMoved && sdy * sdy > 100.0f) g_scrollMoved = 1;
            if (g_scrollMoved) { g_igScroll = g_scrollStartScroll - sdy; vc_ig_scroll_clamp(); }
            return;
        }
        if (pid == g_zoomPid) {                    /* dedo do botao de zoom */
            if (down && !edge) {                   /* RELEASE */
                if (!g_zoomToggle) g_zoomHeld = 0;  /* Segurar: solta para; Alternar: mantem ligado */
                g_zoomPid = -1; g_ourPtrs &= ~bit;
            }
            return;                                /* MOVE mantem */
        }
        if (pid == g_perspPid) {                   /* dedo do botao de perspectiva (ja ciclou no press) */
            if (down && !edge) { g_perspPid = -1; g_ourPtrs &= ~bit; }   /* RELEASE */
            return;
        }
        if (pid == g_dragPid) {                    /* dedo da bolha */
            if (down && !edge) {                   /* RELEASE */
                if (!g_dragMoved) { g_igMenu = (g_igMenu == 1) ? 0 : 1; g_igMenuT0 = vc_now_ms(); if (g_igMenu) g_igScroll = 0.0f; }  /* TAP -> abre/fecha (anima) */
                g_dragPid = -1; g_ourPtrs &= ~bit;
                return;
            }
            float ddx = vx - g_dragSX, ddy = vy - g_dragSY;          /* MOVE */
            if (!g_dragMoved && (ddx * ddx + ddy * ddy) > IG_DRAG2) g_dragMoved = 1;
            if (g_dragMoved) { g_igX = vx - g_dragOX; g_igY = vy - g_dragOY; vc_ig_clamp(); }
            return;
        }
        if (down && !edge) g_ourPtrs &= ~bit;      /* item do menu: solta */
        return;
    }
    g_ptrX[pid] = vx; g_ptrY[pid] = vy;   /* guarda a posicao deste dedo; a bola segue so o de interacao */
    if (orig_feed) orig_feed(down, edge, x, y, pid);   /* CPS agora e contado no my_turntick (area do jogo) */
}

// hook do HotBarRenderer::render: pega o rect REAL da hotbar (5o arg = RectangleArea& na pilha).
static void my_hotbar(void* self, void* mc, void* ctrl, int a, void* rect) {
    void* uc = ctrl ? *(void**)ctrl : nullptr;     // shared_ptr<UIControl>& -> UIControl*
    if (uc) {
        float aabb[4] = { 0, 0, 0, 0 };
        ((void(*)(void*, void*))VC_CALL(0x725bc8u))(aabb, uc);   // getAABB (GUI units) {x0,x1,y0,y1}
        if (aabb[0] < g_hbAccL) g_hbAccL = aabb[0];              // acumula os slots -> hotbar inteira
        if (aabb[1] > g_hbAccR) g_hbAccR = aabb[1];
        if (aabb[2] < g_hbAccT) g_hbAccT = aabb[2];
        if (aabb[3] > g_hbAccB) g_hbAccB = aabb[3];
    }
    if (orig_hotbar) orig_hotbar(self, mc, ctrl, a, rect);
}
// TouchTurnInteractControl::tick: o ponteiro ativo (this+0x34) vai de -1 -> id quando um toque
// NOVO entra na area de camera/ataque (NAO em botao/joystick/hotbar). Isso = 1 clique de CPS.
static void my_turntick(void* self, void* q, void* tpr, int a) {
    int before = self ? *(int*)((char*)self + 0x34) : -1;
    if (orig_turntick) orig_turntick(self, q, tpr, a);
    int after = self ? *(int*)((char*)self + 0x34) : -1;
    if (before == -1 && after != -1) vc_modules_click(0);
    g_interactPid = after;   // dedo de interacao (camera/ataque) p/ a bola; -1 = nenhum (joystick nao conta)
}
extern "C" void vc_ball_config(int on, float size, unsigned color) {
    g_ballOn = on; g_ballSize = size; if (color) g_ballColor = color;
}
// Codifica um float no imm8 do NEON VMOV.F32 (valor encodavel mais proximo). <0 = fora da faixa.
static int vc_vfp_imm8(float v) {
    if (v < 0.125f || v > 31.0f) return -1;
    int n = 0; float m = v;
    while (m >= 2.0f) { m *= 0.5f; n++; }
    while (m < 1.0f)  { m *= 2.0f; n--; }
    int efgh = (int)((m - 1.0f) * 16.0f + 0.5f);
    if (efgh > 15) { efgh = 0; n++; }
    if (n < -3 || n > 4) return -1;
    int b, cd;
    if (n >= 1) { b = 0; cd = n - 1; } else { b = 1; cd = n + 3; }
    int c = (cd >> 1) & 1, d = cd & 1;
    return (b << 6) | (c << 5) | (d << 4) | (efgh & 0xF);
}
// Patcha o imm de escala do anel (vmov.f32 @0x70ae2c) p/ 3.5*fator -> escala SO o tamanho (posicao intacta).
static void vc_patch_ring_scale(float f) {
    if (!g_slide) return;
    unsigned char* p = (unsigned char*)(g_slide + 0x70ae2cu);
    unsigned short hw1 = (unsigned short)(p[0] | (p[1] << 8)), hw2 = (unsigned short)(p[2] | (p[3] << 8));
    if ((hw1 & 0xFF00) != 0xEF00 || (hw2 & 0x0F00) != 0x0F00) return;   // nao e o vmov.f32 esperado -> aborta
    int imm8 = vc_vfp_imm8(3.5f * f); if (imm8 < 0) return;
    int i = (imm8 >> 7) & 1, imm3 = (imm8 >> 4) & 7, imm4 = imm8 & 0xF;
    hw1 = (unsigned short)((hw1 & ~0x1007) | (i << 12) | imm3);
    hw2 = (unsigned short)((hw2 & ~0x000F) | imm4);
    uintptr_t page = (uintptr_t)p & ~(uintptr_t)0xFFF;
    if (mprotect((void*)page, 0x2000, PROT_READ | PROT_WRITE | PROT_EXEC) != 0) return;
    p[0] = hw1 & 0xFF; p[1] = (hw1 >> 8) & 0xFF; p[2] = hw2 & 0xFF; p[3] = (hw2 >> 8) & 0xFF;
    __builtin___clear_cache((char*)p, (char*)p + 4);
    mprotect((void*)page, 0x2000, PROT_READ | PROT_EXEC);
}
// hook do anel nativo: ON -> patcha a escala (3.5*fator); 0% -> suprime (invisivel); OFF -> restaura nativo.
static int my_rpi(void* self, void* client, int a, int b, float f) {
    if (!orig_rpi) return 0;
    if (!g_ballOn) {
        if (g_ringPatched != 1.0f) { vc_patch_ring_scale(1.0f); g_ringPatched = 1.0f; }
        return orig_rpi(self, client, a, b, f);
    }
    if (g_ballSize < 0.05f) return 0;
    if (g_ringPatched != g_ballSize) { vc_patch_ring_scale(g_ballSize); g_ringPatched = g_ballSize; }
    return orig_rpi(self, client, a, b, f);
}
static void install_swap_hook() {
    void* p = dlsym(g_mcpe, "_ZN19AppPlatform_android11swapBuffersEv");
    if (!p) { LOG("AppPlatform::swapBuffers nao resolvido"); return; }
    MSHookFunction(p, (void*)my_apSwap, (void**)&orig_apSwap);
    LOG("hook AppPlatform::swapBuffers @%p orig=%p", p, (void*)orig_apSwap);

    void* hbr = dlsym(g_mcpe, "_ZN14HotBarRenderer6renderER15MinecraftClientRSt10shared_ptrI9UIControlEiR13RectangleArea");
    if (hbr) { MSHookFunction(hbr, (void*)my_hotbar, (void**)&orig_hotbar); LOG("hook HotBarRenderer::render @%p", hbr); }

    void* tt = dlsym(g_mcpe, "_ZN24TouchTurnInteractControl4tickER15InputEventQueueR17TouchPointResultsi");
    if (tt) { MSHookFunction(tt, (void*)my_turntick, (void**)&orig_turntick); LOG("hook TouchTurnInteractControl::tick @%p", tt); }

    void* rpi = dlsym(g_mcpe, "_ZN19HudProgressRenderer24_renderProgressIndicatorER15MinecraftClientiif");
    if (rpi) { MSHookFunction(rpi, (void*)my_rpi, (void**)&orig_rpi); LOG("hook _renderProgressIndicator (a bola) @%p", rpi); }
    else LOG("_renderProgressIndicator (a bola) nao resolvido");

    void* up = dlsym(g_mcpe, "_ZN15MinecraftClient6updateEv");
    if (up) {
        g_slide = ((uintptr_t)up & ~(uintptr_t)1) - 0x6c9c9cu;
        MSHookFunction(up, (void*)my_update, (void**)&orig_update);
        LOG("hook update @%p slide=0x%x", up, (unsigned)g_slide);
    }

    void* pp = dlsym(g_mcpe, "_ZN15MinecraftClient31handlePointerPressedButtonPressEv");
    void* pr = dlsym(g_mcpe, "_ZN15MinecraftClient33handlePointerPressedButtonReleaseEv");
    void* sl = dlsym(g_mcpe, "_ZN17ScreenViewAdapter21handlePointerLocationEss");
    if (pp) MSHookFunction(pp, (void*)h_press, (void**)&orig_press);
    if (pr) MSHookFunction(pr, (void*)h_release, (void**)&orig_release);
    if (sl) MSHookFunction(sl, (void*)h_svLoc, (void**)&orig_svLoc);
    LOG("hook input press=%p release=%p svLoc=%p", pp, pr, sl);

    void* pR = dlsym(g_mcpe, "_ZN11PauseScreen6renderEiif");
    if (pR) MSHookFunction(pR, (void*)my_pauseRender, (void**)&orig_pauseRender);
    LOG("hook pauseRender=%p", pR);

    void* hb = dlsym(g_mcpe, "_ZN15MinecraftClient10handleBackEb");
    void* be = dlsym(g_mcpe, "_ZN10ScreenView17handleButtonEventEs11ButtonState");
    if (hb) MSHookFunction(hb, (void*)my_handleBack, (void**)&orig_handleBack);
    if (be) MSHookFunction(be, (void*)my_btnEvt, (void**)&orig_btnEvt);
    LOG("hook back=%p btnEvt=%p", hb, be);

    void* svr = dlsym(g_mcpe, "_ZN10ScreenView6renderER13ScreenContext");
    if (svr) MSHookFunction(svr, (void*)my_svRender, (void**)&orig_svRender);
    LOG("hook svRender=%p", svr);

    if (g_slide) {
        void* pong = (void*)((g_slide + 0xab7574u) | 1u);
        MSHookFunction(pong, (void*)my_pong, (void**)&orig_pong);
        LOG("hook pong=%p", pong);
        void* feedp = (void*)((g_slide + 0x1200558u) | 1u);
        MSHookFunction(feedp, (void*)my_feed, (void**)&orig_feed);
        LOG("hook feed=%p", feedp);
    }

    void* nb = dlsym(g_mcpe, "Java_com_mojang_minecraftpe_MainActivity_nativeBackPressed");
    if (nb) MSHookFunction(nb, (void*)my_nativeBack, (void**)&orig_nativeBack);
    LOG("hook nativeBack=%p", nb);

    void* ntc = dlsym(g_mcpe, "Java_com_mojang_minecraftpe_MainActivity_nativeTypeCharacter");
    void* nst = dlsym(g_mcpe, "Java_com_mojang_minecraftpe_MainActivity_nativeSetTextboxText");
    void* nrk = dlsym(g_mcpe, "Java_com_mojang_minecraftpe_MainActivity_nativeReturnKeyPressed");
    void* nbs = dlsym(g_mcpe, "Java_com_mojang_minecraftpe_MainActivity_nativeBackSpacePressed");
    if (!ntc) ntc = (void*)((g_slide + 0xdb5e34u) | 1u);
    if (!nst) nst = (void*)((g_slide + 0xdb5c8cu) | 1u);
    if (!nrk) nrk = (void*)((g_slide + 0xdb59e8u) | 1u);
    if (!nbs) nbs = (void*)((g_slide + 0xdb5908u) | 1u);
    MSHookFunction(nst, (void*)my_nSetText, (void**)&orig_nSetText);
    MSHookFunction(ntc, (void*)my_nTypeChar, (void**)&orig_nTypeChar);
    MSHookFunction(nrk, (void*)my_nReturn, (void**)&orig_nReturn);
    MSHookFunction(nbs, (void*)my_nBksp, (void**)&orig_nBksp);
    LOG("hook text jni tc=%p st=%p rk=%p bs=%p", ntc, nst, nrk, nbs);

    vc_str_init();
    vc_modules_load();
    LOG("modulos registrados=%d", g_moduleCount);
}

static void* worker(void*) {
    for (int i = 0; i < 600 && !g_mcpe; i++) {
        g_mcpe = dlopen("libminecraftpe.so", RTLD_NOLOAD | RTLD_NOW);
        if (!g_mcpe) usleep(200000);
    }
    if (!g_mcpe) { LOG("libminecraftpe ausente"); return nullptr; }

    void* subs = dlopen("libmobilesubstrate.so", RTLD_NOW);
    if (!subs) subs = dlopen("libsubstrate.so", RTLD_NOW);
    MSHookFunction = subs ? (MSHookFunction_t)dlsym(subs, "MSHookFunction") : nullptr;
    if (!MSHookFunction) { LOG("MSHookFunction ausente"); return nullptr; }

    install_swap_hook();
    LOG("overlay armado (gate por update). mcpe=%p", g_mcpe);
    return nullptr;
}

extern "C" JNIEXPORT jint JNICALL JNI_OnLoad(JavaVM* vm, void* reserved) {
    LOG("JNI_OnLoad: Void Client injetado");
    pthread_t t;
    pthread_create(&t, nullptr, worker, nullptr);
    return JNI_VERSION_1_6;
}
