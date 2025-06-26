import http.server
import socketserver

PORT = 8000  # Port d'écoute du serveur

Handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(("", PORT), Handler) as httpd:
    print(f"Serveur web local démarré sur http://localhost:{PORT}")
    print("Ctrl+C pour arrêter")
    httpd.serve_forever()
