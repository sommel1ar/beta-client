All claims are now binary-confirmed this session. Singleplayer side verified too: `getLocalWorldAtIndex` computes `start + i*0x40` from `model+0x1c/+0x20` (stride 0x40, `asr #6`); `getWorldCount` reads LOCAL from `+0x1c/+0x20`; `getWorldName = this+0x10`; the ctor calls the base model ctor then zeroes the vectors and writes up to `+0xd4`; `startWorld` validates the index against the LOCAL vector. Producing the markdown.

---

# VOID_WORLDS_SERVERS_RE.md

> **Void Client — Singleplayer (mundos locais) & Multiplayer (servidores externos)**
> MCPE **0.15.10** VANILLA · `armeabi-v7a` · Thumb-2 · `libminecraftpe.so`
> Alvo: helpers em **C** chamáveis do overlay a partir de `g_mc`. Realms fora do escopo.
> Toda VA é do binário em `C:\modulo\minecraft\_emu32\mcpe-vanilla\lib\armeabi-v7a\libminecraftpe.so`.

**Legenda de procedência**
- `[✓ sessão]` = desmontei nesta sessão e o comportamento bate com o texto.
- `[RE]` = levantado nas 3 frentes de RE (disassembly), não re-conferido byte-a-byte aqui, mas coerente.
- `(a confirmar)` = inferência a validar no device.

---

## 0. Pré-requisitos, convenções e a REGRA DE OURO

```c
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>   // calloc/free
#include <string.h>   // strlen
#include <dlfcn.h>    // dlsym do gnustl

extern uintptr_t g_slide;   // viés de carga da libminecraftpe (já existe no launcher)
extern void*     g_mc;      // MinecraftClient*

// Thumb: toda VA do libminecraftpe vira ponteiro chamável com bit 0 = 1
#define VC_CALL(va) ((void*)(((uintptr_t)g_slide + (uintptr_t)(va)) | 1u))
```

**REGRA DE OURO (vale para TODAS as funções deste doc):**
- Chamar **SEMPRE na thread do jogo** (hooks `update`/`press`). **NUNCA** em `swapBuffers` / thread de render.
- Disparar **1x por clique** e **consumir o toque** (não repassar ao jogo).
- Convenção de chamada: AAPCS/thiscall — `this` em `r0`, demais args `r1..r3` + pilha.
- `std::string` por valor → o compilador passa **ponteiro para o objeto** no registrador; ABI Itanium = **quem chama destrói** (ver §1).

---

## 1. gnustl `std::string` (libstdc++ COW `_Rep`)

### 1.1 Layout — PROVADO

A `std::string` da 0.15.10 é a COW clássica do GCC/gnustl. O **objeto ocupa 4 bytes** (um único ponteiro `_M_p`), que aponta **direto** para os caracteres (UTF-8, NUL-terminados). O cabeçalho `_Rep` (12 bytes) fica **imediatamente antes** do buffer:

```
_M_p - 0xc : uint32 _M_length     (comprimento)
_M_p - 0x8 : uint32 _M_capacity   (capacidade)
_M_p - 0x4 : int32  _M_refcount   (<0 leaked, >0 shared, 0 único)
_M_p + 0   : char data[]          (o conteúdo; data[length] == '\0')
```

**Prova `[✓ sessão]` — `ExternalServer::isValidIp(std::string const&)` @`0x6bcaac`:**
```
6bcab0: ldr  r1, [r1]          ; r1 = _M_p  (o objeto é 1 ponteiro, carregado da referência)
6bcab2: ldr  r2, [r1, #-12]    ; r2 = length  (em _M_p-0xc)
6bcac0: ldrb r3, [r1]          ; r3 = data[0] (chars DIRETO em _M_p)
```
Reforço `[✓ sessão]` em `addServer` @`0x6bd54e`: `ldr r1,[r11,#-12]` (len do arg) e `ldr r2,[r0,#-12]` (len do campo armazenado). Mesmo offset `-0xc`.

### 1.2 LER uma `std::string` gnustl (sem precisar de símbolo)

`s` = ponteiro para o **objeto** `std::string` (4 bytes). Ex.: endereço de um campo-membro `(char*)obj + off`, ou o retorno de um getter que devolve `std::string*`.

