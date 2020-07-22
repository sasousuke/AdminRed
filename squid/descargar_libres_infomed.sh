#!/bin/bash

## Tiempo inicial

## echo $(date +%d%H%M)

### Variables Globales
SQUIDCONFDIR=/etc/squid

## Descargar lista de dominios
wget "http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=125&output=both" -O ${SQUIDCONFDIR}/newsites/dominios.txt

## Descargar lista de sitios
wget "http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=124&output=both" -O ${SQUIDCONFDIR}/newsites/sitios.txt

## Descargar lista de parciales
wget "http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=123&output=both" -O ${SQUIDCONFDIR}/newsites/parciales.txt

## Tiempo final

## echo $(date +%d%H%M)


exit 0