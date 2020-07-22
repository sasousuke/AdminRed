#!/bin/bash

# actualizando sitios de navegacion infomed tematica
/usr/bin/php /etc/squid/upd/div_sitios.php
/usr/bin/php /etc/squid/upd/div_dominios.php
/usr/bin/php /etc/squid/upd/div_parciales.php

#eliminando los elementos duplicados
/usr/bin/php /etc/squid/upd/eliminar_duplicados_dominios.php
/usr/bin/php /etc/squid/upd/eliminar_duplicados_parciales.php
/usr/bin/php /etc/squid/upd/eliminar_duplicados_sitios.php
## /usr/bin/php /etc/squid/upd/eliminar_duplicados_off.php

exit 0



