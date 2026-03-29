/*
 Script : 05_ranking_analysis.sql
 Purpose : Rank items based on performance to identify
           the best and worst contributors across the business.
*/

--===============================
-- 1. TOP 5 PRODUCTS BY REVENUE :
select *
from(
select 
    p.product_name,
    sum(f.sales_amount) as total_revenue ,
    RANK() over(order by sum(f.sales_amount) DESC) as products_rank
from gold.fact_sales as f
left join gold.dim_products as p
on p.product_key = f.product_key
group by p.product_name ) u
where products_rank <=5

--===============================
-- 2.  BOTTOM 5 PRODUCTS BY REVENUE:
select *
from(
select 
    p.product_name,
    sum(f.sales_amount) as total_revenue ,
    RANK() over(order by sum(f.sales_amount) ASC) as products_rank
from gold.fact_sales as f
left join gold.dim_products as p
on p.product_key = f.product_key
group by p.product_name ) u
where products_rank <=5

--===============================
-- 3. BOTTOM 3 CUSTOMERS BY NUMBER OF ORDERS :
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT order_number) AS total_orders
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
    ON c.customer_key = f.customer_key
GROUP BY
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders ASC

--===============================