```c
// _M_p nunca é NULL numa string válida (string vazia aponta p/ _S_empty_rep_storage+12, len=0).
static inline const char* str_data(const void* s){ return *(const char* const*)s; }                 // = _M_p
static inline uint32_t    str_len (const void* s){ const uint8_t* p=(const uint8_t*)*(const char* const*)s; return ((const uint32_t*)p)[-3]; } // *(u32*)(_M_p-0xc)
static inline uint32_t    str_cap (const void* s){ const uint8_t* p=(const uint8_t*)*(const char* const*)s; return ((const uint32_t*)p)[-2]; }
static inline int32_t     str_ref (const void* s){ const uint8_t* p=(const uint8_t*)*(const char* const*)s; return ((const int32_t*) p)[-1]; }
```
Uso **somente leitura**. Nunca escrever no buffer nem assumir ownership (é COW/compartilhado).

### 1.3 CONSTRUIR uma `std::string` temporária segura (via gnustl por dlsym) — RECOMENDADO

`libgnustl_shared.so` é `NEEDED` da libminecraftpe (todos os ctors/dtors de `std::string` são símbolos `U`, importados). `std::allocator<char>` é vazio/stateless → basta passar **qualquer ponteiro legível** como 3º arg. Todo malloc/free passa pelo próprio gnustl ⇒ zero risco de corromper heap.

> **Atenção:** os símbolos são da **libgnustl**, NÃO do `g_slide`/libminecraftpe. `VC_CALL(va)` **não** serve para os ctors de string — use `dlsym`.

```c
typedef void (*fn_str_cstr)(void* self, const char* s, const void* alloc); // _ZNSsC1EPKcRKSaIcE
typedef void (*fn_str_dtor)(void* self);                                   // _ZNSsD1Ev
static fn_str_cstr Str_ctor; static fn_str_dtor Str_dtor;

static void vc_str_init(void){                      // chamar 1x no init do launcher
    void* g = dlopen("libgnustl_shared.so", RTLD_NOW|RTLD_NOLOAD); // já está carregado
    if(!g) g = RTLD_DEFAULT;
    Str_ctor = (fn_str_cstr)dlsym(g, "_ZNSsC1EPKcRKSaIcE");
    if(!Str_ctor) Str_ctor = (fn_str_cstr)dlsym(g, "_ZNSsC2EPKcRKSaIcE"); // fallback C2
    Str_dtor = (fn_str_dtor)dlsym(g, "_ZNSsD1Ev");
    if(!Str_dtor) Str_dtor = (fn_str_dtor)dlsym(g, "_ZNSsD2Ev");          // fallback D2
}

// 'slot' = buffer de 4 bytes alinhado (o objeto std::string). Passa-se &slot às funções do jogo.
static inline void vc_mkstr (void** slot, const char* c){ char a; Str_ctor((void*)slot, c, &a); }
static inline void vc_delstr(void** slot){ Str_dtor((void*)slot); }
```

Símbolos gnustl úteis (todos `U`, resolvidos de `libgnustl_shared.so`):

| Mangled | Papel |
|---|---|
| `_ZNSsC1EPKcRKSaIcE` | `string(char const*, allocator const&)` — **construir** de C-string (via recomendada) |
| `_ZNSsC1EPKcjRKSaIcE` | `string(char const*, uint len, allocator const&)` — construir com len explícito (bytes com `\0`) |
| `_ZNSsD1Ev` | `~string()` — **destruir** o temporário |
| `_ZNSsC1ERKSs` | copy-ctor (o jogo usa p/ guardar name/address no servidor) |
| `_ZNSs6assignERKSs` | `assign` — `joinMultiplayer` usa p/ gravar o host em `mc+0x90` |

### 1.4 ABI por-valor: **caller-destroys** — PROVADO

`joinMultiplayer(std::string host, int port)` recebe `host` **por valor**, passado como ponteiro em `r1`. No corpo o jogo **reusa** o arg (faz `mc.mConnectedServer.assign(host)`) e **NUNCA o destrói** → quem chama é responsável pelo dtor.

