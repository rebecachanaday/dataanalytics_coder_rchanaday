--══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Chanaday Rebeca
-- Fecha: 2/08/2026
-- ══════════════════════════════════════════
-- ── CONSULTA 1: LEFT JOIN ─────────────────
-- Pregunta de negocio: ¿Qué productos del catálogo nunca fueron vendidos? 
-- Mostrá todos los productos y sus ventas asociadas.
-- Los productos sin ventas aparecerán con NULL en las columnas de ventas.

SELECT p.nombre,
       p.categoria,
       v.cantidad
FROM productos p
LEFT JOIN VENTAS V ON p.producto_id = v.producto_id
ORDER BY p.producto_id;

-- ── CONSULTA 2: RIGHT JOIN ────────────────
-- Pregunta de negocio: ¿Existen ventas registradas con productos
-- que no figuran en nuestro catálogo? (posible error de carga de datos)
-- Los registros huérfanos aparecerán con NULL en las columnas de productos.

SELECT v.venta_id,
       v.producto_id,
       v.cantidad,
       v.fecha_venta,
       p.nombre
FROM productos p
RIGHT JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL
ORDER BY p.producto_id;


-- ── CONSULTA 3: FULL OUTER JOIN ───────────
-- Pregunta de negocio: Vista completa de auditoría que muestre
-- todos los productos y todas las ventas sin perder ninguna fila,
-- identificando tanto productos sin ventas como ventas sin producto.

SELECT v.producto_id,  
       v.venta_id,      
       v.cliente_id,   
       v.cantidad,    
       v.fecha_venta,
	   p.nombre,
	   p.categoria
FROM ventas V
FULL OUTER JOIN productos p on v.producto_id = p.producto_id
ORDER BY v.venta_id;