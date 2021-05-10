#-------------------------------------------------------------------------------------
# DockerProject - Java 8
# https://hub.docker.com/_/tomcat
#-------------------------------------------------------------------------------------

FROM tomcat:10.0.4-jdk8-openjdk-buster

# Corrige alguns problemas estranhos do terminal, 
# como problemas como 'clear' ou CTRL+L
ENV TERM=linux

# Para o apt não fazer perguntas ao instalar pacotes
ENV DEBIAN_FRONTEND=noninteractive

# Para identificar o uso do docker dentro da aplicação PHP
ENV RUNNING_DOCKER=1

# Diretório principal da imagem
RUN mkdir /application
WORKDIR /application

ADD tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
ADD context.xml /tmp/context.xml

RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps2; \
    mv /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps; \
    cp /tmp/context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml;

# Instala o gradle
RUN wget https://services.gradle.org/distributions/gradle-7.0-bin.zip -P /tmp
RUN unzip -d /opt/gradle /tmp/gradle-*.zip
RUN rm -f /tmp/gradle-*.zip
RUN ln -s /opt/gradle/gradle-7.0/bin/gradle /usr/bin/gradle

STOPSIGNAL SIGQUIT

EXPOSE 8080

CMD exec /bin/bash -c "useradd -ms /bin/bash \"devel\" >/dev/null 2>&1; echo \"Running... Press Ctrl+C to stop\"; catalina.sh start; trap : TERM INT; sleep infinity & wait"
