chcp 65001
@echo off
title Arrêt du projet Lock Me
echo.

echo Arrêt de l'API Flask (LockME.py)...
taskkill /F /IM python.exe /FI "WINDOWTITLE eq 🔒 Lancement Lock Me*" >nul 2>&1
taskkill /F /IM python.exe /FI "IMAGENAME eq python.exe" /FI "WINDOWTITLE eq LockME.py*" >nul 2>&1

echo Arrêt de Ngrok...
taskkill /F /IM ngrok.exe >nul 2>&1

echo Arrêt du serveur PWA (app.py)...
taskkill /F /IM python.exe /FI "WINDOWTITLE eq app.py*" >nul 2>&1

echo.
echo Tous les services ont été arrêtés (si détectés).
pause
