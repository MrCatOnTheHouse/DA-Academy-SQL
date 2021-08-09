USE lab;

SELECT p.ProductName, LENGTH(p.ProductName) Letters_in_products_names
FROM products AS p;

SELECT p.ProductName, BIT_LENGTH(p.ProductName) Letters_in_products_names
FROM products AS p;

SELECT p.ProductName, HEX(p.ProductName) Letters_in_products_names
FROM products AS p;

SELECT p.ProductName, UPPER(p.ProductName) Letters_in_products_names
FROM products AS p;

SELECT CONCAT_WS(s.firstName,'-',s.lastName) AS Stundent_Name
FROM students AS s;

SELECT CONCAT(s.firstName,' ',s.lastName) AS Stundent_Name
FROM students AS s;


SELECT LTRIM('              theres a lot of space at the beggining ');

SELECT SUBSTRING(s.firstName,1, 5)
from students AS s;

SELECT REVERSE (s.firstName)
FROM students AS s;


(SELECT CONCAT_WS('-',c.CustomerID,c.CustomerName) AS Customer_Info, YEAR(o.OrderDate) AS Orders_year,
 		 COUNT(o.OrderID) AS Total_Orders,
 		 ROUND(SUM(od.Quantity * p.Price)*.97, 2) AS SubTotal,
 		 RANK() OVER (ORDER BY SubTotal DESC) AS Customer_rank
FROM customers AS c
JOIN orders AS o ON o.CustomerID = c.CustomerID
JOIN order_details AS od ON od.OrderId = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID
WHERE YEAR(o.OrderDate) = '1996'
GROUP BY c.CustomerID
HAVING SubTotal > 1000)
UNION
( 
SELECT CONCAT_WS('-',c.CustomerID,c.CustomerName) Customer_Info, YEAR(o.OrderDate) AS Orders_year,
 		 COUNT(o.OrderID) AS Total_Orders,
 		 ROUND(SUM(od.Quantity * p.Price), 2) AS SubTotal,
 		 RANK() OVER (ORDER BY SubTotal DESC) AS Customer_rank
FROM customers AS c
JOIN orders AS o ON o.CustomerID = c.CustomerID
JOIN order_details AS od ON od.OrderId = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID
WHERE YEAR(o.OrderDate) = '1997'
GROUP BY c.CustomerID
HAVING SubTotal > 1000)



