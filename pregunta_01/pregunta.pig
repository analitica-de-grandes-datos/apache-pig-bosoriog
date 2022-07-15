/* 
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra.
Almacene los resultados separados por comas. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
rmf output

df = LOAD 'data.tsv' AS (letra:CHARARRAY,fecha:datetime,valor:int);

columnas = FOREACH df GENERATE letra;

grouped = GROUP columnas BY letra;

wordcount = FOREACH grouped GENERATE group, COUNT(columnas);

STORE wordcount INTO 'output' USING PigStorage (',');