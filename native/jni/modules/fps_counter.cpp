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

        addHeader("Aparencia");
        addToggle("fundo", "Fundo",   true);
        addSlider("tam",   "Tamanho", 28.0f, 16.0f, 48.0f);
        addColor ("cor",   "Cor",     0xFF7A3CFFu);
        static const char* CANTOS[] = { "Sup. Esquerdo", "Sup. Direito" };
        addDropdown("canto", "Canto", CANTOS, 2, 0);
        addInfo("O FPS e suavizado a cada 0.5s.");
    }

    void onRender(VoidCanvas& g) override {
        char buf[32];
        snprintf(buf, sizeof(buf), "%d FPS", g.fps());
        float sz = getSlider("tam");
        float w  = g.textW(buf, sz);
        float x  = (getDropdown("canto") == 1) ? (g.screenW() - w - 24.0f) : 24.0f;
        float y  = sz + 16.0f;
        if (getToggle("fundo")) g.rect(x - 8.0f, y - sz, w + 16.0f, sz + 14.0f, 0x99060609u);
        g.text(x, y, buf, sz, getColor("cor"));
    }
};
VOID_MODULE(FpsCounter);
