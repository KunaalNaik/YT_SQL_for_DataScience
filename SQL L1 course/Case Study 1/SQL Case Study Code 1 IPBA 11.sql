# Insights Stage 1 

select * 
from orderdetails 
order by Quantity DESC 
LIMIT 10 ;

# Provides Unique Product Ids
select distinct ProductID
from orderdetails;

# Provides Unique Product Count
select count(distinct ProductID)
from orderdetails;

# Insight Stage 2

# Top 5 
SELECT ProductID
	, sum(Quantity) as Total_Quantity
FROM orderdetails
GROUP BY ProductID
ORDER BY 2 DESC;

# Top 5 
SELECT ProductID
	, sum(Quantity) as Total_Quantity
FROM orderdetails
GROUP BY ProductID
ORDER BY 2; # default ascending order


# Insight Stage 3 - Joins

SELECT * 
from orderdetails o
left join products p on  o.ProductID = p.ProductID
left join propertyinfo prop on o.PropertyID = prop.`Prop ID`;

# Notation
#superstore.orderdetails.OrderID
#orderdetails.OrderDate
#orderdetails.PropertyID
#sample_db.sample_sales.id

SELECT * 
FROM orderdetails
left join products on orderdetails.ProductID = products.ProductID
left join propertyinfo on orderdetails.PropertyID = propertyinfo.`Prop ID`;

# with alias table name
SELECT * 
FROM orderdetails o
left join products p on o.ProductID = p.ProductID
left join propertyinfo prop on o.PropertyID = prop.`Prop ID`;

#create sales
SELECT *,  o.Quantity * p.Price as Sales
FROM orderdetails o
left join products p on o.ProductID = p.ProductID
left join propertyinfo prop on o.PropertyID = prop.`Prop ID`;

# Create a table using a Query
create table superstore_combined as
SELECT o.*, prop.*
, p.ProductName
, p.ProductCategory
, p.Price
, o.Quantity * p.Price as Sales
FROM orderdetails o
left join products p on o.ProductID = p.ProductID
left join propertyinfo prop on o.PropertyID = prop.`Prop ID`;

# permanent table
select * from superstore_combined ;

# Remove one column
ALTER TABLE superstore_combined
  DROP COLUMN `Prop ID`;

# Insights Stage 3 - Having and Dates 
create temporary table superstore_temp as
select *
, STR_TO_DATE(OrderDate, '%d-%m-%Y') as OrdDate 
, YEAR(STR_TO_DATE(OrderDate, '%d-%m-%Y')) as OrdYear 
, MONTH(STR_TO_DATE(OrderDate, '%d-%m-%Y')) as OrdMonth 
from superstore_combined ;

# Having on Temp Data
select OrdYear, sum(Sales) as Total_Sales
from superstore_temp
group by OrdYear;

select OrdMonth, sum(Sales) as Total_Sales
from superstore_temp
where OrdYear = 2016
group by OrdMonth
having Total_Sales > 120000
order by 2
;





 







