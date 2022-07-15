/*
Pregunta
===========================================================================

Ordene el archivo `data.tsv`  por letra y valor (3ra columna). Escriba el
resultado separado por comas.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

     >>> Escriba el codigo del mapper a partir de este punto <<<
*/
rmf output
df = LOAD 'data.tsv' AS (letra:CHARARRAY,fecha:CHARARRAY,valor:int);
df_sort = ORDER df BY letra, valor asc;
STORE df_sort INTO 'output' USING PigStorage (',');