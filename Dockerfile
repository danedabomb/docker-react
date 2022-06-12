# Phased approach... 
# Phase I: Build
FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Phase II: Run
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# Initial run CMD executes automatically for nginx
