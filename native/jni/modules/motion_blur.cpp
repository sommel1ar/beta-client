// motion_blur.cpp — Motion Blur acumulado (ghosting) por mistura de quadros.
// -----------------------------------------------------------------------------
// O EFEITO (captura do FB + composicao de N quadros) vive na camada GL do
// launcher (vc_mb_* no launcher.cpp), porque precisa do framebuffer da cena e
// roda no overlay_frame, ANTES da nossa UI. Este modulo e so o "painel de
// controle": liga/desliga + ajusta tipo/intensidade e empurra isso pro efeito
// via vc_mb_config(). Mesma ideia do Flarial (Average Pixel / Ghost Frames),
// mas a FONTE e o nosso overlay GLES2, nao DirectX.
//
// NOTAS:
//   - Offsets/simbolos usados: nenhum (so GL do proprio overlay).
//   - TODO: modo "Time Aware" (peso exp(-idade/T), independente de FPS) e
//     captura em baixa-res pra aliviar GPU no celular.
// =============================================================================
#include "../void_sdk.h"

extern "C" void vc_mb_config(int on, int frames, float alpha, float bleed, int dynamic);

struct MotionBlur : VoidModule {
    MotionBlur() {
        id             = "motion_blur";
        name           = "Motion Blur";
        category       = CAT_VISUAL;
        description    = "Suaviza o movimento acumulando os quadros anteriores";
        defaultEnabled = false;

        addHeader("Efeito");
        static const char* TIPOS[] = { "Suave (media)", "Fantasma (rastro)" };
        addDropdown("tipo", "Tipo", TIPOS, 2, 0);  // 0 = Suave (sutil), 1 = Fantasma (rastro)
        addInt("frames", "Intensidade (quadros)", 3, 1, 6);
        addToggle("dinamico", "Dinamico", true);
        addInfo("Over-blend dos ultimos N quadros (metodo do Flarial): cena nitida + ecos fracos. Dinamico so corta em stutter (<45fps).");
    }

    void apply() {
        int tipo = getDropdown("tipo");
        // Constantes exatas do Flarial: Suave=Average Pixel (0.25/0.95), Fantasma=Ghost Frames (0.30/0.80).
        float alpha = (tipo == 0) ? 0.25f : 0.30f;
        float bleed = (tipo == 0) ? 0.95f : 0.80f;
        vc_mb_config(enabled ? 1 : 0, getInt("frames"), alpha, bleed, getToggle("dinamico") ? 1 : 0);
    }

    void onEnable() override { apply(); }
    void onDisable() override { vc_mb_config(0, 0, 0.0f, 0.0f, 0); }
    void onSettingChanged(const char* /*key*/) override { apply(); }
};
VOID_MODULE(MotionBlur);
