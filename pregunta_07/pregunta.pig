/*
Pregunta
===========================================================================

Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
columna 3 separados por coma. La tabla debe estar ordenada por las 
columnas 1, 2 y 3.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
rmf output
df = LOAD 'data.tsv' AS (letra:CHARARRAY,dicc:BAG{},lista:MAP[]);
conteos = foreach df generate letra, SIZE(dicc) as dicc, SIZE(lista) as lista;
df_sort = ORDER conteos BY letra asc, dicc asc, lista asc;

STORE df_sort INTO 'output' USING PigStorage (',');
