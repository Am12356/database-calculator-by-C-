CREATE DATABASE RetailstoreDB ;  
USE RetailstoreDB ; 

CREATE TABLE  Customers (  
 CustomerID SERIAL PRIMARY KEY , 
 First_name VARCHAR ( 100 ) , 
 second_name VARCHAR ( 100 ) , 
 Email VARCHAR ( 100 ) UNIQUE, 
 RegistrationDate DATE  
 ) ;   
CREATE TABLE Products ( 
 productID SERIAL PRIMARY KEY , 
 product_NAME VARCHAR ( 100 ) , 
 Category VARCHAR ( 100 ) , 
 price INT , 
 StockQuantity INT 
 ) ; 
CREATE TABLE Orders ( 
 OrderID SERIAL PRIMARY KEY , 
 CustomersID INT , 
 ProductsID INT , 
 OrderDATE DATE , 
 Quantity INT ,  
 FOREIGN KEY ( CustomerID ) references Customers ( CustomerID ) , 
 FOREIGN KEY ( ProductID ) references products ( productID ) 
 ) ; 
 
INSERT INTO Customers (FirstName, LastName, Email, RegistrationDate) VALUES
('John', 'Doe', 'john.doe@example.com', '2023-01-15'),
('Alice', 'Smith', 'alice.smith@example.com', '2023-06-20'),
('Bob', 'Brown', 'bob.brown@example.com', '2024-02-05'),
('Eve', 'Johnson', 'eve.johnson@example.com', '2024-03-10'),
('Charlie', 'Wilson', 'charlie.wilson@example.com', '2024-05-01');


 INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Laptop', 'Electronics', 1200.99, 10),
('Smartphone', 'Electronics', 899.49, 20),
('Headphones', 'Accessories', 199.99, 50),
('Keyboard', 'Accessories', 49.99, 30),
('Monitor', 'Electronics', 299.99, 15);

INSERT INTO Orders (CustomerID, ProductID, OrderDate, Quantity) VALUES
(1, 2, '2024-02-10', 1),
(2, 1, '2024-02-15', 1),
(3, 3, '2024-02-18', 2),
(4, 5, '2024-02-20', 1),
(5, 4, '2024-02-25', 3);

SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders; 

SELECT * FROM Customers WHERE REGISTRATIONDATE > '2024-01-01' ;  
SELECT * FROM Products order by price DESC LIMIT 3 ;  


SELECT 
    Orders.OrderID, 
    Customers.FirstName, 
    Customers.LastName, 
    Products.ProductName, 
    Orders.Quantity, 
    Orders.OrderDate
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID;

SELECT 
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    SUM(Orders.Quantity * Products.Price) AS TotalSpent
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName
ORDER BY TotalSpent DESC; 

SELECT 
    Customers.CustomerID,
    Customers.FirstName,
    Customers.LastName,
    COUNT(Orders.OrderID) AS TotalOrders
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
GROUP BY Customers.CustomerID, Customers.FirstName, Customers.LastName;

SELECT 
    Products.ProductID,
    Products.ProductName,
    SUM(Orders.Quantity) AS TotalSold,
    SUM(Orders.Quantity * Products.Price) AS TotalRevenue
FROM Orders
JOIN Products ON Orders.ProductID = Products.ProductID
GROUP BY Products.ProductID, Products.ProductName
ORDER BY TotalRevenue DESC;






 

