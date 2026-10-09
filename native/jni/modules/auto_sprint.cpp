// auto_sprint.cpp — Auto Sprint estilo Java: sprinta ao andar PRA FRENTE (1 input,
// instantaneo, sem toque duplo). NAO e o sprint-eterno antigo; para quando nao anda.
// -----------------------------------------------------------------------------
// Mecanismo: hook em LocalPlayer::travel(float,float) (roda todo tick de movimento
// com o input). Se o componente "pra frente" > limiar, setSprinting(true) ANTES do
// orig (velocidade aplicada no MESMO tick = zero delay). Guarda com isSprinting pra
// NAO repetir a chamada (evita spam de pacote de sprint pro servidor).
//
// Simbolos (base-stock 0.15.10, confirmados no .dynsym):
//   LocalPlayer::travel(float,float)  _ZN11LocalPlayer6travelEff   @0x93c938 (hook por nome)
//   LocalPlayer::setSprinting(bool)   _ZN11LocalPlayer12setSprintingEb @0x93d40c
//   Mob::isSprinting() const          _ZNK3Mob11isSprintingEv       @0xbf5e74
// Confirmado no device: o 2o float de travel e o "pra frente" (g_as_fwdArg=1).
// =============================================================================
#include "../void_sdk.h"

typedef void (*fn_travel)(void*, float, float);
typedef void (*fn_setsprint)(void*, bool);
typedef bool (*fn_issprint)(void*);

static fn_travel orig_travel = nullptr;
static int   g_as_on = 0;
static int   g_as_fwdArg = 1;      // 0 = 1o arg, 1 = 2o arg (qual e "pra frente"); confirmar no device
static float g_as_thresh = 0.1f;

static void my_travel(void* self, float a, float b) {
    if (g_as_on && self) {
        float fwd = g_as_fwdArg ? b : a;               // 2o arg = "pra frente" (confirmado no device)
        bool want = fwd > g_as_thresh;
        fn_issprint  isS  = (fn_issprint) vc_call(0xbf5e74);
        fn_setsprint setS = (fn_setsprint)vc_call(0x93d40c);
        bool cur = isS(self);
        if (want && !cur)      setS(self, true);
        else if (!want && cur) setS(self, false);
    }
    orig_travel(self, a, b);
}

struct AutoSprint : VoidModule {
    AutoSprint() {
        id             = "auto_sprint";
        icon           = ICON_SPRINT;
        name           = "Auto Sprint";
        category       = CAT_UTILITY;
        description    = "Sprinta ao andar pra frente (estilo Java, instantaneo)";
        defaultEnabled = false;
        addInfo("1 input pra frente = sprint na hora (sem toque duplo). Para ao parar de andar.");
    }
    void onEnable() override {
        g_as_on = 1;
        if (!orig_travel) vc_hook_sym("_ZN11LocalPlayer6travelEff", (void*)my_travel, (void**)&orig_travel);
    }
    void onDisable() override { g_as_on = 0; }
};
VOID_MODULE(AutoSprint);
