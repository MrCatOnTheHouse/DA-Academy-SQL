# 1.	An alphabetical list of customers located in Mexico
SELECT c.CustomerName , c.City
FROM customers AS c
WHERE c.City = 'México D.F.';

#2.	A list of employees from youngest to oldest
SELECT * 
FROM employees AS e 
ORDER BY e.BirthDate DESC;

#3.	A list of orders that included “Dairy Products” and “Grains/Cereals”
SELECT o.OrderID , c.CategoryName
FROM orders AS o
JOIN order_details AS od ON od.OrderID = o.OrderID
JOIN products AS  p ON p.ProductID = od.ProductID
JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE c.CategoryID = 4 OR c.CategoryID = 5;

#4.	What products are supplied by “G'day, Mate” ?
SELECT p.ProductName , s.SupplierName
FROM products AS p
JOIN suppliers AS s ON s.SupplierID = p.SupplierID
WHERE s.SupplierID = 24;

#5.	What shippers have delivered our orders per country?
SELECT o.OrderID, s.ShipperName, c.Country
FROM orders AS o
JOIN customers AS c ON c.CustomerID = o.CustomerID
JOIN shippers AS s ON s.ShipperID = o.ShipperID
ORDER BY Country;

#6-The list of orders managed by Nancy Davolio during 1997
SELECT o.OrderID, CONCAT(e.FirstName, ' ', e.LastName) AS Employee_Name, o.OrderDate
FROM orders AS o 
JOIN employees AS e ON e.EmployeeID = o.EmployeeID
WHERE e.EmployeeID = 1
AND o.OrderDate BETWEEN '1997-01-01' AND '1997-12-31';

#7-A list of our US suppliers, identifying their phone area code.
SELECT SupplierName, Country, Phone
FROM suppliers 
WHERE Country = 'USA' AND Phone LIKE '%555%';

#8- What customer(s) have never placed an order? 
SELECT o.OrderID , c.CustomerName
FROM orders AS o
RIGHT JOIN customers AS c
ON c.CustomerID = o.CustomerID
WHERE ISNULL(o.OrderID)
ORDER BY o.OrderID;

#9- In what countries do we have customers? 
SELECT DISTINCT(Country)
FROM customers;

#10 -What are the 5 most sold products?
SELECT od.ProductID, SUM(od.Quantity)
FROM order_details AS od 
GROUP BY od.ProductID
ORDER BY SUM(od.Quantity) DESC LIMIT 5;

#11 -What product(s) should our client stop offering?
SELECT od.ProductID, SUM(od.Quantity), s.SupplierName 
FROM order_details AS od 
JOIN products AS p
ON p.ProductID = od.ProductID
JOIN suppliers AS s
ON s.SupplierID = p.SupplierID
GROUP BY od.ProductID
ORDER BY SUM(od.Quantity) LIMIT 10;

/*Bonus Questions: 

A) Describe how could you assign a manager to an employee, hence creating a hierarchical organization of records in the [Employees] table. (Clue: you're allowed to modify the [Employees] attributes) 

Bonus points: Build the query for the scenario you just described. 

A= For this situation y found that in the employee table the employees actually does'nt have an "position" field and I guess it's so importante to known what 
position fills our employee in the entreprise so I decide to add the field, instead I add an aditional fiel called "Manager" this allows to put 
and EmployeeID on this field for see who is the related Manager from an employee, and I create another table called Positions and in this table we gonna 
have PositionsId (thats gonna be the the field called "position" in our employees table) and a field called position description who's gonna contain 
the description of the respective PositionID, I just make a Query for insert values, the job for create the Position table and modify the employees table
I used the HeidiSQL IDE 

INSERT INTO positions (PositionDescription)
VALUES
("Manager"),
("Janitor"),
("Developer")

I added this positions
 

B) Describe a possible valid business scenario where you would have a need to extract information by cross-joining tables in our case study. 

Bonus points: Build the query for the scenario you just described. 


I think the best use case that we gonna need this CROSS JOIN on our case study at the moment we want to see a list of the
 orders made but we additionally need to see the id of the product that was sold in that order along
 with the quantity, then we could use the cross join to obtain a list of them and thus make a better way of data analysis.

SELECT o.OrderID, o.OrderDate, od.ProductID, od.Quantity
FROM orders AS o
CROSS JOIN order_details AS od
ON o.OrderID = od.OrderID
GROUP BY o.OrderID

maybe something like this could help us!*/

#12-What products do we sell the most of and how much do we charge for them?
SELECT p.ProductName, SUM(od.Quantity) AS Total_Products, p.Price AS Unit_Price,
ROUND(SUM(od.Quantity)* p.Price,2)
FROM order_details AS od
JOIN products AS p ON p.ProductID = od.ProductID
GROUP BY od.ProductID
ORDER BY SUM(od.Quantity) DESC LIMIT 15;

#13-Which products brings us the most revenue? (Excluding “Alice Mutton” because they are going out of business.)
SELECT p.ProductName , c.CategoryName, SUM(od.Quantity) AS Total_Units_Sold, p.Price AS Unit_Price,
SUM(od.Quantity) * p.Price AS Total_Products_Revenue
FROM products AS p
JOIN order_details AS od ON od.ProductID = p.ProductID
JOIN categories AS c ON c.CategoryID = p.CategoryID
WHERE p.ProductName <> 'Alice Mutton'
GROUP BY p.ProductID
ORDER BY Total_Products_Revenue DESC;

#14-What is our Annual Total Revenue?
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

#15-Who is the shipper that delivers most of our customers' orders?
SELECT s.ShipperName, COUNT(o.ShipperID) AS Ships_by_shippers
FROM orders AS o 
JOIN shippers AS s ON s.ShipperID = o.ShipperID
GROUP BY s.ShipperID
ORDER BY Ships_by_shippers DESC;

#16-Do we have customers that only request orders for one category of products?
SELECT c.CustomerName, COUNT(ca.CategoryID) AS Categories_per_client
FROM customers AS c
JOIN orders AS o ON o.CustomerID = c.CustomerID
JOIN order_details AS od ON od.OrderID = o.OrderID
JOIN products AS p ON p.ProductID = od.ProductID
JOIN categories AS ca ON ca.CategoryID = p.CategoryID
GROUP BY c.CustomerName
HAVING Categories_per_client = 1;
 
