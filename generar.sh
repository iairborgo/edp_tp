#!bin/bash

REGEX="^[1-9][0-9]*$"
DIRECTORIO="$( cd "$( dirname "$0" )" && pwd )" # esto va ayudar a ubicarse en el script
NOMBRES="$DIRECTORIO/dict_limpio.csv"

if [[ $# -ne 1 ]]
then
    echo "Solo se acepta 1 argumento [número de imagenes a generar]" && exit 1
fi


if [[ $1 =~ $REGEX ]]
then
    echo "El Argumento ingresado debe ser un número positivo" && exit 2
# si el argumento es 0 simplemente no generariamos imagen

for i in $(seq 1 $1) ;
do



done
