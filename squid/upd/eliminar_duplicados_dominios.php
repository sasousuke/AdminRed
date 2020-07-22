<?php
    $fileName = "/etc/squid/newsites/dominios.txt";
    
    // Función comparativa que devuelve 1 si la longitud del string $a es mayor que el string $b,
    // devuelve -1 en caso contrario.

    function cmp($a, $b)
    {
        if (strlen($a) < strlen($b))
            return -1;
        return 1;
    }
    // Leer todos los dominios publicados por proxyenlaces.sld.cu
    $array_dominios = file($fileName);
    $tempArray = array();
    foreach ($array_dominios as $dominio){
    	if (strlen($dominio) > 2){
    		$tempArray[] = $dominio;
    	}
    }
    $array_dominios = $tempArray;
    // Guardar los dominios en un arreglo.
    #$array_dominios = explode(" ", $dominios);
    // Se ordenan en orden ascendente (por longitud de cadena) para que se procesen los 
    // dominios más cortos en nombre ya que se cumple siempre que el dominio superior es 
    // siempre más corto.
    // Ejemplo:
    // dominio primario:
    // .org .com .net
    // subdominios primarios o dominios secundarios:
    // .gmail.com wikipedia.org .asp.net
    // subdominios secundarios o dominios terciarios: 
    // .static.gmail.com .multimedia.wikipedia.org .code.asp.net 
    usort($array_dominios, "cmp");
    // Inicializo las variables
    $result = array();
    // El 1er ciclo es para ir procesando los dominios originales.
    foreach ($array_dominios as $dominio){
        // Bandera para dominio no procesado aún.
        $isIt = false;
        // El 2do ciclo es para comprobar que el dominio sea un dominio superior de uno ya
        // existente o que no se haya agregado aún a la lista de dominios procesados.
        foreach ($result as $key => $dom){
            // Si el dominio a evaluar es un subdominio de uno existente se detiene el ciclo.
            $mayor = $dominio; $menor = $dom;
            if (strlen($mayor) < strlen($menor)){
                $mayor = $dom; $menor = $dominio;
            }
            // Se extrae la misma cantidad de caracteres de derecha a izquierda de la más larga
            // como longitud de la menor cadena
            // Ejemplo 1: menor = .com.org (corto) [8] mayor = .net.com.org (largo)
            // Ejemplo 2: menor = .dom.org (corto) [8] mayor = .net.com.org (largo)
            // Ejemplo 3: menor =  .cu.org (corto) [7] mayor =  .cu.org.com (largo)
            $temp = substr($mayor, strlen($mayor) - strlen($menor));
            // Se comparan ambas cadenas ya que si la mayor es un subdominio de la menor deben
            // tener la misma terminacion
            // Extraer 1: temp = .com.org menor = .com.org
            // Extraer 2: temp = .com.org menor = .dom.org
            // Extraer 3: temp =  .cu.org menor =  org.com
            if ($temp == $menor){
                $isIt = true; break;
            }
        }
        // En caso de que el dominio a evaluar no sea un dominio superior de uno existente
        // indica que es un dominio sin precedentes
        if (!$isIt){
            $result[] = $dominio;
        }
    }
    #echo "Dominios antes de procesar: ". count($array_dominios).  " <br>";
    #echo "Dominios despues de procesar: ". count($result).  " <br>";
    $dominios = "";
    foreach ($result as $dominio)
        $dominios .= $dominio;
    file_put_contents($fileName, $dominios, LOCK_EX);
?>