# Utilisez une image Node.js officielle comme image de base
FROM node:18

# Créez un répertoire de travail dans l'image
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the entire application code to the container
COPY . .

# Exposez le port sur lequel le serveur écoute
EXPOSE 8000

# Commande pour exécuter le script app.js lorsque le conteneur démarre
CMD ["node", "app.js"]
