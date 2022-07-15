/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código que genere la siguiente salida.

   Boyer,BOYER,boyer
   Coffey,COFFEY,coffey
   Conway,CONWAY,conway
   Crane,CRANE,crane
   Diaz,DIAZ,diaz
   Estes,ESTES,estes
   Fry,FRY,fry
   Garrett,GARRETT,garrett
   Guy,GUY,guy
   Hamilton,HAMILTON,hamilton
   Holcomb,HOLCOMB,holcomb
   Jarvis,JARVIS,jarvis
   Kinney,KINNEY,kinney
   Klein,KLEIN,klein
   Knight,KNIGHT,knight
   Noel,NOEL,noel
   Sexton,SEXTON,sexton
   Silva,SILVA,silva

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
rmf output
df = LOAD 'data.csv' USING PigStorage(',') AS (indice:int,nombre:CHARARRAY,apellido:CHARARRAY,fecha:CHARARRAY,color:CHARARRAY,valor:int) ;
df_final = FOREACH df GENERATE UCFIRST(apellido) as apellido1, UPPER(apellido) as apellido2,LOWER(apellido) as apellido3;
df_sort = ORDER df_final BY apellido1 asc;
dump df_sort;
STORE df_sort INTO 'output' USING PigStorage (',');
