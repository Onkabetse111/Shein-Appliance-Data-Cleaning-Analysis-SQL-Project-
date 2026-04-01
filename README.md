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
- Identified duplicates using multiple fields (product name, price, discount, category, ranking)
- Removed duplicates without relying on product_url due to high missing values

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

| Metric | Before Cleaning | After Cleaning |
|-------|----------------|----------------|
| Missing Values | Present | Resolved|
| Duplicate Record | Present | Removed |
| Data Types | Text-Based | Numeric |
| Data Consistency | Low | Standardized |


**Note:**  
The `product_url` column contained a high proportion of missing values (~97%) and was excluded from cleaning constraints and analysis, as it did not provide meaningful analytical value.

---


## 🔍 Exploratory Data Analysis (EDA)

### 💰 Price & Discount Overview

Product prices range from $0.50 to $1430.99, with an average price of $14.33, indicating that most products fall within a low-cost, budget-friendly segment.

The large gap between average and maximum price suggests a right-skewed distribution, where a small number of high-priced items exist alongside many low-cost products.

Discounts are widely applied, with some products reaching up to 85%, highlighting a strong reliance on promotional pricing.

### 🔥 Top Discounted Products

Highly discounted products (up to 85%) are present in the dataset, with some appearing among best-selling items, suggesting that discounts may contribute to increased product visibility.

### 📉 Discount vs Sales Relationship

Analysis of discount levels shows no measurable variation in average sales, with all segments (low, medium, high discount) returning zero average sales.

This suggests that:

- The sales data may be incomplete or inconsistent
- The dataset does not fully capture product demand

---

### 📦 Category Distribution

The majority of products fall under the “Unknown” category (1048 products), indicating significant inconsistencies in category labeling.

Other categories such as:

LED Makeup Mirror
Aroma Diffuser
Household Appliances

contain relatively few products, suggesting that the category structure is not well standardized.

---

### ⚠️ Data Limitations
Sales data lacked sufficient variation for meaningful trend analysis
Category labels were inconsistent and required further standardization
Product URL data was largely missing and not suitable for analysis

---

### 🛠 Tools & Technologies
SQL (MySQL)
Data Cleaning & Transformation
Exploratory Data Analysis (EDA)

---

### 📁 Project Structure
shein-data-cleaning-sql/
│
├── README.md
├── shein_products_cleaned.sql   # Data cleaning script
├── shein_products_eda.sql       # Analysis queries

---

### 🚀 Key Skills Demonstrated
Data cleaning and preprocessing
Handling missing and inconsistent data
SQL data transformation and type conversion
Exploratory data analysis using SQL
Identifying and communicating data limitations

---

## 📌 Conclusion

This project demonstrates the importance of data cleaning in the analytics workflow and highlights how data quality directly impacts the ability to generate meaningful insights.

Despite limitations in the dataset, the project showcases a structured approach to preparing raw data for analysis and extracting actionable observations.

---

### 🔮 Future Improvements
Standardize product categories for better analysis
Improve sales data quality for demand analysis
Build a dashboard for visualization (Power BI / Excel)
Incorporate additional datasets for deeper insights

---

## 📬 Contact

If you have any feedback or suggestions, feel free to connect with me.

---

⭐ If you found this project useful, consider giving it a star!









