/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

rmf output

df = LOAD 'data.tsv' AS (letra:CHARARRAY,dicc:BAG{},lista:MAP[]);
llaves = FOREACH df GENERATE FLATTEN(KEYSET(lista)) as llave;
grupos = GROUP llaves BY llave;
grupo_count = FOREACH grupos GENERATE group, COUNT(llaves);

STORE grupo_count INTO 'output' USING PigStorage (',');