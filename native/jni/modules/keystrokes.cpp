// keystrokes.cpp — Keystrokes estilo Lunar/Flarial (cruz WASD + barra de espaco + LMB/RMB).
// -----------------------------------------------------------------------------
// VISUAL copiado do Keystrokes do Flarial (dll-oss): cruz W / A S D, barra de
// espaco larga embaixo, linha opcional LMB/RMB; cada tecla = retangulo arredondado
// com LERP suave de cor ao pressionar. Tamanho = resize do "Editar HUD".
//
// INPUT adaptado pro TOUCH 0.15 (no touch nao ha teclado; o dado e o MESMO que o
// handler do Flarial le = o input de movimento):
//   W/A/S/D  <- LocalPlayer::travel(float strafe, float forward) @0x93c938 (hook por NOME,
//              igual auto_sprint; o _updateMoveVector@0x901940 era pequeno demais = crash)
//   Espaco   <- Player::jumpFromGround() @0xc115d4 (gate: so o LocalPlayer;
//              getLocalPlayer @0x6c3658) — pisca no pulo
//   LMB      <- onClick(0) (edge de ataque/interact, mesmo do CPS) — pisca no ataque
//   RMB      <- sem equivalente no touch (fica apagado; linha e opcional/off)
// =============================================================================
#include "../void_sdk.h"
#include <time.h>

// estado do input, cacheado pelos hooks (thread do jogo) e lido no render.
static float    g_ks_strafe = 0.0f, g_ks_fwd = 0.0f;
static unsigned g_ks_jumpT = 0, g_ks_atkT = 0;

typedef void (*fn_mv)(void*, float, float);
typedef void (*fn_jump)(void*);
static fn_mv   orig_mv   = nullptr;
static fn_jump orig_jump = nullptr;

static unsigned ks_now() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (unsigned)((unsigned long long)ts.tv_sec * 1000ull + ts.tv_nsec / 1000000ull);
}

static void ks_travel(void* self, float strafe, float fwd) {   // LocalPlayer::travel(strafe, forward)
    g_ks_strafe = strafe; g_ks_fwd = fwd;
    if (orig_mv) orig_mv(self, strafe, fwd);
}
static void ks_jump(void* self) {                              // Player::jumpFromGround
    void* mc = vc_game();
    if (mc) { void* lp = ((void* (*)(void*))vc_call(0x6c3658u))(mc); if (self == lp) g_ks_jumpT = ks_now(); }
    if (orig_jump) orig_jump(self);
}

static unsigned ks_lerp(unsigned a, unsigned b, float t) {     // lerp ARGB (igual LerpColor do Flarial)
    if (t < 0.0f) t = 0.0f; if (t > 1.0f) t = 1.0f;
    int aa = (a >> 24) & 0xff, ar = (a >> 16) & 0xff, ag = (a >> 8) & 0xff, ab = a & 0xff;
    int ba = (b >> 24) & 0xff, br = (b >> 16) & 0xff, bg = (b >> 8) & 0xff, bb = b & 0xff;
    int ra = aa + (int)((ba - aa) * t), rr = ar + (int)((br - ar) * t);
    int rg = ag + (int)((bg - ag) * t), rb = ab + (int)((bb - ab) * t);
    return ((unsigned)ra << 24) | ((unsigned)rr << 16) | ((unsigned)rg << 8) | (unsigned)rb;
}

struct Keystrokes : VoidModule {
    float    keyT[7];   // 0..1 por tecla (anim): 0=W 1=A 2=S 3=D 4=LMB 5=RMB 6=ESPACO
    unsigned lastT;

    Keystrokes() {
        id             = "keystrokes";
        name           = "Keystrokes";
        category       = CAT_HUD;
        description    = "Mostra WASD/pulo/ataque estilo Lunar (copia do Flarial)";
        defaultEnabled = false;
        x = 0.04f; y = 0.45f;
        for (int i = 0; i < 7; i++) keyT[i] = 0.0f;
        lastT = 0;

        addToggle("mouse", "Show Mouse Buttons", false);   // linha LMB/RMB (off por padrao no touch)
        addHeader("Colors");
        addColor("cbg",   "Background (off)", 0xB0141420u);
        addColor("cbgOn", "Background (on)",  0xF0FAFAFAu);
        addColor("ctx",   "Text (off)",       0xFFCACAD8u);
        addColor("ctxOn", "Text (on)",        0xFF141420u);
        addInfo("WASD = joystick ; barra = pulo ; LMB = ataque. Tamanho = resize no Editar HUD.");
    }

