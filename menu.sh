#!/bin/bash

#Script del menu navegable

echo -e "\nLista de opciones: \n"
PS3='Elija una opción de la lista> ' 							#En este prompt se guarda un mensaje para mostrar al usuario al momento de ingresar una opcion del select

select opciones in 'generar' 'descomprimir' 'procesar' 'comprimir' 'salir'$'\n'
do
	[ -e $opciones ] && echo -e "\nLa opcion ingresada no es correcta!\n" && continue 	# Check por si la opcion ingresada no es válida se indica el mensaje y continúa
	[ $REPLY == 5 ] && echo -e "\nSaludos!\n" && break					# En REPLY tenemos almacenada la entrada del usuario, en caso de ser 5 termina el programa
	[ $REPLY == 1 ] && read -p "Ingrese la cantidad de imágenes que desea descargar:" cant_imags && ./$opciones.sh "$cant_imags" && continue 	#Solicita al usuario el ingreso de un numero para pasar por parámetro al script de generar 
	[ $REPLY == 2 ] || [ $REPLY == 3 ] || [ $REPLY == 4 ] && ./$opciones.sh && continue	# Chequeo por el resto de opciones ejecutando los scripts en caso de matchear
done
exit 0
