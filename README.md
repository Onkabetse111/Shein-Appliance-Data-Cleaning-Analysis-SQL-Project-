#  🛍️ Shein-Appliance-Data-Cleaning-Analysis-SQL-Project-
SQL project focused on cleaning and analyzing SHEIN appliance data, transforming raw messy data into a structured dataset and extracting insights on pricing, discounts, and product distribution.

---

## 📌 Project Overview
This project focuses on transforming raw SHEIN appliance product data into a clean, structured dataset and performing exploratory data analysis (EDA) using SQL.

The goal was to:

- Clean and standardize messy e-commerce data
- Prepare the dataset for analysis
- Give insights related to pricing, discounts, and product distribution

---

## 📁 Dataset Description
The dataset consists of SHEIN appliance product listings, including:

- Product name
- Product URL
- Price
- Discount
- Ranking information
- Sales data

---

## 🚩 Data Quality Issues Identified

The raw dataset contained multiple issues:

- Missing values in key fields (price, product name, URL)
- Duplicate product listings
- Text-based numeric fields (e.g., "$12.99", "2k sold")
- Inconsistent category and ranking labels
- Noisy text in sales data

---

## 🧹 Data Cleaning Process (SQL)

### 1. Handling Missing Values
- Converted empty strings to NULL
- Removed rows missing critical fields (price, product name, URL)

### 2. Removing Duplicates
- Identified duplicates using product_url
- Removed duplicates using SELECT DISTINCT

### 3. Data Type Conversion
- Converted:
  * price → DECIMAL
  * discount → INTEGER
  * sales_info → INTEGER

### 4. String Cleaning 
- Rmoved unwanted characters
  * $ from price
  * % from discount
  * "sold" from sales
- Cleaned and standardized text fields

  ### 5. Data Transformation
- Converted abbreviated values:
  *"2k" → 2000
- Standardized categorical values (e.g., rank categories)

---

## 📊 Data Quality Improvements
















