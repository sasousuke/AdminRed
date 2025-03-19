# Cuando queremos que nuestro squish no contabilice como cuota gastada el tráfico hacia algunos dominios
# agregamos una línea en la lista de excepciones

# A manera de ejemplo este sería la línea a agregar para los dominios .cu

# Original
@excludelist = (
	{ "field" => 3, "pattern" => "TCP_DENIED/" } ,
	{ "field" => 3, "pattern" => "NONE/" },
	{ "field" => 6, "pattern" => '^http://127\.0\.0\.1/' } # localhost

);

# Modificado con la línea adicionada, fijarse de la coma "," antes del comentario de # localhost, eso es parte de la sintanxis de perl.
@excludelist = (
	{ "field" => 3, "pattern" => "TCP_DENIED/" } ,
	{ "field" => 3, "pattern" => "NONE/" },
	{ "field" => 6, "pattern" => '^http://127\.0\.0\.1/' }, # localhost
	{ "field" => 6, "pattern" => '^(https?://)([\w.-]+\.)*[\w-]+\.(cu)' } # Navegacion .cu
);
