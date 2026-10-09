// void_sdk.h — SDK de modulos do Void Client (MCPE 0.15.10)
// -----------------------------------------------------------------------------
// Como criar um modulo: crie UM arquivo em native/jni/modules/<seu_modulo>.cpp,
// herde de VoidModule, declare metadata + settings no construtor, implemente os
// callbacks que quiser (onRender/onTick/onEnable/...) e registre com VOID_MODULE(Classe).
// O card aparece sozinho na tela de Modulos, com toggle + config, no estilo do client.
//
// Acesso e RAW: alem do SDK, voce pode hookar qualquer funcao (vc_hook_*) e ler
// qualquer offset (vc_slide/vc_call/vc_data). Poder total, sem rede de seguranca:
// 1 offset errado derruba o client. Veja DOCUMENTATION.md.
// -----------------------------------------------------------------------------
#ifndef VOID_SDK_H
#define VOID_SDK_H
#include <stdint.h>

// ----------------------------- Categorias ------------------------------------
enum VoidCategory {
    CAT_HUD = 0,        // FPS, CPS, coords, keystrokes, relogio, armadura...
    CAT_COMBAT = 1,     // reach, hitbox, aim, KB...
    CAT_VISUAL = 2,     // zoom, fullbright, motion blur, FOV, crosshair...
    CAT_PLAYER = 3,     // skin, perfil, nick, movimento
    CAT_WORLD = 4,      // tempo/clima client-side, fog, block outline
    CAT_UTILITY = 5,    // QoL: auto sprint, bola/cursor, atalhos
    CAT_MISC = 6,       // diversos
    CAT_COUNT = 7
};

// indices de icone no atlas (ver native/gen_icons.py). Use no campo `icon` do modulo.
enum VoidIcon {
    ICON_NONE = -1,
    ICON_ZOOM = 4, ICON_FPS = 5, ICON_CPS = 6, ICON_BALL = 7,
    ICON_SUN = 8, ICON_MOTION = 9, ICON_SPRINT = 10, ICON_EYE = 14
};

// ----------------------------- Settings --------------------------------------
enum VSettingType {
    VS_TOGGLE = 0, VS_SLIDER = 1, VS_INT = 2, VS_DROPDOWN = 3, VS_COLOR = 4,
    VS_HEADER = 5,   // rotulo de secao (nao-interativo, nao persiste)
    VS_INFO = 6,     // nota/descricao (nao-interativo, nao persiste)
    VS_TEXT = 7      // campo de digitacao (precisa do teclado)
};
struct VSetting {
    const char* key;              // id estavel (usado pra salvar o config)
    const char* label;            // texto exibido no painel de config
    int type;
    float value;                  // toggle 0/1 | slider float | int | dropdown idx
    unsigned color;               // valor ARGB (VS_COLOR)
    float lo, hi;                 // range (slider/int)
    const char* const* names;     // nomes das opcoes (dropdown)
    int nameCount;
    char textBuf[64];             // valor (VS_TEXT)
    const char* placeholder;      // dica quando vazio (VS_TEXT)
};

// ----------------------------- Canvas (draw) ---------------------------------
// Passado pro onRender. Coordenadas em ESPACO VIRTUAL (use screenW()/screenH()).
// Cores em ARGB 0xAARRGGBB.
class VoidCanvas {
public:
    void  rect(float x, float y, float w, float h, unsigned argb);
    void  text(float x, float y, const char* s, float px, unsigned argb);
    void  textC(float cx, float y, const char* s, float px, unsigned argb); // centralizado em cx
    void  textMC(float x, float y, const char* s, float px, unsigned def);  // respeita cores §a7
    void  round(float x, float y, float w, float h, float r, unsigned argb); // retangulo arredondado (SDF)
    float textW(const char* s, float px);
    int   fps();        // FPS suavizado
    int   screenW();    // largura virtual
    int   screenH();    // altura virtual
    float hudX();       // origem X (espaco virtual) deste modulo HUD — ANCORE seu desenho aqui (arrastavel)
    float hudY();       // origem Y deste modulo HUD
    float hudScale();   // escala do HUD (modo Redimensionar) — MULTIPLIQUE seus tamanhos por isto
};

