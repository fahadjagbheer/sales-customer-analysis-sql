/*
Script  : 01_data_exploration.sql
Purpose : Explore database metadata, table structures,
          and column details before starting analysis 
*/
--===============================

-- 1. Explore the tables in database:

select  *
from INFORMATION_SCHEMA.TABLES

--Expected: 3 tables in the 'gold' schema, all BASE TABLE type


--===============================


-- 2. Explore the columns for each table

-- >> dim_customers

select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='dim_customers'

-- >> dim_products

select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='dim_products'

-- >> fact_sales

select *
from INFORMATION_SCHEMA.COLUMNS
where TABLE_NAME='fact_sales'

--Expected:Shows column names, data types, 
--         and constraints for each table


--===============================

-- 3. preview the data :

SELECT TOP 10 * FROM gold.dim_customers;
SELECT TOP 10 * FROM gold.dim_products;
SELECT TOP 10 * FROM gold.fact_sales;



--===============================