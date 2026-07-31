CREATE DATABASE retail_sales_db;
USE retail_sales_db;



CREATE TABLE retail_sales (
    year INT,
    month VARCHAR(20),
    supplier VARCHAR(200),
    item_code VARCHAR(50),
    item_description VARCHAR(255),
    item_type VARCHAR(100),
    retail_sales DECIMAL(10,2),
    retail_transfers DECIMAL(10,2),
    warehouse_sales DECIMAL(10,2)
);

SELECT *
FROM retail_sales
LIMIT 10;

-- Query 1: Total Records
SELECT COUNT(*) AS Total_Records
FROM retail_sales;

-- Query 2: View Table Structure
DESCRIBE retail_sales;

-- Query 3: Check Missing Values
SELECT
SUM(YEAR IS NULL) AS Year_Null,
SUM(MONTH IS NULL) AS Month_Null,
SUM(SUPPLIER IS NULL) AS Supplier_Null,
SUM(`ITEM CODE` IS NULL) AS ItemCode_Null,
SUM(`ITEM DESCRIPTION` IS NULL) AS Description_Null,
SUM(`ITEM TYPE` IS NULL) AS ItemType_Null,
SUM(`RETAIL SALES` IS NULL) AS RetailSales_Null,
SUM(`RETAIL TRANSFERS` IS NULL) AS RetailTransfers_Null,
SUM(`WAREHOUSE SALES` IS NULL) AS WarehouseSales_Null
FROM retail_sales;

-- Query 4: Count Distinct Suppliers
SELECT COUNT(DISTINCT supplier) AS Total_Suppliers
FROM retail_sales;

-- Query 5: Count Distinct Products
SELECT COUNT(DISTINCT `ITEM CODE`) AS Total_Products
FROM retail_sales;

-- Query 6: Count Item Types
SELECT COUNT(DISTINCT `ITEM CODE`) AS Total_Products
FROM retail_sales;

-- Query 7 – Count Distinct Item Types
SELECT COUNT(DISTINCT `ITEM TYPE`) AS Total_Item_Types
FROM retail_sales;

-- Query 8 – Year Range
SELECT
    MIN(YEAR) AS Start_Year,
    MAX(YEAR) AS End_Year
FROM retail_sales;

-- Query 9 – Total Retail Sales
SELECT
    ROUND(SUM(`RETAIL SALES`), 2) AS Total_Retail_Sales
FROM retail_sales;

-- Query 10 – Total Warehouse Sales
SELECT
    ROUND(SUM(`WAREHOUSE SALES`), 2) AS Total_Warehouse_Sales
FROM retail_sales;