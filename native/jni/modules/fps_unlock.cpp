// fps_unlock.cpp — modulo: remove o limite de FPS do jogo (VSync + limite interno).
//                  (base: 2 modulos de outro dev, unificados num so)
//
// Faz as DUAS coisas que destravam o FPS, porque sozinhas nao bastam:
//
// 1) VSYNC (o cap real no A71). O jogo RE-LIGA o vsync TODO FRAME em
//    AppPlatform_android::swapBuffers @0xdb2438:
//        @0xdb24b0  ldrb.w r1,[vsync_flag,#0x30]  ; r1 = flag ? 1 : 0
//        @0xdb24bc  eglSwapInterval(display, r1)   ; sobrescreve set externo
//    -> chamar eglSwapInterval por fora e inutil. FIX = patchar @0xdb24b0:
//       ldrb.w r1,[r0,#0x30] (bytes em memoria LE: 90 f8 30 10)
//                         -> movs r1,#0 ; nop     (bytes em memoria LE: 00 21 00 bf)
//       => o jogo passa a chamar eglSwapInterval(display, 0) sempre. Patch 1x +
//       mprotect; restaurado no onDisable. ATENCAO: bytes na ordem da MEMORIA
//       (Thumb e little-endian por halfword), NAO a do display do objdump.
//
// 2) limitFramerate (limitador interno do jogo). Options::setLimitFramerate
//    @0x928D04 = strb.w r1,[r0,#0x6D]; Options = mc+0x13c. Escrever 0 todo tick
//    remove o cap (mesma tecnica do fullbright). No A71 ja vem false, mas cobre
//    quem liga a opcao "limite de FPS" nas configuracoes do jogo.
//
// +200 FPS confirmado no A71 (painel 60Hz nao trava o loop de render).
#include <sys/mman.h>

#include "../void_sdk.h"

struct FpsUnlock : VoidModule {
    static const unsigned SWAP_VA = 0xdb24b0u;   // ldrb.w r1,[r0,#0x30] em AppPlatform_android::swapBuffers
    static const int OPT_OFF_LIMIT = 0x6D;       // Options::limitFramerate (bool)
    unsigned char orig[4];
    bool patched;
    bool hadSaved;
    bool saved;

    FpsUnlock() {
        id = "fps_unlock";  // unico e estavel (chave do config)
        name = "FPS Unlock";
        category = CAT_VISUAL;
        description = "Removes the game's FPS cap (VSync + internal limit).";
        defaultEnabled = false;
        patched = false;
        hadSaved = false;
        saved = true;

        addInfo("Disables VSync and the game's framerate limit. Goes past 60 FPS.");
    }

    // --- parte 1: patch do vsync no swapBuffers ---
    static bool writeBytes(unsigned char* p, const unsigned char* b) {
        uintptr_t page = (uintptr_t)p & ~(uintptr_t)0xFFF;
        if (mprotect((void*)page, 0x2000, PROT_READ | PROT_WRITE | PROT_EXEC) != 0)
            return false;
        for (int i = 0; i < 4; i++) p[i] = b[i];
        __builtin___clear_cache((char*)p, (char*)p + 4);
        mprotect((void*)page, 0x2000, PROT_READ | PROT_EXEC);
        return true;
    }

    void patchVsync() {
        if (patched || !vc_slide())
            return;
        unsigned char* p = (unsigned char*)vc_data(SWAP_VA);
        // so patcha se for exatamente o ldrb.w r1,[r0,#0x30] esperado (ordem da memoria)
        if (!(p[0] == 0x90 && p[1] == 0xf8 && p[2] == 0x30 && p[3] == 0x10))
            return;
        for (int i = 0; i < 4; i++) orig[i] = p[i];
        static const unsigned char NV[4] = { 0x00, 0x21, 0x00, 0xbf };  // movs r1,#0 ; nop
        patched = writeBytes(p, NV);
    }

    // --- parte 2: limitFramerate em Options+0x6D ---
    static unsigned char* limitPtr(void* mc) {
        if (!mc)
            return 0;
        void* opt = *(void**)((char*)mc + 0x13c);   // getOptions
        if (!opt)
            return 0;
        return (unsigned char*)((char*)opt + OPT_OFF_LIMIT);
    }

    void onEnable() override {
        patchVsync();
        hadSaved = false;   // rele o limitFramerate original no 1o onTick in-game
    }

    void onTick(void* mc) override {
        unsigned char* p = limitPtr(mc);
        if (!p)
            return;  // fora do gameplay
        if (!hadSaved) {
            saved = (*p != 0);
            hadSaved = true;
        }
        *p = 0;  // limitFramerate = false
    }

    void onDisable() override {
        if (patched) {
            writeBytes((unsigned char*)vc_data(SWAP_VA), orig);  // restaura o vsync
            patched = false;
        }
        if (hadSaved) {
            unsigned char* p = limitPtr(vc_game());
            if (p)
                *p = saved ? 1 : 0;  // restaura o limitFramerate original
            hadSaved = false;
        }
    }
};
VOID_MODULE(FpsUnlock);
