/* 
script : 11_Customer Report.sql
purpose :  This report consolidates key customer metrics and behaviors
*/
--==================================================
/*
Segments customers into categories (VIP, Regular, New) and age groups.
Aggregates customer-level metrics:
	   - total orders
	   - total sales
	   - total quantity purchased
	   - total products
	   - lifespan (in months)
 Calculates valuable KPIs:
	    - recency (months since last order)
		- average order value
		- average monthly spend
*/

--==================================================

IF OBJECT_ID('gold.report_customers', 'V') IS NOT NULL
    DROP VIEW gold.report_customers;
GO

CREATE VIEW gold.report_customers AS

with customer_cte as (
select 
f.order_number,
f.product_key,
f.order_date,
f.sales_amount,
f.quantity,
c.customer_key,
c.customer_number,
CONCAT( c.first_name,' ' ,c.last_name) as full_name,
DATEDIFF(YEAR, c.birthdate, GETDATE()) as customer_age
from gold.fact_sales as f
left join gold.dim_customers as c
on f.customer_key=c.customer_key
where order_date is not null )

, customer_agg_cte as(
select 
customer_key,
customer_number,
full_name,
customer_age,
COUNT(distinct order_number)  as total_orders,
sum(sales_amount) as total_sales,
sum(quantity) as total_quantities,
COUNT(distinct product_key) as total_products,
MAX(order_date) as last_order,
DATEDIFF(MONTH, min(order_date),max(order_date)) as time_span
from customer_cte
group by customer_key,
customer_number,
full_name,
customer_age)

select 
customer_key,
customer_number,
full_name,
customer_age,
CASE 
	 WHEN customer_age < 20 THEN 'Under 20'
	 WHEN customer_age between 20 and 29 THEN '20-29'
	 WHEN customer_age between 30 and 39 THEN '30-39'
	 WHEN customer_age between 40 and 49 THEN '40-49'
	 ELSE '50 and above'
END AS age_group,
case 
when time_span >=12 and total_sales > 5000 then 'VIP'
when time_span >=12 and total_sales <= 5000 then 'Regular'
else 'new'
end as customer_segement ,
last_order,
DATEDIFF(MONTH,last_order,GETDATE()) as recency,
NULLIF(total_orders, 0) total_order,
total_sales,
total_quantities,
total_products, 
total_sales / NULLIF(total_orders, 0) as avg_orders,
nullif (time_span,0) as life_span  ,
total_sales/ nullif (time_span,0) as avg_monthly_spend

from customer_agg_cte