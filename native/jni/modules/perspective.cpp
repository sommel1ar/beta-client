// perspective.cpp — Perspectiva: botao na tela que cicla a visao (tipo o F5 do Java).
// -----------------------------------------------------------------------------
// Na 0.15 (touch) nao ha tecla F5: o modulo mostra um botao no HUD; cada toque
// chama o CICLO NATIVO do jogo (1a pessoa -> 3a costas -> 3a frente -> 1a). O
// botao (desenho + captura de toque) vive no launcher (vc_persp_* em launcher.cpp)
// porque precisa do overlay e do my_feed; a troca em si = _toggleThirdPersonView,
// disparada na thread do jogo (my_update). Este modulo so liga/desliga o botao.
//
// Simbolos (base-stock 0.15.10, confirmados no .dynsym):
//   MinecraftClient::_toggleThirdPersonView()  @0x6c210c  (ciclo nativo = F5)
// =============================================================================
#include "../void_sdk.h"

extern "C" void vc_persp_config(int on, int skip);

struct Perspective : VoidModule {
    Perspective() {
        id             = "perspective";
        icon           = ICON_EYE;
        name           = "Perspective";
        category       = CAT_VISUAL;
        description    = "On-screen button to switch perspective (like F5)";
        defaultEnabled = false;
        addToggle("skipback", "Skip 3rd (back)", false);
        addInfo("On-screen button; tap cycles the view. 'Skip 3rd (back)' = only 1st <-> 3rd front. Drag in Edit HUD.");
    }
    void apply() { vc_persp_config(enabled ? 1 : 0, getToggle("skipback") ? 1 : 0); }
    void onEnable()  override { apply(); }
    void onDisable() override { vc_persp_config(0, 0); }
    void onSettingChanged(const char*) override { apply(); }
};
VOID_MODULE(Perspective);
