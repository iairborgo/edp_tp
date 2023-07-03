#!bin/bash

REGEX="/[A-Z][a-z]+( [A-Z][a-z]+)?.jpg$"
DIRECTORIO="$( cd "$( dirname "$0" )" && pwd )"
IMAGENES="$DIRECTORIO/fotos_descomprimidas"
PROCESADA="$DIRECTORIO/fotos_procesadas"

# Primero checkeemos que haya imagenes para procesar

[ "$(ls -A $IMAGENES)" ] || (echo "Directorio Vacío" && exit 1) 
LISTA="$($IMAGENES)/*"

for f in $LISTA
do
    if [[ "$f" =~ $REGEX ]]
    then
        convert $f -gravity center -resize 512x512+0+0 \
        -extent 512x512 $PROCESADA/$f
    fi
done


exit 0