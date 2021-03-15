#-------------------------------------------------------------------------------------
# DockerProject - Java 15
# https://hub.docker.com/_/tomcat
#-------------------------------------------------------------------------------------

FROM tomcat:10.0.4-jdk15-openjdk-buster

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

# Diretório principal da imagem
WORKDIR /usr/local/tomcat/webapps/ROOT

ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD context.xml /tmp/context.xml

RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2; \
    mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps; \
    cp /tmp/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml;

STOPSIGNAL SIGQUIT

EXPOSE 8080
CMD ["catalina.sh", "run"]
