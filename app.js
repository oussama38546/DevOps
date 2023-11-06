const http = require('http');

// Créez un serveur HTTP
const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/plain' });
  res.end('Hello, World!\n');
});

// Définissez le port sur lequel le serveur écoutera
const port = process.env.PORT || 8000;

// Démarrez le serveur et écoutez sur le port spécifié
server.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
