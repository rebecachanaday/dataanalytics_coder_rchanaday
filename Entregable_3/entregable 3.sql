--Creación de la base de datos
CREATE DATABASE VENTAS_TECH

--Eliminar tablas ya existentes
DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

--Creación de las tablas categorias, productos, ventas y clientes

CREATE TABLE categorias (
IDcategoria int NOT NULL IDENTITY PRIMARY KEY, 
Nombre_categoria VARCHAR(50), 
Descripcion_categoria VARCHAR(50)
);
CREATE TABLE productos (
IDproducto int NOT NULL IDENTITY PRIMARY KEY, 
Nombre_producto VARCHAR (50) NOT NULL,
IDcategoria INT NOT NULL, 
FOREIGN KEY(IDcategoria) REFERENCES categorias(IDcategoria),
precio DECIMAL (10,2) NOT NULL,
);
CREATE TABLE clientes (
IDcliente int NOT NULL IDENTITY PRIMARY KEY,
nombre_cliente VARCHAR(50) NOT NULL, 
email VARCHAR (50) NOT NULL,
ciudad VARCHAR (50) NOT NULL,
fecha_registro date NOT NULL,
);
CREATE TABLE ventas (
IDventa int NOT NULL IDENTITY PRIMARY KEY,
fecha_venta date NOT NULL,
cantidad int NOT NULL,
IDproducto INT NOT NULL,
FOREIGN KEY (IDproducto) REFERENCES productos(IDproducto),
IDcliente INT NOT NULL, 
FOREIGN KEY (IDcliente)REFERENCES clientes(IDcliente),
);

--Inserción de registros en las tabla categorias
INSERT INTO categorias (Nombre_categoria,Descripcion_categoria)

VALUES 
('Smartphones','Teléfonos inteligentes de diferentes marcas'),
('Periféricos', 'Teclados, mouse y otros accesorios'),
('Laptops', 'Computadoras portátiles para diversos usos');

select * from categorias;

--Inserción de registros en la tabla productos
INSERT INTO productos (Nombre_producto, IDcategoria, precio)

VALUES
--Smartphones (IDCategoria = 1)
('Samsung Galaxy S24', 1, 899.99),
('iPhone 15', 1, 1199.99),
('Motorola Edge 50 Pro', 1, 649.99),
('Xiaomi Redmi Note 13', 1, 329.99),
('Google Pixel 9', 1, 799.99),

-- Periféricos (IDCategoria = 2)
('Mouse Logitech G203', 2, 35.99),
('Teclado Redragon Kumara', 2, 59.99),
('Auriculares HyperX Cloud II', 2, 99.99),
('Webcam Logitech C920', 2, 89.99),
('Monitor LG 24 Pulgadas', 2, 199.99),

-- Laptops (IDCategoria = 3)
('Lenovo ThinkPad E14', 3, 1249.99),
('HP Pavilion 15', 3, 999.99),
('Dell Inspiron 15', 3, 1099.99),
('ASUS VivoBook 15', 3, 849.99),
('Acer Aspire 5', 3, 779.99);

select * from productos;

--Inserción de registros en la tabla clientes
INSERT INTO clientes (nombre_cliente, email, ciudad, fecha_registro)

VALUES
('Juan Pérez', 'juan.perez@gmail.com', 'Córdoba', '2024-02-15'),
('María González', 'maria.gonzalez@hotmail.com', 'Rosario', '2024-05-20'),
('Carlos Fernández', 'carlos.fernandez@yahoo.com', 'Buenos Aires', '2025-01-10');

select * from clientes;

--Inserción de registros en la tabla ventas 
INSERT INTO ventas (fecha_venta, cantidad, IDproducto, IDcliente)

VALUES
('2025-01-05', 1, 1, 1),
('2025-01-08', 2, 6, 2),
('2025-01-10', 1, 11, 3),
('2025-01-15', 3, 2, 1),
('2025-02-03', 1, 7, 2),
('2025-02-10', 2, 12, 3),
('2025-02-18', 1, 5, 1),
('2025-03-02', 4, 8, 2),
('2025-03-12', 1, 13, 3),
('2025-03-20', 2, 15, 1);

select * from ventas;
