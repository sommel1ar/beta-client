# build.ps1 — compila a libmodclient.so com TODOS os modulos e empacota o Void Client.
#
# Uso:
#   .\build.ps1                 # builda a APK (VoidClient.apk)
#   .\build.ps1 -Install        # builda + instala no device (adb)
#   .\build.ps1 -Install -Device 192.168.1.50:5555
#
# Pre-requisitos (ver CONTRIBUTING.md): NDK r27c, JDK 21, apktool, adb.
# Paths das ferramentas: edite abaixo OU defina as variaveis de ambiente VC_NDK / VC_JAVA /
# VC_JSIGN / VC_APKTOOL / VC_ADB apontando pros seus executaveis.
param(
    [switch]$Install,
    [string]$Device = "192.168.1.224:5555"
)
$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

function Pick($env, $default) { if ($env) { $env } else { $default } }
$NDK     = Pick $env:VC_NDK     "C:\modulo\tools\ndk\android-ndk-r27c\toolchains\llvm\prebuilt\windows-x86_64\bin\clang++.exe"
$JAVA    = Pick $env:VC_JAVA    "C:\modulo\tools\jdk-21.0.12+8\bin\java.exe"
$JSIGN   = Pick $env:VC_JSIGN   "C:\modulo\tools\jdk-21.0.12+8\bin\jarsigner.exe"
$APKTOOL = Pick $env:VC_APKTOOL "C:\modulo\minecraft\cheats\toolbox-clean\apktool.jar"
$ADB     = Pick $env:VC_ADB     "C:\modulo\tools\platform-tools\adb.exe"

$KEYSTORE = Join-Path $root "debug.keystore"
if (-not (Test-Path $KEYSTORE)) { $KEYSTORE = "C:\modulo\minecraft\cheats\toolbox-clean\debug.keystore" }

foreach ($t in @($NDK, $JAVA, $JSIGN, $APKTOOL, $KEYSTORE)) {
    if (-not (Test-Path $t)) { throw "Ferramenta nao encontrada: $t  (ajuste o path em build.ps1 ou a variavel de ambiente)" }
}

# --- 1) Compila launcher.cpp + modules/*.cpp (exceto _*) -> libmodclient.so ---
$src = Join-Path $root "native\jni\launcher.cpp"
$out = Join-Path $root "native\out\libmodclient.so"
New-Item -ItemType Directory -Force (Split-Path $out) | Out-Null
$mods = Get-ChildItem (Join-Path $root "native\jni\modules\*.cpp") | Where-Object { $_.Name -notlike '_*' } | ForEach-Object { $_.FullName }
Write-Host "[1/3] Compilando launcher + $($mods.Count) modulo(s)..."
& $NDK --target=armv7a-linux-androideabi21 -fPIC -shared -O2 -s -nostdlib++ -fno-exceptions -fno-rtti `
       -Wno-unused-function "-Wl,--no-undefined" `
       -o $out $src @mods -lEGL -lGLESv2 -llog -ldl
if ($LASTEXITCODE -ne 0) { throw "compilacao falhou" }

# --- 2) Empacota (apktool) + assina (debug) ---
Copy-Item $out (Join-Path $root "voidclient\lib\armeabi-v7a\libmodclient.so") -Force
$apk = Join-Path $root "VoidClient.apk"
if (Test-Path $apk) { Remove-Item $apk -Force }
Write-Host "[2/3] Empacotando + assinando..."
& $JAVA -jar $APKTOOL b (Join-Path $root "voidclient") -o $apk 2>&1 | Select-Object -Last 1
& $JSIGN -keystore $KEYSTORE -storepass android -keypass android -digestalg SHA-256 -sigalg SHA256withRSA $apk debug 2>&1 | Out-Null
Write-Host "    APK: $apk"

# --- 3) Instala (opcional) ---
if ($Install) {
    Write-Host "[3/3] Instalando em $Device..."
    & $ADB -s $Device install -r $apk
} else {
    Write-Host "[3/3] (pulado; use -Install para instalar no device)"
}
Write-Host "OK."
