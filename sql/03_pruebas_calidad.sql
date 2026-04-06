-- Prueba de Integridad (Null Check)
SELECT 
  'Error: Nulos encontrados' AS Status, 
  COUNT(*) AS Cantidad_Errores
FROM online_retail_dataset
WHERE InvoiceNo IS NULL OR CustomerID IS NULL;

-- Prueba de Lógica de Negocio (Price & Quantity Check)
SELECT 
  InvoiceNo, 
  Quantity, 
  UnitPrice
FROM online_retail_dataset
WHERE Quantity <= 0 OR UnitPrice <= 0;
