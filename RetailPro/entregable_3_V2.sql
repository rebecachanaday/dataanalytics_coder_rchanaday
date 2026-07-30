--Creación de la base de datos
CREATE DATABASE VENTAS_TECH_DB

--Eliminar tablas ya existentes
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--Creación de las tablas categorias, productos, ventas y clientes

CREATE TABLE categorias (
id_categoria int NOT NULL IDENTITY PRIMARY KEY, 
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200)
);
CREATE TABLE productos (
id_producto int NOT NULL IDENTITY PRIMARY KEY, 
nombre_producto VARCHAR (100) NOT NULL,
id_categoria INT NOT NULL, 
FOREIGN KEY(id_categoria) REFERENCES categorias(id_categoria),
precio DECIMAL (10,2) NOT NULL,
stock int default 0,
activo TINYINT DEFAULT 1
);
CREATE TABLE clientes (
id_cliente int NOT NULL IDENTITY PRIMARY KEY,
nombre_cliente VARCHAR(100) NOT NULL, 
email VARCHAR (100) UNIQUE,
ciudad VARCHAR (50),
fecha_registro date NOT NULL
);
CREATE TABLE ventas (
id_venta int NOT NULL PRIMARY KEY,
fecha_venta date NOT NULL,
cantidad int NOT NULL,
precio_unitario decimal(10,2) NOT NULL,
id_producto INT NOT NULL,
FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
id_cliente INT NOT NULL, 
FOREIGN KEY (id_cliente)REFERENCES clientes(id_cliente),
);

--Inserción de registros en las tabla categorias
INSERT INTO categorias (nombre_categoria,descripcion)

VALUES 
('Computación', 'Laptops, PCs y monitores'),
('Accesorios', 'Periféricos y complementos'),
('Audio', 'Auriculares y parlantes'),
('Almacenamiento', 'Discos y memorias')
;

select * from categorias;

--Inserción de registros en la tabla productos
INSERT INTO productos (nombre_producto, id_categoria, precio, stock, activo)

VALUES
('Laptop Pro 15', 1, 1200.00, 15, 1),
('Mouse Inalámbrico', 2, 28.00, 80, 1),
('Monitor 4K 27"', 1,  450.00, 12, 1),
('Auriculares BT Pro', 3,  120.00, 35, 1),
('SSD Externo 1TB', 4,  130.00, 18, 1),
('Teclado Mecánico', 2, 95.00, 40, 1)
;

select * from productos;

--Inserción de registros en la tabla clientes
INSERT INTO clientes (nombre_cliente, email, ciudad, fecha_registro)

VALUES
('María López',   'maria@mail.com',   'Buenos Aires', '2024-01-05'),
('Carlos Ruiz',   'carlos@mail.com',  'Córdoba',      '2024-01-10'),
('Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01'),
('Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15'),
('Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01')
;

select * from clientes;

--Inserción de registros en la tabla ventas 
INSERT INTO ventas (id_venta, id_cliente, id_producto, cantidad, precio_unitario, fecha_venta)

VALUES
(1,  1, 1, 2, 1200.00, '2024-03-05'),
(2,  2, 2, 5,   28.00, '2024-03-06'),
(3,  3, 3, 1,  450.00, '2024-03-07'),
(4,  1, 4, 2,  120.00, '2024-03-08'),
(5,  4, 5, 3,  130.00, '2024-03-10'),
(6,  2, 6, 4,   95.00, '2024-03-11'),
(7,  5, 1, 1, 1200.00, '2024-03-12'),
(8,  3, 2, 8,   28.00, '2024-03-13'),
(9,  4, 4, 1,  120.00, '2024-03-14'),
(10, 5, 3, 2,  450.00, '2024-03-15')
;

select * from ventas;
