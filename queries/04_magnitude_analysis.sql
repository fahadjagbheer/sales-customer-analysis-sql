/*
Script  : 04_magnitude_analysis.sql
Purpose : Measure and compare business performance across
          different categories.
          Helps identify which groups (products, customers,
          countries) contribute the most or least to the business.
*/

--==================================

-- 1. TOTAL CUSTOMERS BY COUNTRY:
select 
    country,
    count(customer_key) as [TOTAL CUSTOMERS]
from gold.dim_customers
group by country
order by count(customer_key) desc

--==================================

-- 2. TOTAL CUSTOMERS BY GENDER:
select 
    gender,
    count(customer_key) as [TOTAL CUSTOMERS]
from gold.dim_customers
group by gender
order by count(customer_key) desc

--==================================

-- 3. TOTAL PRODUCTS BY CATEGORY :
select 
    category,
    count(product_key) as [TOTAL PRODUCTS]
from gold.dim_products
group by category
order by count(product_key) desc

--==================================

-- 4. AVERAGE COST BY CATEGORY:
select 
    category,
    avg(cost) as [AVG COST]
from gold.dim_products
group by category
order by avg(cost) desc

--==================================

-- 5. TOTAL REVENUE BY CATEGORY:
SELECT
    p.category,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
    ON p.product_key = f.product_key
GROUP BY p.category
ORDER BY total_revenue DESC


--==================================

-- 6. TOTAL REVENUE BY CUSTOMER :
SELECT
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(f.sales_amount) AS total_revenue
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC

--==================================
-- 7. TOTAL SOLD ITEMS BY COUNTRY:
SELECT
    c.country,
    SUM(f.quantity) AS total_sold_items
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY c.country
ORDER BY total_sold_items DESC

--==================================
