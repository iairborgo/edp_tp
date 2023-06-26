#!bin/bash

#Primero checkeamos que la cantidad de argumentos dada sea correcta
if [[ $# -ne 2 ]]
then
    echo "Ingresar 2 argumentos (link imagen, link checksum)" && exit 1
fi

LINK_IMAGENES=$1
LINK_CHECKSUM=$2

# Usamos cURL para poder descargar los archivos, guardandolos
#  Si curl da errordamos un mensaje de donde fallo la descarga.

# El -L sirve para redirecciones. Sin esto no bajaría zips
# El -s oculta el output de cURL
# (igual es mas vulnerable pero no estamos en clase de ciberseguridad :P)

curl -L -s -o fotos_comprimidas.zip $LINK_IMAGENES \
|| ( echo "Ocurrió un error descargando el archivo de imagenes" && exit 2)

curl -L -s -o checksum.txt $LINK_CHECKSUM \
|| ( echo "Ocurrió un error descargando el archivo de imagenes" && exit 3)

# Realizamos un checkeo para ver si la checksum otorgada

CHECK=$(cat checksum.txt)
ORIGINAL=$(md5sum fotos_comprimidas.zip)

if [[ "$CHECK" == "$ORIGINAL" ]]
then
    echo "Checksum válida, continuar"
    exit 0
else
    echo "Checksum no válida, reintentar"
    rm fotos_comprimidas.zip
    rm checksum.txt
    exit 3
fi