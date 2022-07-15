/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT
       firstname,
       color
   FROM 
       u
   WHERE color = 'blue' OR firstname LIKE 'K%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        
*/
rmf output
df = LOAD 'data.csv' USING PigStorage(',') AS (indice:int,nombre:CHARARRAY,apellido:CHARARRAY,fecha:CHARARRAY,color:CHARARRAY,valor:int) ;
df_filter = FILTER df BY (LOWER(color) == 'blue') OR  (LOWER(nombre) matches 'k.*');
df_final = FOREACH df_filter GENERATE nombre, color;
STORE df_final INTO 'output' USING PigStorage (',');