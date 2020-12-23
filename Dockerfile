FROM node:14.9.0 as build
WORKDIR = /app
RUN npm install --registry=https://registry.npm.taobao.org
RUN npm run build
COPY ./dist /app/

FROM nginx:1.9
COPY config/nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]