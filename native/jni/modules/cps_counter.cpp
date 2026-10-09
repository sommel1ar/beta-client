// cps_counter.cpp — modulo CPS (toques por segundo) no HUD.
// -----------------------------------------------------------------------------
// Na 0.15 (TOUCH) nao existe LMB/RMB: "clique" = um PRESS edge de gameplay.
// A fonte e o NOSSO hook de toque (my_feed = Multitouch::feed@0x1200558), que
// despacha onClick(0) a cada PRESS in-game nao consumido pela nossa UI.
// A contagem e a mesma logica do CPS do Flarial: janela deslizante de 1 segundo
// (so a FONTE muda: toque de dedo, nao botao de mouse como no PC/APK deles).
//
// NOTAS:
//   - Offsets/simbolos usados: nenhum (usa o onClick do SDK; o my_feed ja existe).
//   - TODO: separar toque de ataque vs joystick/olhar por regiao da tela (opcional).
// =============================================================================
#include "../void_sdk.h"
#include <stdio.h>
#include <time.h>

static inline unsigned vc_now_ms() {
    struct timespec ts;
    clock_gettime(CLOCK_MONOTONIC, &ts);
    return (unsigned)((unsigned long long)ts.tv_sec * 1000ull + ts.tv_nsec / 1000000ull);
}

struct CpsCounter : VoidModule {
    // Ring de timestamps (ms). 1 escritor (thread de input) + 1 leitor (render);
    // uint32 = leitura/escrita atomica no ARM, entao sem lock (contagem benigna).
    static const int CAP = 128;
    volatile unsigned times[CAP];
    volatile int head;

    CpsCounter() {
        id             = "cps_counter";
        icon           = ICON_CPS;
        name           = "CPS";
        category       = CAT_HUD;
        description    = "Mostra seus toques por segundo";
        defaultEnabled = false;
        for (int i = 0; i < CAP; i++) times[i] = 0;
        head = 0;

        x = 0.02f; y = 0.10f;                  // posicao-padrao (fracao, abaixo do FPS); arrastavel no "Editar HUD"
        addHeader("Aparencia");
        addToggle("fundo", "Fundo",   true);
        addSlider("tam",   "Tamanho", 28.0f, 16.0f, 48.0f);
        addColor ("cor",   "Cor",     0xFFFFFFFFu);
        addInfo("Conta cada toque na tela durante o jogo (janela de 1s). Arraste no Editar HUD.");
    }

    void onClick(int /*button*/) override {
        unsigned t = vc_now_ms(); if (!t) t = 1;   // 0 = slot vazio; evita colisao
        times[head] = t;
        head = (head + 1) % CAP;
    }

    void onRender(VoidCanvas& g) override {
        unsigned now = vc_now_ms();
        int cps = 0;
        for (int i = 0; i < CAP; i++) {
            unsigned t = times[i];
            if (t && (unsigned)(now - t) <= 1000u) cps++;
        }
        char buf[24];
        snprintf(buf, sizeof(buf), "CPS: %d", cps);
        float sz = getSlider("tam") * g.hudScale();
        float ox = g.hudX(), oy = g.hudY(), w = g.textW(buf, sz);
        if (getToggle("fundo")) g.rect(ox - 8.0f, oy, w + 16.0f, sz + 14.0f, 0x99060609u);
        g.text(ox, oy + sz + 4.0f, buf, sz, getColor("cor"));
    }
};
VOID_MODULE(CpsCounter);
