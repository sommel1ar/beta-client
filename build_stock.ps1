# Launcher 0.15.10 - monta o APK de teste sobre a BASE STOCK (apk default da Mojang).
# So adiciona: nosso libmodclient.so + libmobilesubstrate.so + loadLibrary no smali. ZERO toolbox.
$ErrorActionPreference = "Stop"
$ndkbin = "C:\modulo\tools\ndk\android-ndk-r27c\toolchains\llvm\prebuilt\windows-x86_64\bin"
$clang  = Join-Path $ndkbin "clang++.exe"
$js     = "C:\modulo\tools\jdk-21.0.12+8\bin\jarsigner.exe"
$java   = "C:\modulo\tools\jdk-21.0.12+8\bin\java.exe"
$apktool= "C:\modulo\minecraft\cheats\toolbox-clean\apktool.jar"
$ks     = "C:\modulo\minecraft\cheats\toolbox-clean\debug.keystore"
$dec    = "C:\modulo\minecraft\_launcher\base-stock"
$subs   = "C:\modulo\minecraft\_native-inject-port\v29-decode\lib\armeabi-v7a\libmobilesubstrate.so"
$src    = "C:\modulo\minecraft\_launcher\native\jni\launcher.cpp"
$so     = "C:\modulo\minecraft\_launcher\native\out\libmodclient.so"
$outdir = "C:\modulo\minecraft\_launcher\test"
$apk    = Join-Path $outdir "MCPE-0.15.10-stock-chatscroll.apk"
New-Item -ItemType Directory -Force -Path (Split-Path $so) | Out-Null
New-Item -ItemType Directory -Force -Path $outdir | Out-Null

Write-Host "[1/5] compilando launcher.cpp..." -ForegroundColor Cyan
& $clang --target=armv7a-linux-androideabi21 -fPIC -shared -O2 -s -nostdlib++ -fno-exceptions -fno-rtti -o $so $src -llog -ldl
if (-not (Test-Path $so)) { throw "build do .so falhou" }
Write-Host ("  libmodclient.so = " + (Get-Item $so).Length + " bytes")

Write-Host "[2/5] copiando libs p/ base-stock..." -ForegroundColor Cyan
Copy-Item $so   (Join-Path $dec "lib\armeabi-v7a\libmodclient.so") -Force
Copy-Item $subs (Join-Path $dec "lib\armeabi-v7a\libmobilesubstrate.so") -Force

Write-Host "[3/5] apktool b..." -ForegroundColor Cyan
if (Test-Path $apk) { Remove-Item $apk -Force }
& $java -jar $apktool b $dec -o $apk 2>&1 | Select-Object -Last 3
if (-not (Test-Path $apk)) { throw "apktool b falhou" }

Write-Host "[4/5] assinando (debug.keystore / alias debug)..." -ForegroundColor Cyan
& $js -keystore $ks -storepass android -keypass android -digestalg SHA-256 -sigalg SHA256withRSA $apk debug 2>&1 | Select-Object -Last 1

Write-Host "[5/5] verificando..." -ForegroundColor Cyan
& $js -verify $apk 2>&1 | Select-Object -Last 1
$sz = [math]::Round((Get-Item $apk).Length/1MB,1)
Write-Host "PRONTO -> $apk ($sz MB)" -ForegroundColor Green