    void onEnable() override {
        if (!orig_mv)   vc_hook_sym("_ZN11LocalPlayer6travelEff", (void*)ks_travel, (void**)&orig_mv);  // movimento (strafe, frente)
        if (!orig_jump) vc_hook_va(0xc115d4u, (void*)ks_jump, (void**)&orig_jump);  // pulo
    }   // hooks ficam (MSHook nao desfaz) mas so cacheiam -> inofensivo com o modulo off

    void onClick(int /*button*/) override { g_ks_atkT = ks_now(); }   // ataque/interact edge

    void onRender(VoidCanvas& g) override {
        bool mouse = getToggle("mouse");
        unsigned cbg = getColor("cbg"), cbgOn = getColor("cbgOn"), ctx = getColor("ctx"), ctxOn = getColor("ctxOn");

        float K = g.screenH() * 0.072f * g.hudScale();   // tamanho = resize do HUD
        float S = K * 0.10f;                             // espacamento fixo
        float ox = g.hudX(), oy = g.hudY();

        // --- estado pressionado por tecla ---
        const float th = 0.3f;
        unsigned now = ks_now();
        bool pressed[7];
        pressed[0] = (g_ks_fwd    >  th);                 // W = frente
        pressed[1] = (g_ks_strafe >  th);                 // A = esquerda
        pressed[2] = (g_ks_fwd    < -th);                 // S = tras
        pressed[3] = (g_ks_strafe < -th);                 // D = direita
        pressed[4] = ((now - g_ks_atkT)  < 120u);         // LMB = ataque (pisca)
        pressed[5] = false;                               // RMB = sem touch
        pressed[6] = ((now - g_ks_jumpT) < 160u);         // Espaco = pulo (pisca)

        // --- anim (lerp por tempo, independente do FPS) ---
        float dt = lastT ? (float)(now - lastT) : 16.0f; lastT = now;
        float rate = dt / 110.0f; if (rate > 1.0f) rate = 1.0f; if (rate < 0.0f) rate = 0.0f;
        for (int i = 0; i < 7; i++) keyT[i] += ((pressed[i] ? 1.0f : 0.0f) - keyT[i]) * rate;

        // --- geometria (layout do Flarial) ---
        float mw = 1.5f * K + 0.5f * S, mh = K * 0.95f;
        float mouseY = oy + 2.0f * (K + S);
        float spaceY = mouse ? (mouseY + mh + S) : (oy + 2.0f * (K + S));
        float sw = 3.0f * K + 2.0f * S, shh = K * 0.55f;
        float RX[7] = { ox + K + S, ox, ox + K + S, ox + 2.0f * (K + S), ox, ox + 1.5f * (K + S), ox };
        float RY[7] = { oy, oy + K + S, oy + K + S, oy + K + S, mouseY, mouseY, spaceY };
        float RW[7] = { K, K, K, K, mw, mw, sw };
        float RH[7] = { K, K, K, K, mh, mh, shh };
        const char* LBL[7] = { "W", "A", "S", "D", "LMB", "RMB", "" };

        for (int i = 0; i < 7; i++) {
            if ((i == 4 || i == 5) && !mouse) continue;    // linha de mouse opcional
            float w = RW[i], h = RH[i], px = RX[i], py = RY[i];
            float rr = (h < w ? h : w) * 0.5f * 0.30f;     // rounding fixo
            g.round(px, py, w, h, rr, ks_lerp(cbg, cbgOn, keyT[i]));
            if (LBL[i][0]) {
                float fs = (i == 4 || i == 5) ? K * 0.30f : K * 0.44f;
                g.textC(px + w * 0.5f, py + h * 0.5f + fs * 0.35f, LBL[i], fs, ks_lerp(ctx, ctxOn, keyT[i]));
            }
        }
    }
};
VOID_MODULE(Keystrokes);
