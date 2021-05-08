#-------------------------------------------------------------------------------------
# DockerProject - Ruby 3.0
# https://github.com/phusion/passenger-docker
# https://www.firmhouse.com/blog/how-i-deploy-a-rails-app-using-docker
# https://qiita.com/NaokiIshimura/items/db143bbbc439a7cd10aa
#-------------------------------------------------------------------------------------

FROM phusion/passenger-ruby30

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

# Using Nginx and Passenger
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD nginx.conf /etc/nginx/sites-enabled/webapp.conf


RUN mkdir /application
WORKDIR /application

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

STOPSIGNAL SIGQUIT

EXPOSE 80 
EXPOSE 443
EXPOSE 8080
EXPOSE 9292 
EXPOSE 3000


CMD exec /bin/bash -c "useradd -ms /bin/bash \"devel\" >/dev/null 2>&1; /sbin/my_init"
