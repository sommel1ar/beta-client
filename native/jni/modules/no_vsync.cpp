// no_vsync.cpp — modulo: desativa o VSync do jogo.  (autor: outro dev; integrado/reescrito por nos)
//
// Por que a 1a versao (eglSwapInterval no onTick/onRender) NAO funcionava:
// o proprio jogo RE-SETA o intervalo TODO FRAME. Em AppPlatform_android::swapBuffers
// (@0xdb2438) ele faz, logo antes do eglSwapBuffers:
//     ldrb.w r1, [vsync_flag, #0x30]   ; le um flag de vsync interno
//     r1 = (flag == 1) ? 1 : 0
//     eglSwapInterval(display, r1)     ; <- sobrescreve qualquer coisa que a gente setou
//     eglSwapBuffers(display, surface)
// Logo, chamar eglSwapInterval por fora e inutil (e sobrescrito no mesmo frame).
//
// FIX: patchar o swapBuffers pra SEMPRE passar 0 ao eglSwapInterval.
//   @0xdb24b0:  ldrb.w r1, [r0, #0x30]   (bytes em memoria LE: 90 f8 30 10)
//          ->   movs r1, #0 ; nop        (bytes em memoria LE: 00 21 00 bf)
//   => o cmp/it/movne seguintes mantem r1=0 -> eglSwapInterval(display, 0) todo frame.
// Patch 1x (nao por-frame), com mprotect + clear_cache; restaurado no onDisable.
// Mesma tecnica do anel do DPI. Sanity-check dos bytes antes de escrever.
#include <sys/mman.h>

#include "../void_sdk.h"

struct NoVSync : VoidModule {
    static const unsigned SWAP_VA = 0xdb24b0u;   // ldrb.w r1,[r0,#0x30] em AppPlatform_android::swapBuffers
    unsigned char orig[4];
    bool patched;

    NoVSync() {
        id = "no_vsync";  // unico e estavel (chave do config)
        name = "No VSync";
        category = CAT_VISUAL;
        description = "Disables VSync to uncap the FPS. Pair with FPS Unlock.";
        defaultEnabled = false;
        patched = false;

        addInfo("Forces the game's swap interval to 0 (1-time patch in swapBuffers).");
        addInfo("Pair with FPS Unlock to go past 60 FPS.");
    }

    static bool writeBytes(unsigned char* p, const unsigned char* b) {
        uintptr_t page = (uintptr_t)p & ~(uintptr_t)0xFFF;
        if (mprotect((void*)page, 0x2000, PROT_READ | PROT_WRITE | PROT_EXEC) != 0)
            return false;
        for (int i = 0; i < 4; i++) p[i] = b[i];
        __builtin___clear_cache((char*)p, (char*)p + 4);
        mprotect((void*)page, 0x2000, PROT_READ | PROT_EXEC);
        return true;
    }

    void onEnable() override {
        if (patched || !vc_slide())
            return;
        unsigned char* p = (unsigned char*)vc_data(SWAP_VA);
        // so patcha se for exatamente o ldrb.w r1,[r0,#0x30] esperado
        // (evita re-patch e protege contra lib de versao diferente).
        if (!(p[0] == 0x90 && p[1] == 0xf8 && p[2] == 0x30 && p[3] == 0x10))
            return;
        for (int i = 0; i < 4; i++) orig[i] = p[i];
        static const unsigned char NV[4] = { 0x00, 0x21, 0x00, 0xbf };  // movs r1,#0 ; nop
        patched = writeBytes(p, NV);
    }

    void onDisable() override {
        if (!patched)
            return;
        writeBytes((unsigned char*)vc_data(SWAP_VA), orig);  // restaura -> vsync volta ao normal
        patched = false;
    }
};
VOID_MODULE(NoVSync);
