# Launcher 0.15.10 - compila o backend nativo, empacota e assina o APK de teste (32-bit).
# NAO instala (A71 entra depois). Uso: powershell -File build_test.ps1
$ErrorActionPreference = "Stop"
$ndkbin = "C:\modulo\tools\ndk\android-ndk-r27c\toolchains\llvm\prebuilt\windows-x86_64\bin"
$clang  = Join-Path $ndkbin "clang++.exe"
$js     = "C:\modulo\tools\jdk-21.0.12+8\bin\jarsigner.exe"
$java   = "C:\modulo\tools\jdk-21.0.12+8\bin\java.exe"
$apktool= "C:\modulo\minecraft\cheats\toolbox-clean\apktool.jar"
$ks     = "C:\modulo\minecraft\_native-inject-port\modclient.keystore"
$dec    = "C:\modulo\minecraft\_native-inject-port\v29-decode"
$src    = "C:\modulo\minecraft\_launcher\native\jni\launcher.cpp"
$so     = "C:\modulo\minecraft\_launcher\native\out\libmodclient.so"
$outdir = "C:\modulo\minecraft\_launcher\test"
$apk    = Join-Path $outdir "MCPE-0.15.10-launcher-chatscroll.apk"
New-Item -ItemType Directory -Force -Path $outdir | Out-Null

Write-Host "[1/4] compilando launcher.cpp..." -ForegroundColor Cyan
& $clang --target=armv7a-linux-androideabi21 -fPIC -shared -O2 -s -nostdlib++ -fno-exceptions -fno-rtti -o $so $src -llog -ldl
if (-not (Test-Path $so)) { throw "build falhou" }
Copy-Item $so (Join-Path $dec "lib\armeabi-v7a\libmodclient.so") -Force
Write-Host "  .so copiado p/ v29-decode"

Write-Host "[2/4] apktool b..." -ForegroundColor Cyan
if (Test-Path $apk) { Remove-Item $apk -Force }
& $java -jar $apktool b $dec -o $apk 2>&1 | Select-Object -Last 2
if (-not (Test-Path $apk)) { throw "apktool b falhou" }

Write-Host "[3/4] assinando (modclient.keystore)..." -ForegroundColor Cyan
& $js -keystore $ks -storepass android -keypass android -digestalg SHA-256 -sigalg SHA256withRSA $apk modclient 2>&1 | Select-Object -Last 1

Write-Host "[4/4] verificando conteudo..." -ForegroundColor Cyan
& $js -verify $apk 2>&1 | Select-Object -Last 1
$sz = [math]::Round((Get-Item $apk).Length/1MB,1)
Write-Host "PRONTO -> $apk ($sz MB). Instalar no A71: adb install -r --bypass-low-target-sdk-block `"$apk`"" -ForegroundColor Green
