#-------------------------------------------------------------------------------------
# PhpProject - Nginx 1.17
# Imagem oficial (Docker Hub): https://hub.docker.com/_/nginx
# Imagem oficial (Git Hub): https://github.com/nginxinc/docker-nginx
#-------------------------------------------------------------------------------------

FROM nginx:1.17

RUN mkdir -p /application

WORKDIR /application

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;" ]
