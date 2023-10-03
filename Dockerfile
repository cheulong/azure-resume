#Stage 1
FROM node:18-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

EXPOSE 3000

#Stage 2
FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=builder /app/out .

ENTRYPOINT [ "nginx","-g","daemon off;" ]
