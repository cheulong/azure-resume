FROM node:18-alpine

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

FROM nginx:stable-alpine
COPY /out /usr/share/nginx/html

CMD ["nginx","-g","daemon off;"]
