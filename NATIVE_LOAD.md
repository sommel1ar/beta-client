# Backend native-load (32-bit) no APK DEFAULT — receita reproduzível

Data: 2026-10-04 · Validado no **Samsung A71 (SM-A715F, Android 13)**, `com.mojang.minecraftpe` 0.15.10.

Como o launcher injeta código nativo no MCPE 0.15.10 **sem Toolbox e sem root**, mantendo a `libminecraftpe.so` **default/intacta**. Hook em runtime por nome de símbolo (a lib exporta ~42k símbolos C++).

---

## 1. Princípio
- O launcher público = **o próprio APK carrega o jogo** (modelo BlockLauncher/Toolbox/Lunar). Sem root não dá pra injetar no MC instalado de terceiros.
- A **lib do jogo nunca é modificada**. Nosso `libmodclient.so` é carregado junto e aplica os hooks **em memória** (`MSHookFunction`), depois que a lib carrega.
- **Nada de Toolbox/mcpelauncher** (`libtoolbox.so`, `libmcpelauncher-utils.so`). Só precisamos da lib default + a nossa + o loader do Substrate.

## 2. Base
APK **stock** da Mojang: `Minecraft-PE-0-15-10.apk` (`com.mojang.minecraftpe`, versionName 0.15.10.0).
- `lib/armeabi-v7a/`: **só** `libminecraftpe.so` (23.770.524 B = vanilla RE, offsets batem), `libfmod.so`, `libgnustl_shared.so`. Zero toolbox.
- `assets/resourcepacks/`: packs completos (vanilla + city + fantasy + natural + plastic). **Packs completos são obrigatórios** (packs faltando → crash de recursão, ver §6).
- Decodificado em `base-stock/` (apktool d).

## 3. Injeção (o que adicionamos na base)
Três coisas, só:
1. `lib/armeabi-v7a/libmodclient.so` — **nosso** backend (compilado de `native/jni/launcher.cpp`).
2. `lib/armeabi-v7a/libmobilesubstrate.so` — framework de hook (fornece `MSHookFunction`). NÃO é Toolbox. *(Futuro: implementar hook inline próprio e dispensar até o Substrate.)*
3. Duas linhas no smali da MainActivity, logo **após** `loadLibrary("minecraftpe")`:
   ```smali
   const-string v1, "mobilesubstrate"
   invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
   const-string v1, "modclient"
   invoke-static {v1}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V
   ```
   Arquivo: `base-stock/smali/com/mojang/minecraftpe/MainActivity.smali`.

`libmodclient` expõe `JNI_OnLoad` → cria uma thread worker → espera a `libminecraftpe.so` (`dlopen RTLD_NOLOAD` em loop) → `dlopen` do Substrate → `MSHookFunction` por nome.

## 4. ★ Fix de boot no Android 13 (OBRIGATÓRIO)
A base stock vem com `<application>` pelado e **targetSdk 22**. No Android 13 isso cai no **limbo da `ReviewPermissionsActivity`** → o app roda **sem acesso funcional ao `/sdcard`** → o jogo não abre a config de resource packs → **crash de recursão** (ver §6).

No `base-stock/`:
- `AndroidManifest.xml` → `<application ... android:requestLegacyExternalStorage="true" android:debuggable="true" ...>`
- `apktool.yml` → `targetSdkVersion: 23` (tira o limbo; **target 24 quebraria o Substrate** — SIGFPE no `dlsym_handle_lookup`).

E conceder storage por adb antes de abrir (o 0.15.10 é código de 2016, assume grant de install):
```
pm grant com.mojang.minecraftpe android.permission.WRITE_EXTERNAL_STORAGE
pm grant com.mojang.minecraftpe android.permission.READ_EXTERNAL_STORAGE
```

## 5. Build + install
Script: `build_stock.ps1` (compila o .so, copia as 2 libs, `apktool b`, assina debug).
- NDK r27c clang: `--target=armv7a-linux-androideabi21 -fPIC -shared -O2 -s -nostdlib++ -fno-exceptions -fno-rtti -llog -ldl`
- Assina com `cheats/toolbox-clean/debug.keystore` (alias `debug`, pass `android`) — **bate com o A71** (install -r sem conflito).
- Saída: `test/MCPE-0.15.10-stock-chatscroll.apk` (72.6 MB).

Install limpo:
```
adb uninstall com.mojang.minecraftpe
adb install test\MCPE-0.15.10-stock-chatscroll.apk
# grants de storage (ver §4)
adb shell am start -n com.mojang.minecraftpe/com.mojang.minecraftpe.MainActivity
```
Confirmação de sucesso no logcat (tag `BetaClient`):
```
BetaClient: JNI_OnLoad: Launcher injetado
BetaClient: hook _drawChatMessages=0x...
```
Mundos ficam em `/sdcard/games/com.mojang` (legado, sobrevive ao uninstall).

## 6. Armadilha: recursão do ResourcePackManager
`ResourcePackManager::_loadLastActiveResourcePacksFromFile` recursa infinito → SIGSEGV (stack overflow, Thread-5) quando o jogo **não consegue abrir** a config de packs em `/sdcard` OU quando **faltam packs** no APK. **Não é o nosso hook** (backtrace fica 100% dentro do jogo). RE completa e as duas causas em `~/.claude/.../memory/reference_mcpe_0151_poco_crash.md`. Mitigação = §4 (storage) + packs completos (§2).

## 7. Layout
```
_launcher/
  native/jni/launcher.cpp     backend nativo (JNI_OnLoad -> worker -> Substrate -> hook por nome) + features
  native/out/libmodclient.so  (build output; gitignored)
  base-stock/                 APK stock decodificado + nossa injeção (gitignored: binários Mojang)
  build_stock.ps1             compila + empacota + assina
  test/*.apk                  APK de teste (gitignored)
  re/CHAT_SCROLL_RE.md        RE da 1a feature (chat scroll — passada p/ outro dev)
  NATIVE_LOAD.md              este arquivo
```
Guard-rail: nunca versionar binário do Mojang, keystores, nem nada do emu32/ModPE privado (ver `.gitignore`).
