/*
Pregunta
===========================================================================

Obtenga los cinco (5) valores más pequeños de la 3ra columna.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
rmf output
df = LOAD 'data.tsv' AS (letra:CHARARRAY,fecha:CHARARRAY,valor:int);
columnas = FOREACH df GENERATE valor;
df_sort = ORDER columnas BY valor asc;
df_top = LIMIT df_sort 5;
STORE df_sort INTO 'output' USING PigStorage (',');