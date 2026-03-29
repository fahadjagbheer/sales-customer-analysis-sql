/*
Script  : 09_part_to_whole_analysis.sql
Purpose : -Measure each category's contribution to overall
           sales to understand what drives the business.
          -Helps prioritize focus areas by revealing which
           segments hold the largest share of total revenue.
*/


--=======================================================

 --Find Which categories contribute the most to overall sales :
 with sales_cte as (
 select 

     p.category,
     sum(f.sales_amount) as total_sales
 from gold.fact_sales as f
 left join gold.dim_products as p
 on f.product_key=p.product_key
 group by p.category)
 select *,
 SUM(total_sales) OVER () AS overall_sales,
 ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
 from sales_cte
 order by total_sales desc

 --=======================================================