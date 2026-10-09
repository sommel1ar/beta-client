// fps_counter.cpp — modulo de exemplo: contador de FPS no HUD.
// Categoria HUD, desenha todo frame via onRender. Mostra como usar settings.
#include "../void_sdk.h"
#include <stdio.h>

struct FpsCounter : VoidModule {
    FpsCounter() {
        id             = "fps_counter";          // unico e estavel (chave do config)
        name           = "Contador de FPS";
        category       = CAT_HUD;
        description    = "Mostra o FPS atual";
        defaultEnabled = true;

        x = 0.02f; y = 0.03f;                  // posicao-padrao (fracao); arrastavel no "Editar HUD"
        addHeader("Aparencia");
        addToggle("fundo", "Fundo",   true);
        addSlider("tam",   "Tamanho", 28.0f, 16.0f, 48.0f);
        addColor ("cor",   "Cor",     0xFF7A3CFFu);
        addInfo("Arraste no modo Editar HUD. Suavizado a cada 0.5s.");
    }

    void onRender(VoidCanvas& g) override {
        char buf[32];
        snprintf(buf, sizeof(buf), "%d FPS", g.fps());
        float sz = getSlider("tam") * g.hudScale();
        float ox = g.hudX(), oy = g.hudY(), w = g.textW(buf, sz);
        if (getToggle("fundo")) g.rect(ox - 8.0f, oy, w + 16.0f, sz + 14.0f, 0x99060609u);
        g.text(ox, oy + sz + 4.0f, buf, sz, getColor("cor"));
    }
};
VOID_MODULE(FpsCounter);
