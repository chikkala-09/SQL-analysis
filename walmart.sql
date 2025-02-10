use project;
CREATE TABLE WalmartData (
    invoice_id VARCHAR(255),
    branch CHAR(1),
    city VARCHAR(255),
    customer_type VARCHAR(50),
    gender VARCHAR(10),
    product_line VARCHAR(255),
    unit_price DECIMAL(10, 2),
    quantity INT,
    vat DECIMAL(10, 4),
    total DECIMAL(10, 4),
    dtme DATETIME,
    tme TIME,
    payment_method VARCHAR(50),
    cogs DECIMAL(10, 4),
    gross_margin_pct DECIMAL(10, 4),
    gross_income DECIMAL(10, 4),
    rating FLOAT,
    time_of_day VARCHAR(50),
    day_name VARCHAR(50),
    month_name VARCHAR(50)
);
SELECT * FROM walmartdata;
#check total records
SELECT COUNT(*) FROM WalmartData;
# preview 1st 10 rows
SELECT * FROM walmartdata 
LIMIT 10;
# check data range (min& max date)
SELECT MIN(dtme) AS StartDate, MAX(dtme) AS EndDate 
FROM WalmartData;
# total sales
SELECT SUM(total)AS Total_Revenue FROM walmartdata;
# Total sales by branch 
SELECT branch, SUM(total) AS Total_revenue
FROM walmartdata
GROUP BY branch;
# Total sales by product line 
SELECT product_line, SUM(total) AS Total_revenue
FROM walmartdata
GROUP BY product_line;
# top 5 highest selling products
SELECT product_line, COUNT(*) AS Total_Sales
FROM WalmartData
GROUP BY product_line
ORDER BY Total_Sales DESC
LIMIT 5;
# customer distribution by gender
SELECT gender, COUNT(*) AS Count 
FROM WalmartData 
GROUP BY gender;
# customer distribution by type
SELECT customer_type, COUNT(*) AS Count 
FROM WalmartData 
GROUP BY customer_type;
# avg rating by product line
SELECT product_line, AVG(rating) AS avg_rating
FROM walmartdata
GROUP BY product_line;
# peak shopping hours
SELECT time_of_day, COUNT(*) AS Transactions 
FROM WalmartData 
GROUP BY time_of_day 
ORDER BY Transactions DESC;
# total cost of goods sold
SELECT SUM(cogs) AS Total_COGS 
FROM WalmartData;
# gross margin percentage analysis
SELECT product_line, AVG(gross_margin_pct) AS Avg_Margin 
FROM WalmartData 
GROUP BY product_line 
ORDER BY Avg_Margin DESC;
# total cross income by branch 
SELECT branch, SUM(gross_income) AS Total_Gross_Income 
FROM WalmartData 
GROUP BY branch;
# sales by day of the week
SELECT day_name, SUM(total) AS Total_Sales 
FROM WalmartData 
GROUP BY day_name 
ORDER BY FIELD(day_name, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');
# sales by month
SELECT month_name, SUM(total) AS Total_Sales 
FROM WalmartData 
GROUP BY month_name 
ORDER BY FIELD(month_name, 'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
# average quantity sold per day
SELECT day_name, AVG(quantity) AS Avg_Quantity 
FROM WalmartData 
GROUP BY day_name 
ORDER BY Avg_Quantity DESC;
# find duplicate invoices
SELECT invoice_id, COUNT(*) AS Occurrences
FROM WalmartData
GROUP BY invoice_id
HAVING COUNT(*) > 1;
# to find the day with highest revenue
SELECT day_name, SUM(total) AS Total_Sales
FROM WalmartData
GROUP BY day_name
ORDER BY Total_Sales DESC
LIMIT 1;
# compare online vs offline payments
SELECT payment_method, COUNT(*) AS Transactions, SUM(total) AS Total_Revenue
FROM WalmartData
GROUP BY payment_method
ORDER BY Total_Revenue DESC;
#  to Find Which Customer Type Spends the Most on Average
SELECT customer_type, AVG(total) AS Avg_Spending
FROM WalmartData
GROUP BY customer_type
ORDER BY Avg_Spending DESC;
# TO Identify the Gender That Spends More per Transaction
SELECT gender, AVG(total) AS Avg_Spending
FROM WalmartData
GROUP BY gender
ORDER BY Avg_Spending DESC;
# To Find the Most Loyal Customers (Returning Customers)
SELECT customer_type, COUNT(*) AS Visit_Count
FROM WalmartData
GROUP BY customer_type
ORDER BY Visit_Count DESC;
# To Identify the Most Profitable Branch
SELECT branch, SUM(gross_income) AS Total_Profit
FROM WalmartData
GROUP BY branch
ORDER BY Total_Profit DESC
LIMIT 1;
# To Find the Average Rating Per Product Line
SELECT product_line, ROUND(AVG(rating), 2) AS Avg_Rating
FROM WalmartData
GROUP BY product_line
ORDER BY Avg_Rating DESC;


