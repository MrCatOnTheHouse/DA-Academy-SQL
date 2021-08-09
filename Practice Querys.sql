SELECT * FROM categories;

SELECT ProductName, (Price + 15) * 2 AS FinalPrice
FROM products;

SELECT p.ProductName, p.Price
FROM products AS p
WHERE p.Price > 15;

SELECT DISTINCT c.CustomerName, od.OrderId
FROM customers AS c
JOIN orders AS o ON o.CustomerID = c.CustomerID
JOIN order_details AS od ON od.OrderID = o.OrderID;



DESCRIBE orders AS ;

DESCRIBE order_details;

DESCRIBE products;

DESCRIBE employees;

DESCRIBE shippers;

DESCRIBE suppliers;


SELECT c.CustomerName, DISTINCT od.OrderId
FROM customers AS c
JOIN orders AS o ON o.CustomerID = c.CustomerID
JOIN order_details AS od ON od.OrderID = o.OrderID;

SELECT od.ProductID, p.ProductName, SUM(od.Quantity) AS Total_Products, (SUM(od.Quantity) * p.Price) AS Revenue
FROM order_details AS od 
JOIN products AS p
ON p.ProductID = od.ProductID
GROUP BY od.ProductID
ORDER BY SUM(od.Quantity) DESC LIMIT 15;

SELECT od.ProductID, p.ProductName ,ROUND((SUM(od.Quantity)* p.Price),2) AS Total_Revenue
FROM order_details AS od
JOIN products AS p 
ON p.ProductID = od.ProductID
WHERE p.ProductName <> 'Alice Mutton'
GROUP BY od.ProductID
ORDER BY Total_Revenue DESC;

SELECT * FROM products ;

SELECT od.ProductID, p.ProductName ,(SUM(od.Quantity)* p.Price) AS Total_Revenue
FROM order_details AS od
JOIN products AS p 
ON p.ProductID = od.ProductID
WHERE p.ProductName <> 'Alice Mutton'
GROUP BY od.ProductID
ORDER BY Total_Revenue DESC;

SELECT od.OrderDetailID, SUM((p.Price * od.Quantity)) AS revenue, COUNT(DISTINCT od.ProductID) AS NumberOfProducts
FROM order_details AS od
JOIN products AS p 
ON p.ProductID = od.ProductID
ORDER BY od.OrderDetailID;

SELECT s.ShipperName, COUNT(o.ShipperID) AS Ships_by_shippers
FROM orders AS o 
JOIN shippers AS s ON s.ShipperID = o.ShipperID
GROUP BY s.ShipperID
ORDER BY Ships_by_shippers DESC;

(SELECT YEAR(o.OrderDate) AS FY, SUM(od.Quantity) * p.Price AS Total
FROM orders AS o
JOIN order_details AS od ON od.OrderID = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID
WHERE YEAR(o.OrderDate) = 1996
GROUP BY YEAR(o.OrderDate))
UNION
(SELECT YEAR(o.OrderDate) AS FY, SUM(od.Quantity) * p.Price AS Total
FROM orders AS o
JOIN order_details AS od ON od.OrderID = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID
WHERE YEAR(o.OrderDate) = 1997
GROUP BY YEAR(o.OrderDate));

SELECT c.CustomerName, COUNT(ca.CategoryID) AS Categories_per_client
FROM customers AS c
JOIN orders AS o ON o.CustomerID = c.CustomerID
JOIN order_details AS od ON od.OrderID = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID
JOIN categories AS ca ON ca.CategoryID = p.CategoryID
GROUP BY c.CustomerName
HAVING Categories_per_client = 1;

SELECT *,ROW_NUMBER() OVER () AS Rows_number
FROM order_details;

SELECT *,ROW_NUMBER() OVER (PARTITION BY Quantity, ProductId) AS Rows_number
FROM order_details;

SELECT *,ROW_NUMBER() OVER (PARTITION BY Quantity) AS Rows_number
FROM order_details;

SELECT *,
ROW_NUMBER() OVER (PARTITION BY ProductId, Quantity ORDER BY Quantity) AS Row_num
FROM order_details;

SELECT *,
RANK() OVER (PARTITION BY ProductId, Quantity ORDER BY Quantity ) AS rnk
FROM order_details ;

SELECT p.ProductName , c.CategoryName, SUM(od.Quantity) AS Total_Units_Sold, p.Price AS Unit_Price,
SUM(od.Quantity) * p.Price AS Total_Products_Revenue
FROM products AS p
JOIN order_details AS od ON od.ProductID = p.ProductID
JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE p.ProductName <> 'Alice Mutton'
GROUP BY p.ProductID
ORDER BY Total_Products_Revenue DESC;


SELECT p.ProductName , c.CategoryName, SUM(od.Quantity) AS Total_Units_Sold, p.Price AS Unit_Price,
SUM(od.Quantity * p.Price) * .98 AS Total_Products_Revenue
FROM products AS p
JOIN order_details AS od ON od.ProductID = p.ProductID
JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE p.ProductName <> 'Alice Mutton'
GROUP BY p.ProductID
ORDER BY Total_Products_Revenue DESC;

SELECT o.OrderID AS IDCliente, o.OrderDate AS Fecha,p.ProductName AS Producto ,od.Quantity AS Cantidad_Comprada, p.Price AS Precio_producto, (od.Quantity * p.Price) AS Total_Compra,
ROW_NUMBER() OVER (PARTITION BY o.OrderID ORDER BY Total_Compra DESC) AS Rows_num
FROM orders AS o
JOIN order_details AS od ON od.OrderID = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID;


SELECT * FROM 
(
SELECT p.ProductID, p.ProductName, od.OrderID ,od.Quantity,
		 ROW_NUMBER() OVER () AS rowsss,
		 RANK() OVER (PARTITION BY od.OrderID ORDER BY od.Quantity DESC) AS Rrank,
		 DENSE_RANK() OVER (PARTITION BY od.OrderID ORDER BY od.Quantity DESC) AS Dense_Rrank
FROM products AS p 
JOIN order_details AS od ON od.ProductID = p.ProductID
) Edson
WHERE Rrank = 1;


SELECT *,
row_number() OVER (PARTITION BY ORDERID ORDER BY quantity ) AS Row_num,
RANK() OVER (PARTITION BY ORDERID ORDER BY quantity ) AS rnk,
DENSE_RANK() OVER (PARTITION BY ORDERID ORDER BY quantity ) AS DENSE_RANK
FROM order_details;

