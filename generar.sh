#!bin/bash

REGEX="^[1-9][0-9]*$"
DIRECTORIO="$( cd "$( dirname "$0" )" && pwd )" # esto va ayudar a ubicarse en el script
NOMBRES="$DIRECTORIO/dict_limpio.csv"

# Primero realizamos un control de los argumentos
if [[ $# -ne 1 ]]
then
    echo "Solo se acepta 1 argumento [número de imagenes a generar]" && exit 1
fi

if [[ $1 =~ $REGEX ]]
then
    echo "El Argumento ingresado debe ser un número positivo" && exit 2


# Luego cambiamos a un directorio donde guardaremos imagenes, segun el numero indicado 
# Elegimos un nombre, descargamos la imagen y la guardamos con el nombre selecto



for i in $(seq 1 $1)
do
    NOMBRE=[shuf -n $1 NOMBRES]
    (cd $DIRECTORIO/fotos_descargadas && curl -o $NOMBRE.jpg https://source.unsplash.com/random/900%C3%97700/?person)
    sleep 2
done

# Comprimimos las fotos descargadas en un archivo, luego procedemos a limpiar la carpeta
zip fotos_descargadas.zip $DIRECTORIO/fotos_descargadas/*

rm $DIRECTORIO/fotos_descargadas/*

exit 0