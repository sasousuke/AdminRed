REM Encabezado para poder obtener el formato de archivo de salva por fecha de ejecución para BASH en Windows

REM FECHA en números
SET DIA=%date:~-10,2%
SET MES=%date:~-7,2%
SET ANNO=%date:~-4%

REM TIME en números
SET HOR=%time:~0,2%
SET MIN=%time:~3,2%
SET SEG=%time:~-5,2%

REM Ejemplos de nombres de ficheros

REM salva-28-09-2020
SET FILENAME=salva-%DIA%-%MES%-%ANNO%

REM salva-28-09-2020-10-45-34
SET FILENAME=salva-%DIA%-%MES%-%ANNO%-%HOR%-%MIN%-%SEG%
