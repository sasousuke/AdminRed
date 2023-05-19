#!/bin/bash

export LC_ALL=C

SAVDIRUPDATEBASE=/opt/webftp/Segurmatica/Update

replicator -i segav -d ${SAVDIRUPDATEBASE} -f 192.168.10.1 -p 3128

# Posicionandonos en la ruta donde esta la actualizacion
cd ${SAVDIRUPDATEBASE}

# Eliminando el zip anterior
rm updateSAV.zip

# Creando el zip
zip -r updateSAV.zip *

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
