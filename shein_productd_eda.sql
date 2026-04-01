SELECT * 
FROM shein_cleaned_products
LIMIT 20;

SELECT COUNT(*) AS total_products FROM shein_cleaned_products;

SELECT COUNT(DISTINCT product_name) AS unique_products FROM shein_cleaned_products;

SELECT 
      MIN(price) AS min_price,
      MAX( price) AS max_price,
      AVG(price) AS avg_price
      
FROM shein_cleaned_products;	

SELECT 
     MIN(discount) AS min_discount,
     MAX(discount) AS max_discount,
     AVG(discount) AS avg_discount
FROM  shein_cleaned_products;    

SELECT rank_title, COUNT(*) AS count_products
FROM shein_cleaned_products 
GROUP BY rank_title
ORDER BY count_products DESC;

SELECT rank_category, COUNT(*) AS count_products
FROM shein_cleaned_products
GROUP BY rank_category
ORDER BY count_products DESC;

SELECT 
    CASE 
        WHEN price < 50 THEN '<$50'
        WHEN price BETWEEN 50 AND 100 THEN '$50-$100'
        WHEN price BETWEEN 100 AND 500 THEN '$100-$500'
        ELSE '>$500'
    END AS price_range,
    AVG(discount) AS avg_discount,
    COUNT(*) AS products_count
FROM shein_cleaned_products
GROUP BY price_range
ORDER BY price_range;

SELECT product_name, price, discount, rank_title
FROM shein_cleaned_products
WHERE discount IS NOT NULL
ORDER BY discount DESC
LIMIT 10;

SELECT COUNT(*) AS products_with_sales_info
FROM shein_cleaned_products
WHERE sales_info LIKE '%+ recently%';

SELECT product_name, sales_info
FROM shein_cleaned_products
WHERE sales_info LIKE '%+ recently%'
ORDER BY CAST(REGEXP_REPLACE(sales_info, '[^0-9]', '') AS UNSIGNED) DESC
LIMIT 10;

-- Does price affect sales?
SELECT 
    CASE 
        WHEN price < 100 THEN 'Low Price'
        WHEN price BETWEEN 100 AND 300 THEN 'Mid Price'
        ELSE 'High Price'
    END AS price_segment,
    ROUND(AVG(sales_info), 2) AS avg_sales,
    COUNT(*) AS total_products
FROM shein_cleaned_products
GROUP BY price_segment;

-- Do higher discounts increase sales?
SELECT 
    CASE 
        WHEN discount < 20 THEN 'Low Discount'
        WHEN discount BETWEEN 20 AND 50 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,
    ROUND(AVG(sales_info), 0) AS avg_sales,
    COUNT(*) AS total_products
FROM shein_cleaned_products
GROUP BY discount_level;


-- Which categories sell the most?
SELECT 
    rank_category,
    COUNT(*) AS total_products,
    ROUND(AVG(sales_info), 2) AS avg_sales
FROM shein_cleaned_products
GROUP BY rank_category
ORDER BY avg_sales DESC;













