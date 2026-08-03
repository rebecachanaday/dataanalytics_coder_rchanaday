SELECT * FROM clientes;
SELECT * FROM productos;
SELECT * FROM categorias;
SELECT * FROM ventas;
SELECT*FROM territorios;

-- Consulta 1 — Vista base del proyecto (INNER JOIN) Combiná ventas, clientes, productos y territorios para obtener en una sola fila: 
--fecha, nombre del cliente, segmento, región, nombre del producto, categoría, cantidad, precio unitario, total de venta y canal. 

SELECT 
v.fecha_venta,
cl.nombre_cliente,
cl.segmento,
t.region,
p.nombre_producto,
p.categoria,
v.cantidad,
v.precio_unitario,
v.total_venta,
v.canal
FROM ventas v 
INNER JOIN productos p on v.id_producto = p.id_producto
INNER JOIN clientes cl on v.id_cliente=cl.id_cliente
INNER JOIN territorios t on cl.id_territorio=t.id_territorio
ORDER BY v.fecha_venta;

--Con esta consulta se obtiene una vista unica que cruza toda la información del negocio, 
--las ventas, clientes, productos y territorios estan interrelacionados en una sola tabla.

--Consulta 2 — Clientes sin ventas (LEFT JOIN) Identificá clientes registrados que aún no han realizado ninguna compra. 
--Mostrá su nombre, email y fecha de registro.
SELECT 
cl.nombre_cliente,
cl.email,
cl.fecha_registro
FROM clientes cl
LEFT JOIN ventas v on cl.id_cliente=v.id_cliente
WHERE v.id_cliente is NULL
ORDER BY cl.fecha_registro;

--El cliente que no ha realizado ninguna compra en Roberto Díaz.

--Consulta 3 — Productos sin ventas (LEFT JOIN) Identificá productos del catálogo que no tienen ninguna venta registrada. 
--Mostrá nombre del producto, categoría y precio.
SELECT 
p.nombre_producto,
p.categoria,
p.precio
FROM productos p
LEFT JOIN ventas v on p.id_producto=v.id_producto
WHERE v.id_venta is NULL
ORDER BY p.nombre_producto;

--El producto que no tiene ninguna venta registrada es Pad Mouse XL

--- Consulta 4 — Consolidado por canal (UNION ALL) Usá UNION ALL para combinar en un solo resultado las ventas Online y Presencial
--agregando una columna canal que identifique el origen de cada fila. 
--Al final calculá el total por canal con un GROUP BY.

SELECT
    canal,
    SUM(total_venta) AS total_facturado
FROM (
    SELECT
        id_venta,
        total_venta,
        'Online' AS canal
    FROM ventas
    WHERE canal = 'Online'
    UNION ALL
    SELECT
        id_venta,
        total_venta,
        'Presencial' AS canal
    FROM ventas
    WHERE canal = 'Presencial'
) AS ventas_consolidadas
GROUP BY canal;