**Prova `[✓ sessão]` em `joinMultiplayer` @`0x6cfc30`:**
```
6cfc3e: mov   r8, r1            ; r8 = &host (preservado o tempo todo)
...
6cfce0: add.w r0, r4, #0x90     ; r0 = &mc.mConnectedServer
6cfce6: blx   _ZNSs6assignERKSs ; mConnectedServer.assign(host)   <- REUSA
6cfcec: strh.w r7, [r4, #0x94]  ; mc.mConnectedPort = (u16)port
```
Nenhum `~string` sobre `r8` em todo o corpo ⇒ **padrão fixo: ctor → chamada → dtor** (destruir **depois**, nunca antes).

### 1.5 Via alternativa SEM dlsym (fake `_Rep`) — menos limpa

Montar `{u32 len; u32 cap; i32 ref; char data[];}` e usar `&data` como `_M_p`, com `ref = 0x7FFFFFFF`. `_M_is_leaked()` = `(ref<0)` dá falso ⇒ cópias fazem `_M_refcopy` (inc atômico); `_M_dispose` decrementa mas nunca chega a 0 ⇒ buffer estático nunca é liberado. Funciona por `const&` e por valor, mas **vaza** se o jogo reatribuir por cima. Buffer precisa ser **estático/persistente** (o jogo guarda via `assign/refcopy` e pode ler depois da chamada). Prefira a §1.3.

---

## 2. SINGLEPLAYER — mundos locais

### 2.1 Visão geral

A lista de mundos vive num `PlayScreenModel`, **não** no `MinecraftClient`. O `MinecraftClient` não guarda um `PlayScreenModel` persistente (`repopulatePlayScreenWorlds` @`0x6cde48` passa por `chooser->getPlayScreen()`, exige a PlayScreen nativa viva). **Solução:** criamos nosso próprio `PlayScreenModel` transiente, populamos, lemos e lançamos — tudo sem a tela nativa.

### 2.2 Structs

```c
// PlayScreenModel (sizeof ~0xD8; o ctor escreve até +0xd4). Alocar ZERADO >= 0x100.
//  +0x00  vtable
//  +0x0c  MinecraftClient*          (gravado pela base MinecraftScreenModel no ctor)
//  +0x18  u8 isDirty
//  +0x1c / +0x20   vector<LocalWorldInfo>  LOCAL  (start/finish; stride 0x40)   <- NOSSO ALVO
//  +0x28 / +0x2c   vector<NetworkWorldInfo> NWT=3 (stride 0xC0)
//  +0x34 / +0x38   vector<NetworkWorldInfo> NWT=1 (stride 0xC0)
//  +0x40 / +0x44   vector<NetworkWorldInfo> NWT=2 (stride 0xC0)
//  +0x4c / +0x50   vector<RealmsWorldInfo>  REALMS (stride 0x1c)   [fora do escopo]

// LocalWorldInfo (0x40 bytes):
//  +0x10 std::string NOME de exibição   (getWorldName -> this+0x10)
//  +0x14 std::string/escalar "date"     (getDate -> this+0x14)
//  +0x18 int GameType                   (getGameType -> this+0x18)
//  +0x1c u8 hasLocalStorage ; +0x1d u8 hasCloudStorage
//  +0x20 std::string folder/levelId     (pasta no disco)
//  +0x24 std::string name (cópia)
//  +0x28..0x37 escalares da LevelSummary ; +0x38 u64 lastPlayed

// LevelSummary (0x20 bytes): +0x0 folder(str) +0x4 name(str) +0x8 int +0xc GameType +0x10 int +0x14 int +0x18 u64 lastPlayed
```

Offsets do vetor LOCAL, da stride `0x40` e do nome `[✓ sessão]`:
- `getLocalWorldAtIndex(int)` @`0x8404f8`: `ldr r2,[r0,#0x1c]; ldr r0,[r0,#0x20]; sub; asr #6` (count=(finish-start)/0x40) e `add r0, r2, r1, lsl #6` (= `start + i*0x40`), NULL se fora de faixa.
- `getWorldCount` @`0x842da0`: LOCAL lê `+0x1c/+0x20` `>>6`; NETWORK lê `+0x28/+0x34/+0x40` com stride `0xC0`; REALMS `+0x4c/+0x50` stride `0x1c`.
- `LocalWorldInfo::getWorldName` @`0x83e004`: `adds r0,#0x10; bx lr` ⇒ nome em `+0x10`.
- Ctor `PlayScreenModel` @`0x83fb30`: chama a base (`blx 0x5a6e6c` → grava client em `+0xc`), seta vtable em `+0x0`, `strb 0,[r0,#0x18]` (isDirty), zera os vetores e escreve até `+0xd4`.
- `startWorld` @`0x84139c`: valida índice contra o vetor LOCAL (`+0x1c/+0x20 >>6`) quando `WorldType==0`.

