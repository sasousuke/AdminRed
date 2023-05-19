#!/bin/bash

# Incluir sí o sí para que el script se ejecute
export LC_ALL=C

### Usando la herramienta replicator de Segurmatica para descargar las actualizaciones
# Herramienta para descargar hacia una carpeta local una actualizacion

# replicator -i DBid -d <directorio> [-s <servidor>][-f <proxy> [-p <puerto>]][-u <nombre usuario> -c <contrasenna>]

# -i o --dbid        Identificador de la BD a copiar (Debe coincidir con el de la BD)
# Identificadores: Producto
# segav: Segurmatica Antivitus 1.4
# segavEK: Segurmatica Antivitus Edicion Kaspersky 1.4
# savUnix: SavUnix
# -d o --directorio  Directorio donde almacenar la actualizacion (Debe existir)
# -s o --servidor  Servidor de actualizaciones, por defecto: http://www.segurmatica.cu/descargas/actualizaciones/segav/
# -f o --proxy             Nombre del Proxy or IP
# -p o --puerto    Puerto del Proxy, por defecto: 3128
# -u o --usuario   Usuario Proxy
# -c o --contrasenna Contrasenna del Usuario Proxy

# Ejemplos:
# replicator -i segav -d c:\prueba\baseAv\
# replicator --dbid segav --directorio c:\prueba\ --servidor http://www.segurmatica.cu/descargas/actualizaciones/segav/
# replicator --dbid segav --directorio c:\prueba\ --servidor http://www.segurmatica.cu/descargas/actualizaciones/segav/ --proxy proxy.cu --usuario nombre_usuario --contrasenna contrasenna_usuario
# replicator -i segav -d c:\prueba\ -s http://www.segurmatica.cu/descargas/actualizaciones/segav/ -f proxy.cu -p 3128 -u nombre_usuario -c contrasenna_usuario

replicator -i segav -d /opt/webftp/Segurmatica/Update/ -f 192.168.10.1 -p 3128

# Regla de oro. Si un script finaliza de forma satisfactoria emite un mensaje de OK == 0
exit 0
