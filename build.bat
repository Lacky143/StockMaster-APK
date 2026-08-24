@echo off
REM StockMaster APK Build Script for Windows

echo.
echo ==========================================
echo StockMaster APK Builder
echo ==========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo X Node.js is not installed. Please install it from https://nodejs.org/
    exit /b 1
)

echo OK Node.js found: 
node --version

REM Check if Cordova is installed
where cordova >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Installing Cordova CLI...
    call npm install -g cordova
)

echo OK Cordova found: 
cordova --version

REM Install dependencies
echo.
echo Fetching dependencies...
call npm install

REM Add Android platform if not already added
echo.
echo Setting up Android platform...
call cordova platform add android 2>nul
echo OK Android platform ready

REM Build
echo.
echo Preparing to build APK...
set /p build_type="Build debug (d) or release (r)? [d/r]: "

if "%build_type%"=="r" (
    echo Building Release APK...
    call cordova build android --release
    echo.
    echo OK Release APK ready at: platforms\android\app\build\outputs\bundle\release\
) else (
    echo Building Debug APK...
    call cordova build android --debug
    echo.
    echo OK Debug APK ready at: platforms\android\app\build\outputs\apk\debug\app-debug.apk
)

echo.
echo ==========================================
echo Build Complete!
echo ==========================================
pause