;
; BIND data file for local loopback interface
;
$TTL	604800
$ORIGIN hgdan.sld.cu. ;
@	IN	SOA	hgdan.sld.cu. root.hgdan.sld.cu. (
			52
			604800
			86400
			2419200
			604800 )
;
hgdan.sld.cu.	IN	NS	dns.hgdan.sld.cu.
@	IN	A	127.0.0.1
@	IN	AAAA	::1

dns.hgdan.sld.cu.	IN	A	192.168.0.2
www.hgdan.sld.cu.	IN	A	192.168.0.8
wpad.hgdan.sld.cu.	IN	CNAME	www.hgdan.sld.cu.
ftp.hgdan.sld.cu.	IN	A	192.168.0.3
ldap.hgdan.sld.cu.	IN	A	192.168.0.4
proxy.hgdan.sld.cu.	IN	A	192.168.0.5
lightsquid.hgdan.sld.cu.	IN	CNAME	proxy.hgdan.sld.cu.
galen.hgdan.sld.cu.	IN	A	192.168.0.13
ubuntu1604.hgdan.sld.cu.	IN	A	192.168.0.18
guardiamedica.hgdan.sld.cu.	IN	A	192.168.0.11
ubuntu1804.hgdan.sld.cu.	IN	A	192.168.0.15
directorio.hgdan.sld.cu.	IN	A	192.168.0.7
pquirurgica.hgdan.sld.cu.	IN	CNAME	www.hgdan.sld.cu.
farmacia.hgdan.sld.cu.	IN	A	192.168.0.7
wsus.hgdan.sld.cu.	IN	A	192.168.0.21
debian9.hgdan.sld.cu.	IN	A	192.168.0.9
imedig.hgdan.sld.cu.	IN	A	172.16.0.202
