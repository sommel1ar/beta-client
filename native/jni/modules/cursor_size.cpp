// cursor_size.cpp — "A bola": tamanho do anel de toque que aparece sob o dedo.
// Suprime o anel nativo (HudProgressRenderer) e redesenha no overlay: tamanho continuo
// AO VIVO, 0 = invisivel, SEM mexer em densidade/GUI Scale (ao contrario do BlockLauncher).
#include "../void_sdk.h"

extern "C" void vc_ball_config(int on, float size, unsigned color);

struct CursorSize : VoidModule {
    CursorSize() {
        id             = "cursor_size";
        icon           = ICON_BALL;
        name           = "DPI";
        category       = CAT_VISUAL;
        description    = "Tamanho do ponto de toque/cursor (DPI). 0 = invisivel; nao mexe na GUI.";
        defaultEnabled = false;
        addSlider("dpi", "Tamanho", 40.0f, 0.0f, 100.0f);
        addInfo("0% = invisivel ; 40% = nativo ; 100% = 2,5x. Anel NATIVO do jogo, escalado ao vivo.");
    }
    void apply() { vc_ball_config(enabled ? 1 : 0, getSlider("dpi") / 40.0f, 0u); }
    void onEnable()  override { apply(); }
    void onDisable() override { vc_ball_config(0, 0.0f, 0u); }
    void onSettingChanged(const char*) override { apply(); }
};
VOID_MODULE(CursorSize);
