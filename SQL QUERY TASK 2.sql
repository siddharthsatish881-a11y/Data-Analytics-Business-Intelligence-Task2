create database task2_db;
use task2_db;
SHOW TABLES;
SELECT *
FROM orders
LIMIT 5;

SELECT *
FROM customers
LIMIT 5;

DESCRIBE orders;

SHOW COLUMNS FROM customers;

ALTER TABLE orders
RENAME COLUMN `ï»¿Order ID` TO `Order ID`;

ALTER TABLE customers
RENAME COLUMN `ï»¿Customer ID` TO `Customer ID`;

SHOW COLUMNS FROM orders;

SHOW COLUMNS FROM customers;

SELECT

o.`Order ID`,

o.`Order Date`,

c.`Customer Name`,

c.Region,

c.Segment,

o.Category,

o.Sales,

o.Quantity,

o.Profit

FROM orders o

INNER JOIN customers c

ON o.`Customer ID`=c.`Customer ID`;


SELECT

c.Region,

ROUND(SUM(o.Sales),2)

AS Total_Sales

FROM orders o

JOIN customers c

ON o.`Customer ID`=c.`Customer ID`

GROUP BY c.Region

ORDER BY Total_Sales DESC;


SELECT

c.Segment,

ROUND(SUM(o.Sales),2)

AS Total_Sales

FROM orders o

JOIN customers c

ON o.`Customer ID`=c.`Customer ID`

GROUP BY c.Segment

ORDER BY Total_Sales DESC;


SELECT

Category,

ROUND(

(SUM(Profit)/SUM(Sales))*100

,2)

AS Profit_Margin

FROM orders

GROUP BY Category

ORDER BY Profit_Margin DESC;


SELECT

c.`Customer Name`,

ROUND(SUM(o.Sales),2)

AS Total_Revenue

FROM orders o

JOIN customers c

ON o.`Customer ID`=c.`Customer ID`

GROUP BY c.`Customer Name`

ORDER BY Total_Revenue DESC

LIMIT 5;


SELECT

MONTHNAME(`Order Date`) AS Month,

ROUND(SUM(Sales),2)

AS Monthly_Sales

FROM orders

GROUP BY

MONTH(`Order Date`),

MONTHNAME(`Order Date`)

ORDER BY MONTH(`Order Date`);


SELECT

ROUND(

SUM(Sales)

/

COUNT(DISTINCT `Order ID`)

,2)

AS Average_Order_Value

FROM orders;


