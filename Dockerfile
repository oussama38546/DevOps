# Utilisez une image Node.js officielle comme image de base
FROM node:18

# Créez un répertoire de travail dans l'image
WORKDIR /app

# Copiez le fichier app.js dans le répertoire de travail de l'image
COPY app.js .

# Exposez le port sur lequel le serveur écoute
EXPOSE 8000

# Commande pour exécuter le script app.js lorsque le conteneur démarre
CMD ["node", "app.js"]
