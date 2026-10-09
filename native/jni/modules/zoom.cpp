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
        name           = "Zoom";
        category       = CAT_VISUAL;
        description    = "Segure o botao Z pra aproximar (reduz o FOV)";
        defaultEnabled = false;

        addHeader("Zoom");
        addSlider("nivel", "Nivel (x)", 3.0f, 2.0f, 8.0f);
        addToggle("suave", "Suave", true);
        static const char* MODOS[] = { "Segurar", "Alternar" };  // Alternar = tap liga/desliga (dedos livres p/ olhar)
        addDropdown("modo", "Modo", MODOS, 2, 0);
        addInfo("Botao Z no jogo. Segurar = so enquanto segura. Alternar = tap liga/desliga (da pra mover/olhar).");
    }

    void apply() {
        vc_zoom_config(enabled ? 1 : 0, getSlider("nivel"), getToggle("suave") ? 1 : 0, getDropdown("modo"));
    }

    void onEnable() override { apply(); }
    void onDisable() override { vc_zoom_config(0, 0.0f, 0, 0); }
    void onSettingChanged(const char* /*key*/) override { apply(); }
};
VOID_MODULE(Zoom);
