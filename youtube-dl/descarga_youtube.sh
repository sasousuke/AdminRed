#!/bin/bash

# Para descargar de Youtube usando youtube-dl
# Se usa descarga_youtube.sh https://youtu.be/1RKPsALUGn8
# /usr/local/sbin/descarga_youtube.sh

# Estableciendo proxy
export http_proxy="http://proxy.sld.cu:3128"
export http_proxys="http://proxy.sld.cu:3128"

# Asi se muestran los formatos de una URL del video
youtube-dl --list-formats $1

# Pedimos el formato a descargar el video donde:
# 18 es el mp4 de 640x480
# 22 es el mp4 de 1280x720 
read option

# Descargar el video en el formato mp4 (casi siempre mejor calidad)
# donde:
# --retries infinite es para que haga infinitos reintentos de descarga
youtube-dl --retries infinite --format $option $1

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
