#!/bin/bash

BASEDIR=/home/trazas/logs_rotados # directorio base donde estan almacenados los logs que se iran eliminando cuando su fecha de caducidad llegue

# Elimino todos los archivos de un directorio y subdirectorios dentro de este que tengan mas de 6 dias de antiguo con respecto a la fecha del sistema.
find ${BASEDIR} -type f -mtime +6 -exec rm {} \;

# Eliminar los directorios que estan vacios
find ${BASEDIR} -type d -empty -delete

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
