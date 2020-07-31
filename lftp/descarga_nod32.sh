#!/bin/sh

# Descargar las actualizaciones del NOD32 que se publican en el WebFTP de INFOMED con LFTP
# Se utiliza el rar para crear comprimido
# Se utiliza adicional el modulo sfx7z del 7zip para generar un autoextraible
# /usr/local/sbin/descarga_nod32.sh

# Carpetas donde se almacenaran las actualizaciones
ESETDIRUPDATE=/var/www/ftp/antivirus/actualizaciones/eset

# Borrar la actualización anterior
rm -rf ${ESETDIRUPDATE}

# Comprobar que existe el directorio. Si no existe, crearlo.
if [ ! -d ${ESETDIRUPDATE} ]; then
	mkdir -p ${ESETDIRUPDATE}
fi

# Temporal para SFX
TEMPDIRUPDATE=/root/extras/nod32

# Comprobar que existe el directorio. Si no existe, crearlo.
if [ ! -d ${TEMPDIRUPDATE} ]; then
	mkdir -p ${TEMPDIRUPDATE}
fi

# INFOMED WebFTP
TEMPURLUPDATE=http://ftp.sld.cu/pub/antivirus/nod32/actualizaciones/up_date3/

# Realizar mirror de las url de antivirus a las carpetas
lftp -c mirror -e -n ${TEMPURLUPDATE} ${TEMPDIRUPDATE}

# Creando el SFX con p7zip y el modulo SFX
7z a -mhe=on -sfx7z.sfx ${ESETDIRUPDATE}/updateESET.exe ${TEMPDIRUPDATE}/*

# Posicionandonos en la ruta donde esta la actualización
cd ${TEMPDIRUPDATE}

# Creando el zip
zip -r updateESET.zip *

# Moviendo el zip a la ruta de actualizaciones
mv updateESET.zip ${ESETDIRUPDATE}

# Ponerle todos los permisos de lectura
chmod -R 744 ${ESETDIRUPDATE}

# Estableciendo el propietario del usuario que publica en el servidor webftp local
chown -R www-data:www-data ${SAVDIRUPDATE}

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0