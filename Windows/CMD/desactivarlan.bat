@echo off
echo "Mostrando las interfaces de red"
netsh interface show interface

echo "Desactivar interface de red LAN"
netsh interface set interface LAN admin=disabled

pause
