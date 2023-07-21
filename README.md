# edp_tp

Trabajo Práctico Final

Para ejecutar el programa creado deberán ejecutarse los siguientes comandos en orden desde la terminal.

$ docker build -t tpedp .

$ docker run -it -v $(pwd):/app/output tpedp

La funcionalidad del programa es procesar un lote de imágenes. Cuenta con un menu de cinco opciones las cuales deberán ejecutarse idealmente de forma lineal del 1 al 4. Además, en cualquier momento puede salir del programa con la opción 5. 

Opcion 1: Descarga un conjunto de imágenes y las comprime.

Opcion 2: Descomprime el conjunto de imágenes comprimido.

Opcion 3: Recorta aquellas imágenes que tienen nombres válidos de personas (entiendase por "válidos" aquellos nombres que comienzan con mayúsculas) a una resolución de 512x512.

Opcion 4: Genera un archivo con la lista de nombres de todas las personas, otro listando los nombres "válidos", uno mas con la suma de todas las imagenes cuyo nombre finaliza en "a" y un ultimo archivo comprimido que incluye los archivos generados anteriormente y todas las imagenes.

Opcion 5: Salir

Aclaraciones importantes!!!

Para la opción 1 deben de pasar como argumento al programa la cantidad de imágenes que desea generar en formato de numero, el mismo deberá pertenecer a los Naturales 

mayores a 0.

Para la opción 2 deben de pasar los nombres de los archivos para descomprimir, son los siguientes:

imagenes.tar.gz checksum.txt

Para las opciones 3 y 4 no se requieren argumentos.

Una vez finalizado correctamente el programa podrá accederse al archivo archivos.tar.gz
