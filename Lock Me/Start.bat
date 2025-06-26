@echo off
title 🔒 Lancement Lock Me

:: Étape 1 - Lancer le serveur Flask
start cmd /k "cd /d %~dp0 && python LockME.py"

:: Pause pour laisser le temps au Flask de démarrer (optionnel)
timeout /t 2

:: Étape 2 - Lancer Ngrok depuis son dossier
start cmd /k "cd /d %~dp0ngrok && ngrok http 5000"

:: Étape 3 - Lancer le serveur de la PWA (dans le dossier Server)
start cmd /k "cd /d %~dp0Server && python app.py"

exit