### 2.3 Símbolos

| Função | VA | Papel |
|---|---|---|
| `PlayScreenModel::PlayScreenModel(MinecraftClient&)` | `0x83fb30` `[✓]` | ctor; base grava client em `+0xc`, zera vetores |
| `PlayScreenModel::~PlayScreenModel()` (D1/D2) | `0x83fc10` `[RE]` | dtor a usar + `free` do nosso bloco. **NÃO** usar `0x83fef0` (D0 deleting → faria `operator delete`) |
| `PlayScreenModel::_populateLocalWorlds()` | `0x8405c8` `[RE]` | enche `+0x1c/+0x20` via `getLevelSource(getServer())->getLevelList()` |
| `PlayScreenModel::repopulateLocalWorlds()` | `0x84373c` `[RE]` | refresh público (alternativa; mesmo vetor) |
| `PlayScreenModel::getLocalWorldAtIndex(int)` | `0x8404f8` `[✓]` | `start + i*0x40` (NULL se inválido) |
| `PlayScreenModel::getWorldCount(WorldType,NetworkWorldType)` | `0x842da0` `[✓]` | contagem por tipo |
| `PlayScreenModel::startWorld(int,WorldType,NetworkWorldType)` | `0x84139c` `[✓]` | **LANÇAR** — entrada fiel ao toque nativo |
| `PlayScreenModel::_startLocalWorld(int)` | `0x8416e8` `[RE]` | launch direto (bypass do diálogo data-loss) |
| `PlayScreenModel::_willCauseDataLossUponSave(int,WorldType)` | `0x8415c0` `[RE]` | gate dentro de `startWorld` |
| `PlayScreenModel::removeWorld(int,WorldType,NetworkWorldType)` | `0x842aac` `[RE]` | deletar (há `_removeLocalWorld` @`0x842ba4`) |
| `LocalWorldInfo::getWorldName() const` | `0x83e004` `[✓]` | `this+0x10` |
| `MinecraftClient::getServer()` | `0x6c1c90` `[RE]` | `= *(mc+0x50)` (fonte do level source) |
| `MinecraftClient::startLocalServer(std::string,std::string,LevelSettings)` | `0x6c985c` `[RE]` | alvo final de `_startLocalWorld` (carrega o mundo) |

### 2.4 Código — enumerar + lançar

```c
typedef void  (*fn_psm_ctor) (void* m, void* client);         // 0x83fb30
typedef void  (*fn_psm_dtor) (void* m);                       // 0x83fc10 (D1/D2)
typedef void  (*fn_psm_pop)  (void* m);                       // 0x8405c8 _populateLocalWorlds
typedef void* (*fn_psm_at)   (void* m, int i);               // 0x8404f8 -> LocalWorldInfo*
typedef int   (*fn_psm_start)(void* m,int i,int wt,int nwt); // 0x84139c startWorld
typedef void  (*fn_psm_slw)  (void* m,int i);                // 0x8416e8 _startLocalWorld (bypass)

#define PSM_SIZE 0x100   // >= sizeof (~0xD8); bloco nosso, zerado

// --- abrir a tela Singleplayer: 1 model, popular UMA vez ---
void* vc_worlds_open(void){
    if(!*(void**)((char*)g_mc + 0x50)) return 0;     // guarda: getServer() != NULL
    void* m = calloc(1, PSM_SIZE);                    // ZERADO
    ((fn_psm_ctor)VC_CALL(0x83fb30))(m, g_mc);        // grava model+0xc = g_mc
    ((fn_psm_pop) VC_CALL(0x8405c8))(m);              // enche model+0x1c/+0x20
    return m;
}
void vc_worlds_refresh(void* m){ ((fn_psm_pop)VC_CALL(0x8405c8))(m); } // após deletar/mudar
void vc_worlds_close  (void* m){ ((fn_psm_dtor)VC_CALL(0x83fc10))(m); free(m); }

// --- (1) contagem + nome + pasta ---
int vc_world_count(void* m){
    void* s = *(void**)((char*)m + 0x1c);
    void* f = *(void**)((char*)m + 0x20);
    return (int)(((uintptr_t)f - (uintptr_t)s) / 0x40);     // == getWorldCount(m,0,0)
}
const char* vc_world_name(void* m, int i){                  // nome de exibição (UTF-8, NUL-term)
    void* w = ((fn_psm_at)VC_CALL(0x8404f8))(m, i);
    return w ? str_data((char*)w + 0x10) : 0;               // LocalWorldInfo+0x10 (gnustl _M_p)
}
const char* vc_world_folder(void* m, int i){               // levelId/pasta (se precisar)
    void* w = ((fn_psm_at)VC_CALL(0x8404f8))(m, i);
    return w ? str_data((char*)w + 0x20) : 0;
}
// comprimento do nome, se precisar cortar: str_len((char*)w + 0x10)

// --- (2) lançar o mundo i (fiel ao toque nativo) ---
void vc_world_launch(void* m, int i){
    ((fn_psm_start)VC_CALL(0x84139c))(m, i, 0 /*WorldType::LOCAL*/, 0 /*NetworkWorldType*/);
    // interno: se !_willCauseDataLossUponSave -> _startLocalWorld(i)
    //          -> MinecraftClient::startLocalServer(folder, name, LevelSettings())
}
// bypass do diálogo data-loss (mundo que pediria upgrade/conversão):
void vc_world_launch_force(void* m, int i){ ((fn_psm_slw)VC_CALL(0x8416e8))(m, i); }
```

