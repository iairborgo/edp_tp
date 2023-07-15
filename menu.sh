#!/bin/bash

#Script del menú navegable
intentos_gen=0
intentos_des=0
continua_gen=true
continua_des=true

echo -e "\nLista de opciones: \n"

PS3='Elija una opción de la lista> '

select opciones in 'generar' 'descomprimir' 'procesar' 'comprimir' 'salir'$'\n'
do
    [ -z "$opciones" ] && echo -e "\nLa opción ingresada no es correcta!\n" && continue
    [ "$REPLY" == 5 ] && echo -e "\nSaludos!\n" && break
    [ "$REPLY" == 1 ] && 
        while [ $intentos_gen -lt 5 ] && $continua_gen # Setearemos un máximo de 5 intentos
        do
            read -p "Ingrese la cantidad de imágenes que desea descargar: " cant_imags  # Lee el ingreso del usuario almacenandolo en la variable
            ./$opciones.sh "$cant_imags"    # Ejecuta el script de generar con el argumento de la variable anterior
            if [ $? -eq 0 ] 
            then 
                continua_gen=false
            else
                intentos_gen=$((intentos_gen + 1))
                if [ $intentos_gen -ge 5 ] 
                then 
                    echo -e "\nHas intentado demasiadas veces..\n"
                fi 
            fi
        done
    [ "$REPLY" == 2 ] &&
        while [ $intentos_des -lt 5 ] && $continua_des
        do
            read -p "Ingrese primero el archivo de imágenes comprimidas y luego el checksum en orden: " zip sum
            ./$opciones.sh "$zip" "$sum"
	    if [ $? -eq 0 ]
	    then
		continua_des=false
	    else
            	intentos_des=$((intentos_des + 1))
            	if [ $intentos_des -ge 5 ]
            	then
                	echo -e "\nHas intentado demasiadas veces..\n"
            	fi
	    fi
        done
    [ "$REPLY" == 3 ] || [ "$REPLY" == 4 ] && ./$opciones.sh && continue
done

exit 0
