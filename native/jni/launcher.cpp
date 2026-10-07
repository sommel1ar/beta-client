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
static int g_igMenu = 0;
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
static int vc_ig_hit(float vx, float vy);
static void vc_ig_press(float vx, float vy);
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
static UIVert g_vQuad[6];
static GLuint g_loFbo, g_loTex; static int g_loW, g_loH;

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
    g_glReady = 1;
    LOG("overlay GL pronto prog=%u vbo=%u white=%u font=%u icons=%u", g_prog, g_vbo, g_white, g_font, g_iconTex);
}

static void push(UIVert* buf, int* n, float x, float y, float w, float h,
                 float u0, float v0, float u1, float v1, unsigned argb) {
    if (*n + 6 > MAX_V) return;
    unsigned char a = argb >> 24, r = argb >> 16, g = argb >> 8, b = argb;
    UIVert q0 = { x, y, u0, v0, r, g, b, a }, q1 = { x + w, y, u1, v0, r, g, b, a },
           q2 = { x + w, y + h, u1, v1, r, g, b, a }, q3 = { x, y + h, u0, v1, r, g, b, a };
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

// =========================== FRAMEWORK DE MODULOS ============================
static VoidModule* g_modules[64];
static int g_moduleCount = 0;
static int g_modCat = 0;
static const char* CAT_NAMES[CAT_COUNT] = { "HUD", "Visual", "Jogabilidade", "Cosmeticos", "Perfil" };

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
        for (int j = 0; j < m->settingCount; j++) {
            VSetting& s = m->settings[j];
            if (s.type == VS_HEADER || s.type == VS_INFO) continue;
            if (s.type == VS_COLOR) fprintf(f, "%s.%s=%u\n", m->id, s.key, s.color);
            else if (s.type == VS_TEXT) fprintf(f, "%s.%s=%s\n", m->id, s.key, s.textBuf);
            else fprintf(f, "%s.%s=%g\n", m->id, s.key, s.value);
        }
    }
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
        for (int i = 0; i < g_moduleCount; i++) {
            VoidModule* m = g_modules[i];
            if (strcmp(m->id, mid)) continue;
            if (!strcmp(key, "enabled")) { m->enabled = atoi(val) != 0; break; }
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
    for (int i = 0; i < g_moduleCount; i++) if (g_modules[i]->enabled) g_modules[i]->onRender(g);
}
static void vc_mod_set_enabled(VoidModule* m, bool on) {
    if (m->enabled == on) return;
    m->enabled = on;
    if (on) m->onEnable(); else m->onDisable();
    vc_modules_save();
}

