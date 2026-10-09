# VOID_GUISCALE_APPLY_RE — Re-aplicar o GUI Scale no HUD in-game

**Alvo:** MCPE 0.15.10, `armeabi-v7a`, Thumb-2 (`libminecraftpe.so`).
**ABI:** armeabi-v7a *softfp* — argumentos `float`/`double` passam em registradores de núcleo (r0/r3), não em s0/d0. Isso é visível no binário e importa para os `typedef` abaixo.
**Convenção de endereço:** todo VA abaixo é *file-offset = VA*. Em runtime, somar `base` (endereço de carga da lib). Funções Thumb → setar bit0 do ponteiro.
**Status das afirmações:** tudo marcado como confirmado foi lido/desmontado diretamente no binário. `(a confirmar)` = inferência ou medição de runtime pendente.

> **Correção herdada:** uma das frentes citou `Options::getGuiScale @0x928f00`. **Errado.** `0x928f00` é `Options::getCameraSpeed` (`ldr r0,[r0,#0xf4]`). O símbolo correto é **`_ZNK7Options11getGuiScaleEv @0x928f10`**. Toda esta doc usa 0x928f10.

---

## 1. Option (0-4) → guiScale EFETIVO do HUD

### 1.1 Visão geral do pipeline (confirmado)

```
opts+0xf8 (0..4)
   │  Options::getGuiScale() @0x928f10  (gate VR: só vale se opts+0x4c==0)
   ▼
MinecraftClient::calculateGuiScale(int option) @0x6ce124
   │   effIdx = clamp( screenMax(tela, regra) + option , 0 , 7 )
   │   (se getUIScalingRules()==1  →  option é FORÇADO a 0)
   │   scale  = GUI_SCALE_VALUES[effIdx]           // @0x1546284 = {1,2,3,4,5,6,7,8}
   ▼
GuiData::setGuiScale(float scale) @0x749e64        // estática, float em r0
   │   *GuiData::GuiScale    = scale               // @0x16a300c (.data)
   │   *GuiData::InvGuiScale = 1.0f/scale          // @0x16aecf4 (.bss)
   ▼
HUD lê ESSES GLOBAIS por frame (getGuiScale/getInvGuiScale/acesso direto)
```

O option **não é índice absoluto**: é um *offset aditivo* sobre um piso (`screenMax`) derivado da resolução. `option=0` = escala automática pura da tela.

### 1.2 `calculateGuiScale(int option) @0x6ce124` — desmontagem confirmada

- Carrega `r7 = *(mc+0x40)` (largura px) e `r6 = *(mc+0x44)` (altura px).
- Chama `AppPlatform::getUIScalingRules()` (via PLT `0x5981c0`) e ramifica a **fórmula** por regra:

| regra | ramo | fórmula do `min_tiles` (confirmada numericamente) |
|---|---|---|
| **0** `LARGE` | `0x6ce1c2` | `min( largura/384 , altura/250 )` (float) — magics `0xae4c415d` asr8 / `0x10624dd3` asr4 |
| **1** `SMALL-FLOAT` | `0x6ce15e` | `min( largura/320 , altura/216 )` (float) — magics `0x66666667` asr7 / `0x9c09c09d` asr7 **+ FORÇA option=0** |
| **≥2** `SMALL-INT` | `0x6ce228` | buckets de largura (inteiro) |

- **Buckets SMALL-INT (literais do binário, exatos):**
  `>3600 (0xe10) → 7` · `>2000 (0x7d0) → 5` · `>1280 (0x500) → 3` · `≥860 (0x35c) → 2` · `>480 (0x1e0) → 1` · senão `0`.
- Nos ramos float, `screenMax ≈ floor(min_tiles) − 1`, clamp `[0,7]` (árvore de `vcmpe` contra 1.0,2.0,…,8.0). O mapeamento fino pode variar ±1 tile em resoluções não testadas — *(a confirmar)*. `screenMax` é gravado em `mc+0x48`.
- **Force-0 (confirmado @0x6ce31c-0x6ce334):** `if (option >= 1 && getUIScalingRules() == 1) option = 0;`
- **Soma + clamp (confirmado @0x6ce336-0x6ce344):** `effIdx = clamp(screenMax + option, 0, 7)`.
- **Lookup + aplicação (confirmado @0x6ce346-0x6ce352):** `scale = GUI_SCALE_VALUES[effIdx]` e `GuiData::setGuiScale(scale)` (mesmo stub PLT `0x5992f4` usado por `setUISizeAndScale`).

