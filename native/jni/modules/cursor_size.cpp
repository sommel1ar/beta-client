// cursor_size.cpp — "A bola": tamanho do anel de toque que aparece sob o dedo.
// Suprime o anel nativo (HudProgressRenderer) e redesenha no overlay: tamanho continuo
// AO VIVO, 0 = invisivel, SEM mexer em densidade/GUI Scale (ao contrario do BlockLauncher).
#include "../void_sdk.h"

extern "C" void vc_ball_config(int on, float size, unsigned color);

struct CursorSize : VoidModule {
    CursorSize() {
        id             = "cursor_size";
        name           = "Bola";
        category       = CAT_VISUAL;
        description    = "Tamanho da bola de toque (0 = invisivel). So a bola, nao mexe na GUI.";
        defaultEnabled = false;
        addSlider("tam", "Tamanho", 1.0f, 0.0f, 3.0f);
        addColor ("cor", "Cor",     0xFFB8A8FFu);
        addInfo("0 = invisivel ; 1 = normal ; maior = maior. Muda ao vivo no mundo.");
    }
    void apply() { vc_ball_config(enabled ? 1 : 0, getSlider("tam"), getColor("cor")); }
    void onEnable()  override { apply(); }
    void onDisable() override { vc_ball_config(0, 0.0f, 0u); }
    void onSettingChanged(const char*) override { apply(); }
};
VOID_MODULE(CursorSize);
