USE EmpresaDB;
GO

INSERT INTO Inventario (Producto, Existencias)
VALUES
    ('Laptop', 20),
    ('Monitor', 30);
GO

INSERT INTO Ventas (Producto, Cantidad)
VALUES
    ('Laptop', 3),
    ('Monitor', 5);
GO

SELECT * FROM Ventas;
SELECT * FROM AuditoriaVentas;
SELECT * FROM Inventario;
GO