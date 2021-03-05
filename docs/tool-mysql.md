# MySQL e compatíveis

As imagens do MySQL já possuem o servidor Nginx e o Gerenciador de Bancos PhpMyAdmin configurado.
O banco é acessível pela porta 3306 e o PhpMyAdmin pela porta 80.

Ambas portas podem ser mapeadas paras outras através da execução do container via Docker ou Docker Compose.

As seguintes versões do MySQL estão presentes:

- MySQL 5.7 ricardopedias/docker-project:mysql57
- MySQL 8.0 ricardopedias/docker-project:mysql80
- MariaDB 10.5 ricardopedias/docker-project:mariadb105

## Docker Compose

Um exemplo de configuração via Docker Compose:

```
version: "3.1"
services:
  mysql:
    image: riacrdopedias/docker-project:mysql80
    container_name: container-mysql
    volumes:
      - ./my-mysql/storage:/var/lib/mysql
    ports:
      - "8080:80"
      - "9090:3306"
    networks:
      - my-network
```

## Acessando

Para acessar o banco de dados ou o PhpMyAdmin, use as seguintes informações:

- Usuário: root
- Senha: devel

ou

- Usuário: devel
- Senha: devel