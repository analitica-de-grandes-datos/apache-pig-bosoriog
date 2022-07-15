/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
rmf output

df = LOAD 'data.tsv' AS (letra_col:CHARARRAY,dicc:BAG{t1:TUPLE(letra:CHARARRAY)},lista:MAP[]);
df_planos = FOREACH df GENERATE FLATTEN(dicc);
grupos = GROUP df_planos BY letra;
grupo_count = FOREACH grupos GENERATE group, COUNT(df_planos);

STORE grupo_count INTO 'output' USING PigStorage (',');