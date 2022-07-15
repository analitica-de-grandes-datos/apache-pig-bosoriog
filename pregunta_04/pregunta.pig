/*
Pregunta
===========================================================================

El archivo `data.csv` tiene la siguiente estructura:

  driverId       INT
  truckId        INT
  eventTime      STRING
  eventType      STRING
  longitude      DOUBLE
  latitude       DOUBLE
  eventKey       STRING
  correlationId  STRING
  driverName     STRING
  routeId        BIGINT
  routeName      STRING
  eventDate      STRING

Escriba un script en Pig que carge los datos y obtenga los primeros 10 
registros del archivo para las primeras tres columnas, y luego, ordenados 
por driverId, truckId, y eventTime. 

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

         >>> Escriba su respuesta a partir de este punto <<<
*/
rmf output
df = LOAD 'data.csv' USING PigStorage(',');
columnas = FOREACH df GENERATE $0 AS driverID, $1 AS truckId, $2 AS eventTime;
df_top = LIMIT columnas 10;
df_sort = ORDER df_top BY driverID asc, truckId asc, eventTime asc;

STORE df_sort INTO 'output' USING PigStorage (',');