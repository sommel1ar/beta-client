# Void Client — Guia de Módulos (SDK)

Como criar um **módulo** (feature) pro Void Client (MCPE 0.15.10). Você escreve **um
arquivo**, o framework faz o resto: o card aparece sozinho na tela de Módulos, com
toggle liga/desliga + painel de configuração, no estilo do client.

> Público: devs do time. Pré-requisito: C++ básico. Para features que mexem no jogo
> (ler vida, posição, hookar função), é útil saber engenharia reversa da 0.15.10 — mas
> dá pra fazer muita coisa só com o SDK.

---

## 1. Índice
1. [Como funciona](#2-como-funciona)
2. [Estrutura de arquivos](#3-estrutura-de-arquivos)
3. [Tutorial: criando um módulo do zero](#4-tutorial-criando-um-módulo-do-zero)
4. [Referência da API](#5-referência-da-api)
5. [Tipos de setting](#6-tipos-de-setting)
6. [Acesso RAW (hooks e offsets)](#7-acesso-raw-hooks-e-offsets)
7. [Guia de estilo](#8-guia-de-estilo)
8. [Adicionando um tipo de setting novo](#9-adicionando-um-tipo-de-setting-novo)
9. [Build e teste](#10-build-e-teste)
10. [Boas práticas e armadilhas](#11-boas-práticas-e-armadilhas)

---

## 2. Como funciona

- **Módulos são compilados dentro do client.** Cada módulo é um `.cpp` em
  `native/jni/modules/`. No build, todos são linkados na `libmodclient.so`.
- **Auto-registro.** A macro `VOID_MODULE(SuaClasse)` registra o módulo no load (sem
  você mexer em nenhuma lista central). Tirou o arquivo = tirou o módulo.
- **O framework desenha a UI.** Você só declara a metadata e os settings; o framework
  gera o **card** (estilo Lunar) na categoria certa, o **toggle** e o **painel de
  config**, mantendo cores/formas automaticamente. Você não desenha a tela de Módulos.
- **O config persiste** em `/sdcard/voidclient_modules.cfg` (ligado/desligado + valores).
- **Ciclos de vida:** o framework chama seus callbacks — `onEnable/onDisable` ao
  (des)ligar, `onTick` por update (thread do jogo), `onRender` por frame (in-game, HUD).

Fluxo: `seu .cpp` → `VOID_MODULE(...)` → registra → card na tela de Módulos → o usuário
liga/configura → o framework chama seus callbacks.

---

## 3. Estrutura de arquivos

```
native/jni/
  void_sdk.h            <- a API (inclua nos seus módulos)
  launcher.cpp          <- o client + framework (NÃO precisa mexer)
  modules/
    fps_counter.cpp     <- exemplo: HUD de FPS (onRender + settings)
    fullbright.cpp      <- exemplo: brilho máximo (onTick + acesso raw)
    _template.cpp       <- COPIE este (arquivos "_*" são ignorados no build)
    <seu_modulo>.cpp    <- o seu vai aqui
```

Regra: **não comece o nome do arquivo com `_`** (esses são pulados no build).

---

## 4. Tutorial: criando um módulo do zero

Vamos fazer um **relógio** no HUD.

**1) Copie o template:** `cp modules/_template.cpp modules/relogio.cpp`

**2) Preencha a metadata e os settings no construtor:**

```cpp
#include "../void_sdk.h"
#include <stdio.h>
#include <time.h>

struct Relogio : VoidModule {
    Relogio() {
        id          = "relogio";        // único e estável (chave do config)
        name        = "Relógio";
        category    = CAT_HUD;
        description = "Hora atual no HUD";
        defaultEnabled = false;

        addToggle("segundos", "Mostrar segundos", true);
        addColor ("cor",      "Cor",              0xFFFFFFFFu);
        addSlider("tam",      "Tamanho",          26.0f, 16.0f, 48.0f);
    }

    void onRender(VoidCanvas& g) override {
        time_t t = time(nullptr);
        struct tm* lt = localtime(&t);
        char buf[16];
        if (getToggle("segundos")) snprintf(buf, sizeof(buf), "%02d:%02d:%02d", lt->tm_hour, lt->tm_min, lt->tm_sec);
        else                        snprintf(buf, sizeof(buf), "%02d:%02d", lt->tm_hour, lt->tm_min);

        float sz = getSlider("tam");
        float w  = g.textW(buf, sz);
        g.rect(g.screenW() - w - 32.0f, 16.0f, w + 16.0f, sz + 14.0f, 0x99060609u);
        g.text(g.screenW() - w - 24.0f, sz + 20.0f, buf, sz, getColor("cor"));
    }
};
VOID_MODULE(Relogio);
```

**3) Build e instale** (seção 10). Abra o jogo → **MODULOS** → categoria **HUD** → ligue
o **Relógio** e configure. Pronto — nenhuma linha fora do seu arquivo.

---

## 5. Referência da API

Tudo em `void_sdk.h`. Herde de `VoidModule`.

### Metadata (preencha no construtor)
| Campo | Tipo | Descrição |
|---|---|---|
| `id` | `const char*` | **Obrigatório.** Único e estável (chave do config). Ex: `"fps_counter"`. |
| `name` | `const char*` | Nome exibido no card. |
| `description` | `const char*` | Descrição curta (card/config). |
| `category` | `int` | `CAT_HUD`, `CAT_VISUAL`, `CAT_GAMEPLAY`, `CAT_COSMETIC`, `CAT_PROFILE`. |
| `defaultEnabled` | `bool` | Ligado por padrão (antes de o usuário mexer). |
| `x`, `y` | `float` | Posição padrão do HUD (se você quiser usar). |

### Callbacks (sobrescreva o que precisar)
| Callback | Thread | Quando |
|---|---|---|
| `onEnable()` | jogo | Ligou o módulo. **Instale hooks aqui.** |
| `onDisable()` | jogo | Desligou. Restaure o estado. |
| `onTick(void* mc)` | **jogo** | Por update (~tick). `mc` = `MinecraftClient*`. Seguro chamar funções do jogo. |
| `onRender(VoidCanvas& g)` | **render** | Por frame, **só in-game**. Desenhe HUD aqui. |
| `onSettingChanged(const char* key)` | jogo | Usuário mexeu num setting. |

### Settings — builders (chame no construtor)
```cpp
addToggle  (key, label, bool  def);
addSlider  (key, label, float def, float lo, float hi);
addInt     (key, label, int   def, int   lo, int   hi);
addDropdown(key, label, const char* const* nomes, int count, int def);
addColor   (key, label, unsigned defArgb);   // 0xAARRGGBB
addHeader  (label);                          // rótulo de seção (não-interativo)
addInfo    (label);                          // nota/descrição (não-interativo)
addText    (key, label, def, placeholder);   // campo de digitação (usa o teclado)
```

### Settings — getters (leia em qualquer callback)
```cpp
bool        getToggle  (key);
float       getSlider  (key);
int         getInt     (key);
int         getDropdown(key);   // índice
unsigned    getColor   (key);   // 0xAARRGGBB
const char* getText    (key);   // conteúdo do campo
```

### VoidCanvas (passado no `onRender`)
```cpp
void  rect (x, y, w, h, argb);
void  text (x, y, s, px, argb);
void  textC(cx, y, s, px, argb);   // centralizado em cx
void  textMC(x, y, s, px, def);    // respeita cores §a (ex "§aVerde")
float textW(s, px);
int   fps();                       // FPS suavizado
int   screenW();  int screenH();   // tamanho VIRTUAL (use sempre estes)
```
Coordenadas do `onRender` são em **espaço virtual** (use `screenW()/screenH()`), não
pixels. Cores são **ARGB** `0xAARRGGBB`.

---

## 6. Tipos de setting

| Tipo | Builder | Guardado | No painel |
|---|---|---|---|
| Liga/desliga | `addToggle` | 0/1 | botão ON/OFF |
| Decimal | `addSlider` | float | `−` valor `+` (passo = range/20) |
| Inteiro | `addInt` | int | `−` valor `+` (passo 1) |
| Lista | `addDropdown` | índice | toca pra ciclar as opções |
| Cor | `addColor` | ARGB | toca pra ciclar a paleta |
| Seção | `addHeader` | — | rótulo/divisor (não-interativo) |
| Nota | `addInfo` | — | texto secundário (não-interativo) |
| Texto | `addText` | string | campo; toca pra abrir o teclado |

> A edição no painel é por toque (passo/ciclo) — simples e sem bug. Slider com arraste
> fino entra no pass de design.
>
> **`addText`**: o campo está implementado (declara/mostra/persiste/`getText`) e abre o
> teclado ao tocar. O teclado em si ainda é a **pendência conhecida** do client (fecha/
> reabre não 100%) — então use com parcimônia até ele ser religado de vez.

---

## 7. Acesso RAW (hooks e offsets)

O SDK **não te limita**: além dos callbacks, você pode hookar qualquer função do jogo e
ler/escrever qualquer offset. Poder total, **sem rede de segurança** — 1 offset errado
derruba o client. Sempre valide no device.

```cpp
uintptr_t vc_slide();          // base de carga da libminecraftpe (file-VA + slide)
void*     vc_game();           // MinecraftClient* (pode ser null fora do jogo)
void*     vc_call(unsigned va);// ponteiro Thumb p/ CHAMAR função do jogo (file-VA)
void*     vc_data(unsigned va);// ponteiro p/ LER/ESCREVER dado (file-VA)
void      vc_hook_sym(const char* simboloMangled, void* minhaFn, void** orig);
void      vc_hook_va (unsigned fileVA,            void* minhaFn, void** orig);
void      vc_log(const char* tag, const char* msg);
```

Exemplo (ler o `Options` do jogo, como o `fullbright` faz):
```cpp
void onTick(void* mc) override {
    if (!mc) return;
    void* opts = *(void**)((char*)mc + 0x13c);   // MinecraftClient::getOptions
    if (!opts) return;
    float* gamma = (float*)((char*)opts + 0xe0); // brilho
    *gamma = 1.0f;
}
```

Exemplo (hookar uma função — instale **1x** em `onEnable`):
```cpp
static void (*orig)(void*) = nullptr;
static bool g_on = false;
static void minhaFn(void* self) { if (g_on) { /* seu comportamento */ } orig(self); }
void onEnable()  override { g_on = true;  static bool once=false; if(!once){once=true; vc_hook_sym("_ZN...mangled...", (void*)minhaFn, (void**)&orig);} }
void onDisable() override { g_on = false; }  // MSHook não "desfaz": use um flag
```

> **Regra do trampolim:** chamar o `orig` de certas funções (ex. as que começam com um
> `ldr [pc]`/entram em PLT) pode dar SIGBUS por modo ARM/Thumb. Se o `orig` crashar,
> hooke outro ponto ou só leia o estado em vez de repassar. (Ver as notas de RE da 0.15.)

---

## 8. Guia de estilo

Pra o seu módulo combinar com o client (dark + roxo):

| Uso | Cor (ARGB) |
|---|---|
| Acento / destaque | `0xFF7A3CFF` (roxo) |
| Texto principal | `0xFFF2F2FF` |
| Texto secundário | `0xFF9A9ABF` |
| Fundo de HUD (semi) | `0x99060609` |
| Painel/card | `0xEE141420` |
| ON (ligado) | `0xFF2E7D32` |

- Fonte: JetBrains Mono (bitmap ASCII — **sem acentos** por enquanto; evite `ç/á` em
  texto desenhado até o pass de design da fonte).
- Cantos retos, barras de acento de 6px à esquerda (como os cards). Border-radius/efeitos
  entram no pass de design final (o overlay é GLES2, dá liberdade total depois).

---

## 9. Adicionando um tipo de setting novo

Se precisar de um setting que não existe no template (ex. **keybind**, **texto**):

1. **`void_sdk.h`** — adicione o valor no `enum VSettingType` (ex. `VS_KEYBIND`), um
   builder `addKeybind(...)` na classe `VoidModule`, e campos extras no `struct VSetting`
   se precisar.
2. **`launcher.cpp`** — implemente o builder (perto dos outros `add*`), o desenho no
   `ui_build_modcfg` (como a linha aparece), o hit-test em `hitTestModCfg`, a ação em
   `vc_modcfg_action`, e a (de)serialização em `vc_modules_save/load`.
3. Documente aqui na tabela da seção 6.

> Combine isso com o dono do framework (Allan) pra manter o estilo consistente.

---

## 10. Build e teste

```powershell
# compila launcher + TODOS os modules/*.cpp (menos _*) na libmodclient.so
$ndk  = "C:\modulo\tools\ndk\android-ndk-r27c\toolchains\llvm\prebuilt\windows-x86_64\bin\clang++.exe"
$mods = Get-ChildItem native\jni\modules\*.cpp | ? { $_.Name -notlike '_*' } | % FullName
& $ndk --target=armv7a-linux-androideabi21 -fPIC -shared -O2 -s -nostdlib++ `
       -fno-exceptions -fno-rtti -Wno-unused-function "-Wl,--no-undefined" `
       -o native\out\libmodclient.so native\jni\launcher.cpp @mods -lEGL -lGLESv2 -llog -ldl

# empacota + assina + instala
copy native\out\libmodclient.so voidclient\lib\armeabi-v7a\libmodclient.so
apktool b voidclient -o VoidClient.apk
jarsigner -keystore debug.keystore -storepass android VoidClient.apk debug
adb install -r VoidClient.apk
```

Abra o jogo → menu **VOID CLIENT** → **MODULOS** → sua categoria → ligue/configure.
Logue com `vc_log("SeuModulo", "...")` e leia em `adb logcat -s VoidClient SeuModulo`.

---

## 11. Boas práticas e armadilhas

- **Thread certa:** chame funções do jogo em `onTick` (thread do jogo), **nunca** em
  `onRender` (thread de render). Desenho só em `onRender`.
- **Hooks 1x:** instale em `onEnable` com guarda `static bool once`. `MSHookFunction`
  não desfaz — controle o efeito com um flag ligado/desligado.
- **Offsets:** são file-VA da 0.15.10; some com `vc_slide()`. Offset errado = crash mudo.
  Valide no device, não assuma.
- **Null-guard:** `vc_game()` é null fora do jogo; cheque antes de derreferenciar.
- **`id` estável:** não mude o `id` depois de publicado (quebra o config salvo).
- **Sem STL pesado:** o client compila com `-nostdlib++ -fno-exceptions -fno-rtti`. Use
  C/arrays/`snprintf`; evite `std::string`/`std::vector`/exceptions. (O `operator new/delete`
  é fornecido pelo framework em `launcher.cpp` — não redeclare.) Sempre builde com
  `-Wl,--no-undefined`: pega símbolo faltando em tempo de link em vez de crashar o app no load.
- **Nada de cheat de vantagem competitiva** (reach/hitbox/anti-KB): o Void é client
  legítimo (estilo Lunar). Features = HUD, visual, QoL, cosméticos.
```
