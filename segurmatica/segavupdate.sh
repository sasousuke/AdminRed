#!/bin/bash
export LC_ALL=C

# Directorio de descarga de la actualizacion
SAVDIRUPDATEBASE=/srv/ftp/antivirus/sav/actualizaciones

# Directorio de la actualizacion manual
SAVDIRUPDATEMANUAL=/srv/ftp/antivirus/sav/actualizacion_manual

# Archivo con la actualizacion manual
ARCHIVOZIP=${SAVDIRUPDATEMANUAL}/actualizacion-$(date +%Y%m%d).zip

SIZEFILEMIN=1024 # 1 MB en bytes

# Borrar la actualizacion anterior
rm -rf ${SAVDIRUPDATEBASE}/*

# Borrar la actualizacion anterior
rm -rf ${SAVDIRUPDATEMANUAL}/*

actions() {

    # Ejecutamos la aplicacion Replicator con los parametros de nuestra red
    # Poner la ruta completa para evitar errores de no encontrado la ruta del ejecutable
    /usr/local/sbin/replicator -i segav -d ${SAVDIRUPDATEBASE} -f proxy.sld.cu -p 3128

    #Estableciendo permisos para que cualquier usuario del sistema pueda leer el contenido de la carpeta
    chmod -R 755 ${SAVDIRUPDATEBASE}

    # Posicionandonos en la ruta donde esta la actualizacion
    cd ${SAVDIRUPDATEBASE}

    # Creando el zip
    zip -r updateSAV.zip *

    # Mover el update hacia la carpeta destino
    mv updateSAV.zip ${ARCHIVOZIP}

    #Estableciendo permisos para que cualquier usuario del sistema pueda leer el contenido de la carpeta
    chmod -R 755 ${SAVDIRUPDATEMANUAL}
}

while true; do
    if [ -f "$ARCHIVOZIP" ]; then
        SIZEFILE=$(stat -c%s "$ARCHIVOZIP")
        if [ "$SIZEFILE" -ge "$SIZEFILEMIN" ]; then
           echo "El archivo ahora pesa 1 MB o más. Saliendo del ciclo."
           break
        else
           echo "El archivo es menor de 1 MB. Ejecutando tarea..."
           actions 
        fi
    else
        echo "El archivo no existe."
        actions 
    fi
    sleep 10  # Espera 10 segundos antes de verificar nuevamente
done

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
