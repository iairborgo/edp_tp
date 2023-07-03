#!bin/bash

#Primero checkeamos que la cantidad de argumentos dada sea correcta
if [[ $# -ne 2 ]]
then
    echo "Ingresar 2 argumentos (zip imagen, checksum)" && exit 1
fi

IMAGENES=${1: -"fotos_comprimidas.zip"} # el - sirve para setear un argumento default
CHECKSUM=${2: -"checksum.txt"}

# Realizamos un checkeo para ver si la checksum otorgada

CHECK=$(cat $CHECKSUM)
ORIGINAL=$(md5sum $IMAGENES)

if [[ "$CHECK" == "$ORIGINAL" ]]
then
    echo "Checksum válida, continuar"
    exit 0
else
    echo "Checksum no válida, reintentar"
    exit 2
fi