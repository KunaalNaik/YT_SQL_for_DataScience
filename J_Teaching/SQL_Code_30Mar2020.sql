Select 1 + 9;

-- Select
-- Distinct, limit 
-- Sort
-- Where 

select OrderId
, OrderDate
, OrderPriority
, Sales
, ShipMode 
from SalesData
where OrderPriority = "High"
order by Sales DESC limit 10;


select OrderId
, OrderDate
, OrderPriority
, Sales
, ShipMode 
from SalesData
where OrderPriority = "High" and Sales > 20000
order by Sales DESC;


select OrderId
, OrderDate
, OrderPriority
, Sales
, Profit
, ShipMode 
from SalesData
where OrderPriority = "High"
order by Profit DESC Limit 15;


-- Group by = Excel (Pivot)

Select 
OrderPriority
, count(RowID) as No_Orders
from SalesData
where Sales > 10000
group by OrderPriority
order by 2 DESC;


-- Having 

Select 
OrderPriority
, count(RowID) as No_Orders
from SalesData
group by OrderPriority
having No_Orders > 1700
order by 2 DESC;


-- Maximum Sales by which Product Category?

select 
ProductCategory
, Sum(Sales) as Total_Sales
from SalesData
group by ProductCategory;

select 
[ProductSub-Category]
, Sum(Sales) as Total_Sales
from SalesData
group by [ProductSub-Category]
having Total_Sales > 1000000
order by 2 DESC;

-- Joins 

-- Join Example
select 
b.Cust_ID, b.Sales, a.Customer 
from merge_df2 b
left join merge_df1 a on a.Cust_ID = b.Cust_ID


-- Case Study

Select o.* -- all columns from OrderDetails
, p.ProductName, p.ProductCategory, p.Price
, o.Quantity * p.Price as Sales
from OrderDetails o 
left join Products p on o.ProductID = p.ProductID
;


Select p.ProductName, sum(o.Quantity * p.Price) as Sales
from OrderDetails o 
left join Products p on o.ProductID = p.ProductID
group by p.ProductName
order by 2 DESC
;
