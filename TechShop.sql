CREATE DATABASE TechShop;

--Q2-1
--Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(255),
    Phone VARCHAR(13),
    Address VARCHAR(255)
);

-- Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Description TEXT,
    Price DECIMAL(10, 2)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- OrderDetails Table
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

-- Inventory Table
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Q3(a)
INSERT INTO Customers VALUES
(2, 'Neeta', 'goel', 'neetagoel@gmail.com', '8630693461', '12 harmony flats'),
(3, 'Pratyaksh', 'goel', 'pratgoel@gmail.com', '9837571211', '1 harmony flats'),
(4, 'Pranay', 'goel', 'pranagoel@gmail.com', '9870734518', '13 harmony flats'),
(5, 'Shubhi', 'goel', 'sgoel@gmail.com', '9411783402', '14 harmony flats'),
(6, 'Sakshi', 'goel', 'sakshigoel@gmail.com', '9411089454', '15 harmony flats'),
(7, 'Sadhana', 'goel', 'sadgoel@gmail.com', '9837001585', '16 harmony flats'),
(8, 'Yash', 'goel', 'yashgoel@gmail.com', '7505272532', '17 harmony flats'),
(9, 'Isha', 'goel', 'ishagoel@gmail.com', '8635389701', '18 harmony flats'),
(10,'Vasu', 'goel', 'vasugoel@gmail.com', '9444872313', '19 harmony flats');

INSERT INTO Products VALUES
(1, 'Laptop', 'Powerful laptop with high-performance specs', 999.99),
(2, 'Smartphone', 'Latest smartphone with advanced features', 599.99),
(3, 'Tablet', 'Portable tablet with high-resolution display', 299.99),
(4, 'Smartwatch', 'Smartwatch with fitness tracking features', 129.99),
(5, 'Desktop PC', 'Desktop computer with powerful processing', 899.99),
(6, 'Headphones', 'Wireless headphones with noise cancellation', 79.99),
(7, 'Digital Camera', 'Professional-grade digital camera', 499.99),
(8, 'Gaming Console', 'High-performance gaming console', 399.99),
(9, 'External Hard Drive', 'Portable external hard drive for data storage', 149.99),
(10, 'Printer', 'Color printer with wireless connectivity', 199.99);

-- Insert more sample records into Orders table
INSERT INTO Orders VALUES
(1, 1, '2023-01-01', 1500.00),
(2, 2, '2023-01-02', 1200.00),
(3, 3, '2023-01-03', 450.00),
(4, 4, '2023-01-04', 750.00),
(5, 5, '2023-01-05', 1200.00),
(6, 6, '2023-01-06', 300.00),
(7, 7, '2023-01-07', 600.00),
(8, 8, '2023-01-08', 900.00),
(9, 9, '2023-01-09', 150.00),
(10, 10, '2023-01-10', 200.00);

-- Insert more sample records into OrderDetails table
INSERT INTO OrderDetails VALUES
(1, 1, 1, 2),
(2, 1, 2, 1),
(3, 3, 3, 1),
(4, 4, 4, 2),
(5, 5, 5, 3),
(6, 6, 6, 1),
(7, 7, 7, 2),
(8, 8, 8, 1),
(9, 9, 9, 1),
(10, 10, 10, 1);

-- Insert more sample records into Inventory table
INSERT INTO Inventory VALUES
(1, 1, 50, '2023-01-01'),
(2, 2, 100, '2023-01-02'),
(3, 3, 20, '2023-01-03'),
(4, 4, 30, '2023-01-04'),
(5, 5, 40, '2023-01-05'),
(6, 6, 15, '2023-01-06'),
(7, 7, 25, '2023-01-07'),
(8, 8, 10, '2023-01-08'),
(9, 9, 5, '2023-01-09'),
(10, 10, 8, '2023-01-10');




--Q3(b)1
Select firstname, lastname,email from customers;

--Q3(b)2
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--Q3(b)3
Insert Into Customers values(11,'cheenu','goel','cheenu@gmail.com','9847216530','20 harmony flats');

--Q3(b)4
UPDATE Products
SET Price = Price * 1.10;

--Q3(b)5
DELETE FROM  OrderDetails   Where OrderID=2;

