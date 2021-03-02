#-------------------------------------------------------------------------------------
# PhpProject - Nginx 1.17
# Imagem oficial (Docker Hub): https://hub.docker.com/_/nginx
# Imagem oficial (Git Hub): https://github.com/nginxinc/docker-nginx
#-------------------------------------------------------------------------------------

FROM nginx:1.17

RUN mkdir -p /application
RUN chmod 750 /application
RUN chown www-data:www-data /application

COPY https://raw.githubusercontent.com/ricardopedias/php-project-images/master/nginx117/nginx.conf /etc/nginx/conf.d/default.conf

RUN sed -i 's/accessible_path/application\/${DOCROOT}\1/' /etc/nginx/conf.d/default.conf

WORKDIR /application

CMD ["nginx", "-g", "daemon off;"]
