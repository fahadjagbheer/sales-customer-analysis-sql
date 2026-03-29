/*
Script  : 06_change_over_time_analysis.sql
Purpose :  - For time-series analysis and identifying seasonality.
           - To track trends, growth, and changes.
*/

--=============================

--Analyse sales performance over Year:

select
   year(order_date) as order_year,
   sum(sales_amount) as sum_of_sales,
   COUNT(DISTINCT customer_key) AS total_customers,
   SUM(quantity) AS total_quantity
from gold.fact_sales
group by YEAR(order_date)
having year(order_date) is not null
order by order_year asc

--=======================================

--Analyse sales performance over months :

select
   DATETRUNC(MONTH,order_date) as order_month,
   sum(sales_amount) as sum_of_sales,
   COUNT(DISTINCT customer_key) AS total_customers,
   SUM(quantity) AS total_quantity
from gold.fact_sales
group by DATETRUNC(MONTH,order_date)
having DATETRUNC(MONTH,order_date)is not null
order by order_month asc

--=======================================
