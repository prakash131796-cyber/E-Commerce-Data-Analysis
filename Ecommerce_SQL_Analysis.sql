USE EcommerceDB;

-- 1. View all data
SELECT * FROM ecommerce_analysis;

-- 2. Total orders
SELECT COUNT(*) AS Total_Orders
FROM ecommerce_analysis;

-- 3. Total customers
SELECT COUNT(DISTINCT Customer_ID) AS Total_Customers
FROM ecommerce_analysis;

-- 4. Total revenue
SELECT ROUND(SUM(Sales_Amount_INR), 2) AS Total_Revenue
FROM ecommerce_analysis;

-- 5. Total profit
SELECT ROUND(SUM(Profit_INR), 2) AS Total_Profit
FROM ecommerce_analysis;

-- 6. Category-wise sales
SELECT Product_Category,
       SUM(Sales_Amount_INR) AS Total_Sales
FROM ecommerce_analysis
GROUP BY Product_Category;

-- 7. Category-wise profit
SELECT Product_Category,
       SUM(Profit_INR) AS Total_Profit
FROM ecommerce_analysis
GROUP BY Product_Category;

-- 8. Top 5 best-selling products
SELECT Product_Name,
       SUM(Quantity) AS Total_Quantity
FROM ecommerce_analysis
GROUP BY Product_Name
ORDER BY Total_Quantity DESC
LIMIT 5;

-- 9. Top 5 customers
SELECT Customer_Name,
       SUM(Sales_Amount_INR) AS Total_Spending
FROM ecommerce_analysis
GROUP BY Customer_Name
ORDER BY Total_Spending DESC
LIMIT 5;

-- 10. Monthly sales
SELECT MONTHNAME(Order_Date) AS Month_Name,
       SUM(Sales_Amount_INR) AS Monthly_Sales
FROM ecommerce_analysis
GROUP BY MONTH(Order_Date), MONTHNAME(Order_Date)
ORDER BY MONTH(Order_Date);

-- 11. State-wise sales
SELECT State,
       SUM(Sales_Amount_INR) AS Total_Sales
FROM ecommerce_analysis
GROUP BY State
ORDER BY Total_Sales DESC;

-- 12. Payment method analysis
SELECT Payment_Method,
       COUNT(*) AS Total_Orders
FROM ecommerce_analysis
GROUP BY Payment_Method;

-- 13. Order status analysis
SELECT Order_Status,
       COUNT(*) AS Total_Orders
FROM ecommerce_analysis
GROUP BY Order_Status;

-- 14. Average customer rating
SELECT ROUND(AVG(Customer_Rating), 2) AS Average_Rating
FROM ecommerce_analysis;

-- 15. Average profit margin by category
SELECT Product_Category,
       ROUND(AVG(Profit_Margin_Percent), 2) AS Average_Profit_Margin
FROM ecommerce_analysis
GROUP BY Product_Category;
