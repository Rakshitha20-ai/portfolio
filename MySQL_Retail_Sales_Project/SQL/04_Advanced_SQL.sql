-- Query 1 – Rank Item Types by Retail Sales
SELECT
    `ITEM TYPE`,
    ROUND(SUM(`RETAIL SALES`),2) AS Total_Sales,
    RANK() OVER(
        ORDER BY SUM(`RETAIL SALES`) DESC
    ) AS Sales_Rank
FROM retail_sales
GROUP BY `ITEM TYPE`;

-- Query 2 – Dense Rank Suppliers
SELECT SUPPLIER,
    ROUND(SUM(`RETAIL SALES`),2) AS Total_Sales,
    DENSE_RANK() OVER(
        ORDER BY SUM(`RETAIL SALES`) DESC
    ) AS Supplier_Rank
FROM retail_sales
GROUP BY SUPPLIER;

-- Query 3 – Top Product from Each Item Type
WITH ProductSales AS
(
SELECT
    `ITEM TYPE`,
    `ITEM DESCRIPTION`,
    SUM(`RETAIL SALES`) AS Sales,
    ROW_NUMBER() OVER(
        PARTITION BY `ITEM TYPE`
        ORDER BY SUM(`RETAIL SALES`) DESC
    ) AS rn
FROM retail_sales
GROUP BY
    `ITEM TYPE`,
    `ITEM DESCRIPTION`
)
SELECT *
FROM ProductSales
WHERE rn=1;

-- Query 4 – Running Total
SELECT
    YEAR,
    MONTH,
    SUM(`RETAIL SALES`) AS MonthlySales,
    SUM(SUM(`RETAIL SALES`))
    OVER(
        ORDER BY YEAR,MONTH
    ) AS Running_Total
FROM retail_sales
GROUP BY YEAR,MONTH;

-- Query 5 – Moving Average
SELECT
YEAR,
MONTH,
SUM(`RETAIL SALES`) AS MonthlySales,
AVG(SUM(`RETAIL SALES`))
OVER(
ORDER BY YEAR,MONTH
ROWS BETWEEN 2 PRECEDING
AND CURRENT ROW
) AS MovingAverage
FROM retail_sales
GROUP BY YEAR,MONTH;

-- Query 6 – Previous Month Sales (LAG)
SELECT YEAR,
MONTH,
SUM(`RETAIL SALES`) AS MonthlySales,
LAG(
SUM(`RETAIL SALES`)
)
OVER(
ORDER BY YEAR,MONTH
) PreviousMonth
FROM retail_sales
GROUP BY YEAR,MONTH;

-- Query 7 – Next Month Sales (LEAD)
SELECT
YEAR,
MONTH,
SUM(`RETAIL SALES`) AS MonthlySales,
LAG(
SUM(`RETAIL SALES`)
)
OVER(
ORDER BY YEAR,MONTH
) PreviousMonth
FROM retail_sales
GROUP BY YEAR,MONTH;

-- Query 8 – CASE Statement
SELECT
SUPPLIER,
SUM(`RETAIL SALES`) Sales,
CASE
WHEN SUM(`RETAIL SALES`)>=1000
THEN 'High'
WHEN SUM(`RETAIL SALES`)>=500
THEN 'Medium'
ELSE 'Low'
END AS Supplier_Category
FROM retail_sales
GROUP BY SUPPLIER;

-- Query 9 – Subquery
SELECT *
FROM
(
SELECT
SUPPLIER,
SUM(`RETAIL SALES`) Sales
FROM retail_sales
GROUP BY SUPPLIER
)t
WHERE Sales>
(
SELECT AVG(Sales)
FROM
(
SELECT
SUM(`RETAIL SALES`) Sales
FROM retail_sales
GROUP BY SUPPLIER
)x
);

-- Query 10 – Create a View
CREATE VIEW vw_supplier_sales AS
SELECT
SUPPLIER,
ROUND(SUM(`RETAIL SALES`),2) TotalSales
FROM retail_sales
GROUP BY SUPPLIER;

-- Query 11 – Top 5 Products in Each Category
WITH ProductRank AS
(
SELECT
`ITEM TYPE`,
`ITEM DESCRIPTION`,
SUM(`RETAIL SALES`) Sales,
ROW_NUMBER() OVER(
PARTITION BY `ITEM TYPE`
ORDER BY SUM(`RETAIL SALES`) DESC
) rn
FROM retail_sales
GROUP BY
`ITEM TYPE`,
`ITEM DESCRIPTION`
)

SELECT *
FROM ProductRank
WHERE rn<=5;

-- ===========================================
-- Query 12 – Percentage Contribution
-- ===========================================
SELECT SUPPLIER,
ROUND(SUM(`RETAIL SALES`),2) Sales,
ROUND(
SUM(`RETAIL SALES`)*100/
SUM(SUM(`RETAIL SALES`))
OVER(),2 ) AS Percentage
FROM retail_sales
GROUP BY SUPPLIER
ORDER BY Sales DESC;