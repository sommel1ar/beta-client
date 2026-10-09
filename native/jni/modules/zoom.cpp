// zoom.cpp — Zoom (reduz o FOV enquanto segura o botao Z na tela).
// -----------------------------------------------------------------------------
// Na 0.15 (touch) nao ha tecla: aparece um botao "Z" no HUD; segure pra aproximar,
// solte pra voltar. O EFEITO (botao + captura de toque + anim do FOV) vive na
// camada do launcher (vc_zoom_* em launcher.cpp), porque precisa do toque (my_feed)
// e escreve o FOV em opts+0xe4 (o jogo rele por frame). Este modulo so configura.
// Mesma ideia do Zoom do Flarial (intercepta o FOV), mas trigger = toque, nao tecla.
//
// NOTAS:
//   - Offsets usados: Options = mc+0x13c; FOV = opts+0xe4 (graus). Ver VOID_SETTINGS_RE.
//   - TODO: reduzir sensibilidade junto (sens = opts+0x58), scroll pra ajustar, esconder HUD.
// =============================================================================
#include "../void_sdk.h"

extern "C" void vc_zoom_config(int on, float mult, int smooth, int toggle);

struct Zoom : VoidModule {
    Zoom() {
        id             = "zoom";
        icon           = ICON_ZOOM;
        name           = "Zoom";
        category       = CAT_VISUAL;
        description    = "Hold the Z button to zoom in (reduces FOV)";
        defaultEnabled = false;

        addHeader("Zoom");
        addSlider("nivel", "Level (x)", 3.0f, 2.0f, 8.0f);
        addToggle("suave", "Smooth", true);
        static const char* MODOS[] = { "Hold", "Toggle" };  // Toggle = tap on/off (free fingers to look around)
        addDropdown("modo", "Mode", MODOS, 2, 0);
        addInfo("Z button in game. Hold = only while held. Toggle = tap on/off (you can move/look).");
    }

    void apply() {
        vc_zoom_config(enabled ? 1 : 0, getSlider("nivel"), getToggle("suave") ? 1 : 0, getDropdown("modo"));
    }

    void onEnable() override { apply(); }
    void onDisable() override { vc_zoom_config(0, 0.0f, 0, 0); }
    void onSettingChanged(const char* /*key*/) override { apply(); }
};
VOID_MODULE(Zoom);
