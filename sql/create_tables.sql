USE EmpresaDB;
GO

IF OBJECT_ID('Inventario', 'U') IS NULL
BEGIN
    CREATE TABLE Inventario (
        Producto VARCHAR(100) PRIMARY KEY,
        Existencias INT NOT NULL
            CONSTRAINT CK_Inventario_Existencias
            CHECK (Existencias >= 0)
    );
END;
GO

IF OBJECT_ID('Ventas', 'U') IS NULL
BEGIN
    CREATE TABLE Ventas (
        VentaID INT IDENTITY(1,1) PRIMARY KEY,
        Producto VARCHAR(100),
        Cantidad INT,
        Fecha DATETIME DEFAULT GETDATE()
    );
END;
GO

IF OBJECT_ID('AuditoriaVentas', 'U') IS NULL
BEGIN
    CREATE TABLE AuditoriaVentas (
        AuditoriaID INT IDENTITY(1,1) PRIMARY KEY,
        VentaID INT,
        FechaRegistro DATETIME DEFAULT GETDATE(),
        Mensaje VARCHAR(255)
    );
END;
GO