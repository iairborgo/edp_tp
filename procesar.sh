#!/bin/bash

# Este script recibe una carpeta con imágenes descomprimidas, las procesa verificando que cada imagen tenga nombre de persona y las recorta a cierta resolución.

DIRECTORIO_IMAGENES="$(pwd)/imagenes_descomprimidas"
DIRECTORIO_PROCESADAS="imagenes_procesadas"
RESOLUCION="512x512"
REGEX="/[A-Z][a-z]+( [A-Za-z]+)?.jpg$"

# Verificar que el directorio de imágenes contenga archivos
if [ -z "$(ls -A "$DIRECTORIO_IMAGENES")" ]; then
    echo "Directorio vacío"
    exit 1
fi

# Crear el directorio de salida si no existe
mkdir -p "$DIRECTORIO_PROCESADAS"

# Procesar cada imagen
for imagen in "$DIRECTORIO_IMAGENES"/*; do
    if [[ "$imagen" =~ $REGEX ]]; then
        nombre_archivo=$(basename "$imagen")
        imagen_procesada="$DIRECTORIO_PROCESADAS/${nombre_archivo%.*}_procesada.jpg" # ${nombre_archivo%.*} elimina la parte de la cadena después del último punto, es decir, la extensión del archivo.
        convert "$imagen" -gravity center -resize "$RESOLUCION"+0+0 -extent "$RESOLUCION" "$imagen_procesada"
    fi
done

exit 0