**Fluxo:** ao entrar na nossa tela Singleplayer, `vc_worlds_open()` **uma vez** (guarde o ponteiro). A cada frame desenhe lendo `vc_world_count()`/`vc_world_name()`. No `h_press`, ao tocar o item `i`, `vc_world_launch(m,i)` e **retorne** (consuma o toque). Ao sair, `vc_worlds_close(m)` (ou destrua logo após o launch — o `startLocalServer` já copiou o que precisa).

---

## 3. MULTIPLAYER — servidores externos

### 3.1 Instância e container — PROVADO (unordered_map, **não** vector)

`ExternalServerFile* f = *(void**)((char*)g_mc + 0x64)`.
**Prova `[✓ sessão]` — `MinecraftClient::getExternalServer` @`0x6cd714`:** `ldr r0,[r0,#0x64]; bx lr`.

O container é o **primeiro membro** de `ExternalServerFile` (offset 0).
**Prova `[✓ sessão]` — `ExternalServerFile::getExternalServers` @`0x6bd4ec`:** só `bx lr` (devolve `this`).

Esse membro é um `std::unordered_map<int, std::unique_ptr<ExternalServer>>` (gnustl `_Hashtable`), **confirmado `[✓ sessão]`** por `addServer` (aloca nó de `0xc` bytes, usa `buckets@file+0x0` e `bucket_count@file+0x4`, id auto, `operator new(0x2c)`) e por `save` (percorre a lista encadeada a partir de `file+0x8`). *(A nota "vector de ponteiros" de uma das frentes está desatualizada — é hashtable.)*

```c
// ExternalServerFile (gnustl _Hashtable no offset 0):
//  +0x00  _M_buckets               (array de ponteiros p/ 1º nó do bucket)
//  +0x04  _M_bucket_count
//  +0x08  _M_before_begin._M_nxt   (CABEÇA da lista encadeada de TODOS os nós)  <- iterar aqui
//  +0x0c  _M_element_count
//  +0x10  max_load_factor (float)
//  +0x14  _M_next_resize
//  +0x18  _M_single_bucket
//  +0x1c+ helpers/caminho do arquivo

// _Hash_node (0xc bytes):  +0x00 next ; +0x04 int key(==id) ; +0x08 ExternalServer*

// ExternalServer (0x2c bytes):
//  +0x00 shared_ptr/ip resolvido (NULL até resolve(); getIP THROWS se NULL)
//  +0x08 int id (== chave)          +0x0c int port
//  +0x10 int protocol               +0x14 int players        +0x18 int maxPlayers
//  +0x1c std::string name           +0x20 std::string title  +0x24 std::string version
//  +0x28 std::string address (HOST que o usuário digitou)
```

