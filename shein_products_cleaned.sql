CREATE TABLE shein_raw_products (
product_name TEXT,
    product_url TEXT,
    rank_title TEXT,
    rank_category TEXT,
    price TEXT,
    discount TEXT,
    sales_info TEXT,
    extra_product_name TEXT
);

SELECT * 
FROM shein_raw_products;

SELECT COUNT(*) 
FROM shein_raw_products;

SELECT *
FROM shein_raw_products
WHERE price IS NULL;

-- 1. Create working table
CREATE TABLE shein_clean_products AS
SELECT * FROM shein_raw_products;


-- 2. Convert empty strings → NULL
UPDATE shein_clean_products
SET 
    product_name = NULLIF(TRIM(product_name), ''),
    product_url = NULLIF(TRIM(product_url), ''),
    rank_title = NULLIF(TRIM(rank_title), ''),
    rank_category = NULLIF(TRIM(rank_category), ''),
    price = NULLIF(TRIM(price), ''),
    discount = NULLIF(TRIM(discount), ''),
    sales_info = NULLIF(TRIM(sales_info), ''),
    extra_product_name = NULLIF(TRIM(extra_product_name), '');


-- 3. Remove only critical missing values
DELETE FROM shein_clean_products
WHERE price IS NULL;


-- 4. Fill remaining NULLs
UPDATE shein_clean_products
SET 
    discount = COALESCE(discount, '0'),
    rank_title = COALESCE(rank_title, 'Not Ranked'),
    rank_category = COALESCE(rank_category, 'Unknown'),
    sales_info = COALESCE(sales_info, '0');


-- 5. Clean price
UPDATE shein_clean_products
SET price = REPLACE(price, '$', '');

UPDATE shein_clean_products
SET price = REPLACE(price, ',', '');

ALTER TABLE shein_clean_products
MODIFY price DECIMAL(10,2);


-- 6. Clean discount
UPDATE shein_clean_products
SET discount = REPLACE(discount, '%', '');

UPDATE shein_clean_products
SET discount = REPLACE(discount, '-', '');

ALTER TABLE shein_clean_products
MODIFY discount INT;


-- 7. Clean sales_info (SAFE ORDER)
UPDATE shein_clean_products
SET sales_info = LOWER(sales_info);

UPDATE shein_clean_products
SET sales_info = REPLACE(sales_info, ' sold', '');

UPDATE shein_clean_products
SET sales_info = REPLACE(sales_info, '+', '');

UPDATE shein_clean_products
SET sales_info = 
    CASE
        WHEN sales_info LIKE '%k'
        THEN CAST(REPLACE(sales_info, 'k', '') AS DECIMAL(10,2)) * 1000
        ELSE sales_info
    END;

-- Remove any remaining non-numeric values
UPDATE shein_clean_products
SET sales_info = NULL
WHERE sales_info REGEXP '[^0-9.]';

ALTER TABLE shein_clean_products
MODIFY sales_info INT;


-- 8. Remove duplicates (FIXED)
DELETE t1
FROM shein_clean_products t1
JOIN shein_clean_products t2
ON t1.product_name = t2.product_name
AND t1.price = t2.price
AND t1.discount = t2.discount
AND t1.rank_category = t2.rank_category
AND t1.rank_title = t2.rank_title
AND t1.sales_info = t2.sales_info
AND t1.product_url < t2.product_url;


-- 9. Rename final table
RENAME TABLE shein_clean_products TO shein_cleaned_products;


-- 10. Final data quality check
SELECT
    COUNT(*) AS total_rows,
    SUM(product_name IS NULL) AS missing_product_name,
    SUM(price IS NULL) AS missing_price,
    SUM(discount IS NULL) AS missing_discount,
    SUM(product_url IS NULL) AS missing_url,
    SUM(rank_title IS NULL) AS missing_rank_title,
    SUM(rank_category IS NULL) AS missing_rank_category,
    SUM(sales_info IS NULL) AS missing_sales
FROM shein_cleaned_products;

