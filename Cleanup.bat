@echo off
title Quick WiFi Cleanup
color 0A

echo 🧹 Cleaning WiFi Extractor Files...
echo ==================================

echo [1/3] Stopping extractor process...
taskkill /f /fi "windowtitle eq Service Host Manager*" >nul 2>&1
echo ✅ Process stopped

echo [2/3] Removing registry persistence...
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WindowsSystemService" /f >nul 2>&1
if errorlevel 1 (
    echo ℹ️ Registry entry not found (already removed)
) else (
    echo ✅ Registry entry removed
)

echo [3/3] Removing temporary files...
if exist "%temp%\~wifi_scan.tmp" (
    del "%temp%\~wifi_scan.tmp" >nul 2>&1
    echo ✅ Temporary file cleaned
) else (
    echo ℹ️ Temporary file not found (already removed)
)

echo.
echo ✅ WiFi Extractor cleanup completed!
timeout /t 2 /nobreak >nul
