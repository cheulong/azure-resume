FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

RUN rm -r /usr/share/nginx/html/*

RUN cp -a out/. /usr/share/nginx/html
