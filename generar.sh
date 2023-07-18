#!/bin/bash

# Este script toma un argumento numerico que marca la cantidad de imagenes que queremos descargar de una pagina web, les da un nombre valido, las comprime y genera un archivo con su suma de verificación.

URL="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"
wget -O "NOMBRES.CSV" "$URL"

function obtener_imagen { # Funcion que retorna una imagen aleatoria desde una pagina web.
  url="https://source.unsplash.com/random/900%C3%97700/?person."
  wget -O "$1" "$url"
  sleep 2
}

function obtener_nombre {
  # awk procesa el texto y extrae los nombres.
  NOMBRES=$(awk -F "," '{print $1}' "$1")
  # Genera un número aleatorio entre 1 y el número de nombres disponibles.
  RANDOM_NUM=$(( RANDOM % $(echo "$NOMBRES" | wc -l) + 1 )) # Uso del operador módulo (%) para generar un número aleatorio dentro del rango de cantidad de nombres.

  # Obtiene el nombre correspondiente al número aleatorio y lo transforma a mayúsculas.
  NOMBRE=$(echo "$NOMBRES" | sed -n "${RANDOM_NUM}p")
  echo "${NOMBRE^}"
}

function comprimir { # Funcion que toma un directorio con imagenes y las comprime.
  tar zcvf imagenes.tar.gz "$1"
}

# Aca comienza el programa
echo "La cantidad de imágenes que desea generar es de: "$1" imagenes."
ARGS=$1
regex='^[1-9][0-9]*$' # Expresion regular para que el ingreso sea un numero mayor a 0.
if [[ $ARGS =~ $regex ]]; then
  mkdir imagenes_generadas
    for ((i=1; i<=ARGS; i++)); do # Valor inicial de la variable i=1. El bucle se ejecutará mientras i<=ARGS. Después de cada iteración, la variable i se incrementa en 1 mediante i++.
      NOMBRE_GENERADO=$(obtener_nombre "NOMBRES.CSV")
      obtener_imagen "imagenes_generadas/$NOMBRE_GENERADO.jpg"
    done
  comprimir imagenes_generadas
  md5sum imagenes.tar.gz > checksum.txt # Crea un .txt con la suma de verificaciones de la compresion.
  mv imagenes_generadas imagenes_originales
else
  echo "Ingrese solo un numero mayor a 0" && exit 1
fi
exit 0
