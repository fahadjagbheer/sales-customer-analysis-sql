/*
Script  : 08_performance_analysis.sql
Purpose : Measure product sales performance over time by
          comparing each year against the product's historical
          average and the previous year's sales.
          Helps identify high-performing products, declining
          trends, and seasonality patterns.
*/

--===================================

--Analyze the yearly performance of products by comparing their sales 
--to both the average sales performance of the product and the previous year's sales:
with perf_cte as(
select 
    YEAR(f.order_date) as order_year,
    p.product_name,
    sum(f.sales_amount) as current_sales

from gold.fact_sales as f
left join gold.dim_products as p
on p.product_key=f.product_key
group by YEAR(f.order_date) , p.product_name
having YEAR(f.order_date) is not null
)
select *,
AVG(current_sales) over(partition by product_name) as  sales_avg,
current_sales-AVG(current_sales) over(partition by product_name) as diff_avg,
CASE 
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN current_sales - AVG(current_sales) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
    LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS py_sales,
    current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) AS diff_py,
    CASE 
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
        WHEN current_sales - LAG(current_sales) OVER (PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
from perf_cte
ORDER BY product_name, order_year



--===================================