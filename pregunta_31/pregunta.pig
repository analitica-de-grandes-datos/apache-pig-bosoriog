/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Cuente la cantidad de personas nacidas por año.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        
*/
rmf output
df = LOAD 'data.csv' USING PigStorage(',') AS (indice:int,nombre:CHARARRAY,apellido:CHARARRAY,fecha:DATETIME,color:CHARARRAY,valor:int) ;
df_final_aux = FOREACH df GENERATE ToString(fecha,'yyyy') as anio;
df_group = GROUP df_final_aux BY anio;
df_final = FOREACH df_group GENERATE group, COUNT(df_final_aux);
STORE df_final INTO 'output' USING PigStorage (',');