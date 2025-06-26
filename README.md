🧰 Technologies utilisées :

Python + Flask pour le backend (serveur de verrouillage)

Ngrok pour l’exposition sécurisée via Internet

HTML, JS, CSS pour la PWA (interface mobile)

1️⃣ Télécharger ou cloner le projet

Place tous les fichiers dans un dossier nommé Lock Me

Lock Me/

│    ├── LockMe.py      # Script backend pour verrouiller le PC

│    ├── Start.bat      # Script pour lancer les services

│    ├── Stop.bat       # Script pour Arrêter les services

├── Server/             # Contient le serveur Flask + la PWA (HTML, JS, manifest.json)

│   ├── app.py       
│   ├── app.js          # Script JS de la PWA (sera mis à jour dynamiquement)

│   ├── index.html      # Interface de l'application mobile

│   └── ...             # Autres fichiers web (manifest, icônes, etc.)

├── ngrok/

│   ├── ngrok.exe       # Binaire Ngrok pour exposer Flask sur Internet

2️⃣ Télécharger Et Installer les dépendances

- Python + Flask pour le backend (Utiliser le script dependances.ps1)

3️⃣ Exécuter le start.bat pour lancer tous les services

Une fois lancée récupérez l'URL générée et rajoutez là dans le fichier app.py

4️⃣ Accéder à l’application depuis ton téléphone

https://l'ip-de-ton-pc:8000

✅ Tu verras l’interface avec un bouton "Verrouiller le PC", Appuie sur le bouton 

🔒 Si tout est correctement configuré, le PC verrouillera immédiatement sa session Windows.

📝 Remarques

Le lien Ngrok change à chaque redémarrage, donc une fois le lien généré il faudra le renseigner dans app.js et recharger la page.
