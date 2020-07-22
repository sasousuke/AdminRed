#!/bin/bash

# detener el servicio de squid
/etc/init.d/squid stop

# No dejar vivo a ningun hilo de demonio suelto por ahi
sleep 15s
killall squid
sleep 15s
killall squid
sleep 15s
killall squid

# iniciar servicio de squid
/etc/init.d/squid start

exit 0