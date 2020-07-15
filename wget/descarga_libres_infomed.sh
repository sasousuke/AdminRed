#!/bin/bash

# Actualizar la lista de dominios, parciales y sitios que INFOMED tiene liberados del consumo de cuota de navegacion
# /usr/local/sbin/descarga_libres_infomed.sh

# Variables Globales
SQUIDCONFDIR=/etc/squid

# Descargar lista de dominios
wget "http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=125&output=both" -O ${SQUIDCONFDIR}/infomed/dominios.txt

# Descargar lista de sitios
wget "http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=124&output=both" -O ${SQUIDCONFDIR}/infomed/sitios.txt

# Descargar lista de parciales
wget "http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=123&output=both" -O ${SQUIDCONFDIR}/infomed/parciales.txt

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
