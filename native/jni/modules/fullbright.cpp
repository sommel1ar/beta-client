// fullbright.cpp — modulo de exemplo: enxergar no escuro (gamma alto).
// Metodo: setar o gamma do Options num valor ALTO (~1500) estoura o calculo de luz.
// O gamma fica em DOIS campos, escolhidos pelo flag em Options+0x4c
// (flag==0 -> Options+0xe0 ; flag!=0 -> Options+0x9c), igual Options::setGamma@0x928e34.
#include "../void_sdk.h"

struct Fullbright : VoidModule {
    float saved = -1.0f;   // gamma original (restaurado ao desligar)

    Fullbright() {
        id          = "fullbright";
        icon        = ICON_SUN;
        name        = "Fullbright";
        category    = CAT_VISUAL;
        description = "Enxergar no escuro";
        addSlider("gamma", "Intensidade", 1500.0f, 100.0f, 3000.0f);
    }

    float* gammaPtr() {
        void* mc = vc_game();
        if (!mc) return nullptr;
        void* opts = *(void**)((char*)mc + 0x13c);   // getOptions
        if (!opts) return nullptr;
        unsigned char flag = *(unsigned char*)((char*)opts + 0x4c);
        return (float*)((char*)opts + (flag ? 0x9c : 0xe0));
    }

    void onTick(void*) override {
        float* g = gammaPtr();
        if (!g) return;
        if (saved < 0.0f) saved = *g;       // guarda o original 1x
        *g = getSlider("gamma");
    }

    void onDisable() override {
        float* g = gammaPtr();
        if (g && saved >= 0.0f) *g = saved;
        saved = -1.0f;
    }
};
VOID_MODULE(Fullbright);