// ----------------------------- VoidModule ------------------------------------
class VoidModule {
public:
    // --- metadata (preencha no construtor) ---
    const char* id = "";                 // OBRIGATORIO, unico, estavel (ex "fps_counter")
    const char* name = "Modulo";         // nome exibido no card
    const char* description = "";         // descricao no card/config
    int         category = CAT_HUD;
    bool        defaultEnabled = false;   // ligado por padrao?
    float       x = 0.02f, y = 0.03f;      // posicao do HUD: FRACAO (0..1) da tela; arrastavel no modo "Editar HUD"
    float       scale = 1.0f;              // escala do HUD (modo Redimensionar); multiplique seus tamanhos por g.hudScale()
    int         icon = ICON_NONE;          // indice no atlas de icones (gen_icons.py); -1 = usa a 1a letra do nome

    // --- estado (gerenciado pelo framework) ---
    bool enabled = false;                 // ligado agora? (persistido)
    VSetting settings[24];
    int settingCount = 0;

    // --- builders de settings (chame no construtor) ---
    void addToggle(const char* key, const char* label, bool def);
    void addSlider(const char* key, const char* label, float def, float lo, float hi);
    void addInt(const char* key, const char* label, int def, int lo, int hi);
    void addDropdown(const char* key, const char* label, const char* const* names, int count, int def);
    void addColor(const char* key, const char* label, unsigned defArgb);
    void addHeader(const char* label);                                             // rotulo de secao
    void addInfo(const char* label);                                               // nota/descricao
    void addText(const char* key, const char* label, const char* def, const char* placeholder); // campo de texto

    // --- getters de settings (use em qualquer callback) ---
    bool        getToggle(const char* key);
    float       getSlider(const char* key);
    int         getInt(const char* key);
    int         getDropdown(const char* key);
    unsigned    getColor(const char* key);
    const char* getText(const char* key);

    // --- callbacks (sobrescreva o que precisar) ---
    virtual void onEnable() {}                         // ligou o modulo
    virtual void onDisable() {}                        // desligou
    virtual void onClick(int button) {}                // thread de INPUT: 1 toque de gameplay (PRESS edge nao consumido pela UI). 0.15 touch: button=0
    virtual void onTick(void* mc) {}                   // thread do JOGO, por update (~tick). mc = MinecraftClient*
    virtual void onRender(VoidCanvas& g) {}            // thread de RENDER, por frame, so IN-GAME (HUD)
    virtual void onSettingChanged(const char* key) {}  // usuario mexeu num setting
    virtual ~VoidModule() {}
};

// ----------------------------- Registro --------------------------------------
void vc_register_module(VoidModule* m);
#define VOID_MODULE(Cls)                                             \
    static Cls _vc_inst_##Cls;                                       \
    static struct _vc_reg_##Cls {                                    \
        _vc_reg_##Cls() { vc_register_module(&_vc_inst_##Cls); }     \
    } _vc_reg_obj_##Cls

// ----------------------------- Acesso RAW ------------------------------------
// Tudo file-VA relativo ao slide. SO chame funcoes do jogo na thread do jogo
// (onTick e seguro; onRender e thread de render). Hooks: instale 1x (onEnable).
extern "C" {
    uintptr_t vc_slide();            // base de carga da libminecraftpe
    void*     vc_game();             // MinecraftClient* (g_mc); pode ser null fora do jogo
    void      vc_hook_sym(const char* symbol, void* replacement, void** orig); // por nome (dlsym)
    void      vc_hook_va(unsigned fileVA, void* replacement, void** orig);     // por file-VA (forca Thumb)
    void      vc_log(const char* tag, const char* msg);                        // logcat "VoidClient"
}
static inline void* vc_call(unsigned va) { return (void*)((vc_slide() + (uintptr_t)va) | 1u); } // ptr Thumb p/ chamar
static inline void* vc_data(unsigned va) { return (void*)(vc_slide() + (uintptr_t)va); }        // ptr p/ ler/escrever

#endif // VOID_SDK_H
