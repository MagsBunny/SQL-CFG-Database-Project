#CFG Pharmacy Database
CREATE DATABASE CarewellPharmacy;

USE CarewellPharmacy;

#Create Fact Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    employee_id INT NOT NULL,
    supplier_id INT NOT NULL,
    payment_id INT NOT NULL,
    sale_date DATE NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    sale_quantity INT NOT NULL
);

INSERT INTO Sales (sale_id, customer_id, product_id, order_id, employee_id, supplier_id, payment_id, sale_date, sale_amount, sale_quantity)
VALUES 
  (1, 1, 1, 1, 1, 1, 1, '2023-03-20', 10.99, 1),
  (2, 2, 2, 2, 2, 2, 2, '2023-03-19', 25.50, 2),
  (3, 3, 3, 3, 3, 3, 3, '2023-03-18', 35.00, 1),
  (4, 4, 4, 4, 4, 4, 4, '2023-03-17', 5.99, 3),
  (5, 5, 5, 5, 5, 5, 5, '2023-03-16', 15.75, 2),
  (6, 6, 6, 6, 6, 6, 6, '2023-03-15', 12.50, 1),
  (7, 7, 7, 7, 7, 7, 7, '2023-03-14', 8.99, 4),
  (8, 8, 8, 8, 8, 8, 8, '2023-03-13', 18.00, 2),
  (9, 9, 9, 9, 9, 9, 9, '2023-03-12', 27.50, 3),
  (10, 10, 10, 10, 10, 10, 10, '2023-03-11', 40.00, 2);


#Create the dimension tables
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_category VARCHAR(50) NOT NULL,
    product_brand VARCHAR(50) NOT NULL,
    product_price DECIMAL(10, 2) NOT NULL
);

INSERT INTO Products (product_id, product_name, product_category, product_brand, product_price)
VALUES
  (1, 'Aspirin', 'Pain Relief', 'Bayer', 5.99),
  (2, 'Ibuprofen', 'Pain Relief', 'Advil', 6.99),
  (3, 'Tylenol', 'Pain Relief', 'Johnson & Johnson', 4.99),
  (4, 'Claritin', 'Allergy Relief', 'Bayer', 12.99),
  (5, 'Benadryl', 'Allergy Relief', 'Johnson & Johnson', 9.99),
  (6, 'Zyrtec', 'Allergy Relief', 'Pfizer', 15.99),
  (7, 'Nexium', 'Heartburn Relief', 'AstraZeneca', 18.99),
  (8, 'Prilosec', 'Heartburn Relief', 'Procter & Gamble', 16.99),
  (9, 'Zantac', 'Heartburn Relief', 'Sanofi', 14.99),
  (10, 'Neosporin', 'First Aid', 'Johnson & Johnson', 7.99);


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_email VARCHAR(50) NOT NULL,
    customer_address VARCHAR(100) NOT NULL,
    customer_phone VARCHAR(20) NOT NULL
);

INSERT INTO Customers (customer_id, customer_name, customer_email, customer_address, customer_phone)
VALUES (1, 'John Doe', 'johndoe@gmail.com', '123 Main St, Anytown, USA', '555-1234'),
       (2, 'Jane Smith', 'janesmith@gmail.com', '456 Broad St, Anytown, USA', '555-5678'),
       (3, 'David Johnson', 'davidjohnson@yahoo.com', '789 First St, Anytown, USA', '555-9012'),
       (4, 'Mary Brown', 'marybrown@gmail.com', '246 Elm St, Anytown, USA', '555-3456'),
       (5, 'Mike Davis', 'mikedavis@gmail.com', '135 Oak St, Anytown, USA', '555-7890'),
       (6, 'Lisa Wilson', 'lisawilson@outlook.com', '789 Maple St, Anytown, USA', '555-2345'),
       (7, 'Tom Chen', 'tomchen@gmail.com', '246 Cherry St, Anytown, USA', '555-6789'),
       (8, 'Olivia Lee', 'olivialee@gmail.com', '135 Pine St, Anytown, USA', '555-0123'),
       (9, 'Brian Zhang', 'brianzhang@gmail.com', '789 Cedar St, Anytown, USA', '555-4567'),
       (10, 'Amy Wang', 'amywang@yahoo.com', '246 Oakwood St, Anytown, USA', '555-8901');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    order_status VARCHAR(20) NOT NULL,
    order_shipping_info VARCHAR(100) NOT NULL
);

INSERT INTO Orders (order_id, order_date, order_status, order_shipping_info)
VALUES
  (1, '2022-01-01', 'Shipped', '123 Main St., Chicago, USA'),
  (2, '2022-01-05', 'Shipped', '456 Elm St., New York,  USA'),
  (3, '2022-01-10', 'Pending', '789 Oak St., New Jersey, USA'),
  (4, '2022-01-15', 'Cancelled', '321 Maple St., Montreal, Canada'),
  (5, '2022-01-20', 'Shipped', '654 Pine St., Nairobi, Kenya'),
  (6, '2022-01-25', 'Shipped', '987 Cedar St., Kampala, Uganda'),
  (7, '2022-01-30', 'Pending', '654 Pine St., Miami, USA'),
  (8, '2022-02-01', 'Cancelled', '321 Maple St., Miami, USA'),
  (9, '2022-02-05', 'Shipped', '987 Cedar St., New York, USA'),
  (10, '2022-02-10', 'Shipped', '123 Main St., New York, USA');

CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50) NOT NULL,
    supplier_contact_info VARCHAR(100) NOT NULL
);

