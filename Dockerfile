FROM node:alpine as builder
WORKDIR '/app'
COPY package.json package.json
COPY package-lock.json package-lock.json
RUN  npm install
COPY . .
RUN  npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
