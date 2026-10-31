USE EmpresaDB;
GO

CREATE OR ALTER TRIGGER trg_AuditarVenta
ON Ventas
AFTER INSERT
AS
BEGIN
    INSERT INTO AuditoriaVentas (VentaID, Mensaje)
    SELECT VentaID, 'Venta registrada automáticamente'
    FROM inserted;

    UPDATE Inventario
    SET Existencias = Existencias - VentasInsertadas.CantidadTotal
    FROM Inventario
    INNER JOIN (
        SELECT Producto, SUM(Cantidad) AS CantidadTotal
        FROM inserted
        GROUP BY Producto
    ) AS VentasInsertadas
        ON Inventario.Producto = VentasInsertadas.Producto;
END;
GO