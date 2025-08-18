#!/bin/sh
# Descargar recursos URL usando WGET y proxy web
# Los recursos URL deben estar en el archivo declarado un recurso por linea
# Si se desea descargar 10 recursos el archivo debe tener 10 lineas

# Estableciendo proxy para HTTP y HTTPS
export http_proxy="http://PROXYIP:PORT"
export https_proxy="http://PROXYIP:PORT"

# Estableciendo directorio a descargar
DOWNLOADFOLDER=/root/extras/descargas/

# Estableciendo archivo con URLs a descargar
DOWNLOADFILEURL=/root/descarga-fuera-salud-recursos-url.txt

# Estableciendo directorio de reportes
REPORTFOLDER=/root/extras/reportes

# Estableciendo ruta de descarga
cd ${DOWNLOADFOLDER}

# Descomentar este para descargas desde INTERNET
wget -c -t inf -o ${REPORTFOLDER}/descarga-planificada-$(date +%F)-$(date +%T).log -i ${DOWNLOADFILEURL}

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
