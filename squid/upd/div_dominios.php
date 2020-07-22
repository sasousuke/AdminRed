<?php

 // Create a stream
$opts = array(
  'http'=>array(
    'method'=>"GET",
    'header'=>"Accept-language: en\r\n" .
              "Cookie: foo=bar\r\n"
  )
);

$context = stream_context_create($opts);

// Open the file using the HTTP headers set above
$file = file_get_contents('http://proxyenlaces.sld.cu/SPT--ProxyList.php?clasificacion=125&output=both', false, $context);
$prueba = @explode(' ',$file);
$fileOut = "/etc/squid/newsites/dominios.txt";
if(file_exists($fileOut))
         {
             unlink($fileOut);
         }
 for ($i=0;$i<count($prueba);$i++)
 {
     $t = $prueba[$i]."\n";
	 
	 file_put_contents($fileOut, $t, FILE_APPEND);
 }

?>