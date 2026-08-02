── CONSULTA 1: LEFT JOIN ────────────────-
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos? 
Los productos que nunca fueron vendidos son: Hub USB-C 7p y Parlante Bluetooth

── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
La venta 10 se realizó con un producto que no figura en el catálogo.

-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.
Se muestran todas las ventas y productos, apareciendo con NULL los productos sin ventas, y la venta sin un producto asignado.

--PREGUNTA 1:
Por qué usaste LEFT JOIN para la Consulta 1 y no INNER JOIN? ¿Qué se perdería si usaras INNER JOIN?
Use LEFT JOIN ya que esta clausula devuelve todos los datos de la tabla 1 (izquierda) y las filas concidentes de la tabla 2 (derecha), para los casos en que no se encuentra coincidencia el resultado del lado derecho es NULL. Como era necesario determinar los productos que no tuvieron ventas, la manera de hacerlo es usando un LEFT JOIN, buscando aquellos productos cuya cantidad sea NULL (ya que no habrá coinciencia en la tabla de ventas).
Si se usara el INNER JOIN se perderían aquellas filas donde no hay coincidencias, por lo cual no se podría detectar cuales fueron los productos que no se vendieron.

--PREGUNTA 2
¿Por qué usaste RIGHT JOIN para la Consulta 2? ¿Qué tabla está a la izquierda y cuál a la derecha en tu consulta?
Use RIGHT JOIN para encontrar las ventas registradas cuyos productos no aparecen en el catálogo. La tabla que esta a la izquierda es la de productos y la que esta a la derecha la de ventas. De esta manera la consulta me devuelve todas los registros de la tabla ventas (derecha) y cuando no hay coincidencia en productos (tabla izquierda) devuelve un NULL. 

--PREGUNTA 3
¿Qué representan los valores NULL en cada resultado? Explicá con un ejemplo concreto de los datos qué significa que venta_id sea NULL en la Consulta 1 y que producto_id de productos sea NULL en la Consulta 2.
Los valores NULL representan un valor desconocido o inexistentte, cuando al hacer algún JOIN aparece NULL, es porque no hay coincidencias entre las dos tablas. 
Para la consulta 1, el NULL indica que esos 2 productos no tienen ventas registradas, es decir, nunca fueron vendidos.
En la consulta 2, el NULL indica que no hay productos en el catálogo con ese número de ID.

--PREGUNTA 4
¿Cuándo usarías FULL OUTER JOIN en un caso real de negocio?
Usaría el FULL OUTER JOIN para obtener una visión completa cuando ambas tablas pueden tener datos únicos sin correspondencia, por ejempl para el caso de auditorías, o para evitar perder datos importantes que luego generen errores y puedan dar resultados sesgados.
