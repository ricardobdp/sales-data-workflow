-- Creación de la "View", filtrado de los pedidos devueltos y elaboración del campo calculado 'NetRevenue'.
CREATE VIEW AS sales_insights
  SELECT InvoiceNo, Description, Quantity, InvoiceDate, UnitPrice,
	CustomerID, Country, Discount, PaymentMethod, ShippingCost, Category,
  	SalesChannel, ReturnStatus, ShipmentProvider, WarehouseLocation,
  	OrderPriority,
	(UnitPrice * Quantity) * (1 - Discount) AS NetRevenue
  FROM sales
  WHERE ReturnStatus = 'Not Returned';

-- Elaboración de Métricas

	-- Indicadores Generales
SELECT SUM(NetRevenue) AS TotalRevenue,       -- Ingreso Neto Total
      COUNT(InvoiceNo) AS OrderVolume,        -- Cantidad de Ventas Realizadas
      ROUND(AVG(NetRevenue), 2) AS AvgSale    -- Ingreso Promedio por Ticket
FROM sales_insights;

	-- Ingresos por Categoría
SELECT Category, SUM(NetRevenue) AS TotalSales, COUNT(InvoiceNo) AS OrderVolume, 
      SUM(Quantity) AS UnitsSold
FROM sales_insights
GROUP BY Category
ORDER BY TotalSales DESC;

	-- Ingresos por País
SELECT Country, SUM(NetRevenue) AS TotalSales, COUNT(InvoiceNo) AS OrderVolume,
      ROUND(AVG(NetRevenue), 2) AS AvgSale
FROM sales_insights
GROUP BY Country
ORDER BY TotalSales DESC;

	-- Análisis Temporal
SELECT YEAR(InvoiceDate) AS Year, Month(InvoiceDate) AS Month, 
	SUM(NetRevenue) AS TotalSales, COUNT(InvoiceNo) AS OrderVolume
FROM sales_insights
GROUP BY Year, Month
ORDER BY TotalSales DESC;

	-- Cálculo de Logística
SELECT WarehouseLocation, ShipmentProvider, 
	ROUND(AVG(ShippingCost), 2) AS AvgCost, COUNT(InvoiceNo) AS TotalOrders
FROM sales_insights
GROUP BY WarehouseLocation, ShipmentProvider
ORDER BY AvgCost DESC, 

	-- 10 productos más rentables
SELECT Description, Category, SUM(NetRevenue) AS TotalSales
FROM sales_insights
GROUP BY Description, Category
ORDER BY TotalSales DESC
LIMIT 10;

	-- 5 paises con mayor volumen de pedidos
SELECT Country, COUNT(InvoiceNo) AS TotalVolume
FROM sales_insights
GROUP BY Country, 
ORDER BY TotalVolume DESC
LIMIT 5;
