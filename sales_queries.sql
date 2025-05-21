
USE yisu;     # Selecting database

SELECT * FROM sales;  # Retrieving all the columns from sales dataset

# Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.
SELECT * FROM sales
WHERE Ship_Mode = 'Economy' AND  Total_Amount > 25000;

# Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
SELECT * 
    FROM sales 
WHERE 
    Category = "Technology" AND Country = "Ireland" 
    AND STR_TO_DATE(Order_Date, '%d-%m-%Y') > "2020-01-01";

# List the top 10 most profitable sales transactions in descending order.
SELECT 
    *, 
    Total_Amount AS Revenue,
    (Unit_Cost * Sold_Quantity) AS Costs FROM 
    sales
WHERE 
    Total_Amount > (Unit_Cost * Sold_Quantity)
ORDER BY 
    Unit_Profit DESC
LIMIT 10;

# Find all customers whose name starts with 'J' and ends with 'n'.
SELECT  Customer_Name FROM  sales 
WHERE 
        Customer_Name LIKE "J%" AND Customer_Name LIKE "%N";

# Retrieve all product names that contain 'Acco' anywhere in the name.
SELECT
      Product_Name FROM  sales 
WHERE 
      Product_Name LIKE "%Acco%";


# Get the top 5 cities with the highest total sales amount.
SELECT 
     City, Total_Amount AS Highest_Total_Sales 
FROM sales 
ORDER BY 
     Highest_Total_Sales desc 
LIMIT 5; 


# Find the total revenue, average unit cost, and total number of orders.
SELECT 
    Total_Amount AS Total_Revenue, (Unit_Cost / Sold_Quantity) AS Average_Unit_Cost,
    Sold_Quantity AS Total_Number_of_Orders 
FROM sales;

# Get total sales per product category.
SELECT 
     Category, Total_Amount AS Total_Sales
FROM sales 
ORDER BY category;

# Get customers who have placed orders worth more than ₹50,000
SELECT 
      Customer_Name, Total_Amount 
FROM  sales 
WHERE 
  Total_Amount > 50000;

# Find the top 5 customers by sales revenue using DENSE_RANK()
SELECT 
    Customer_Name, SUM(Total_Amount) AS Sales_Revenue,
    DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) As Rnk
FROM sales 
GROUP BY Customer_Name
Order By Rnk
LIMIT 5; 

