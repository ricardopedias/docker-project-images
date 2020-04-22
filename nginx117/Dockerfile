#-------------------------------------------------------------------------------------
# PhpProject - Nginx 1.17
# Imagem oficial (Docker Hub): https://hub.docker.com/_/nginx
# Imagem oficial (Git Hub): https://github.com/nginxinc/docker-nginx
#-------------------------------------------------------------------------------------

FROM nginx:1.17

RUN mkdir -p /app
RUN chmod 750 /app
RUN chown www-data:www-data /app

CMD ["nginx", "-g", "daemon off;"]
