-- E-Commerce Sales & Customer Analytics
-- Data Quality Checks

USE ecommerce_analytics;

-- Check total rows
SELECT COUNT(*) AS total_rows
FROM ecommerce_analysis;

-- Check for duplicate Order IDs
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT `ï»¿Order_ID`) AS unique_order_ids
FROM ecommerce_analysis;

-- Check missing values
SELECT
    COUNT(*) AS total_rows,
    COUNT(`ï»¿Order_ID`) AS order_id_filled,
    COUNT(Order_Date) AS order_date_filled,
    COUNT(Customer_Name) AS customer_name_filled,
    COUNT(Customer_Segment) AS customer_segment_filled,
    COUNT(Product_Category) AS category_filled,
    COUNT(Product_Name) AS product_filled,
    COUNT(Quantity) AS quantity_filled,
    COUNT(Unit_Price) AS unit_price_filled,
    COUNT(Total_Sales) AS sales_filled,
    COUNT(Profit) AS profit_filled
FROM ecommerce_analysis;

-- Check date conversion
SELECT
    Order_Date,
    STR_TO_DATE(Order_Date, '%d-%m-%Y') AS converted_date
FROM ecommerce_analysis
LIMIT 10;

-- Check sales and profit
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Total_Sales <= 0 THEN 1 ELSE 0 END) AS invalid_sales,
    SUM(CASE WHEN Profit IS NULL THEN 1 ELSE 0 END) AS missing_profit,
    SUM(CASE WHEN Profit < 0 THEN 1 ELSE 0 END) AS loss_orders
FROM ecommerce_analysis;