PREGUNTA 1: ¿Cuántas filas devuelve cada consulta y por qué son distintas? Explicá con ejemplos concretos de los datos qué filas se eliminaron con UNION.
CONSULTA 1 devuleve 11 filas, ya que elimina aquellas filas que sean idénticas
Consulta 2 devuelve 14 filas ya que incluye todos los registros, incluso los duplicados.

PREGUNTA 2: ¿Por qué UNION ALL es más eficiente que UNION? ¿Qué operación adicional realiza UNION internamente que consume más recursos?
UNION ALL es más eficiente porque solo concatena los resultados de ambas consultas mientras que UNION además debe buscar y eliminar los registros duplicados que requiere más memoria y tiempo de procesamiento.

PREGUNTA 3:En qué casos de negocio usarías cada uno? Dá al menos dos ejemplos reales distintos a los del ejercicio.
Utilizaría UNION para:
Consolidar un listado único de clientes provenientes de dos sucursales para evitar enviar promociones duplicadas.

Utilizaría UNION ALL para:
Unificar las ventas diarias de todas las sucursales para calcular la facturación total sin eliminar ningún registro.

PREUGNTA 4:¿Qué pasa si las columnas de ambas consultas no coinciden en número o tipo? ¿Qué error genera SQL?
Para realizar un UNION o UNION ALL, la cantidad de columnas debe ser la misma en todas las consultas y los tipos de datos Las columnas correspondientes deben ser compatibles. 
Si no coinciden la cantidad de filas, SQL server genera un error similar a 
"All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists."
Si no coinciden el tipo de datos, SQL server mostrará un error de conversión
"Conversion failed when converting the varchar value 'Laptop Pro 15' to data type int."