--Q3(b)6
INSERT INTO Orders VALUES(2, 2, '2023-01-02', 1200.00);

--Q3(b)7
UPDATE Customers
SET 
Email = 'sa@gmail.com',
Address = '4 harmony flats',
Phone='9834687210'
WHERE  CustomerID = '6';

--Q3(b)8
UPDATE Orders
SET TotalAmount = (
SELECT SUM(p.Price * od.Quantity)
FROM OrderDetails as od
inner join Products as p on od.ProductID = p.ProductID
WHERE od.OrderID = Orders.OrderID
);

--Q3(b)9
DELETE FROM OrderDetails
WHERE OrderID IN (SELECT OrderID FROM Orders WHERE CustomerID = 2);
DELETE FROM Orders
WHERE CustomerID = 2;
--Q3(b)10
INSERT INTO Products values(11,'New Electronic Gadget', 'Cutting-edge gadget with advanced features', 999.99);

--Q4-1
SELECT Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID;

--Q4-2
SELECT P.ProductID, P.ProductName,
SUM(OD.Quantity * P.Price) AS TotalRevenue
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName;

--Q4-3
SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID;

--Q4-4
SELECT P.ProductID, P.ProductName,SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantityOrdered DESC;

--Q4-5
SELECT ProductID,ProductName,Category
FROM Products
WHERE Category = 'electronic gadget';

--Q4-6
SELECT C.CustomerID, C.FirstName, C.LastName, AVG(O.TotalAmount) AS AverageOrderValue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

--Q4-7
SELECT O.OrderID, O.CustomerID, C.FirstName, C.LastName, O.TotalAmount AS TotalRevenue
FROM Orders O
JOIN Customers C ON O.CustomerID = C.CustomerID
ORDER BY O.TotalAmount DESC;

--Q4-8
SELECT P.ProductID, P.ProductName, COUNT(OD.OrderID) AS OrderCount
FROM Products P
LEFT JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.ProductID, P.ProductName;

--Q4-9
SELECT DISTINCT C.CustomerID, C.FirstName, C.LastName, C.Email, C.Phone, C.Address
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.ProductName = 'Laptop';

--Q4-10
SELECT
    SUM(TotalAmount) AS TotalRevenue
FROM
    Orders
WHERE
    OrderDate BETWEEN '2023-01-03' AND '2023-01-06';

--Q5-1
SELECT * FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL;
--Q5-2
SELECT COUNT(*) AS TotalProducts
FROM Products;
--Q5-3
SELECT SUM(TotalAmount) AS TotalRevenue
FROM Orders;
--Q5-4
SELECT AVG(OD.Quantity) AS AverageQuantityOrdered
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
WHERE P.Category = 'electronic gadget';

--Q5-5
SELECT SUM(O.TotalAmount) AS TotalRevenue
FROM Orders O
WHERE O.CustomerID = 4;
--Q5-6
SELECT C.CustomerID,C.FirstName,C.LastName,
COUNT(O.OrderID) AS NumberOfOrders
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY NumberOfOrders DESC;

--Q5-7
SELECT P.Category, SUM(OD.Quantity) AS TotalQuantityOrdered
FROM Products P
JOIN OrderDetails OD ON P.ProductID = OD.ProductID
GROUP BY P.Category
ORDER BY TotalQuantityOrdered DESC;

--Q5-8
SELECT C.CustomerID,C.FirstName,C.LastName,
SUM(O.TotalAmount) AS TotalSpending
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderDetails OD ON O.OrderID = OD.OrderID
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY C.CustomerID, C.FirstName, C.LastName
ORDER BY TotalSpending DESC;



--Q5-9
SELECT O.CustomerID,
AVG(O.TotalAmount) AS AverageOrderValue
FROM Orders O
GROUP BY O.CustomerID;
--Q5-10
SELECT C.CustomerID,C.FirstName,C.LastName,
COUNT(O.OrderID) AS OrderCount
FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
GROUP BY C.CustomerID, C.FirstName, C.LastName;

--ALTER TABLE Products
--ADD Category VARCHAR(255);
--UPDATE Products
--SET Category = 'electronic gadget';













