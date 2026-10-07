# Contribuindo com módulos — Void Client

Guia pra adicionar um **módulo** (feature) ao Void Client. A API do módulo está em
**[DOCUMENTATION.md](DOCUMENTATION.md)** — leia lá como escrever o código. Aqui é o
**fluxo de trabalho** (clonar → criar → buildar → testar → PR).

> Resumo: você cria **um** arquivo `.cpp` em `native/jni/modules/`, builda, testa no seu
> celular e abre um Pull Request. O mantenedor revisa, faz merge e gera o APK de release.

---

## 1. Pré-requisitos (uma vez)

**Ferramentas (PC Windows):**
- **Android NDK r27c** (pro `clang++`).
- **JDK 21** (pro `jarsigner` e pra rodar o apktool).
- **apktool** (`apktool.jar`).
- **adb** (platform-tools).

Aponte os paths por variável de ambiente (ou edite o topo do `build.ps1`):
```powershell
$env:VC_NDK     = "C:\...\android-ndk-r27c\toolchains\llvm\prebuilt\windows-x86_64\bin\clang++.exe"
$env:VC_JAVA    = "C:\...\jdk-21\bin\java.exe"
$env:VC_JSIGN   = "C:\...\jdk-21\bin\jarsigner.exe"
$env:VC_APKTOOL = "C:\...\apktool.jar"
$env:VC_ADB     = "C:\...\platform-tools\adb.exe"
```

**Celular (pra testar):**
- Android com o **Minecraft PE 0.15.10** instalado (`com.mojang.minecraftpe`) — o Void
  Client carrega o jogo instalado; **não** desinstale o MCPE.
- **adb** habilitado (USB ou Wi-Fi: `adb connect <ip>:5555`).

---

## 2. Fluxo de contribuição

```bash
# 1. clona o repo e cria sua branch
git clone <repo>
cd voidclient
git checkout -b modulo/meu-modulo

# 2. cria o módulo a partir do template
copy native\jni\modules\_template.cpp native\jni\modules\meu_modulo.cpp
#   -> edite meu_modulo.cpp (veja DOCUMENTATION.md)

# 3. builda + instala no device
.\build.ps1 -Install -Device <ip>:5555

# 4. testa: abre o Void Client -> Launch -> MODULOS -> seu card aparece
#    (ou na bolha in-game). Ajusta até ficar redondo.

# 5. commita e abre PR
git add native\jni\modules\meu_modulo.cpp
git commit -m "Add módulo: Meu Modulo"
git push -u origin modulo/meu-modulo
#   -> abre o Pull Request no GitHub
```

O mantenedor revisa o PR, faz merge, e o `build.ps1` dele gera o APK de release com o
seu módulo incluído automaticamente (o build pega **todo** `modules/*.cpp`).

---

## 3. Regras

- **Um módulo = um arquivo** em `native/jni/modules/`. Não comece o nome com `_`
  (arquivos `_*` são ignorados no build — é onde fica o `_template.cpp`).
- **Não edite** `launcher.cpp` nem `void_sdk.h` no seu PR (é o framework; mudança ali
  combina antes com o mantenedor — ex. adicionar um tipo de setting novo, seção 9 da doc).
- **`id` único e estável** — é a chave do config salvo; não mude depois de publicado.
- **Funções do jogo só em `onTick`** (thread do jogo). Desenho só em `onRender`. Hooks:
  instale 1x em `onEnable`.
- **Build limpo**: o `build.ps1` usa `-Wl,--no-undefined` — se faltar símbolo, falha no
  build (não deixa virar crash no celular). PR só com build passando + testado no device.
- **Escopo**: client **legítimo** (HUD, visual, QoL, cosméticos). **Nada** de
  reach/hitbox/anti-knockback — isso é cheat e está fora.
- **Estilo**: siga as cores/formas da seção 8 da doc (o framework já desenha o card/config
  no padrão; o que você desenha no `onRender` deve combinar).

---

## 4. Checklist do PR

- [ ] 1 arquivo novo em `modules/`, nome sem `_`.
- [ ] `id` único.
- [ ] `.\build.ps1` passa sem erro.
- [ ] Testado no device (liga/desliga + cada setting).
- [ ] Não mexeu em `launcher.cpp`/`void_sdk.h`.
- [ ] Feature legítima (não-cheat).
