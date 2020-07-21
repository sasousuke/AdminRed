#!/bin/bash

# Descarga el repositorio de Ubuntu 18.04 con debmirror desde el FTP de INFOMED
# Si se ejecuta periodicamente actualiza los cambios de paquetes en el repositorio
# Al detectarse un cambio de seguridad en el repositorio se recomienda una actualizacion
# al sistema base porque generalmente se introducen nuevas llaves de verificacion
# /usr/local/sbin/descarga_repositorio_ubuntu1804_infomed.sh

DIRECTORY="/var/www/html/ubuntu"
logs=/var/log/debmirror/update-ubuntu.log
echo Start replic $(date "+%Y-%m-%d %H:%M") > $logs
debmirror \
    --progress \
    --verbose \
    --host=ftp.sld.cu \
    --root=ubuntu \
    --dist=bionic,bionic-updates,bionic-security,bionic-backports \
    --section=main,restricted,universe,multiverse \
    --diff=none \
    --i18n \
    --arch=i386,amd64 \
    --nosource \
    --rsync-extra=none \
    --method=http \
    --postcleanup \
    --ignore-small-errors \
    --ignore-release-gpg \
    --ignore-missing-release \
    --ignore=README* \
    $DIRECTORY >> $logs 2>&1

if [ $? -eq 0 ];then
    echo Stop replic $(date "+%Y-%m-%d %H:%M") >> $logs
    echo $(date "+%Y-%m-%d %H:%M") Update Successfully > $DIRECTORY/update_successfully.log
else
    echo $(date "+%Y-%m-%d %H:%M") Update Error Down >> $DIRECTORY/update_successfully.log
fi

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
