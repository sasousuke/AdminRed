#!/bin/bash
export LC_ALL=C

# Configuración del proxy web
export http_proxy="http://PROXYIP:PORT"
export https_proxy="http://PROXYIP:PORT"

# URL del sitio donde se publicaron las actualizaciones de Segurmática
URL="https://servidor.actualizaciones.cu/segav/"

# Directorio local donde se guardarán las actualizaciones
DESTINO=/var/www/segurmatica

# Borrar la actualización anterior
rm -rf ${DESTINO}/*

# Donde se debe descargar
TEMP=/tmp/segav

# Si no existe el directorio temporal se crea
if [ ! -d ${TEMP} ]; then
   mkdir -p ${TEMP}
fi

# Resultado de usar wget para hace mirror, lo cual añade el origen del mirror a la ruta
TEMP1=${TEMP}/servidor.actualizaciones.cu/segav

# Descargar los archivos
wget --recursive \
     --no-parent \
     --inet4-only \
     --no-check-certificate \
     --directory-prefix="$TEMP" \
     "$URL"

# Buscar y eliminar archivos que comienzan con "index"
find "$TEMP" -type f -name 'index*' -exec rm -v {} \;

# Copiando la actualización descomprimida en el directorio publico para que los clientes en red actualicen
cp -r ${TEMP1}/* ${DESTINO}

# Archivo con la actualizacion manual
ARCHIVOZIP=${DESTINO}/actualizacion.zip

# Posicionandonos en la ruta donde esta la actualizacion
cd ${DESTINO}

# Creando el zip
zip -r ${ARCHIVOZIP} *

#Estableciendo permisos para que cualquier usuario del sistema pueda leer el contenido de la carpeta
chmod -R 755 ${DESTINO}

# Borrar descarga temporal
rm -rf ${TEMP}

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
