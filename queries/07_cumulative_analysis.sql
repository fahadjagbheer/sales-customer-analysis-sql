/*
Script  : 07_cumulative_analysis.sql
Purpose : -Calculate running totals and moving averages
          to track cumulative business performance over time.
          -Useful for identifying long-term growth trends
          and smoothing out short-term fluctuations.
*/

--=================================================

--RUNNING TOTAL OF SALES & MOVING AVERAGE PRICE BY YEAR :
select 
*,
sum(sales_monthly) over(order by monthly_order) as running_total,
AVG(avg_price) OVER (ORDER BY monthly_order ) AS moving_average_price
from(
select
        DATETRUNC(MONTH,order_date)  as monthly_order,
        sum(sales_amount) as sales_monthly,
        AVG(price) AS avg_price
from gold.fact_sales
where DATETRUNC(MONTH,order_date) is not null
group by DATETRUNC(MONTH,order_date)
) o


/*

Helps answer: Is the business growing year over year?

 How to read the results:
 - running_total_sales  : Should keep increasing if the business is growing
 - moving_average_price : A rising trend means prices are going up over time
                          A flat trend means pricing has been stable
*/

--=================================================
