USE DW;

-- CONSULTA TABLA HECHOS DEPOSITO, ESTÁ TAMBIEN EN EL OLE DB SOURCE
SELECT
    CAST(CONVERT(VARCHAR(8), op.FechaHoraDeposito, 112) AS INT) AS IdTiempo_SK,
    dc.IdCliente_SK,
    ds.IdSucursal_SK,
    dm.IdMoneda_SK,
    dcn.IdCanal_SK,
    op.MontoDepositado AS Monto,
    1 AS Cantidad,
    DATEDIFF(day, 
        ISNULL(
            (
                SELECT TOP 1 anterior.FechaHoraDeposito
                FROM [BancoDB].[depositos].[OperacionDeposito] anterior
                WHERE anterior.ClienteId = op.ClienteId 
                  AND anterior.FechaHoraDeposito < op.FechaHoraDeposito
                ORDER BY anterior.FechaHoraDeposito DESC
            ), 
            op.FechaHoraDeposito 
        ), 
        op.FechaHoraDeposito 
    ) AS DiasDesdeUltimo

FROM [BancoDB].[depositos].[OperacionDeposito] op
LEFT JOIN [DW].[dbo].[DimCliente] dc ON op.ClienteId = dc.IdCliente_BK
LEFT JOIN [DW].[dbo].[DimSucursal] ds ON op.SucursalId = ds.IdSucursal_BK 
LEFT JOIN [DW].[dbo].[DimMoneda] dm ON op.MonedaId = dm.IdMoneda_BK
LEFT JOIN [BancoDB].[canales].[Canal] c_oltp ON op.Canal = c_oltp.Codigo
LEFT JOIN [DW].[dbo].[DimCanal] dcn ON c_oltp.CanalId = dcn.IdCanal_BK

select * from FactDepositos;

--CONSULTA PARA LA TABLA HECHOS RECLAMO
SELECT 
    CAST(CONVERT(VARCHAR(8), r.AbiertoEn, 112) AS INT) AS IdTiempo_SK,
    dc.IdCliente_SK     AS IdCliente_SK,
    ds.IdSucursal_SK     AS IdSucursal_SK,
    dcat.IdCategoria_SK  AS IdCategoria_SK,
    1 AS Cantidad,
    --TIEMPO DE RESPUESTA EN HORA
    CASE 
        WHEN r.Estado IN (2, 3) THEN ABS(DATEDIFF(HOUR, r.AbiertoEn, r.CerradoEn))
        ELSE NULL 
    END AS HorasRespuesta,
    -- Si es que fue respondido
    CASE 
        WHEN r.Estado IN (2, 3) THEN 1 
        ELSE 0 
    END AS EsRespondido,
    -- Si es que fue resuelto
    CASE 
        WHEN r.Estado = 2 THEN 1 
        ELSE 0 
    END AS EsResuelto,
    -- Si es que no fue resuelto
    CASE 
        WHEN r.Estado = 3 THEN 1 
        ELSE 0 
    END AS EsNoResuelto

FROM [BancoDB].[relaciones].[Reclamo] r
LEFT JOIN [DW].[dbo].[DimCategoriaReclamo] dcat 
    ON r.Categoria = dcat.NombreCategoria
LEFT JOIN [DW].[dbo].[DimCliente] dc 
    ON r.ClienteId = dc.IdCliente_BK
LEFT JOIN [BancoDB].[nucleo].[Cliente] c_oltp 
    ON r.ClienteId = c_oltp.ClienteId
LEFT JOIN [DW].[dbo].[DimSucursal] ds 
    ON c_oltp.SucursalPrincipalId = ds.IdSucursal_BK

SELECT * FROM FactReclamos;