#!/bin/bash

# Vaciar los registros de navegacion del squid y almacenarlos por fecha
# /etc/squid/rotar-logs.sh

LOGFILEDIR=/var/log/squid
LOGFILE=${LOGFILEDIR}/access.log # ubicacion del log de acceso
CACHEFILE=${LOGFILEDIR}/cache.log # ubicacion del log de cache
STOREFILE=${LOGFILEDIR}/store.log # ubicacion del log de cache

BASEDIR=/var/squid-logs # directorio base para la rotacion
LOGDIR=${BASEDIR}/$(date +%Y)/$(date +%m).$(date +%B) # directorio de almacenamiento de logs
FILENAME=access-$(date +%d%H%M).log # nombre de archivo del log

# comprobar que existe el directorio de almacenamiento de logs
# si no existe, crearlo.
if [ ! -d ${LOGDIR} ]; then
	mkdir -p ${LOGDIR}
fi

# detener el servicio de squid
/etc/init.d/squid stop

# No dejar vivo a ningun hilo de demonio suelto por ahi
sleep 15s
killall squid
sleep 15s
killall squid
sleep 15s
killall squid

# mover el log hacia el directorio de almacenamiento de logs
cp ${LOGFILE} ${LOGDIR}/${FILENAME}

# vaciar access.log
cat /dev/null > ${LOGFILE}

# vaciar store.log
cat /dev/null > ${STOREFILE}

# vaciar cache.log
cat /dev/null > ${CACHEFILE}

#eliminando los elementos duplicados
/usr/bin/php /etc/squid/upd/eliminar_duplicados_dominios.php
/usr/bin/php /etc/squid/upd/eliminar_duplicados_parciales.php
/usr/bin/php /etc/squid/upd/eliminar_duplicados_sitios.php

# iniciar servicio de squid
/etc/init.d/squid start

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
