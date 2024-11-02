FROM --platform=amd64 node:20-alpine AS base

RUN apk add --no-cache libc6-compat
WORKDIR /app

# Copier les fichiers de dépendances
COPY package*.json ./

# Installer toutes les dépendances
RUN npm install --legacy-peer-deps

# Copier tout le code source
COPY . .

# Construire le projet
RUN npm run build

# Exécuter l'application
ENTRYPOINT ["node", "./backend/dist/main.js"]
