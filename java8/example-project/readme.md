# Java 15 - Projeto de Exemplo

Este é  um projeto de exemplo para desenvolvimento Java usando Gradle.

Para iniciar, é preciso gerar o arquivo .war:

```
docker-compose up
docker exec -it java-teste gradle build
```

Em seguida, é preciso reiniciar os containers para efetivar a configuração no Tomcat.

```
docker-compose down; docker-compose up
```

Agora é só acessar os seguintes URLs:

```
// para acessar o index.jsp
http://localhost:8888/app 

// para acessar o MyServlet
http://localhost:8888/app/myservlet
```