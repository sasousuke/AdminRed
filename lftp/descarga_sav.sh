#!/bin/sh

# Descargar las actualizaciones del Segurmatica que se publican en el WebFTP de INFOMED con LFTP
# Se utiliza el rar para crear comprimido
# /usr/local/sbin/descarga_sav.sh

# Carpetas donde se almacenaran las actualizaciones
SAVDIRUPDATE=/var/www/ftp/antivirus/actualizaciones/segurmatica/segav

# Comprobar que existe el directorio. Si no existe, crearlo.
if [ ! -d ${SAVDIRUPDATE} ]; then
	mkdir -p ${SAVDIRUPDATE}
fi

# Borrar la actualizacion anterior
rm -rf ${SAVDIRUPDATE}/*

# INFOMED WebFTP
TEMPURLUPDATE=http://ftp.sld.cu/pub/antivirus/sav/actualizacion/segav/

# Realizar mirror de las url de antivirus a las carpetas
lftp -c mirror -e -n ${TEMPURLUPDATE} ${SAVDIRUPDATE}

# Posicionandonos en la ruta donde esta la actualizacion
cd ${SAVDIRUPDATE}

# Creando el rar
rar a updateSAV.rar *

# Ponerle todos los permisos de lectura
chmod -R 744 ${SAVDIRUPDATE}

# Estableciendo el propietario del usuario que publica en el servidor webftp local
chown -R www-data:www-data ${SAVDIRUPDATE}

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
