const API_URL = 'Ton URL/lock';
const AUTH_TOKEN = '123456';
const statusDiv = document.getElementById('status');

lockBtn.addEventListener('click', () => {
  statusDiv.textContent = 'Envoi de la commande...';

  fetch(API_URL, {
    method: 'POST',
    headers: {
      'Authorization': `Bearer ${AUTH_TOKEN}`
    }
  })
  .then(response => {
    if (response.ok) {
      statusDiv.textContent = '✅ PC verrouillé !';
    } else {
      statusDiv.textContent = '❌ Erreur lors du verrouillage.';
    }
  })
  .catch(() => {
    statusDiv.textContent = '❌ Impossible de contacter le serveur.';
  });
});
