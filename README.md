# StockMaster APK Builder

This repository contains the source files for building the StockMaster Android APK.

## Prerequisites

1. **Node.js** - Download from https://nodejs.org/
2. **Java Development Kit (JDK)** - Download from https://www.oracle.com/java/technologies/downloads/
3. **Android SDK** - Download Android Studio from https://developer.android.com/studio
4. **Cordova CLI** - Install via npm

## Setup Instructions

### 1. Install Cordova CLI
```bash
npm install -g cordova
```

### 2. Install Project Dependencies
```bash
npm install
```

### 3. Add Android Platform
```bash
cordova platform add android
```

### 4. Build the APK

**For Debug APK (Quick testing):**
```bash
cordova build android --debug
```

**For Release APK (Production):**
```bash
cordova build android --release
```

### 5. Find Your APK

After building, the APK will be located at:
- **Debug APK:** `platforms/android/app/build/outputs/apk/debug/app-debug.apk`
- **Release APK:** `platforms/android/app/build/outputs/bundle/release/app-release.aab`

## What's Included

- **www/index.html** - Main application file with all UI and logic
- **config.xml** - Cordova configuration
- **package.json** - Node dependencies

## Features

- 📦 Stock Management
- 🛒 Purchase Tracking
- 👨‍🍳 Usage Logging
- 🗑️ Wastage Tracking
- 📊 Reports & Analytics
- 💾 Local Data Storage

## Quick Start

### Windows Users:
```bash
build.bat
```

### Mac/Linux Users:
```bash
chmod +x build.sh
./build.sh
```

## Troubleshooting

### Android SDK not found
Make sure your ANDROID_SDK_ROOT environment variable is set:
```bash
export ANDROID_SDK_ROOT=/path/to/android-sdk
```

### Gradle build fails
Try updating Cordova:
```bash
npm update -g cordova
```

### Port already in use
Change the emulator port if needed during building.

## Support

For issues or questions, refer to:
- [Cordova Documentation](https://cordova.apache.org/)
- [Android Development](https://developer.android.com/)

---

**Version:** 1.0.0  
**License:** Apache 2.0