FROM node:latest as build
WORKDIR /app
COPY . /app/code
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build

FROM nginx:1.9.2
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/code/dist /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]