CREATE DATABASE CarSalesDB;

USE CarSalesDB;

CREATE TABLE Car_Sales (
    Sale_ID       INT PRIMARY KEY,
    Make          VARCHAR(50),
    Model         VARCHAR(50),
    Body_Style    VARCHAR(30),
    Engine_Type   VARCHAR(30),
    Color         VARCHAR(30),
    Customer_Name VARCHAR(100),
    City          VARCHAR(50),
    State         VARCHAR(50),
    Dealer_Name   VARCHAR(100),
    Sale_Date     DATE,
    Sale_Price    INT
);


SELECT * FROM Car_Sales;

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;


LOAD DATA LOCAL INFILE 'C:/Users/kamsa/Downloads/car_sales_dataset.csv'
INTO TABLE Car_Sales
FIELDS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Sale_ID, Make, Model, Body_Style, Engine_Type, Color,
 Customer_Name, City, State, Dealer_Name, Sale_Date, Sale_Price);
 
 
 #1 total sales amount
 
 SELECT SUM(Sale_Price) AS Total_Sales
FROM Car_Sales;

#2 Number of Cars Sold by Make

SELECT Make, COUNT(*) AS Cars_Sold
FROM Car_Sales
GROUP BY Make
ORDER BY Cars_Sold DESC;

#3 Average Sale Price by Body Style

SELECT Body_Style, AVG(Sale_Price) AS Avg_Price
FROM Car_Sales
GROUP BY Body_Style
ORDER BY Avg_Price DESC;

#4 Top 5 Most Expensive Cars Sold

SELECT Make, Model, Sale_Price, Customer_Name, Dealer_Name
FROM Car_Sales
ORDER BY Sale_Price DESC
LIMIT 5;


#5 Sales by Dealer

SELECT Dealer_Name, COUNT(*) AS Cars_Sold, SUM(Sale_Price) AS Revenue
FROM Car_Sales
GROUP BY Dealer_Name
ORDER BY Revenue DESC;

#6 Monthly Sales

SELECT DATE_FORMAT(Sale_Date, '%Y-%m') AS Month, SUM(Sale_Price) AS Total_Sales
FROM Car_Sales
GROUP BY Month
ORDER BY Month;

#7 Yearly Sales

SELECT YEAR(Sale_Date) AS Year, SUM(Sale_Price) AS Total_Sales
FROM Car_Sales
GROUP BY Year
ORDER BY Year;

#8 Top 5 Customers by Spending

SELECT Customer_Name, SUM(Sale_Price) AS Total_Spent
FROM Car_Sales
GROUP BY Customer_Name
ORDER BY Total_Spent DESC
LIMIT 5;

#9 Sales by State

SELECT State, COUNT(*) AS Cars_Sold, SUM(Sale_Price) AS Revenue
FROM Car_Sales
GROUP BY State
ORDER BY Revenue DESC;













