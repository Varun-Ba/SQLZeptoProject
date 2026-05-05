drop table if exists zepto;

create table zepto (
sku_id SERIAL PRIMARY KEY,
category VARCHAR(120),
name VARCHAR(150) NOT NULL,
mrp NUMERIC(8,2),
discountPercent NUMERIC(5,2),
availableQuantity INTEGER,
discountedSellingPrice NUMERIC(8,2),
weightInGms INTEGER,
outOfStock BOOLEAN,	
quantity INTEGER
);


--data exploration

--count of rows
SELECT COUNT (*) FROM zepto;


--sample data
SELECT * FROM zepto
LIMIT 10;

--null values
SELECT * FROM zepto
WHERE name IS NULL
OR
category IS NULL
OR
mrp IS NULL
OR
discountPercent IS NULL
OR
discountedSellingPrice IS NULL
OR
weightInGms IS NULL
OR
availableQuantity IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;

--different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

--products in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;

--product names present multiple times
SELECT name, COUNT(sku_id) AS "Number of SKUs"
FROM zepto
GROUP BY name
HAVING count(sku_id) > 1
ORDER BY count(sku_id) DESC;

--data cleaning

--products with price = 0
SELECT * FROM zepto
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto
WHERE mrp = 0;

--convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
discountedSellingPrice = discountedSellingPrice / 100.0;

SELECT mrp, discountedSellingPrice FROM zepto;

--products with weight = 0
SELECT * FROM zepto
WHERE weightInGms = 0;

DELETE FROM zepto
WHERE weightInGms = 0;

--data analysis

--Which products generate the highest revenue?

SELECT name,
       SUM(discountedSellingPrice * quantity) AS revenue
FROM zepto
GROUP BY name
ORDER BY revenue DESC
LIMIT 5;


--Which category contributes the most to total revenue?

SELECT category,
       SUM(discountedSellingPrice * quantity) AS revenue
FROM zepto
GROUP BY category
ORDER BY revenue DESC;


--Which products are heavily discounted?

SELECT name, discountPercent
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


--How many products are out of stock?

SELECT COUNT(*) AS out_of_stock_products
FROM zepto
WHERE outOfStock = TRUE;


--Which categories give highest discounts?

SELECT category,
       AVG(discountPercent) AS avg_discount  --can be done to two decmal places
FROM zepto
GROUP BY category
ORDER BY avg_discount DESC;


--Do expensive products get higher discounts?

SELECT 
    CASE 
        WHEN mrp < 500 THEN 'Low Price'
        WHEN mrp BETWEEN 500 AND 1000 THEN 'Medium Price'
        ELSE 'High Price'
    END AS price_range,
    AVG(discountPercent) AS avg_discount
FROM zepto
GROUP BY price_range;


--Which products are running low on stock?

SELECT name, availableQuantity
FROM zepto
WHERE availableQuantity < 5
ORDER BY availableQuantity ASC;


--Which products give best value for money?

SELECT name,
       discountedSellingPrice / weightInGms AS price_per_gram
FROM zepto
ORDER BY price_per_gram ASC
LIMIT 10;