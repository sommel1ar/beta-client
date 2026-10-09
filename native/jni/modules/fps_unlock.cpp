// fps_unlock.cpp — modulo: aumenta o limite de FPS do jogo.  (autor: outro dev; integrado/ajustado por nos)
//
// Metodo: forca options.limitFramerate = false a todo tick (mesma tecnica do
// fullbright, que forca o gamma). Sem hook, sem chamar funcao do jogo: so
// escrita de 1 byte na thread do jogo (onTick).
//
// Verificado na lib original (MCPE 0.15.10, libminecraftpe.so):
//   Options::setLimitFramerate(bool) = file-VA 0x928D04:
//       strb.w r1, [r0, #0x6D] ; bx lr   (so escreve o byte, sem efeito extra)
//   Options::getLimitFramerate()     = file-VA 0x928D0C:
//       ldrb.w r0, [r0, #0x6D] ; bx lr
// Ou seja: o flag mora em Options+0x6D e escrever 0 equivale a chamar o setter
// com false. Combine com o modulo No VSync para passar dos 60 FPS.
//
// FIX na integracao: o original pegava Options em mc+0x1C (ERRADO -> ponteiro
// invalido -> corrupcao/crash). Options e mc+0x13c (igual fullbright/zoom/launcher).
#include "../void_sdk.h"

struct FpsUnlock : VoidModule {
    static const int OPT_OFF_LIMIT = 0x6D;  // Options::limitFramerate (bool)
    bool hadSaved;
    bool saved;

    FpsUnlock() {
        id = "fps_unlock";  // unico e estavel (chave do config)
        name = "FPS Unlock";
        category = CAT_VISUAL;
        description = "Removes the game's FPS cap. Applies live.";
        defaultEnabled = false;
        hadSaved = false;
        saved = true;

        addInfo("Forces options.limitFramerate = false every tick.");
        addInfo("Pair with No VSync to go past 60 FPS.");
    }

    static unsigned char* limitPtr(void* mc) {
        if (!mc)
            return 0;
        // Minecraft->Options = mc+0x13c (getOptions; igual fullbright/zoom/launcher).
        void* opt = *(void**)((char*)mc + 0x13c);
        if (!opt)
            return 0;
        return (unsigned char*)((char*)opt + OPT_OFF_LIMIT);
    }

    void onEnable() override {
        // Rele o valor original no primeiro onTick in-game (mc pode ser
        // nulo aqui, fora do gameplay).
        hadSaved = false;
    }

    void onTick(void* mc) override {
        unsigned char* p = limitPtr(mc);
        if (!p)
            return;  // fora do gameplay: nada a fazer
        if (!hadSaved) {
            saved = (*p != 0);
            hadSaved = true;
        }
        *p = 0;  // limitFramerate = false
    }

    void onDisable() override {
        if (!hadSaved)
            return;
        unsigned char* p = limitPtr(vc_game());
        if (p)
            *p = saved ? 1 : 0;  // restaura o valor original
        hadSaved = false;
    }
};
VOID_MODULE(FpsUnlock);