INSERT INTO Suppliers (supplier_id, supplier_name, supplier_contact_info)
VALUES (1, 'ABC Pharmaceutical', '123-456-7890'),
       (2, 'XYZ Medical Supplies', '987-654-3210'),
       (3, 'LMN Drug Company', '555-555-5555'),
       (4, 'PQR Pharmacy', '777-777-7777'),
       (5, 'Medline Industries', '888-888-8888'),
       (6, 'Cardinal Health', '999-999-9999'),
       (7, 'Henry Schein', '111-111-1111'),
       (8, 'McKesson Corporation', '222-222-2222'),
       (9, 'AmerisourceBergen', '333-333-3333'),
       (10, 'VWR International', '444-444-4444');


CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    payment_type VARCHAR(20) NOT NULL,
    card_type VARCHAR(20)
);

INSERT INTO Payment (payment_id, payment_type, card_type)
VALUES
  (1, 'Credit Card', 'Visa'),
  (2, 'Credit Card', 'MasterCard'),
  (3, 'Debit Card', 'Visa'),
  (4, 'Debit Card', 'MasterCard'),
  (5, 'PayPal', NULL),
  (6, 'Apple Pay', NULL),
  (7, 'Google Pay', NULL),
  (8, 'Venmo', NULL),
  (9, 'Cash', NULL),
  (10, 'Check', NULL);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL,
    employee_role VARCHAR(50) NOT NULL,
    employee_department VARCHAR(50) NOT NULL
);

INSERT INTO Employees (employee_id, employee_name, employee_role, employee_department)
VALUES
    (1, 'John Smith', 'Pharmacist', 'Pharmacy'),
    (2, 'Ella Kitengo', 'Pharmacy Technician', 'Pharmacy'),
    (3, 'David Johnson', 'Cashier', 'Front End'),
    (4, 'Mary Wilson', 'Pharmacist', 'Pharmacy'),
    (5, 'Kevin Lee', 'Pharmacy Technician', 'Pharmacy'),
    (6, 'Sarah Brown', 'Cashier', 'Front End'),
    (7, 'Mark Taylor', 'Pharmacist', 'Pharmacy'),
    (8, 'Lisa Jones', 'Pharmacy Technician', 'Pharmacy'),
    (9, 'Peter White', 'Cashier', 'Front End'),
    (10, 'Karen Kim', 'Pharmacy Technician', 'Pharmacy');


#Link the Fact table to the Dimension tables
ALTER TABLE Sales ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES Customers(customer_id);
ALTER TABLE Sales ADD CONSTRAINT fk_product_id FOREIGN KEY (product_id) REFERENCES Products(product_id);
ALTER TABLE Sales ADD CONSTRAINT fk_order_id FOREIGN KEY (order_id) REFERENCES Orders(order_id);
ALTER TABLE Sales ADD CONSTRAINT fk_employee_id FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);
ALTER TABLE Sales ADD CONSTRAINT fk_supplier_id FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id);
ALTER TABLE Sales ADD CONSTRAINT fk_payment_id FOREIGN KEY (payment_id) REFERENCES Payment(payment_id);

#Joing the Sales, Products and Customers tables
SELECT Sales.sale_id, Products.product_name, Customers.customer_name, Sales.sale_amount
FROM Sales
INNER JOIN Products ON Sales.product_id = Products.product_id
INNER JOIN Customers ON Sales.customer_id = Customers.customer_id;

#Group By
SELECT Customers.customer_name, SUM(Sales.sale_amount) as total_sales
FROM Sales
INNER JOIN Customers ON Sales.customer_id = Customers.customer_id
GROUP BY Customers.customer_name;

#Top 5 performing products
SELECT product_name, SUM(sale_quantity) AS total_quantity_sold
FROM Sales s
INNER JOIN Products p ON s.product_id = p.product_id
GROUP BY product_name
ORDER BY total_quantity_sold DESC
LIMIT 5;

#Total Sales per date
SELECT sale_date, SUM(sale_amount) AS total_sales
FROM Sales
GROUP BY sale_date
ORDER BY sale_date ASC;

#Having query that returns Pending Orders
SELECT Orders.order_id, Orders.order_date, Orders.order_status, SUM(Sales.sale_amount) AS total_amount
FROM Orders
INNER JOIN Sales
ON Orders.order_id = Sales.order_id
GROUP BY Orders.order_id
HAVING Orders.order_status = 'Pending';


#Stored Procedure that returns total quantity of each product sold in that Category
DELIMITER //
CREATE PROCEDURE GetSalesByProductCategory(
    IN product_category VARCHAR(50)
)
BEGIN
    SELECT Products.product_name, SUM(Sales.sale_quantity) as total_quantity
    FROM Sales
    INNER JOIN Products ON Sales.product_id = Products.product_id
    WHERE Products.product_category = product_category
    GROUP BY Products.product_name;
END //
DELIMITER;

#View that Summarizes sales data by Product and Customer
CREATE VIEW SalesSummary AS
SELECT Customers.customer_name, Products.product_name, SUM(Sales.sale_quantity) as total_quantity, SUM(Sales.sale_amount) as total_amount
FROM Sales
INNER JOIN Customers ON Sales.customer_id = Customers.customer_id
INNER JOIN Products ON Sales.product_id = Products.product_id
GROUP BY Customers.customer_name, Products.product_name;

#Trigger
#Updated after Row is updated in Products table
DELIMITER //
CREATE TRIGGER UpdateProductPrice
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductPriceHistory(product_id, old_price, new_price, update_date)
    VALUES (OLD.product_id, OLD.product_price, NEW.product_price, NOW());
END;






