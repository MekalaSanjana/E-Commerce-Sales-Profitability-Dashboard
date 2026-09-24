-- E-Commerce Sales & Customer Analytics
-- Business Analysis Queries

USE ecommerce_analytics;


-- 1. Final Business KPI Summary
SELECT
    COUNT(*) AS total_orders,
    COUNT(DISTINCT Customer_Name) AS total_customers,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Total_Sales) AS average_order_value,
    AVG(Profit_Margin) AS average_profit_margin,
    SUM(Quantity) AS total_units_sold,
    SUM(Shipping_Cost) AS total_shipping_cost
FROM ecommerce_analysis;


-- 2. Monthly Revenue & Profit
SELECT
    Order_Year,
    Order_Month,
    SUM(Total_Sales) AS monthly_revenue,
    SUM(Profit) AS monthly_profit,
    COUNT(*) AS total_orders
FROM ecommerce_analysis
GROUP BY Order_Year, Order_Month
ORDER BY Order_Year, Order_Month;


-- 3. Top 10 Products by Revenue
SELECT
    Product_Name,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    SUM(Quantity) AS total_quantity,
    COUNT(*) AS total_orders
FROM ecommerce_analysis
GROUP BY Product_Name
ORDER BY total_revenue DESC
LIMIT 10;


-- 4. Top 10 Customers by Revenue
SELECT
    Customer_Name,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Total_Sales) AS average_order_value
FROM ecommerce_analysis
GROUP BY Customer_Name
ORDER BY total_revenue DESC
LIMIT 10;


-- 5. Regional Performance
SELECT
    Region,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin
FROM ecommerce_analysis
GROUP BY Region
ORDER BY total_revenue DESC;


-- 6. Product Category Performance
SELECT
    Product_Category,
    COUNT(*) AS total_orders,
    SUM(Quantity) AS total_quantity,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin
FROM ecommerce_analysis
GROUP BY Product_Category
ORDER BY total_revenue DESC;


-- 7. Payment Method Analysis
SELECT
    Payment_Method,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Total_Sales) AS average_order_value
FROM ecommerce_analysis
GROUP BY Payment_Method
ORDER BY total_revenue DESC;


-- 8. Customer Segment Analysis
SELECT
    Customer_Segment,
    COUNT(*) AS total_orders,
    COUNT(DISTINCT Customer_Name) AS total_customers,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Total_Sales) AS average_order_value,
    AVG(Profit_Margin) AS average_profit_margin
FROM ecommerce_analysis
GROUP BY Customer_Segment
ORDER BY total_revenue DESC;


-- 9. Top 10 Most Profitable Products
SELECT
    Product_Name,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin,
    SUM(Quantity) AS total_quantity
FROM ecommerce_analysis
GROUP BY Product_Name
ORDER BY total_profit DESC
LIMIT 10;


-- 10. Loss-Making Products
SELECT
    Product_Name,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin,
    SUM(Quantity) AS total_quantity
FROM ecommerce_analysis
GROUP BY Product_Name
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 10;


-- 11. Discount & Profit Analysis
SELECT
    Discount_Percent,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin
FROM ecommerce_analysis
GROUP BY Discount_Percent
ORDER BY Discount_Percent;


-- 12. Shipping Cost by Region
SELECT
    Region,
    COUNT(*) AS total_orders,
    SUM(Shipping_Cost) AS total_shipping_cost,
    AVG(Shipping_Cost) AS average_shipping_cost,
    SUM(Profit) AS total_profit
FROM ecommerce_analysis
GROUP BY Region
ORDER BY total_shipping_cost DESC;


-- 13. Repeat Customers
SELECT
    Customer_Name,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit
FROM ecommerce_analysis
GROUP BY Customer_Name
HAVING COUNT(*) > 1
ORDER BY total_orders DESC, total_revenue DESC;


-- 14. Customer Lifetime Value
-- Revenue-based CLV
SELECT
    Customer_Name,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS customer_lifetime_value,
    SUM(Profit) AS total_profit,
    AVG(Total_Sales) AS average_order_value
FROM ecommerce_analysis
GROUP BY Customer_Name
ORDER BY customer_lifetime_value DESC
LIMIT 10;


-- 15. Customer Revenue Segmentation
SELECT
    Customer_Name,
    SUM(Total_Sales) AS total_revenue,
    COUNT(*) AS total_orders,
    SUM(Profit) AS total_profit,
    CASE
        WHEN SUM(Total_Sales) >= 10000 THEN 'High Value'
        WHEN SUM(Total_Sales) >= 5000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS customer_value_segment
FROM ecommerce_analysis
GROUP BY Customer_Name
ORDER BY total_revenue DESC;


-- 16. Top 10 Customers by Profit
SELECT
    Customer_Name,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin
FROM ecommerce_analysis
GROUP BY Customer_Name
ORDER BY total_profit DESC
LIMIT 10;


-- 17. Loss-Making Customers
SELECT
    Customer_Name,
    COUNT(*) AS total_orders,
    SUM(Total_Sales) AS total_revenue,
    SUM(Profit) AS total_profit,
    AVG(Profit_Margin) AS average_profit_margin
FROM ecommerce_analysis
GROUP BY Customer_Name
HAVING SUM(Profit) < 0
ORDER BY total_profit ASC
LIMIT 10;