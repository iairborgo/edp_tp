# NO EJECUTAR, solo proposito de documentacion:

# vemos que el diccionario esta compuesto por 2 columnas
# nombre y ocurrencias, solo nos interesa mantener el primero
# esto se puede hacer con 

# luego hay que transformar la primer letra a mayuscula
# con una busqueda en google encontre

# cut -d , -f  1 dict.csv | awk '{for(i=1;i<=NF;i++){ $i=toupper(substr($i,1,1)) substr($i,2) }}1'  > dict_limpio.csv

