--Consulta 1 — Resumen ejecutivo mensual: Total facturado, cantidad de pedidos y ticket promedio, agrupados por mes. 
SELECT
    MONTH(fecha_venta) AS Mes,
    SUM(cantidad * precio_unitario) AS Total_Facturado,
    COUNT(id_venta) AS Cantidad_Pedidos,
    AVG(cantidad * precio_unitario) AS Ticket_Promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY Mes;

--Consulta 2 — Ranking de productos
SELECT TOP 5 id_producto,
SUM(cantidad) as Unidades_vendidas,
SUM(cantidad*precio_unitario) as Total_facturado
FROM ventas
GROUP BY id_producto
ORDER BY Total_facturado DESC;

--Consulta 3 — Clientes recurrentes 
SELECT
id_cliente,
COUNT(id_venta) as Cantidad_pedidos,
SUM(cantidad*precio_unitario) as Total_gastado
from ventas
GROUP BY id_cliente
HAVING COUNT(*)>1
ORDER BY Total_gastado DESC;

--Consulta 4 — Meses por encima/por debajo del promedio 
SELECT
    Mes,
    Total_Facturado,
    CASE
        WHEN Total_Facturado >
            (
                SELECT AVG(TotalMes)
                FROM (
                    SELECT SUM(cantidad * precio_unitario) AS TotalMes
                    FROM ventas
                    GROUP BY MONTH(fecha_venta)
                ) AS PromedioMensual
            )
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS Comparacion_Promedio
FROM (SELECT
        MONTH(fecha_venta) AS Mes,
        SUM(cantidad * precio_unitario) AS Total_Facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
) AS VentasMensuales
ORDER BY Mes;

/*Bloque de cierre hallazgos:
1-El producto 1 es el de mayor facturación, representando un 56% del total de la facturación.
2-Si bien el producto 2 es el más vendido, es el que menos facturación generó.
3-Todos los clientes son recurrentes ya que han realizado más de un pedido,sin embargo el cliente 1 fue quien que generó la mayor facturación (el 41% del total)
4-No es posible comparar la evolución de la facturación entre distintos meses ya que todas las ventas registradas corresponden a marzo de 2024
/*
