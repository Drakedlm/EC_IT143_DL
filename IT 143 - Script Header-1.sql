/*****************************************************************************************************************
NAME:    Create Answers
PURPOSE: The ability to intepret and make good questions...

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     10/06/2024   DDLisboa       1. Built this script for EC IT143


RUNTIME: 1s
Xm Xs

NOTES: 
Crafting SQL statements to answer user questions using the AdventureWorks sample database....
 
******************************************************************************************************************/


USE AdventureWorks2019;
GO

-- Q1:What is the total number of orders in the Sales.SalesOrderHeader table? 
-- A1:
-- Total Number of Orders
SELECT COUNT(*) AS TotalOrders
FROM Sales.SalesOrderHeader;

-- Q2: What is the total number of orders in the Sales.SalesOrderHeader table? 
-- A1: 
-- Top Three Customer Segments by Average Order Value
SELECT 
    Customer.AccountNumber,
    AVG(SalesOrderHeader.SubTotal) AS AverageOrderValue
FROM 
    Sales.SalesOrderHeader
INNER JOIN 
    Sales.Customer ON SalesOrderHeader.CustomerID = Customer.CustomerID
GROUP BY 
    Customer.AccountNumber
ORDER BY 
    AverageOrderValue DESC
LIMIT 3

-- Q3: What is the average of new people hired by the company per year? 
-- A3:
-- Average New Hires per Year
SELECT 
    YEAR(HireDate) AS Year,
    COUNT(*) AS NewEmployees
FROM 
    HumanResources.Employee
GROUP BY 
    YEAR(HireDate)
ORDER BY 
    Year;

-- Q4: Which three customer segments had the most expensive orders on average based on data from Customer and SalesOrderHeader table.  
-- Q4: There is a concern that some sales are not recouping the cost of production. You are tasked with creating a list of sales where the price of the unit was below the cost to produce it. Management is not concerned with how discounts factor into this so make sure to exclude any instances where a discount was applied to the sale. 
-- A4:
-- Sales Below Production Cost
SELECT 
    SalesOrderHeader.SalesOrderID,
    SalesOrderDetail.ProductID,
    SalesOrderDetail.UnitPrice,
    Product.StandardCost
FROM 
    Sales.SalesOrderHeader
INNER JOIN 
    Sales.SalesOrderDetail ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
INNER JOIN 
    Production.Product ON SalesOrderDetail.ProductID = Product.ProductID
WHERE 
    SalesOrderDetail.UnitPrice < Product.StandardCost
    AND SalesOrderDetail.UnitPriceDiscount = 0;

-- Q5:For the top 10 customers by total purchase value in the Sales.Customer table, which regions (from the Sales.SalesTerritory table) do they belong to, and what are their average order values? This analysis should include data from the last 12 months. 
-- A5: 
-- Top 10 Customers by Total Purchase Value and Region
WITH CustomerTotalSales AS (
    SELECT 
        Customer.CustomerID,
        SUM(SalesOrderDetail.UnitPrice * SalesOrderDetail.OrderQty) AS TotalSales
    FROM 
        Sales.SalesOrderHeader
    INNER JOIN 
        Sales.SalesOrderDetail ON SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID
    INNER JOIN 
        Sales.Customer ON SalesOrderHeader.CustomerID = Customer.CustomerID
    WHERE 
        SalesOrderHeader.OrderDate >= DATEADD(MONTH, -12, GETDATE())
    GROUP BY 
        Customer.CustomerID
  
-- Q7: List all the columns and their data types in the Sales.OrderHeader table. 
-- A7:
-- Columns and Data Types in Sales.OrderHeader
SELECT 
    COLUMN_NAME,
    DATA_TYPE
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_SCHEMA = 'Sales'
    AND TABLE_NAME = 'SalesOrderHeader';
 
-- Q8: Find the number of rows in the Production.Product table. 
-- A8: 
-- Number of Rows in Production.Product
SELECT COUNT(*) AS ProductCount
FROM Production.Product;
