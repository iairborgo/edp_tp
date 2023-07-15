#!/bin/bash

#Este será un limpiador del csv que contendrá los nombres de personas

URL="https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv"

wget -O dict.csv $URL											# Descarga el csv de la URL y con -O se asigna nuevo nombre

cat dict.csv | tr " " "\n" | egrep -o "[A-Za-z]{1,}" | sort | uniq | sort > dict_limpio.csv		# Limpieza de palabras y ordena

exit 0