### 1.3 Tabela de valores (confirmada, lida do .rodata)

`MinecraftClient::GUI_SCALE_VALUES @0x1546284` = `{1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}` (8 floats). Logo `scale = effIdx + 1.0`.

### 1.4 Onde o HUD lê (confirmado)

O guiScale efetivo é **global, não campo de objeto**:
- `GuiData::GuiScale @0x16a300c` (.data, float) — escala efetiva. GOT GLOB_DAT `0x167d36c`.
- `GuiData::InvGuiScale @0x16aecf4` (.bss, float = 1/escala). GOT GLOB_DAT `0x167d368`.
- `GuiData::getGuiScale() @0x749714` = `return *0x16a300c` (**ignora o `this`**).
- `GuiData::getInvGuiScale() @0x7496c4`, `getScreenWidth() @0x7490ec`, `getScreenHeight() @0x749120` multiplicam pelo `InvGuiScale` global.

**Por isso o nosso `Options::set` sozinho não reescala:** ele grava `opts+0xf8` e dispara int-observers, mas **nada** atualiza esses globais. Os globais só mudam quando `GuiData::setGuiScale` roda (ou seja, via `calculateGuiScale` ou `setUISizeAndScale`). `getGuiScale(int) @0x6cde24` é só helper de lookup da tabela — **não** é lido por frame.

### 1.5 Por que "muda muito pouco" (clamp/piso)

O `screenMax` é um **piso**: o option só soma por cima, nunca abaixo dele; e o topo satura em `effIdx=7` → `8.0`.

- **Em tela grande (ex.: 1080p no PC):** `screenMax` já é alto → o option varia pouco (poucos passos antes de saturar em 8.0) e **nunca** deixa o HUD ficar pequeno (não desce abaixo do piso). Isso explica "não fica no tamanho que deveria".
- **Se `getUIScalingRules()==1` (perfil `SMALL-FLOAT`, típico de celular):** o option é **forçado a 0** → o slider **não faz absolutamente nada**, HUD travado na escala automática da tela. Este é o cenário mais provável de "muda nada" no A71/Poco. **Medir no device** (ver §3).

---

## 2. Como re-aplicar no HUD live (após o nosso `Options::set`)

Chamar **na thread do jogo** (hook de `update`/press), **nunca na de render**. Sequência: `Options::set(opt,idx)` → `Options::save()` → *forçar recompute*.

```c
/* base = endereço de carga de libminecraftpe.so; g_slide == base */
#define VC_CALL(va) ((void*)(((uintptr_t)g_slide + (uintptr_t)(va)) | 1u)) /* Thumb: |1 */

/* ---- VIA (B) RECOMENDADA: recompute completo, igual ao resize nativo ---- */
typedef void (*fn_setui)(void* mc, int w, int h, float scaleArg); /* @0x6cdf64 */
void vc_guiscale_apply_live(void* g_mc) {
    int w = *(int*)((char*)g_mc + 0x40);   /* largura px (gravada pelo último resize) */
    int h = *(int*)((char*)g_mc + 0x44);   /* altura  px */
    ((fn_setui)VC_CALL(0x6cdf64))(g_mc, w, h, 0.0f); /* scaleArg=0 => re-lê o option */
}
```

**O que `setUISizeAndScale(mc,w,h,0.0f) @0x6cdf64` faz (confirmado):**
1. grava `w→mc+0x40`, `h→mc+0x44`; aplica defaults (w=0→240, h=0→140) e ajuste Kindle Fire;
2. `scaleArg==0.0f` → `opt = Options::getGuiScale(opts) @0x928f10` → `MinecraftClient::calculateGuiScale(mc, opt) @0x6ce124` → atualiza os globais `GuiScale/InvGuiScale`;
3. dispara o relayout: `Options::onScreenSizeChanged`, `PixelCalc::setPixelsPerMillimeter`, `GuiData::onConfigChanged(Config&) @0x749eb4` em `mc+0x134`, idem `mc+0x128`, `MobEffectsLayout::onConfigChanged` em `mc+0x14c`, e `Screen::setSize` nas telas visíveis.

Cada alvo tem **guarda de null** → a chamada é **segura fora do jogo** (no menu só atualiza os globais e pula os subsistemas inexistentes). Guarda in-game explícita é **opcional**; se quiser evitar trabalho inútil no menu:

```c
if (*(void**)((char*)g_mc + 0x134) != NULL) { /* mc+0x134 = GuiData*, nulo no menu */
    vc_guiscale_apply_live(g_mc);
}
```

### 2.1 Alternativas

