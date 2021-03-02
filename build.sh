#!/bin/bash
#
# build.sh - Compila uma imagem docker contida neste projeto
#
# --------------------------------------------------------------------------------------------------------------------
# Este programa recebe como parâmetro a tag correspondente ao diretório onde se encontra o Dockerfile a ser compilado
# --------------------------------------------------------------------------------------------------------------------
#
# Licença: MIT
#

if [ ! -d ./${1} ]; then
    echo -e "\033[0;31mO diretório ${1} não existe!\033[0m"
    exit 1
fi

docker build - < ./${1}/Dockerfile

echo -e "\033[1;32mImagem gerada com sucesso!\033[0m"
exit 0