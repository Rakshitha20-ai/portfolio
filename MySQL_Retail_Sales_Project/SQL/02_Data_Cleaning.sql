-- Query 1: Check Duplicate Records
SELECT YEAR, MONTH, SUPPLIER, `ITEM CODE`,
COUNT(*) AS Duplicate_Count
FROM retail_sales
GROUP BY YEAR, MONTH, SUPPLIER, `ITEM CODE`
HAVING COUNT(*) > 1;

-- Query 2: Check Blank Supplier Names
SELECT *
FROM retail_sales
WHERE SUPPLIER IS NULL
   OR TRIM(SUPPLIER)='';
   
-- Query 3: Check Blank Item Descriptions
SELECT *
FROM retail_sales
WHERE `ITEM DESCRIPTION` IS NULL
   OR TRIM(`ITEM DESCRIPTION`)='';
   
-- Query 4: Check Negative Sales
SELECT *
FROM retail_sales
WHERE `RETAIL SALES` < 0
   OR `WAREHOUSE SALES` < 0;
   
-- Query 5: Check Zero Sales
SELECT *
FROM retail_sales
WHERE `RETAIL SALES`=0
AND `WAREHOUSE SALES`=0;

-- Query 6: Supplier Count
SELECT SUPPLIER,
COUNT(*) Total_Records
FROM retail_sales
GROUP BY SUPPLIER
ORDER BY Total_Records DESC;