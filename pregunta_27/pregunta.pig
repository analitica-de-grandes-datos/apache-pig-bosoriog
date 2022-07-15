/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname, 
       LOCATE('ia', firstname) 
   FROM 
       u;

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        
*/
rmf output
df = LOAD 'data.csv' USING PigStorage(',') AS (indice:int,nombre:CHARARRAY,apellido:CHARARRAY,fecha:CHARARRAY,color:CHARARRAY,valor:int) ;
df_final = FOREACH df GENERATE INDEXOF(nombre,'ia',1);
STORE df_final INTO 'output' USING PigStorage (',');
