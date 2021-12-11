## Order Details

Select * from orderdetails;
Select * from products;

## Insights 1
Select * 
from OrderDetails 
order by Quantity DESC
limit 10 ;

Select distinct ProductId from OrderDetails;
Select distinct propertyid from OrderDetails;

## Insights 3
create table joined_orders AS 
(
	select o.*
		, p.ProductName
		, p.ProductCategory
		, p.Price  
		, o.Quantity * p.Price as Sales
	from OrderDetails o
	left join products p on o.`ProductID` = p.`ï»¿ProductID`
) ;

drop table joined_orders;
create table joined_orders AS 
(
	select o.*
		, p.ProductName
		, p.ProductCategory
		, p.Price  
		, o.Quantity * p.Price as Sales
        , right(o.OrderDate, 4) * 1 as Year
	from OrderDetails o
	left join products p on o.`ProductID` = p.`ï»¿ProductID`
) ;

select 
Year, sum(Sales) as Total_Sales
from joined_orders 
GROUP by Year

## Having
select 
ProductCategory, sum(Sales) as Total_Sales
from joined_orders 
GROUP by ProductCategory
having Total_Sales > 500000;






