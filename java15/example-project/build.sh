#!/bin/bash

docker-compose up
docker exec -it java-teste gradle build
