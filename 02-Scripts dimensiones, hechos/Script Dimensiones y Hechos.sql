--CREACION DE LAS DIMENSIONES Y TABLA HECHOS EN SCRIPT, NO EN TAREAS DE EJECUTAR
CREATE DATABASE DW;
GO
USE DW;
GO

-- DIMENSIÓN CLIENTE
CREATE TABLE DimCliente (
    IdCliente_SK    INT IDENTITY(0,1) PRIMARY KEY,
    IdCliente_BK    BIGINT NOT NULL,
    NombreCompleto  NVARCHAR(250) NOT NULL,
    TipoCliente     NVARCHAR(20) NOT NULL
);
GO
select * from DimCliente;

-- DIMENSIÓN TIEMPO
CREATE TABLE [dbo].[Dim_Tiempo](
    [IdTiempo_SK] [int] IDENTITY(1,1) NOT NULL,
    [Fecha] [date] NOT NULL,
    [Anio] [int] NOT NULL,
    [Mes] [int] NOT NULL,
    [NombreMes] [nvarchar](20) NOT NULL,
    [Dia] [int] NOT NULL,
    [Semestre] [int] NOT NULL,
    [Trimestre] [int] NOT NULL,
    [DiaSemana] [int] NOT NULL,
    [NombreDia] [nvarchar](20) NOT NULL,
    [EsFinDeSemana] [bit] NOT NULL,
 CONSTRAINT [PK_Dim_Tiempo] PRIMARY KEY CLUSTERED ([IdTiempo_SK] ASC)
);
GO
select * from DimTiempo;

-- DIMENSIÓN CANAL
CREATE TABLE DimCanal (
    IdCanal_SK      INT IDENTITY(0,1) PRIMARY KEY,
    IdCanal_BK      NVARCHAR(16) NOT NULL,        -- Código original (ej: 'VTA', 'ATM')
    NombreCanal     NVARCHAR(64) NOT NULL
);
GO
select * from DimCanal;

-- DIMENSIÓN MONEDA
CREATE TABLE DimMoneda (
    IdMoneda_SK     INT IDENTITY(0,1) PRIMARY KEY,
    IdMoneda_BK     BIGINT NOT NULL,
    CodigoMoneda    CHAR(3) NOT NULL,             -- 'BOB', 'USD'
    NombreMoneda    NVARCHAR(64) NOT NULL
);
GO
select * from DimMoneda;

-- DIMENSIÓN SUCURSAL
CREATE TABLE DimSucursal (
    IdSucursal_SK   INT IDENTITY(0,1) PRIMARY KEY,
    IdSucursal_BK   BIGINT NOT NULL,
    NombreSucursal  NVARCHAR(128) NOT NULL,
    Ciudad          NVARCHAR(128) NOT NULL  -- Desnormalizado para evitar JOINs
);
GO
select * from DimSucursal;

--DIMENSION CATEGORIA RECLAMO
CREATE TABLE DimCategoriaReclamo (
        IdCategoria_SK  INT IDENTITY(0,1) PRIMARY KEY,
        NombreCategoria NVARCHAR(64) NOT NULL -- Aumenté el tamaño por seguridad
    );

-- TABLA HECHOS PRIMER EXAMEN DEPOSITOS
CREATE TABLE FactDepositos (
    IdHecho         BIGINT IDENTITY(0,1) PRIMARY KEY,
    
    IdCliente_SK    INT NOT NULL REFERENCES DimCliente(IdCliente_SK),
    IdTiempo_SK     INT NOT NULL REFERENCES DimTiempo(IdTiempo_SK),
    IdCanal_SK      INT NOT NULL REFERENCES DimCanal(IdCanal_SK),
    IdMoneda_SK     INT NOT NULL REFERENCES DimMoneda(IdMoneda_SK),
    IdSucursal_SK   INT NOT NULL REFERENCES DimSucursal(IdSucursal_SK),
    
    Monto           DECIMAL(19,4) NOT NULL,
    Cantidad        INT DEFAULT 1,
    
    DiasDesdeUltimo INT DEFAULT 0
);

select * from FactDepositos;

--TABLA HECHOS RECLAMOS SEGUNDO EXAMEN
CREATE TABLE FactReclamos (
    IdHechoReclamo  BIGINT IDENTITY(0,1) PRIMARY KEY,
    
    IdTiempo_SK     INT NOT NULL REFERENCES DimTiempo(IdTiempo_SK), -- Fecha del reclamo
    IdCliente_SK    INT NOT NULL REFERENCES DimCliente(IdCliente_SK),
    IdSucursal_SK   INT NOT NULL REFERENCES DimSucursal(IdSucursal_SK),
    IdCategoria_SK  INT NOT NULL REFERENCES DimCategoriaReclamo(IdCategoria_SK),
    
    Cantidad        INT DEFAULT 1,
    
    HorasRespuesta  DECIMAL(10,2) NULL, 
    
    EsRespondido    INT NOT NULL DEFAULT 0,
    EsResuelto      INT NOT NULL DEFAULT 0,
    EsNoResuelto    INT NOT NULL DEFAULT 0
);

select * from FactReclamos;