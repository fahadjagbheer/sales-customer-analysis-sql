/*
Script  : 03_measures_exploration.sql
Purpose : Calculate aggregated key business metrics (KPIs)
          for a quick high-level overview of the business
*/

--=================================

-- KEY BUSINESS METRICS REPORT:
        -- A unified report that combines all core KPIs in one result
        -- Each row represents one business metric and its value

SELECT 
	'Total Sales' AS measure_name,
	SUM(sales_amount) AS measure_value 
	FROM gold.fact_sales

UNION ALL

SELECT 
	'Total Quantity',
	 SUM(quantity)
	FROM gold.fact_sales

UNION ALL

SELECT 
	'Average Price',
	AVG(price) 
	FROM gold.fact_sales

UNION ALL

SELECT 
	'Total Orders', 
	COUNT(DISTINCT order_number) 
	FROM gold.fact_sales

UNION ALL

SELECT 
	'Total Products',
	COUNT(DISTINCT product_name) 
	FROM gold.dim_products

UNION ALL

SELECT 
	'Total Customers',
	COUNT(customer_key)
	FROM gold.dim_customers;


--EXPECTED:
         -- Total Sales      : Overall revenue generated
         -- Total Quantity   : Total units sold across all orders
         -- Average Price    : Average selling price per item
         -- Total Orders     : Number of unique orders placed
         -- Total Products   : Number of distinct products in the catalog
         -- Total Customers  : Total number of registered customers



--=================================
