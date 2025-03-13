# Étape 1 : Construction du backend Java
FROM eclipse-temurin:21 AS backend-builder

WORKDIR /app

COPY ./hello-world-0.0.1-SNAPSHOT.jar app.jar

# Étape 2 : Construction du frontend avec Node.js et Expo
FROM node:18 AS frontend-builder

WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer les dépendances en forçant l'option legacy-peer-deps
RUN npm install --legacy-peer-deps

# Copier tout le projet frontend
COPY . .

# Générer le build statique (il sera placé par défaut dans "web-build")
RUN npm run build

# Étape 3 : Image finale avec Nginx pour le frontend et Java pour le backend
FROM nginx:alpine

# Copier le build frontend généré dans le dossier de Nginx
COPY --from=frontend-builder /app/web-build /usr/share/nginx/html

# Copier le JAR du backend
COPY --from=backend-builder /app/app.jar /app/app.jar

# Installer OpenJDK pour exécuter l'application Java
RUN apk add --no-cache openjdk11-jre

# Exposer les ports pour Nginx et Java
EXPOSE 80 8080

# Script de démarrage pour lancer à la fois Nginx et l'application Java
COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]

