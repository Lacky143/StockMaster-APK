#!/bin/bash

# StockMaster APK Build Script

echo "=========================================="
echo "StockMaster APK Builder"
echo "=========================================="
echo ""

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install it from https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js found: $(node --version)"

# Check if Cordova is installed
if ! command -v cordova &> /dev/null; then
    echo "📦 Installing Cordova CLI..."
    npm install -g cordova
fi

echo "✅ Cordova found: $(cordova --version)"

# Install dependencies
echo ""
echo "📥 Installing dependencies..."
npm install

# Add Android platform if not already added
echo ""
echo "🤖 Setting up Android platform..."
cordova platform add android 2>/dev/null || echo "✅ Android platform already added"

# Build
echo ""
echo "🔨 Building APK..."
read -p "Build debug (d) or release (r)? [d/r]: " build_type

if [ "$build_type" = "r" ]; then
    echo "🔨 Building Release APK..."
    cordova build android --release
    echo ""
    echo "✅ Release APK ready at: platforms/android/app/build/outputs/bundle/release/"
else
    echo "🔨 Building Debug APK..."
    cordova build android --debug
    echo ""
    echo "✅ Debug APK ready at: platforms/android/app/build/outputs/apk/debug/app-debug.apk"
fi

echo ""
echo "=========================================="
echo "Build Complete!"
echo "=========================================="
