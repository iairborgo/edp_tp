#!/bin/bash

#Script del menú navegable
intentos_gen=0
intentos_des=0
flag=0

echo -e "\nLista de opciones: \n"	# Para mostrar antes del select

PS3='Elija una opción de la lista> ' 	# Este es un prompt para el SELECT siguiente

select opciones in 'generar' 'descomprimir' 'procesar' 'comprimir' 'salir'$'\n'
do
    [ -z "$opciones" ] && echo -e "\nLa opción ingresada no es correcta!\n" && continue
    [ "$REPLY" == 5 ] && echo -e "\nSaludos!\n" && break
    [ "$REPLY" == 1 ] &&
        while [ $intentos_gen -lt 5 ] && [ $flag -eq 0 ] # Setearemos un máximo de 5 intentos
        do
            read -p "Ingrese la cantidad de imágenes que desea descargar: " cant_imags  # Lee el ingreso del usuario almacenandolo en la variable
            ./$opciones.sh "$cant_imags"    # Ejecuta el script de generar con el argumento de la variable anterior
            if [ $? -eq 0 ]
	    then
		flag=1
		echo -e "\nHas generado correctamente las imágenes\n"
	    fi
	    intentos_gen=$((intentos_gen + 1))
            if [ $intentos_gen -ge 5 ]
            then
            	echo -e "\nHas intentado demasiadas veces, lo siento...\n"
		exit 1
            fi
        done
    [ "$REPLY" == 2 ] &&
        while [ $intentos_des -lt 5 ] && [ $flag -eq 1 ]
        do
	    read -p "Ingrese los parámetros >  " img zip
            ./$opciones.sh $img $zip
	    if [ $? -eq 0 ]
	    then
		flag=2
	    fi
            intentos_des=$((intentos_des + 1))
            if [ $intentos_des -ge 5 ]
            then
                echo -e "\nLo siento, no se permiten mas intentos...\n"
		exit 2
            fi
        done
    [ "$REPLY" == 3 ] && 
	while [ $flag -eq 2 ]
	do
	    ./$opciones.sh 
	    if [ $? -eq 0 ]
	    then
	    	echo -e "\nImágenes procesadas correctamente\n"
		flag=3
	    fi && break
	done
    [ "$REPLY" == 4 ] &&
	while [ $flag -eq 3 ]
	do
	    ./$opciones.sh 
	    if [ $? -eq 0 ]
	    then
		echo -e "\nImágenes comprimidas correctamente\n \nFin del programa\n"
		flag=4
	    fi && break
	done
done
exit 0
