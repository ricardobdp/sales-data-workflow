-- 1. Monitoreo de Participación de Mercado por Categoría
SELECT 
  Category,
  ROUND(SUM(NetRevenue), 2) AS Revenue_Actual,
  ROUND((SUM(NetRevenue) / 37292000) * 100, 2) AS Porcentaje_Participacion,
  CASE 
    WHEN (SUM(NetRevenue) / 37292000) > 0.25 THEN 'ALERTA: Concentración Excesiva'
    WHEN (SUM(NetRevenue) / 37292000) < 0.15 THEN 'ALERTA: Caída de Interés'
    ELSE 'Distribución Estable'
  END AS Estado_Drift
FROM sales_insights
GROUP BY Category;


-- 2. Detección de Cambio en el comportamiento de Compra
SELECT 
  ROUND(AVG(NetRevenue), 2) AS AvgTicket_Actual,
  944.53 AS Baseline_Historico,
  ROUND(ABS(AVG(NetRevenue) - 944.53) / 944.53 * 100, 2) AS Porcentaje_Variacion,
  CASE 
    WHEN ABS(AVG (NetRevenue) - 944.53) / 944.53 > 0.10 
    THEN 'ALERTA: Cambio en Concepto de Gasto'
    ELSE 'Comportamiento Normal'
  END AS Status_Drift
FROM sales_insights;


-- 3. Monitoreo de Desplazamiento de Demanda Geográfica
SELECT 
  Country,
  COUNT(InvoiceNo) AS Volumen_Actual,
  3300 AS Media_Historica_Ordenes,
  CASE 
    WHEN COUNT(InvoiceNo) > 4000 THEN 'ALERTA: Pico de Demanda Regional'
    WHEN COUNT(InvoiceNo) < 2500 THEN 'ALERTA: Deserción de Mercado'
    ELSE 'Demanda Estable'
  END AS Estado_Geografico
FROM sales_insights
GROUP BY Country;


-- 4. Monitoreo de eficiencia en la cadena de suministro
SELECT 
  WarehouseLocation,
  ShipmentProvider, 
  ROUND(AVG(ShippingCost), 2) AS Costo_Actual,
  17.78 AS Techo_Costo_Historico,
  CASE 
    WHEN AVG(ShippingCost) > 17.78 * 1.05 THEN 'ALERTA: Incremento en Costos Logísticos'
    ELSE 'Costo Bajo Control'
  END AS Control_Costo
FROM sales_insights
GROUP BY WarehouseLocation, ShipmentProvider
ORDER BY Costo_Actual DESC, WarehouseLocation ASC;
