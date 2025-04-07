DROP DATABASE IF EXISTS phoneShop;
CREATE DATABASE phoneShop;
USE phoneShop;

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY AUTO_INCREMENT,
    Emp_Name VARCHAR(32) NOT NULL,
    Email VARCHAR(32) NOT NULL,
    Phone VARCHAR(32),
    Address VARCHAR(32),
    Emp_Role VARCHAR(16)
);

CREATE TABLE Login_Data (
    User_ID INT PRIMARY KEY,
    Username VARCHAR(32) NOT NULL UNIQUE,
    User_Password VARCHAR(32) NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Employee(Emp_ID) ON DELETE CASCADE
);

CREATE TABLE Customer (
    Cust_ID INT PRIMARY KEY AUTO_INCREMENT,
    Cust_Name VARCHAR(32) NOT NULL,
    Phone VARCHAR(32),
    Address VARCHAR(32)
);

CREATE TABLE cust_Order (
    Order_ID INT AUTO_INCREMENT,
    OrderDate DATE,
    TotalAmount REAL,
    Cust_ID INT,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    primary key(Order_ID)
);

CREATE TABLE CustomerPhone (
    Cust_ID INT,
    Phone VARCHAR(32),
    PRIMARY KEY (Cust_ID, Phone),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Payment_Method (
    Order_ID INT,
    Payment_ID INT PRIMARY KEY AUTO_INCREMENT,
    MethodName VARCHAR(32),
    FOREIGN KEY (Order_ID) REFERENCES cust_Order(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Brand VARCHAR(32),
    Price REAL,
    StockQuantity INT,
    Color VARCHAR(32)
);

CREATE TABLE Mobile (
    ProductID INT PRIMARY KEY,
    Mob_Storage INT,
    Model VARCHAR(32),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Accessory (
    ProductID INT PRIMARY KEY,
    Acc_Type VARCHAR(32),
    Acc_Benefite VARCHAR(32),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE OrderProduct (
    Order_ID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (Order_ID, ProductID),
    FOREIGN KEY (Order_ID) REFERENCES cust_Order(Order_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)ON DELETE CASCADE ON UPDATE CASCADE
);

-- Insert data into Employee table
INSERT INTO Employee (Emp_Name, Email, Phone, Address, Emp_Role)
VALUES ('Bashar Thayneh', 'bashar@example.com', '123456789', '123 Main St', 'Manager'),
       ('Mohammad', 'moh@example.com', '987654321', '456 Elm St', 'Employee'),
       ('Ahmad', 'ahmad@example.com', '987654321', '456 Elm St', 'Employee'),
       ('Laila', 'laila@example.com', '123459876', '789 Birch St', 'Sales'),
       ('Sara', 'sara@example.com', '123454321', '321 Cedar St', 'HR');

-- Insert data into Login_Data table
INSERT INTO Login_Data (User_ID, Username, User_Password)
VALUES (1, 'aaa', 'aaa'),
       (2, 'j123', 'j123'),
       (3, 'ahmad', '123'),
       (4, 'laila', 'pass123'),
       (5, 'sara', 'pass456');

-- Insert data into Customer table
INSERT INTO Customer (Cust_Name, Phone, Address)
VALUES ('Alice Johnson', '555-1234', '789 Oak St'),
       ('Bob Williams', '555-5678', '321 Pine St'),
       ('Charlie Brown', '555-6789', '654 Cedar St'),
       ('Diana Prince', '555-7890', '987 Birch St'),
       ('Edward Elric', '555-1111', '123 Maple St'),
       ('Fiona Shrek', '555-2222', '456 Willow St'),
       ('George Smith', '555-3333', '789 Spruce St'),
       ('Hannah White', '555-4444', '321 Ash St');

-- Insert data into cust_Order table
INSERT INTO cust_Order (OrderDate, TotalAmount, Cust_ID)
VALUES ('2022-01-15', 1999.98, 1),
       ('2022-01-20', 1499.99, 2),
       ('2022-01-25', 299.99, 3),
       ('2022-02-10', 1099.99, 4),
       ('2022-02-15', 499.99, 5),
       ('2022-03-05', 699.99, 6),
       ('2022-03-15', 799.99, 7),
       ('2022-03-20', 399.99, 8),
       ('2022-04-01', 1599.99, 1),
       ('2022-04-10', 899.99, 2),
       ('2022-04-20', 999.99, 3),
       ('2022-05-05', 1299.99, 4),
       ('2022-05-15', 699.99, 5),
       ('2022-05-25', 599.99, 6),
       ('2022-06-01', 1499.99, 7),
       ('2022-06-15', 499.99, 8),
       ('2022-06-20', 899.99, 1),
       ('2022-07-05', 1399.99, 2),
       ('2022-07-10', 1099.99, 3),
       ('2022-07-15', 799.99, 4),
       ('2022-07-20', 499.99, 5),
       ('2022-08-01', 999.99, 6),
       ('2022-08-10', 599.99, 7),
       ('2022-08-15', 799.99, 8),
       ('2022-08-20', 1199.99, 1),
       ('2022-09-05', 1099.99, 2),
       ('2022-09-10', 699.99, 3),
       ('2022-09-15', 999.99, 4),
       ('2022-09-20', 499.99, 5),
       ('2022-10-01', 1199.99, 6),
       ('2022-10-10', 899.99, 7),
       ('2022-10-15', 499.99, 8),
       ('2022-10-20', 1099.99, 1),
       ('2022-11-05', 999.99, 2),
       ('2022-11-10', 699.99, 3),
       ('2022-11-15', 399.99, 4),
       ('2022-11-20', 799.99, 5),
       ('2022-12-01', 999.99, 6),
       ('2022-12-10', 699.99, 7),
       ('2022-12-15', 899.99, 8),
       ('2022-12-20', 1099.99, 1),
       ('2023-01-05', 799.99, 2),
       ('2023-01-10', 699.99, 3),
       ('2023-01-15', 999.99, 4),
       ('2023-01-20', 1199.99, 5),
       ('2023-02-05', 1099.99, 6),
       ('2023-02-10', 699.99, 7),
       ('2023-02-15', 899.99, 8),
       ('2023-02-20', 799.99, 1),
       ('2023-03-05', 999.99, 2),
       ('2023-03-10', 1099.99, 3),
       ('2023-03-15', 799.99, 4),
       ('2023-03-20', 599.99, 5),
       ('2023-04-05', 999.99, 6),
       ('2023-04-10', 799.99, 7),
       ('2023-04-15', 1199.99, 8),
       ('2023-04-20', 899.99, 1),
       ('2023-05-05', 1099.99, 2),
       ('2023-05-10', 799.99, 3),
       ('2023-05-15', 699.99, 4),
       ('2023-05-20', 999.99, 5),
       ('2023-06-05', 1199.99, 6),
       ('2023-06-10', 899.99, 7),
       ('2023-06-15', 799.99, 8),
       ('2023-06-20', 999.99, 1),
       ('2023-07-05', 1099.99, 2),
       ('2023-07-10', 799.99, 3),
       ('2023-07-15', 899.99, 4),
       ('2023-07-20', 999.99, 5),
       ('2023-08-05', 1199.99, 6),
       ('2023-08-10', 799.99, 7),
       ('2023-08-15', 699.99, 8),
       ('2023-08-20', 999.99, 1),
       ('2023-09-05', 1099.99, 2),
       ('2023-09-10', 799.99, 3),
       ('2023-09-15', 699.99, 4),
       ('2023-09-20', 999.99, 5),
       ('2023-10-05', 1199.99, 6),
       ('2023-10-10', 899.99, 7),
       ('2023-10-15', 799.99, 8),
       ('2023-10-20', 999.99, 1),
       ('2023-11-05', 1099.99, 2),
       ('2023-11-10', 799.99, 3),
       ('2023-11-15', 899.99, 4),
       ('2023-11-20', 999.99, 5),
       ('2023-12-05', 1199.99, 6),
       ('2023-12-10', 899.99, 7),
       ('2023-12-15', 799.99, 8),
       ('2023-12-20', 999.99, 1),
       ('2024-01-05', 1099.99, 2),
       ('2024-01-10', 799.99, 3),
       ('2024-01-15', 899.99, 4),
       ('2024-01-20', 999.99, 5),
       ('2024-02-05', 1199.99, 6),
       ('2024-02-10', 899.99, 7),
       ('2024-02-15', 799.99, 8),
       ('2024-02-20', 999.99, 1),
       ('2024-03-05', 1099.99, 2),
       ('2024-03-10', 799.99, 3),
       ('2024-03-15', 699.99, 4),
       ('2024-03-20', 999.99, 5),
       ('2024-04-05', 1199.99, 6),
       ('2024-04-10', 899.99, 7),
       ('2024-04-15', 799.99, 8),
       ('2024-04-20', 999.99, 1),
       ('2024-05-05', 1099.99, 2),
       ('2024-05-10', 799.99, 3),
       ('2024-05-15', 899.99, 4),
       ('2024-05-20', 999.99, 5),
       ('2024-06-05', 1199.99, 6),
       ('2024-06-10', 899.99, 7),
       ('2024-06-15', 799.99, 8),
       ('2024-06-20', 999.99, 1),
       ('2024-07-05', 1099.99, 2),
       ('2024-07-10', 799.99, 3),
       ('2024-07-15', 899.99, 4),
       ('2024-07-20', 999.99, 5);

-- Insert data into CustomerPhone table
INSERT INTO CustomerPhone (Cust_ID, Phone)
VALUES (1, '555-1234'),
       (2, '555-5678'),
       (3, '555-6789'),
       (4, '555-7890'),
       (5, '555-1111'),
       (6, '555-2222'),
       (7, '555-3333'),
       (8, '555-4444');

-- Insert data into Payment_Method table
INSERT INTO Payment_Method (Order_ID, MethodName)
VALUES (1, 'Credit Card'),
       (2, 'Cash'),
       (3, 'Credit Card'),
       (4, 'PayPal'),
       (5, 'Credit Card'),
       (6, 'Debit Card'),
       (7, 'Cash'),
       (8, 'Credit Card'),
       (9, 'PayPal'),
       (10, 'Credit Card'),
       (11, 'Debit Card'),
       (12, 'Credit Card'),
       (13, 'PayPal'),
       (14, 'Credit Card'),
       (15, 'Cash'),
       (16, 'Credit Card'),
       (17, 'PayPal');

-- Insert data into Product table
INSERT INTO Product (Brand, Price, StockQuantity, Color)
VALUES ('Samsung Galaxy S20', 999.99, 0, 'Black'),
       ('Apple iPhone 12', 1099.99, 15, 'White'),
       ('Generic Phone Cover', 200.00, 20, 'Blue'),
       ('Samsung Galaxy S21', 1099.99, 8, 'Gray'),
       ('Apple iPhone 13', 1199.99, 12, 'Red'),
       ('Samsung Galaxy S22', 1299.99, 10, 'Pink'),
       ('Apple iPhone 14', 1399.99, 10, 'Yellow'),
       ('Huawei P30', 899.99, 5, 'Black'),
       ('Nokia 3310', 49.99, 30, 'Blue'),
       ('Sony Xperia XZ', 799.99, 7, 'Green'),
       ('JBL Headphones', 199.99, 50, 'Black'),
       ('Samsung Earbuds', 149.99, 40, 'White'),
       ('Apple AirPods', 199.99, 35, 'White'),
       ('Portable Charger', 49.99, 60, 'Black'),
       ('Phone Stand', 19.99, 100, 'Silver');

-- Insert data into Mobile table
INSERT INTO Mobile (ProductID, Mob_Storage, Model)
VALUES (1, 128, 'Samsung Galaxy S20'),
       (2, 256, 'Apple iPhone 12'),
       (4, 128, 'Samsung Galaxy S21'),
       (5, 256, 'Apple iPhone 13'),
       (6, 512, 'Samsung Galaxy S22'),
       (7, 512, 'Apple iPhone 14'),
       (8, 128, 'Huawei P30'),
       (10, 64, 'Sony Xperia XZ');

-- Insert data into Accessory table
INSERT INTO Accessory (ProductID, Acc_Type, Acc_Benefite)
VALUES (3, 'Phone Cover', 'Protection'),
       (9, 'Screen Protector', 'Scratch Resistance'),
       (11, 'Headphones', 'Audio'),
       (12, 'Earbuds', 'Audio'),
       (13, 'Earbuds', 'Audio'),
       (14, 'Charger', 'Battery Backup'),
       (15, 'Stand', 'Convenience');

-- Insert data into OrderProduct table
INSERT INTO OrderProduct (Order_ID, ProductID, Quantity)
VALUES (1, 1, 1),
       (1, 3, 2),
       (2, 2, 1),
       (2, 11, 1),
       (3, 4, 1),
       (4, 5, 1),
       (5, 6, 1),
       (6, 7, 1),
       (7, 8, 1),
       (8, 1, 1),
       (9, 3, 1),
       (10, 11, 2),
       (11, 13, 1),
       (12, 5, 1),
       (13, 6, 1),
       (14, 1, 1),
       (14, 3, 2),
       (15, 2, 1),
       (16, 4, 2),
       (17, 5, 1),
       (1, 11, 1),
       (2, 12, 2),
       (3, 14, 1),
       (4, 15, 3),
       (5, 13, 2);

-- Queries
SELECT o.Order_ID, o.OrderDate, o.TotalAmount, c.Cust_Name, p.Brand, op.Quantity
FROM cust_Order o
JOIN Customer c ON o.Cust_ID = c.Cust_ID
JOIN OrderProduct op ON o.Order_ID = op.Order_ID
JOIN Product p ON op.ProductID = p.ProductID;

SELECT c.*
FROM Customer c
JOIN cust_Order o ON c.Cust_ID = o.Cust_ID
JOIN OrderProduct op ON o.Order_ID = op.Order_ID
JOIN Product p ON op.ProductID = p.ProductID
WHERE p.Brand = 'Apple iPhone 12';

SELECT * FROM Employee;
SELECT * FROM Mobile;
SELECT * FROM Accessory;
SELECT * FROM Product;
SELECT * FROM cust_Order;
SELECT * FROM Payment_Method;
SELECT * FROM OrderProduct;
SELECT * FROM Login_Data;
SELECT * FROM Customer;

SELECT p.Brand
FROM OrderProduct op
JOIN Product p ON op.ProductID = p.ProductID
JOIN cust_Order co ON op.Order_ID = co.Order_ID
WHERE op.Order_ID = 1;