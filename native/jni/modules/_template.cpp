// =============================================================================
// _template.cpp  —  TEMPLATE de modulo do Void Client (COPIE este arquivo)
// -----------------------------------------------------------------------------
// COMO USAR:
//   1. Copie para native/jni/modules/<seu_modulo>.cpp  (NAO comece o nome com "_",
//      arquivos "_*" sao ignorados no build).
//   2. Renomeie a struct, preencha a metadata e os settings no construtor.
//   3. Implemente so os callbacks que precisar.
//   4. Deixe o VOID_MODULE(...) no final com o nome da sua struct.
//   5. Build normal: o card aparece sozinho na tela de Modulos (categoria certa),
//      com toggle liga/desliga e o painel de config dos seus settings.
//
// REGRAS:
//   - onTick(mc)  roda na THREAD DO JOGO (seguro chamar funcoes do jogo aqui).
//   - onRender(g) roda na THREAD DE RENDER, so IN-GAME (desenho de HUD).
//   - Instale hooks UMA vez (em onEnable); nunca dentro de onTick/onRender.
//   - Cores sao ARGB 0xAARRGGBB. Coordenadas do onRender sao VIRTUAIS (g.screenW/H).
//   - Acesso RAW (vc_game/vc_slide/vc_call/vc_data/vc_hook_*) nao tem rede de
//     seguranca: 1 offset errado derruba o client. Valide no device.
//
// NOTAS (preencha ao criar o seu — ajuda a manter/alterar depois):
//   - Offsets/simbolos usados:  <liste aqui, ex: Options=mc+0x13c, gamma=+0xe0>
//   - O que ainda falta / TODO:  <...>
// =============================================================================
#include "../void_sdk.h"
#include <stdio.h>

struct MeuModulo : VoidModule {
    MeuModulo() {
        id             = "meu_modulo";          // OBRIGATORIO: unico e estavel
        name           = "Meu Modulo";          // nome no card
        category       = CAT_UTILITY;           // CAT_HUD / CAT_COMBAT / CAT_VISUAL / CAT_PLAYER / CAT_WORLD / CAT_UTILITY / CAT_MISC
        description    = "Descreva a feature";
        defaultEnabled = false;

        // Settings (viram o painel ⚙ do card). Tipos disponiveis:
        addHeader  ("Geral");                          // rotulo de secao (so visual)
        addToggle  ("ligado",  "Opcao liga/desliga", true);
        addSlider  ("forca",   "Forca",   0.5f, 0.0f, 1.0f);
        addInt     ("qtd",     "Quantidade", 3, 1, 10);
        addColor   ("cor",     "Cor",     0xFF7A3CFFu);
        static const char* OPCOES[] = { "A", "B", "C" };
        addDropdown("modo",    "Modo",    OPCOES, 3, 0);
        addInfo    ("Dica: isso aqui e uma nota explicativa.");  // texto (so visual)
        addText    ("nome",    "Nome",    "", "digite...");       // campo (usa teclado)
        // Leia em qualquer callback: getToggle("ligado"), getSlider("forca"),
        // getInt("qtd"), getColor("cor"), getDropdown("modo"), getText("nome").
    }

    // Ligou o modulo (instale hooks aqui).
    void onEnable() override {
        // Ex (acesso raw): vc_hook_sym("<simbolo mangled>", (void*)minhaFn, (void**)&orig);
    }

    // Desligou (restaure estado; nota: MSHook nao "desfaz" — use um flag no hook).
    void onDisable() override {}

    // Thread do jogo, por update. mc = MinecraftClient*.
    void onTick(void* mc) override {
        // Ex: void* opts = mc ? *(void**)((char*)mc + 0x13c) : nullptr;
    }

    // Thread de render, por frame, so IN-GAME. Desenhe seu HUD aqui.
    void onRender(VoidCanvas& g) override {
        // Ex: g.text(24.0f, 60.0f, "Meu HUD", getSlider("forca")*20.0f + 16.0f, getColor("cor"));
    }

    // Usuario mexeu num setting (recalcule caches se precisar).
    void onSettingChanged(const char* key) override {}
};
VOID_MODULE(MeuModulo);   // <- registra. Mantenha no final, com o nome da sua struct.
