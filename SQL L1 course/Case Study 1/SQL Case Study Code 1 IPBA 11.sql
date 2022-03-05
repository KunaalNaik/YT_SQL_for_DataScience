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

 







