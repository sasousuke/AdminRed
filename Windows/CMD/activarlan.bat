@echo off
echo "Mostrando las interfaces de red"
netsh interface show interface

echo "Activar interface de red LAN"
netsh interface set interface LAN admin=enabled

pause
