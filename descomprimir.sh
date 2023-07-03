#!bin/bash

#Primero checkeamos que la cantidad de argumentos dada sea correcta
if [[ $# -ne 2 ]]
then
    echo "Ingresar 2 argumentos (zip imagen, checksum)" && exit 1
fi

DIRECTORIO="$( cd "$( dirname "$0" )" && pwd )"

IMAGENES=${1: -"fotos_comprimidas.zip"} # el - sirve para setear un argumento default
CHECKSUM=${2: -"checksum.txt"}

# Realizamos un checkeo para ver si la checksum otorgada

CHECK=$(cat $CHECKSUM)
ORIGINAL=$(md5sum $IMAGENES)

if [[ "$CHECK" == "$ORIGINAL" ]]
then
    echo "Checksum validada"
else
    echo "Checksum no válida, reintentar"
    exit 2
fi

unzip $IMAGENES -d $DIRECTORIO/fotos_descomprimidas

exit 0