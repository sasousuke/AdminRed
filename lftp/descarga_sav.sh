#!/bin/sh

# Descargar las actualizaciones del Segurmatica que se publican en el WebFTP de INFOMED con LFTP
# Se utiliza el rar para crear comprimido
# Se utiliza adicional el modulo sfx7z del 7zip para generar un autoextraible
# /usr/local/sbin/descarga_sav.sh

# Carpetas donde se almacenaran las actualizaciones
SAVDIRUPDATEBASE=/var/www/ftp/antivirus/actualizaciones/segurmatica
SAVDIRUPDATE=/var/www/ftp/antivirus/actualizaciones/segurmatica/segav

# Borrar la actualización anterior
rm -rf ${SAVDIRUPDATEBASE}

# Comprobar que existe el directorio. Si no existe, crearlo.
if [ ! -d ${SAVDIRUPDATE} ]; then
	mkdir -p ${SAVDIRUPDATE}
fi

# Temporal para SFX
TEMPDIRUPDATE=/root/extras/segav

# Comprobar que existe el directorio. Si no existe, crearlo.
if [ ! -d ${TEMPDIRUPDATE} ]; then
	mkdir -p ${TEMPDIRUPDATE}
fi

# INFOMED WebFTP
TEMPURLUPDATE=http://ftp.sld.cu/pub/antivirus/sav/actualizacion/segav/

# Realizar mirror de las url de antivirus a las carpetas
lftp -c mirror -e -n ${TEMPURLUPDATE} ${TEMPDIRUPDATE}

# Copiando la actualización descomprimida en el directorio público para que los clientes en red actualicen
cp -r ${TEMPDIRUPDATE}/* ${SAVDIRUPDATE}

# Creando el SFX con p7zip y el modulo SFX
7z a -mhe=on -sfx7z.sfx ${SAVDIRUPDATEBASE}/updateSAV.exe ${TEMPDIRUPDATE}/*

# Posicionandonos en la ruta donde esta la actualizacion
cd ${TEMPDIRUPDATE}

# Creando el zip
zip -r updateSAV.zip *

# Moviendo el zip a la ruta de actualizaciones
mv updateSAV.zip ${SAVDIRUPDATEBASE}

# Ponerle todos los permisos de lectura
chmod -R 777 ${SAVDIRUPDATEBASE}

# Estableciendo el propietario del usuario que publica en el servidor webftp local
chown -R www-data ${SAVDIRUPDATEBASE}

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0