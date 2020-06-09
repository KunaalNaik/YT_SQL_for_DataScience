#1

select 
max(Quantity)
, count(*)
from tr_orderdetails;

#2

select distinct
ProductID, Quantity
from tr_orderdetails
where Quantity = 3
order by ProductID asc, Quantity desc
;

#3
select distinct
PropertyID
from tr_orderdetails;

#4
select
ProductCategory
, count(*) as COUNT
from tr_products
group by ProductCategory
order by 2 desc;

#5
select
PropertyState
, count(*) as COUNT
from tr_propertyinfo
group by PropertyState
order by 2 desc;

#6
select 
ProductID
, sum(Quantity) as Total_Quantity
from tr_orderdetails
group by ProductID
order by 2 desc
limit 5;


#7
select 
 PropertyID
, sum(Quantity) as Total_Quantity
from tr_orderdetails
group by PropertyID
order by 2 desc
limit 5;


#8
select
o.*
, p.ProductName
, p.ProductCategory
, p.Price
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID;

select
p.ProductName
, sum(o.Quantity) as Total_Quantity
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by 2 desc;

#8.1
select 
p.ProductName
, sum(o.Quantity * p.Price) as Sales 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by Sales desc
LIMIT 5;


#9
select 
 pi.PropertyCity
, sum(o.Quantity * p.Price) as Sales 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
group by pi.PropertyCity
order by Sales desc
LIMIT 5;

#10 , Arlington
select 
 pi.PropertyCity
, p.ProductName
, sum(o.Quantity * p.Price) as Sales 
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
where pi.PropertyCity = 'Arlington'
group by pi.PropertyCity, p.ProductName
order by Sales desc
LIMIT 5;











