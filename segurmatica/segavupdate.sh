#!/bin/bash

export LC_ALL=C

# Directorio de descarga de la actualización
SAVDIRUPDATEBASE=/opt/webftp/Segurmatica/Update

# Borrar la actualización anterior
rm -rf ${SAVDIRUPDATEBASE}

# Comprobar que existe el directorio. Si no existe, crearlo.
if [ ! -d ${SAVDIRUPDATE} ]; then
	mkdir -p ${SAVDIRUPDATE}
fi

#Ejecutamos la aplicación Replicator con los parámetros de nuestra red
#Poner la ruta completa para evitar errores de no encontrado la ruta del ejecuatble
/usr/sbin/replicator -i segav -d ${SAVDIRUPDATEBASE} -f 192.168.10.1 -p 3128

#Estableciendo permisos para que cualquier usuario del sistema pueda leer el contenido de la carpeta
chmod -R 755 ${SAVDIRUPDATEBASE}

# Posicionandonos en la ruta donde esta la actualizacion
cd ${SAVDIRUPDATEBASE}

# Creando el zip
zip -r updateSAV.zip *

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
