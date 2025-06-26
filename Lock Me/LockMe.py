from flask import Flask, request
from flask_cors import CORS
import os

app = Flask(__name__)

# Autoriser uniquement l'origine locale de ta PWA
CORS(app, resources={r"/lock": {"origins": "http://192.168.1.149:8000"}})

SECRET_KEY = "123456"

@app.route("/")
def home():
    return "Serveur de verrouillage actif."

@app.route("/lock", methods=["POST"])
def lock_pc():
    auth = request.headers.get("Authorization")
    if auth != f"Bearer {SECRET_KEY}":
        return {"error": "Unauthorized"}, 403

    os.system("rundll32.exe user32.dll,LockWorkStation")
    return {"status": "PC verrouillé"}, 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
