# Étape 1 : Construction du build avec Node.js et Expo
FROM node:18 AS builder

WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances en forçant l'option legacy-peer-deps
RUN npm install --legacy-peer-deps

# Copier tout le projet
COPY . .

# Générer le build statique (il sera placé par défaut dans "web-build")
RUN npm run build

# Étape 2 : Serveur Nginx pour héberger le build statique
FROM nginx:alpine

# Copier le build généré dans le dossier de Nginx
COPY --from=builder /app/web-build /usr/share/nginx/html

# Exposer le port 80
EXPOSE 80

# Démarrer Nginx en mode premier plan
CMD ["nginx", "-g", "daemon off;"]
