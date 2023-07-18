#!/bin/bash

DIRECTORIO_IMAGENES="$(pwd)/imagenes_descomprimidas"
DIRECTORIO_PROCESADAS="$(pwd)/imagenes_procesadas"

REGEX="^[^ ]+a\b"
# Verificar que el directorio de imágenes contenga archivos

if [ -z "$(ls -A "$DIRECTORIO_IMAGENES")" ] || [ -z "$(ls -A "$DIRECTORIO_PROCESADAS")"  ]; then
    echo "Directorio vacío"
    exit 1
fi

for imagen in "$DIRECTORIO_IMAGENES"/*; do
  nombre=$(basename -- "$imagen") # -- que cualquier argumento siguiente debe tratarse como un argumento posicional, incluso si comienza con un guion.
  nombre="${nombre%.*}"  # Eliminar la extensión del archivo
  echo "$nombre" >> nombres_totales.txt
done

for imagen in "$DIRECTORIO_PROCESADAS"/*; do
  nombre=$(basename -- "$imagen")
  nombre="${nombre%_*}"  # Dejar solo el nombre
  echo "$nombre" >> nombres_validos.txt
    if [[ $nombre =~ $REGEX ]]; then
      echo "$nombre" >> nombres_femeninos.txt
    fi
done

tar -czf archivos.tar.gz imagenes_originales/ imagenes_descomprimidas/ imagenes_procesadas/ nombres_totales.txt nombres_validos.txt nombres_femeninos.txt
# -c indica que se va a crear un archivo. -z indica compresion con gzip. -f indica el nombre del archivo de salida.
