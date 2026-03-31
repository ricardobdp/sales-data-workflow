SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE '...\\Uploads\\Ventas_Limpias.csv'
INTO TABLE sales
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS

( 
  InvoiceNo,
  Description,
  Quantity,
  @var_InvoiceDate,
  UnitPrice,
  CustomerID,
  Country,
  Discount,
  PaymentMethod,
  ShippingCost,
  Category,
  SalesChannel,
  ReturnStatus,
  ShipmentProvider,
  WarehouseLocation,
  OrderPriority
)
SET InvoiceDate = STR_TO_DATE(@var_InvoiceDate, '%d/%m/%Y %H:%i');

-- Actualizar data type
ALTER TABLE sales
MODIFY column InvoiceDate DATETIME;

DESCRIBE sales;