**(A) Mínimo cirúrgico** — só recomputa a escala (sem `onConfigChanged`/`onScreenSizeChanged`). Passe o **option como ARG** (a função NÃO re-lê `opts`):
```c
typedef void (*fn_calc)(void* mc, int option);       /* @0x6ce124 */
((fn_calc)VC_CALL(0x6ce124))(g_mc, idxOption);       /* idxOption = 0..4 */
```
Atualiza os globais e o HUD reescala no próximo frame, **mas** não re-empurra o layout das telas. Preferir (B).

**(C) Bypass do clamp / do force-0** — para deixar o HUD menor do que o piso `screenMax` permite (ex. escala 2.0/3.0 em 1080p), ou quando `getUIScalingRules()==1` ignora o option. **Não use o option**; grave o global direto:
```c
typedef void (*fn_setscale)(float scale);            /* GuiData::setGuiScale @0x749e64 */
((fn_setscale)VC_CALL(0x749e64))(2.0f);              /* grava *GuiScale e *InvGuiScale=1/x */
```
`setGuiScale` é **estática** e recebe o float em r0 (ABI v7a softfp → o compilador já coloca `float` em r0; o `typedef void(*)(float)` funciona nativamente). Equivalente: `setUISizeAndScale(g_mc, w, h, 2.0f)` (ramo override em `0x6cdfb2`), que ainda dispara o relayout.
**Pegadinha do (C):** o override é sobrescrito no próximo resize/recompute (que re-roda `calculateGuiScale` com o option e re-aplica o clamp). Para persistir, re-chamar após cada resize ou interceptar.

**Destravar o option no caminho SMALL-FLOAT** (alternativa ao bypass): forçar regra LARGE antes de recomputar, para o option voltar a ter efeito:
```c
typedef void (*fn_setrules)(void* appPlat, int rule); /* AppPlatform::setUIScalingRules @0xb13ec0 */
/* rule=0 (LARGE). appPlat = g_mc->AppPlatform (ponteiro a confirmar no device). */
```
Efeito colateral: muda a curva de escala de TODA a UI para o perfil LARGE. Avaliar antes de usar.

### 2.2 Ler a escala efetiva atual (para a nossa UI)

```c
float s = *(float*)((uintptr_t)g_slide + 0x16a300c); /* GuiData::GuiScale */
```

### 2.3 Entrar num mundo já re-aplica?

**Não por si só.** O ctor `GuiData::GuiData() @0x746a88` **não** chama a cadeia de recompute (confirmado) — o global **persiste** do último `setUISizeAndScale` (startup/menu/último resize). Consequências:
- Mudar o option **sem forçar** → a escala nova só "pega" num resize / recriação de contexto gráfico seguinte.
- Mudar o option **e forçar** (via B) → o global já fica correto; o **próximo mundo herda** o valor certo (o global persiste), mesmo sem novo resize.

Gatilho: `setUISizeAndScale` é override virtual de `App::setUISizeAndScale @0x6b3530`, chamado pela plataforma em resize/criação de contexto gráfico. **Não existe observer de GUI_SCALE** que recompute — a tela de opções NATIVA reescala porque a transição/rebuild dela dispara o resize; a nossa UI custom não dispara nada, por isso **precisa forçar**.

---

## 3. Riscos + open questions

### Riscos
- **Thread:** forçar na thread de render pode corromper layout/race com o frame. Só na thread do jogo (hook `update`/press).
- **Via (C) volátil:** override de `setGuiScale` é apagado no próximo recompute; não serve como estado persistente sem re-hook.
- **`setUIScalingRules(0)` é global:** muda a escala de toda a UI, não só do HUD; pode deslocar menus/telas.
- **Persistência:** lembrar `Options::save() @0x927c74` ao fechar a tela para o valor sobreviver ao restart.