**Prova `[✓ sessão]` — `save` @`0x6bd450`:**
```
6bd480: ldr r6, [r5, #0x8]   ; r6 = cabeça (file+0x8)
...loop:
6bd48c: ldr r0, [r6, #0x8]   ; r0 = node->server (node+0x8)
6bd48e: ldr r1, [r0, #0xc]   ;      port   (server+0xc)
6bd490: ldr r2, [r0, #0x8]   ;      id     (server+0x8)
6bd492: ldr r3, [r0, #0x1c]  ;      name   (server+0x1c, _M_p)
6bd494: ldr r0, [r0, #0x28]  ;      address(server+0x28, _M_p)
6bd4a2: ldr r6, [r6]         ; node = node->next (node+0x0)
```
**Prova `[✓ sessão]` — `addServer` @`0x6bd4f0`:** `ldr r9,[r0]`/`ldr r8,[r0,#4]` (buckets/count), dedup por **address+port** (`ldr [r11,#-12]` vs `ldr [r0,#-12]` e `cmp port`), nó novo `operator new(0xc)` com `str r6,[r3,#4]` (key=id), `ExternalServer` `operator new(0x2c)`, varredura de id `1..0xEA5F` (`movw r0,#0xea60; cmp; blt`), retorna `bool` (`movs r0,#1` sucesso / `movs r0,#0` duplicata).

### 3.2 Conectar — PROVADO

`MinecraftClient::joinMultiplayer(std::string host, int port)` @`0x6cfc30` é **auto-navegante**: grava `host` em `mc+0x90` (via `assign`), `port` (u16) em `mc+0x94`, e dispara o evento de conexão — o engine vai sozinho para loading/in-game. **Não** precisa de `PlayScreenModel` vivo nem de `ExternalServer::resolve`. `host` pode ser hostname OU IP (o engine resolve).
**Gate:** se `*(mc+0x18c)==NULL` cai no caminho de throw (`6cfcd6: ldr r0,[r4,#0x18c]; cbz r0, ...`). Em runtime normal (jogo no menu/estável) está preenchido.
Destinos provados `[✓ sessão]`: `getConnectedServer` @`0x6cd740` = `adds r0,#0x90`; `getConnectedPort` @`0x6cd744` = `ldrh r0,[r0,#0x94]`.

> **Não usar** `_startExternalNetworkWorld(int)` @`0x84240c`: depende do pipeline ServerLocator/DNS do `PlayScreenModel` vivo (`+0x40/+0x44`), inviável sem a PlayScreen MVC. `joinMultiplayer` é o caminho certo e muito mais barato.

### 3.3 Símbolos

| Função | VA | Papel |
|---|---|---|
| `MinecraftClient::getExternalServer() const` | `0x6cd714` `[✓]` | `*(mc+0x64)` → `ExternalServerFile*` |
| `ExternalServerFile::getExternalServers()` | `0x6bd4ec` `[✓]` | `bx lr` → `this` (map no offset 0) |
| `ExternalServerFile::addServer(string const&, string const&, int)` | `0x6bd4f0` `[✓]` | add(name,address,port); id auto `1..59999`; `bool` (false=duplicata); **NÃO salva** |
| `ExternalServerFile::removeServer(int)` | `0x6bd6a0` `[RE]` | remove pela **CHAVE** (id); **NÃO salva** |
| `ExternalServerFile::editServer(int, string const&, string const&, int)` | `0x6bd620` `[RE]` | edit por chave; **NÃO salva** |
| `ExternalServerFile::save()` | `0x6bd450` `[✓]` | persiste (itera `file+0x8`); chamar após add/remove/edit |
| `MinecraftClient::joinMultiplayer(std::string, int)` | `0x6cfc30` `[✓]` | **CONECTAR**; host por-valor (passar `&temp`) |
| `ExternalServer::getName() const` | `0x6bcb60` `[RE]` | `this+0x1c` |
| `ExternalServer::getAddress() const` | `0x6bcb84` `[RE]` | `this+0x28` (host) |
| `ExternalServer::getPort() const` | `0x6bcb58` `[RE]` | `*(this+0xc)` |
| `ExternalServer::getId() const` | `0x6bcb3c` `[RE]` | `*(this+0x8)` (== chave) |
| `ExternalServer::getIP() const` | `0x6bcafc` `[RE]` | **EVITAR na lista**: lê `+0x00` e dá throw se NULL — use `getAddress` |
| `ExternalServer::resolve()` | `0x6bc65c` `[RE]` | DNS/ping assíncrono (preenche players/maxplayers); só p/ refresh, não p/ conectar |

