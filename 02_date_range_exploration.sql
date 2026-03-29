/*
Script  : 02_date_range_exploration.sql
Purpose : Understand the range of historical data
          Useful for time series analysis and segmentation
*/

--==========================

-- 1. SALES DATE BOUNDARIES:
      -- Determines the first and last order date
      -- and the total duration of sales history in months

select 
    min(order_date) as first_order_date,
    max(order_date) as last_order_date,
    DATEDIFF(MONTH,min(order_date),max(order_date))as orders_range
from gold.fact_sales

--Expected : Helps identify how many months of sales data we have.
--          Important before doing any time series or trend analysis.


--==========================

-- 2. Target Age Group :
      -- Finds the youngest and oldest customer based on birthdate.
      -- Useful for understanding the customer demographic group.

SELECT
    MIN(birthdate) AS oldest_customer,
    DATEDIFF(YEAR, MIN(birthdate), GETDATE()) AS oldest_age,
    MAX(birthdate) AS youngest_customer,
    DATEDIFF(YEAR, MAX(birthdate), GETDATE()) AS youngest_age
FROM gold.dim_customers

--Expected :
-- All customers are above 40 years old.
-- This is a mature customer demographic.
-- Useful for targeting and segmentation strategies.

--==========================