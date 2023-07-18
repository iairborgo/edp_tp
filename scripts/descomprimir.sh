#!/bin/bash


# Primero chequeamos que la cantidad de argumentos dada sea correcta

if [[ $# -ne 2 ]]; then
    echo "Ingresar 2 argumentos (archivo comprimido, archivo de checksum)" && exit 1
fi

IMAGENES=$1
CHECKSUM=$2

# Realizamos una verificación del checksum

ORIGINAL=$(cat "$CHECKSUM")
CHECK=$(md5sum "$IMAGENES")

if [[ "$CHECK" == "$ORIGINAL" ]]; then
    echo "Checksum validado"
else
    echo "Checksum no válido, reintentar"
    exit 2
fi

# Extraemos los archivos en el directorio.
tar xvf "$IMAGENES"
mv imagenes_generadas imagenes_descomprimidas

exit 0