// ---- tela de Modulos (cards por categoria) ----
static void ui_build_modules(int W, int H) {
    float fw = (float)W, fh = (float)H;
    draw_rect(0, 0, fw, fh, 0x99060610u);
    draw_text(40.0f, 74.0f, "Mods", 44.0f, 0xFFF2F2FFu);
    draw_rect(40.0f, 90.0f, 150.0f, 4.0f, 0xFF7A3CFFu);
    // tabs de categoria
    float tx = 40.0f, ty = 120.0f, th = 54.0f;
    for (int c = 0; c < CAT_COUNT; c++) {
        float tw = text_width(vc_tr(CAT_NAMES[c]), 24.0f) + 36.0f;
        unsigned bg = (c == g_modCat) ? 0xFF7A3CFFu : 0xCC1A1A26u;
        draw_rect(tx, ty, tw, th, bg);
        draw_text(tx + 18.0f, ty + 35.0f, vc_tr(CAT_NAMES[c]), 24.0f, 0xFFEAEAF6u);
        tx += tw + 10.0f;
    }
    // cards (linhas) da categoria selecionada
    float cardY = ty + th + 24.0f, cardH = 96.0f, gap = 16.0f, cardX = 40.0f, cardW = fw - 80.0f;
    for (int i = 0; i < g_moduleCount; i++) {
        VoidModule* m = g_modules[i];
        if (m->category != g_modCat) continue;
        if (cardY + cardH > fh - 100.0f) break;
        draw_rect(cardX, cardY, cardW, cardH, 0xEE141420u);
        draw_rect(cardX, cardY, 6.0f, cardH, m->enabled ? 0xFF7A3CFFu : 0xFF3A3A4Au);
        draw_text(cardX + 28.0f, cardY + 40.0f, m->name, 28.0f, 0xFFF2F2FFu);
        if (m->description[0]) draw_text(cardX + 28.0f, cardY + 72.0f, m->description, 20.0f, 0xFF9A9ABF);
        if (m->settingCount > 0) draw_text(cardX + cardW - 320.0f, cardY + cardH * 0.5f + 8.0f, vc_tr("Configurar"), 22.0f, 0xFF8A8AB0u);
        // toggle pill a direita
        float pw = 120.0f, px = cardX + cardW - pw - 20.0f, pyy = cardY + cardH * 0.5f - 24.0f, ph = 48.0f;
        draw_rect(px, pyy, pw, ph, m->enabled ? 0xFF2E7D32u : 0xFF3A2A2Au);
        draw_text_c(px + pw * 0.5f, pyy + 32.0f, m->enabled ? "ON" : "OFF", 24.0f, 0xFFFFFFFFu);
        cardY += cardH + gap;
    }
    draw_rect(40.0f, fh - 78.0f, 200.0f, 54.0f, 0xCC1A1A26u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
        draw_rect(rx, ry, rw, rh - 10.0f, 0xEE141420u);
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
    draw_rect(40.0f, fh - 78.0f, 200.0f, 54.0f, 0xCC1A1A26u);
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
    if (onHud(g_mc)) { VoidCanvas g; vc_modules_render_hud(g); ui_build_ingame(W, H); return; }
    float fw = (float)W, fh = (float)H, cx = fw * 0.5f;
    int mel = g_menuT0 ? (vc_now_ms() - g_menuT0) : 0;
    unsigned ma;
    if (mel < 1000) ma = 0xFFu;
    else if (mel < 1500) ma = 0xFFu - (unsigned)((mel - 1000) * 0x7F / 500);
    else ma = 0x80u;
    draw_rect(0, 0, fw, fh, (ma << 24) | 0x100A1Cu);
    draw_text_c(cx, fh * 0.26f, "VOID CLIENT", 54.0f, 0xFFF2F2FFu);
    draw_rect(cx - 90.0f, fh * 0.26f + 20.0f, 180.0f, 4.0f, 0xFF7A3CFFu);
    float pw = 640.0f, px = cx - pw * 0.5f, ph = 70.0f, gap = 20.0f;
    float py = fh * 0.46f;
    for (int i = 0; i < N_MENU; i++) {
        unsigned bg = (i == g_press_region) ? 0xEE2A2A3Au : 0xCC12121Bu;
        draw_rect(px, py, pw, ph, bg);
        draw_rect(px, py, 6.0f, ph, 0xFF7A3CFFu);
        draw_text_c(cx + 3.0f, py + ph * 0.5f + 10.0f, g_menuKey[i] ? vc_tr(g_menuKey[i]) : g_menu[i], 30.0f, 0xFFEAEAF6u);
        py += ph + gap;
    }
    for (int i = 0; i < 3; i++) {
        float bx, by, bs; vc_icobtn(i, fw, fh, &bx, &by, &bs);
        draw_rect(bx, by, bs, bs, (g_press_region == IC_REG[i]) ? 0xEE2A2A3Au : 0xCC12121Bu);
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
    vc_blur_quad((float)W, (float)H, 0.0f, 1.0f);
    glEnable(GL_BLEND);
    glUseProgram(g_prog);
    glUniform2f(g_uInvScreen, 2.0f / (float)g_lastW, 2.0f / (float)g_lastH);
    glUniform1i(g_uTex, 0);
}

static void overlay_frame(int W, int H) {
    g_pixelH = H;
    { static int t0 = 0, fr = 0; int now = vc_now_ms(); fr++; if (!t0) t0 = now; if (now - t0 >= 500) { g_fps = fr * 1000 / (now - t0); fr = 0; t0 = now; } }
    float vh = 1080.0f / g_optMult, vw = vh * (float)W / (float)H;
    g_lastW = (int)(vw + 0.5f); g_lastH = (int)vh;
    g_nSolid = 0; g_nText = 0; g_nIcon = 0;
    ui_build(g_lastW, g_lastH);
    int doBlur = ((g_screen >= 1 && g_screen <= 9) || onPauseScreen(g_mc));
    if (!g_nSolid && !g_nText && !g_nIcon && !doBlur) return;

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

    if (doBlur) vc_blur_bg(W, H);

    segment(g_vSolid, g_nSolid, g_white);
    segment(g_vText, g_nText, g_font);
    segment(g_vIcon, g_nIcon, g_iconTex);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060609u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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
    draw_rect(0, 0, fw, fh, 0x99060610u);
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

#define IG_BCX 70.0f
#define IG_BR 46.0f
static int vc_ig_hit(float vx, float vy) {
    float H = (float)g_lastH, bcy = H * 0.42f;
    if (vx >= IG_BCX - IG_BR && vx <= IG_BCX + IG_BR && vy >= bcy - IG_BR && vy <= bcy + IG_BR) return 0;
    if (g_igMenu == 1) {
        float px = IG_BCX + IG_BR + 14.0f, pw = 384.0f, py = bcy - 140.0f, ph = 340.0f;
        if (vx >= px && vx <= px + pw && vy >= py && vy <= py + ph) {
            int n = g_moduleCount; if (n > 4) n = 4;
            float ry0 = py + 72.0f, rh = 58.0f;
            for (int i = 0; i < n; i++) { float ry = ry0 + i * rh; if (vy >= ry && vy <= ry + rh - 8.0f) return 10 + i; }
            float ey = py + ph - 58.0f; if (vy >= ey && vy <= ey + 46.0f) return 20;
            return 50;
        }
    }
    return -1;
}
static void vc_ig_press(float vx, float vy) {
    int r = vc_ig_hit(vx, vy);
    if (r == 0) g_igMenu = (g_igMenu == 1) ? 0 : 1;
    else if (r >= 10 && r < 10 + g_moduleCount) vc_mod_set_enabled(g_modules[r - 10], !g_modules[r - 10]->enabled);
}
static void ui_build_ingame(int W, int H) {
    float bcy = (float)H * 0.42f;
    unsigned bcol = (g_igMenu == 1) ? 0xF07A3CFFu : 0xDC1B1B26u;
    draw_rect(IG_BCX - IG_BR, bcy - IG_BR, 2.0f * IG_BR, 2.0f * IG_BR, bcol);
    draw_rect(IG_BCX - IG_BR, bcy - IG_BR, 2.0f * IG_BR, 6.0f, 0xFF7A3CFFu);
    draw_text_c(IG_BCX, bcy + 14.0f, "V", 46.0f, 0xFFF2F2FFu);
    if (g_igMenu == 1) {
        float px = IG_BCX + IG_BR + 14.0f, pw = 384.0f, py = bcy - 140.0f, ph = 340.0f;
        draw_rect(px, py, pw, ph, 0xF00C0A16u);
        draw_rect(px, py, pw, 6.0f, 0xFF7A3CFFu);
        draw_text(px + 22.0f, py + 46.0f, "VOID", 30.0f, 0xFFF2F2FFu);
        int n = g_moduleCount; if (n > 4) n = 4;
        float ry0 = py + 72.0f, rh = 58.0f;
        for (int i = 0; i < n; i++) {
            VoidModule* m = g_modules[i];
            float ry = ry0 + i * rh;
            draw_text(px + 22.0f, ry + 32.0f, m->name, 22.0f, 0xFFEAEAF6u);
            unsigned tc = m->enabled ? 0xFF2E7D32u : 0xFF3A2A3Au;
            draw_rect(px + pw - 100.0f, ry + 6.0f, 80.0f, 36.0f, tc);
            draw_text(px + pw - 100.0f + (m->enabled ? 20.0f : 16.0f), ry + 31.0f, m->enabled ? "ON" : "OFF", 20.0f, 0xFFF0F0FFu);
        }
        float ey = py + ph - 58.0f;
        draw_rect(px + 20.0f, ey, pw - 40.0f, 46.0f, 0xFF2A1A4Au);
        draw_text_c(px + pw * 0.5f, ey + 31.0f, vc_tr("Expandir"), 24.0f, 0xFFEAEAF6u);
    }
}
static void my_feed(char down, char edge, short x, short y, int pid) {
    if (pid < 0 || pid > 11 || !g_mc || g_pixelH <= 0 || !onHud(g_mc)) { if (orig_feed) orig_feed(down, edge, x, y, pid); return; }
    float k = (1080.0f / (float)g_pixelH) / g_optMult;
    float vx = (float)x * k, vy = (float)y * k;
    unsigned bit = 1u << pid;
    if (down && edge) {                        /* PRESS */
        int r = vc_ig_hit(vx, vy);
        if (r != -1) { g_ourPtrs |= bit; vc_ig_press(vx, vy); return; }
    } else if (g_ourPtrs & bit) {              /* MOVE/RELEASE do nosso dedo */
        if (down && !edge) g_ourPtrs &= ~bit;  /* RELEASE limpa o bit */
        return;
    }
    if (orig_feed) orig_feed(down, edge, x, y, pid);
}

static void install_swap_hook() {
    void* p = dlsym(g_mcpe, "_ZN19AppPlatform_android11swapBuffersEv");
    if (!p) { LOG("AppPlatform::swapBuffers nao resolvido"); return; }
    MSHookFunction(p, (void*)my_apSwap, (void**)&orig_apSwap);
    LOG("hook AppPlatform::swapBuffers @%p orig=%p", p, (void*)orig_apSwap);

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
