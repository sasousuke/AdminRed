#!/bin/bash

# Para descargar cosas de la mochila
# Cada URL que puede ser una carpeta o un archivo especifico se descarga en carpetas separadas

# Estableciendo proxy
export http_proxy="http://proxy.sld.cu:3128"
export https_proxy="http://proxy.sld.cu:3128"

# Directorio de descarga de las carpetas
MOCHILADIR=/root/extras/mochila

# Archivo de las rutas de las carpetas a descargar
FILENAME=/root/descargar-mochila.txt

# Enumerador de tareas
let TAREA=0

# Leer linea a linea el Archivo de las rutas
# Y almacenarlas en la variable URL
while read -r URL; do

# If no existe el directorio de la URL a descargar se crea
if [ ! -d ${MOCHILADIR}/${TAREA} ]; then
mkdir -p ${MOCHILADIR}/${TAREA}
fi

# Descargar la ruta URL en la carpeta
lftp -c mirror -n ${URL} ${MOCHILADIR}/${TAREA}

# Incrementar el enumerador de la tarea
let TAREA=$TAREA+1

done < "$FILENAME"

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
