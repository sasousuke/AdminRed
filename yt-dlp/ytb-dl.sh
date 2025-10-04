#!/bin/bash
export LC_ALL=C

PROXY=http://10.0.0.1:3128

# Verifica que se haya pasado una URL
if [ -z "$1" ]; then
    echo "Uso: $0 <URL del video de YouTube>"
    exit 1
fi

URL="$1"

# Mostrar los formatos disponibles
echo "Obteniendo formatos disponibles para: $URL"
yt-dlp --force-ipv4 -F --proxy $PROXY "$URL"

# Solicitar al usuario que seleccione un formato
echo ""
read -p "Introduce el código del formato que deseas descargar: " FORMAT

# Verificar que se haya ingresado algo
if [ -z "$FORMAT" ]; then
    echo "No se ha seleccionado ningún formato. Abortando."
    exit 1
fi

# Descargar el video con el formato seleccionado
echo "Descargando el video en el formato $FORMAT..."
yt-dlp --force-ipv4 -f "$FORMAT" --proxy $PROXY "$URL"

echo "Descarga completada."

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