### 3.4 Código — listar + conectar + add + remover + editar

```c
typedef bool  (*fn_add) (void* f, void* name, void* addr, int port);        // 0x6bd4f0
typedef void* (*fn_rem) (void* f, int id);                                  // 0x6bd6a0
typedef void* (*fn_edit)(void* f, int id, void* nm, void* ad, int p);       // 0x6bd620
typedef void  (*fn_save)(void* f);                                          // 0x6bd450
typedef void  (*fn_join)(void* mc, void* host /*std::string*/, int port);   // 0x6cfc30

#define ES_ID 0x08
#define ES_PORT 0x0c
#define ES_NAME 0x1c      // std::string
#define ES_ADDR 0x28      // std::string (host)

static inline void* vc_extfile(void){ return *(void**)((char*)g_mc + 0x64); }

// ================= (1) LISTAR (iterar a cabeça em file+0x8) =================
typedef struct { int id; const char* name; const char* host; int port; } VcServer;

int vc_list_servers(VcServer* out, int cap){
    void* f = vc_extfile(); if(!f) return 0;
    void* node = *(void**)((char*)f + 0x08);          // _M_before_begin._M_nxt
    int n = 0;
    for(; node && n < cap; node = *(void**)node){      // node->next em +0x00
        void* s = *(void**)((char*)node + 0x08);       // node->server em +0x08
        if(!s) continue;
        out[n].id   = *(int*)((char*)s + ES_ID);       // == *(int*)(node+0x04)
        out[n].name = str_data((char*)s + ES_NAME);    // NUNCA getIP (throw se não-resolvido)
        out[n].host = str_data((char*)s + ES_ADDR);
        out[n].port = *(int*)((char*)s + ES_PORT);
        n++;
    }
    return n;
}

// ================= (2) CONECTAR (ctor -> join -> dtor) =================
void vc_connect_host(const char* host, int port){     // host = IP ou hostname
    void* hs; vc_mkstr(&hs, host);                     // temp gnustl string (nosso)
    ((fn_join)VC_CALL(0x6cfc30))(g_mc, &hs, port & 0xFFFF); // engine navega sozinho
    vc_delstr(&hs);                                    // nós destruímos (callee não destrói)
}
void vc_connect_index(int i){
    VcServer v[64]; int n = vc_list_servers(v, 64);
    if(i >= 0 && i < n) vc_connect_host(v[i].host, v[i].port);
}

// ================= (3) ADICIONAR (add + save) =================
bool vc_add_server(const char* name, const char* host, int port){
    void* f = vc_extfile(); if(!f) return false;
    void *ns, *as; vc_mkstr(&ns, name); vc_mkstr(&as, host);
    bool ok = ((fn_add)VC_CALL(0x6bd4f0))(f, &ns, &as, port & 0xFFFF); // false = duplicata
    vc_delstr(&ns); vc_delstr(&as);
    if(ok) ((fn_save)VC_CALL(0x6bd450))(f);            // addServer NÃO persiste sozinho
    return ok;
}

// ================= (4) REMOVER (por id/chave; vem de vc_list_servers) =================
void vc_remove_server(int id){
    void* f = vc_extfile(); if(!f) return;
    ((fn_rem)VC_CALL(0x6bd6a0))(f, id);
    ((fn_save)VC_CALL(0x6bd450))(f);
}

// ================= (bônus) EDITAR =================
void vc_edit_server(int id, const char* name, const char* host, int port){
    void* f = vc_extfile(); if(!f) return;
    void *ns, *as; vc_mkstr(&ns, name); vc_mkstr(&as, host);
    ((fn_edit)VC_CALL(0x6bd620))(f, id, &ns, &as, port & 0xFFFF);
    vc_delstr(&ns); vc_delstr(&as);
    ((fn_save)VC_CALL(0x6bd450))(f);
}
```

