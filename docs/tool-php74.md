# PHP

## Projeto de exemplo

Um projeto de exemplo pode ser obtido em 
[Docker Project Images - PHP80](https://github.com/ricardopedias/docker-project-skeleton-php80)

## Configuração Mínima

O diretório principal da imagem é localizado em `/application`.
Abaixo, um exemplo de configuração mínima:

```
version: "3.1"
services:
  php:
    image: ricardopedias/docker-project:php74
    container_name: php-fullpower
    volumes:
      - .:/application
    ports:
      - "8080:80"
```

## Extensões

A imagens possui a maioria das extensões habilitadas e ativadas por padrão.
Inclusive, o XDebug está ativo e funcional na porta 9000.

## Utilidades

Os seguintes programas também estão presentes:

- unzip
- curl
- vim
- git
- wget
- composer
- npm
- deployer

## Servidor Web

O servidor **Nginx** está embutido na imagem, acessível através da porta 80.

### Diretório root

Por padrão, o diretório root está pontando para o caminho `/application/public`, o que pode ser modificado mapeando uma configuração personalizada.

### Mudando o diretório root

Na raiz do projeto, crie um arquivo de configuração chamado `nginx.conf`, com o seguinde conteúdo:

```
server {
    listen       80;
    server_name  localhost;
    client_max_body_size 108M;
    access_log  /var/log/nginx/host.access.log;

    root   /application/public;
    index  index.php index.html index.htm;

    if (!-e $request_filename) {
        rewrite ^.*$ /index.php last;
    }

    error_page  404              /404.html;

    # redirect server error pages to the static page /50x.html
    #
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }

    location ~ \.php$ {
        fastcgi_pass localhost:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_read_timeout 3600;
        fastcgi_param PHP_VALUE "error_log=/var/log/nginx/application_php_errors.log";
        fastcgi_buffers 16 16k;
        fastcgi_buffer_size 32k;
        include fastcgi_params;
    }
}
```

A linha `root   /application/public;` define o diretório de apontamento do Nginx. Personalize-o como quiser, mantendo o prefixo `/application`.

Em seguida, adicione o arquivo `nginx.conf` no mapeamento de volumes do `docker-compose.yml`:

```
version: "3.1"
services:
  php:
    image: ricardopedias/docker-project:php74
    container_name: php-fullpower
    volumes:
      - .:/application
      - ./nginx.conf:/etc/nginx/conf.d/default.conf
    ports:
      - "8080:80"
```

## Supervisor

O Supervisor também está instalado na imagem. Ele é muito útil, principalmente para desenvolver aplicações Reativas, ou baseadas em Publish/Subscribe.

Para iniciar o Supervisor, basta executar o seguinte comando:

```
docker exec -it meu-conteiner service supervisor start 
```

Para configurar um worker, existem duas formas:

### 1. Criar um worker.php

A forma mais fácil é criando um arquivo chamado **worker.php** na raiz do projeto, ou seja, como `/application/public/worker.php`.

A presença deste arquivo irá ser detectada automaticamente e o Supervisor irá executá-lo por tempo indeterminado.

### 2. Mapear um novo worker

Se o método anterior não for suficiente, pode-se mapear um worker pesonalizado. Por exemplo, crie um arquivo chamado `worker.conf`**` com o seguinte conteúdo:

```
[program:up-worker]
command=php /application/script.php
autostart=true
autorestart=true
redirect_stderr=true
stderr_logfile=/application/worker.err.log
stdout_logfile=/application/worker.out.log
```

Em seguida, faça o mapeamento do worker no `docker-compose.yml`:

```
version: "3.1"
services:
  php:
    image: ricardopedias/docker-project:php74
    container_name: php-fullpower
    volumes:
      - .:/application
      - ./worker.conf:/etc/supervisor/conf.d/up-worker.conf
    ports:
      - "8080:80"
```

Reinicie o Supervisor para que o arquivo `/application/script.php` seja invocado:

```
docker exec -it meu-conteiner service supervisor restart 
```
