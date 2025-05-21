# QUESTIONS 
use yisu;

SELECT * FROM sales;

# Find all orders shipped via 'Economy' mode with a total amount greater than ₹25,000.
SELECT * FROM
  sales where 
  Ship_Mode = 'Economy' and 
 Total_Amount > 25000;

# Retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01.
SELECT * from sales where Category = "Technology" and Country = "Ireland" and STR_TO_DATE(Order_Date, '%d-%m-%Y') > "2020-01-01";

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
Select Customer_Name from sales where Customer_Name LIKE "J%" and Customer_Name LIKE "%N";

# Retrieve all product names that contain 'Acco' anywhere in the name.
Select Product_Name from sales where Product_Name LIKE "%Acco%";

# Get the top 5 cities with the highest total sales amount.
Select City, Total_Amount AS Highest_Total_Sales from sales order by Highest_Total_Sales desc LIMIT 5; 

# Find the total revenue, average unit cost, and total number of orders.
Select Total_Amount AS Total_Revenue, (Unit_Cost / Sold_Quantity) AS Average_Unit_Cost, Sold_Quantity AS Total_Number_of_Orders from sales;

# Get total sales per product category.
Select Category, Total_Amount AS Total_Sales from sales order by category;

# Get customers who have placed orders worth more than ₹50,000
Select Customer_Name, Total_Amount from sales where Total_Amount > 50000;

# Find the top 5 customers by sales revenue using DENSE_RANK()
SELECT Customer_Name, SUM(Total_Amount) AS Sales_Revenue,
DENSE_RANK() OVER (ORDER BY SUM(Total_Amount) DESC) As Rnk
FROM sales 
GROUP BY Customer_Name
Order By Rnk
LIMIT 5; 

SELECT
    Customer_Name, (Unit_Sale_Price * Sold_Quantity) AS Sales_Revenue,
    ROW_NUMBER() OVER (PARTITION BY category ORDER BY  DESC) AS row_num
FROM
    sales
ORDER BY
    (Unit_Sale_Price * Sold_Quantity)
LIMIT 1;