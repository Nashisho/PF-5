-- Crear tabla de usuarios
CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY,
  nombre VARCHAR(50),
  email VARCHAR(50),
  contrasena VARCHAR(50)
);

-- Insertar datos en la tabla de usuarios
INSERT INTO usuarios (id_usuario, nombre, email, contrasena) VALUES
(1, 'Juan Perez', 'juan.perez@gmail.com', '123456'),
(2, 'Maria Rodriguez', 'maria.rodriguez@gmail.com', 'abcdef'),
(3, 'Carlos Gonzalez', 'carlos.gonzalez@gmail.com', 'qwerty'),
(4, 'Ana Torres', 'ana.torres@gmail.com', '123abc'),
(5, 'Pedro Sanchez', 'pedro.sanchez@gmail.com', 'xyz123');

-- Crear tabla de productos
CREATE TABLE productos (
  id_producto INT PRIMARY KEY,
  nombre VARCHAR(50),
  precio DECIMAL(8, 2),
  stock INT
);

-- Insertar datos en la tabla de productos
INSERT INTO productos (id_producto, nombre, precio, stock) VALUES
(1, 'Camisa', 29.99, 10),
(2, 'Pantalón', 49.99, 8),
(3, 'Zapatos', 59.99, 5),
(4, 'Cartera', 39.99, 3),
(5, 'Gorra', 19.99, 7);

-- Crear tabla de compras
CREATE TABLE compras (
id_compra INT PRIMARY KEY,
id_usuario INT,
fecha DATE,
subtotal DECIMAL(8, 2),
iva DECIMAL(8, 2),
total DECIMAL(8, 2),
FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

-- Insertar datos en la tabla de compras
INSERT INTO compras (id_compra, id_usuario, fecha, subtotal, iva, total) VALUES
(1, 1, '2022-01-01', 89.97, 17.09, 107.06),
(2, 2, '2022-02-15', 149.97, 28.49, 178.46),
(3, 3, '2022-03-20', 239.97, 45.59, 285.56),
(4, 4, '2022-04-10', 119.98, 22.80, 142.78),
(5, 5, '2022-05-05', 139.97, 26.59, 166.56);

-------------------------------------------------

-- Actualizar el precio de todos los productos, -20% por concepto de oferta de verano.
UPDATE productos SET precio = precio * 0.8;

-- Listar todos los productos con stock crítico (menor o igual a 5 unidades).
SELECT id_producto, nombre, precio, stock
FROM productos
WHERE stock <= 5;

-- Simular la compra de al menos 3 productos, calcular el subtotal, agregar el IVA y mostrar el total de la compra.
SELECT nombre, precio, 3 as cantidad, precio * 3 as subtotal, (precio * 3) * 0.19 as iva, (precio * 3) * 1.19 as total
FROM productos
WHERE id_producto IN (1, 3, 5

-- Total de ventas del mes diciembre 2022
SELECT SUM(total) as total_ventas_diciembre_2022
FROM compras
WHERE fecha >= '2022-12-01' AND fecha < '2023-01-01';

--Listar el comportamiento de compra del usuario que mas compras realizo durante el 2022.
SELECT u.nombre as nombre_usuario, COUNT(*) as cantidad_compras, SUM(c.total) as monto_total_compras
FROM compras c
JOIN usuarios u ON c.id_usuario = u.id
WHERE c.fecha >= '2022-01-01' AND c.fecha < '2023-01-01'
GROUP BY c.id_usuario
ORDER BY COUNT(*) DESC
LIMIT 1;