### Open questions
1. **Valor de `AppPlatform::getUIScalingRules()` no device (A71/Poco)** — *(a confirmar, medição runtime)*. Se `==1`, o option é ignorado (force-0) e **só** a via (C) ou `setUIScalingRules(0)` resolve. Medir antes de escolher a via.
2. **Gate VR `opts+0x4c`** — `Options::getGuiScale` retorna `0` se `opts+0x4c != 0`. Confirmar `opts+0x4c==0` (não-VR) no device para que a via (B) leia `opts+0xf8` *(a confirmar)*.
3. **Caller exato que dispara `setUISizeAndScale` na entrada em mundo** — nenhuma das frentes rastreou positivamente. O mecanismo de re-leitura (`f==0 → getGuiScale → calculateGuiScale`) está confirmado no código; "entrar num mundo re-aplica" depende de um resize/recriação de contexto ocorrer nesse momento *(a confirmar)*. Pela §2.3, forçar nós mesmos remove essa dependência.
4. **Cobertura total do relayout por uma só chamada** — confirmar in-game que `setUISizeAndScale(mc,*(mc+0x40),*(mc+0x44),0.0f)` reescala TODO o HUD (hotbar/slots/crosshair/chat) e não só parte; se algum elemento usar layout cacheado além de `onConfigChanged`, pode faltar um re-push de tela *(a confirmar)*.
5. **Caller em modo ARM** — a varredura de xref cobriu `.text` Thumb; a plataforma pode ter entrada ARM adicional. Não muda o método de forçar, só a lista de gatilhos nativos *(a confirmar)*.
6. **Mapeamento fino `min_tiles → screenMax`** — divisores 384/250 (LARGE) e 320/216 (SMALL-FLOAT) confirmados numericamente; o arredondamento da árvore `floor−1` pode variar ±1 tile em resoluções não testadas *(a confirmar)*.

---

## Apêndice — símbolos (todos confirmados no binário)

| Símbolo | VA | Papel |
|---|---|---|
| `MinecraftClient::setUISizeAndScale(int,int,float)` | `0x6cdf64` | **Gatilho de re-aplicação (via B).** `f==0`→recomputa do option + relayout; `f!=0`→override `setGuiScale(f)`. |
| `MinecraftClient::calculateGuiScale(int)` | `0x6ce124` | Core: `effIdx=clamp(screenMax(tela,regra)+option,0,7)`; force-0 se regra==1; lookup + `setGuiScale`. Usa o option do ARG. |
| `MinecraftClient::getGuiScale(int)` | `0x6cde24` | Helper lookup `GUI_SCALE_VALUES[clamp(idx,0,7)]`. NÃO lido por frame. |
| `MinecraftClient::GUI_SCALE_VALUES` | `0x1546284` | `.rodata`, 8 floats `{1..8}`. |
| `GuiData::setGuiScale(float)` | `0x749e64` | **Estática** (float em r0): `*GuiScale=x; *InvGuiScale=1/x`. Ponto de override (via C). |
| `GuiData::GuiScale` | `0x16a300c` | Global `.data` = escala efetiva do HUD. Ler/forçar aqui. GOT `0x167d36c`. |
| `GuiData::InvGuiScale` | `0x16aecf4` | Global `.bss` = 1/escala. GOT `0x167d368`. |
| `GuiData::getGuiScale()` | `0x749714` | `return *0x16a300c` (ignora `this`). |
| `GuiData::getInvGuiScale()` | `0x7496c4` | `return *0x16aecf4`. |
| `GuiData::onConfigChanged(Config const&)` | `0x749eb4` | vtable+8; relayout do HUD, chamado por `setUISizeAndScale`. |
| `GuiData::GuiData(MinecraftClient&,NetworkStatistics const*)` | `0x746a88` | Ctor do HUD; **NÃO** recomputa o global. |
| `Options::getGuiScale()` | `0x928f10` | `opts+0x4c? 0 : opts+0xf8`. (Não é 0x928f00.) |
| `Options::setGuiScale(int)` | `0x928f08` | `str r1,[opts+0xf8]`. |
| `Options::set(Option*,int)` | `0x92c0cc` | Grava campo + int-observers; **não** toca os globais. |
| `Options::save()` | `0x927c74` | Persistir após fechar a tela. |
| `Options::onScreenSizeChanged(int,int)` | `0x927264` | Notificado dentro de `setUISizeAndScale` (não essencial p/ escala). |
| `AppPlatform::getUIScalingRules()` | `0xb13ea8` | enum 0=LARGE,1=SMALL-FLOAT(force-0),2=SMALL-INT. |
| `AppPlatform::setUIScalingRules(rule)` | `0xb13ec0` | Grava `+0x84` e seta flag `+0x88`. Forçar 0 destrava o option. |
| `MinecraftClient::getGuiData()` | `0x6c1eb0` | `ldr r0,[r0,#0x134]` = GuiData* (nulo no menu). |
| `App::setUISizeAndScale(int,int,float)` | `0x6b3530` | Virtual base; ponto de entrada da plataforma no resize. |

**Campos de `mc` usados:** `mc+0x40` = largura px (int) · `mc+0x44` = altura px (int) · `mc+0x48` = `screenMax` base · `mc+0x134` = `GuiData*` · `mc+0x13c` = `Options*`.
