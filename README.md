# SQL Data Analytics Project

A comprehensive data analytics project built with **Microsoft SQL Server**, exploring and analyzing sales and customer data through structured SQL scripts.

\---

## Project Overview

This project performs end-to-end exploratory and advanced data analysis on a sales dataset. Starting from raw CSV files, the data was loaded into a SQL Server database and analyzed across multiple dimensions — from high-level KPIs to detailed customer and product reports.

\---

## Database Structure

|Property|Value|
|-|-|
|**Database**|`data\_analysis`|
|**Schema**|`gold`|
|**Tool**|Microsoft SQL Server / SSMS|

### Tables

|Table|Type|Description|
|-|-|-|
|`gold.dim\_customers`|Dimension|Customer profiles and demographic information|
|`gold.dim\_products`|Dimension|Product catalog with categories and cost details|
|`gold.fact\_sales`|Fact|Sales transactions including revenue and quantities|

\---

## Repository Structure

```
sql-data-analytics-project/
│
├── README.md
│
├── data/
│   ├── dim\_customers.csv          ← Customer data
│   ├── dim\_products.csv           ← Product data
│   └── fact\_sales.csv             ← Sales transactions
│
└── queries/
    ├── 01\_data\_exploration.sql
    ├── 02\_date\_range\_exploration.sql
    ├── 03\_measures\_exploration.sql
    ├── 04\_magnitude\_analysis.sql
    ├── 05\_ranking\_analysis.sql
    ├── 06\_change\_over\_time\_analysis.sql
    ├── 07\_cumulative\_analysis.sql
    ├── 08\_performance\_analysis.sql
    ├── 09\_part\_to\_whole\_analysis.sql
    ├── 10\_segmentation\_analysis.sql
    ├── 11\_customer\_report.sql
    └── 12\_product\_report.sql
```

\---

## Scripts Overview

### Exploratory Analysis

|Script|Description|
|-|-|
|`01\_data\_exploration.sql`|Explores database metadata, table structures, column types, and row counts|
|`02\_date\_range\_exploration.sql`|Identifies the sales date boundaries and customer age range|
|`03\_measures\_exploration.sql`|Computes high-level KPIs: total sales, orders, quantity, customers, and products|

### Core Analysis

|Script|Description|
|-|-|
|`04\_magnitude\_analysis.sql`|Compares performance across countries, genders, and product categories|
|`05\_ranking\_analysis.sql`|Ranks top and bottom performing products and customers by revenue and orders|
|`06\_change\_over\_time\_analysis.sql`|Tracks how key metrics evolve month by month and year by year|
|`07\_cumulative\_analysis.sql`|Calculates running totals and moving averages to track long-term growth|
|`08\_performance\_analysis.sql`|Year-over-year product performance vs historical average using window functions|
|`09\_part\_to\_whole\_analysis.sql`|Measures each category's percentage contribution to overall revenue|
|`10\_segmentation\_analysis.sql`|Segments products by cost range and customers by spending and loyalty|

### Reports (Views)

|Script|Description|
|-|-|
|`11\_customer\_report.sql`|Creates `gold.report\_customers` view with full customer KPIs and segmentation|
|`12\_product\_report.sql`|Creates `gold.report\_products` view with full product KPIs and segmentation|

\---

## Key Findings

* **Sales history** spans multiple years — enabling reliable trend and seasonality analysis
* **Customer demographic** is entirely above 40 years old — a mature and established customer base
* **Customer segments**: Customers are classified as **VIP**, **Regular**, or **New** based on lifespan and total spending
* **Product segments**: Products are classified as **High-Performer**, **Mid-Range**, or **Low-Performer** based on total revenue
* **Geographic distribution**: Sales and customer counts vary significantly across countries

\---

## How to Set Up

### 1\. Create the Database \& Schema

```sql
CREATE DATABASE data\_analysis;
GO

USE data\_analysis;
GO

CREATE SCHEMA gold;
GO
```

### 2\. Import the CSV Files

Use the **SQL Server Import Wizard** in SSMS (right-click database → Tasks → Import Flat File), or run:

```sql
BULK INSERT gold.dim\_customers
FROM 'path\\to\\dim\_customers.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2);

BULK INSERT gold.dim\_products
FROM 'path\\to\\dim\_products.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2);

BULK INSERT gold.fact\_sales
FROM 'path\\to\\fact\_sales.csv'
WITH (FORMAT = 'CSV', FIRSTROW = 2);
```

### 3\. Run the Scripts

Open each `.sql` file in SSMS and run them in order from `01` to `12`.

\---

## Tools \& Technologies

|Tool|Purpose|
|-|-|
|Microsoft SQL Server|Database engine|
|SSMS|Query editor and database management|
|CSV Files|Raw data source|
|Window Functions|Advanced analytics (LAG, RANK, SUM OVER)|
|CTEs|Modular and readable query structure|
|Views|Reusable reporting layers|

\---

## Author

fahad aljaghbeer 

