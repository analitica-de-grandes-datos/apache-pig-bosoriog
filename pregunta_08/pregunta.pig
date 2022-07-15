/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
columna 3 es:

  ((b,jjj), 216)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig


*/
rmf output
df = LOAD 'data.tsv' AS (letra:CHARARRAY,dicc:BAG{},lista:MAP[]);
columnas = FOREACH df GENERATE FLATTEN(dicc) as dicc, FLATTEN(KEYSET(lista)) as llave;
grupos = GROUP columnas by (dicc,llave);
df_final = FOREACH grupos GENERATE group, COUNT(columnas);

STORE df_final INTO 'output' USING PigStorage (',');
