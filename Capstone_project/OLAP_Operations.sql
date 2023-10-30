  CREATE TABLE sales_sample (
       Product_ID INTEGER,
       Region VARCHAR(50),
       Date DATE,
       Sales_Amount NUMERIC
   );

INSERT INTO sales_sample (Product_ID, Region, Date, Sales_Amount)
   VALUES
       (1, 'East', '2023-01-01', 1000),
       (2, 'West', '2023-01-02', 1500),
       (3, 'East', '2023-01-03', 1200),
(4, 'North', '2023-01-04', 1250),
(5, 'South', '2023-01-05', 1300),
(6, 'West', '2023-01-06', 1250),
(7, 'East', '2023-01-07', 500),
(8, 'North', '2023-01-01', 750),
(9, 'South', '2023-01-02', 100),
(10, 'West', '2023-01-03', 200);

SELECT Region, Product_ID, SUM(Sales_Amount) AS Total_Sales
   FROM sales_sample
   GROUP BY Region, Product_ID

  SELECT Product_ID, Region, SUM(Sales_Amount) AS Total_Sales
   FROM sales_sample
   GROUP BY Product_ID, Region

   SELECT Product_ID, Region, Date, SUM(Sales_Amount) AS Total_Sales
   FROM sales_sample
   GROUP BY ROLLUP (Product_ID, Region, Date)

   SELECT Region, Date, SUM(Sales_Amount) AS Total_Sales
   FROM sales_sample
   WHERE Region = 'East' AND Date >= '2023-01-01' AND Date <= '2023-01-31'
   GROUP BY Region, Date
 

   SELECT Product_ID, Region, Date, SUM(Sales_Amount) AS Total_Sales
   FROM sales_sample
   WHERE Product_ID = 1 AND Region = 'East' AND Date >= '2023-01-01' AND Date <= '2023-01-31'
   GROUP BY Product_ID, Region, Date