**Fluxo:** ao abrir a tela Multiplayer, desenhe com `vc_list_servers()` (barato; pode chamar por frame, mas se guardar ponteiros além do frame, **copie** para buffer próprio — um add/remove/save pode realocar/liberar). No `h_press` de um item: `vc_connect_index(i)` e retorne. Botões add/remover/editar chamam os helpers correspondentes (cada um já faz `save()`).

---

## 4. Riscos e perguntas em aberto

### 4.1 Riscos
- **Thread:** tudo na thread do jogo (`update`/`press`), nunca em `swapBuffers`. `save()` faz IO de arquivo — pode custar 1 frame; aceitável fora do render.
- **`std::string` do launcher é libc++ (NDK r27), ABI incompatível** com a gnustl COW de 4 bytes. **Nunca** passar `std::string` do launcher para as funções do jogo — só os temporários da §1.3.
- **Passar o ponteiro CERTO:** a `joinMultiplayer`/`addServer`/`editServer` passa-se o **endereço do objeto** `std::string` (o slot de 4 bytes), **não** o `_M_p` nem a `char*`. Confundir = ler/escrever heap errado.
- **caller-destroys:** construir o temp, chamar, e só **depois** destruir (o jogo lê/`assign` durante a chamada). Destruir antes = UAF; não destruir = leak.
- **`joinMultiplayer` exige `mc+0x18c != NULL`** senão throw — só chamar com o jogo já no menu/estável.
- **Ciclo de vida do `PlayScreenModel`:** alocar bloco nosso ZERADO (`calloc`, `0x100`); destruir com `~PlayScreenModel` @`0x83fc10` (D1/D2) e **depois** `free()`. **NÃO** usar `0x83fef0` (D0 deleting → `operator delete` no nosso bloco). A base registra o model como observer do client no ctor; garantir que o dtor rode para desregistrar.
- **`_populateLocalWorlds` deref `getServer()` (= `*(mc+0x50)`) e o level source sem checagem de null.** `vc_worlds_open` já checa `*(mc+0x50)!=0` antes.
- **Strings são COW/compartilhadas:** só leitura. Ponteiros de `vc_list_servers`/`vc_world_name` apontam para o `_M_p` **vivo** dentro do engine; copie se for guardar além do frame.
- **`addServer` rejeita duplicata** (mesmo address+port) → `false`; tratar na UI. **remove/edit são por ID (chave)**, não por índice da lista — capturar o id na enumeração (há buracos: id ≠ posição). Limite prático de ids `1..59999`.
- **Não reconstruir o `PlayScreenModel` a cada frame:** 1x ao abrir, reusar; repopular só no refresh/após deletar.

### 4.2 Perguntas em aberto (validar no device)
- `sizeof(PlayScreenModel)` exato: ctor escreve até `+0xd4` ⇒ ~`0xD8`; `calloc(0x100)` é seguro. Confirmar.
- `repopulateLocalWorlds()` @`0x84373c` (público) vs `_populateLocalWorlds()` @`0x8405c8`: ambos enchem `+0x1c/+0x20`; o público pode marcar dirty/notificar. `_populateLocalWorlds` basta; validar se o público é preferível.
- Confirmar visualmente que `LocalWorldInfo+0x10` é o nome humano (não a pasta). `getWorldName=+0x10` / folder=`+0x20` indicam que sim.
- `save()` escreve em qual arquivo (campo em `file+0x1c`)? Não desmontado; não é necessário p/ chamar — mas confirmar que a lista persiste após reabrir.
- Nomes mangled exatos do gnustl (`C1` vs `C2`, `D1` vs `D2`) presentes em `libgnustl_shared.so` — o código já tenta ambos via `dlsym`.
- Confirmar empiricamente que `ctor → joinMultiplayer → dtor` não causa double-free (prova é por ABI/disassembly, não por execução) e que a transição p/ loading ocorre com **1** chamada.
- `protocol/version/players/maxPlayers` só são preenchidos após `resolve()`/ping. Para mostrar contagem de players na UI, agendar `resolve()` periódico (como o `_populateNetworkWorlds` nativo faz) — fora do escopo de conectar.
- `LevelSettings()` tem ctor default por PLT (`_ZN13LevelSettingsC1Ev`); VA real não estava no grep de símbolos. Só necessário se for lançar sem model via `startLocalServer` @`0x6c985c` — o caminho `startWorld` dispensa.