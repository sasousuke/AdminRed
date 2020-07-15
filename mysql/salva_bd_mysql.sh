#!/bin/bash

# Salvar varias BD haciendo uso de mysqldump
# /usr/local/sbin/salva_bd_mysql.sh

# directorio de almacenamiento de salvas de SQL
SQLDIR=/var/backups/mysqlbd/$(date +%Y)/$(date +%m).$(date +%B)/$(date +%d)

# La ruta quedará de la siguiente forma:
# /var/backups/mysqlbd/2017/01.Enero/01
# /var/backups/mysqlbd/2017/03.Marzo/29

# comprobar que existe el directorio de almacenamiento de logs
# si no existe, crearlo.
if [ ! -d ${SQLDIR} ]; then
    mkdir -p ${SQLDIR}
fi

# datos del usuario de mysql
USERNAME=miusuario
PASSNAME=NoTelaDigoPorQueEsSecreta

# Lista de bases de datos
BDARRAY=("plandetrabajo")
BDARRAY[1]=paquetesemanal
BDARRAY[2]=chismosored
BDARRAY[3]=intranet

printf "\nSalvando bases de datos:"

# Ir salvando cada BD en un archivo independiente
for ITEM in ${BDARRAY[*]}
do
       # Si quieres que te muestre en la consola al ejecutarse el script cuales BD ya ha salvado
       # descomentar la linea del printf a continuacion
       ## printf "%s\n" $ITEM

       # Aquí se realiza la magia
       mysqldump --user=${USERNAME} --password=${PASSNAME} ${ITEM} > ${SQLDIR}/${ITEM}.sql
done

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
