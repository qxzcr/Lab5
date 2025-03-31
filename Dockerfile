# Etap 1: Budowanie aplikacji
FROM node:alpine AS builder

WORKDIR /usr/app

COPY package.json ./
RUN npm install

COPY index.js ./

ARG VERSION=1.0.0
ENV VERSION=$VERSION

# Etap 2: Uruchomienie aplikacji na serwerze Nginx
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Kopiowanie plików aplikacji
COPY --from=builder /usr/app/index.js /usr/share/nginx/html/index.js

# Ustawienie HEALTHCHECK do sprawdzania dostępności serwera
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s \
  CMD curl -f http://localhost || exit 1

CMD ["nginx", "-g", "daemon off;"]
