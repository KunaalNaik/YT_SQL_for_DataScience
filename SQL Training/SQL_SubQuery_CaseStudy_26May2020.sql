select 
ProductID,
sum(Quantity) as Quantity 
from retail_case_study_1.tr_orderdetails
group by ProductID
order by 2 DESC;


select 
  a.ProductID
, b.ProductName
, sum(a.Quantity) as Tot_Quan
from retail_case_study_1.tr_orderdetails a
left join retail_case_study_1.tr_products b on a.ProductID = b.ProductID 
group by   
  a.ProductID
, b.ProductName
order by 3 desc
;

select 
  a.ProductID
, b.ProductName
, sum(a.Quantity) as Tot_Quan
, sum(a.Quantity*b.Price) as Sales
from retail_case_study_1.tr_orderdetails a
left join retail_case_study_1.tr_products b on a.ProductID = b.ProductID 
group by   
  a.ProductID
, b.ProductName
order by 4 desc
;


select
  a.PropertyID
, b.PropertyCity
, sum(a.Quantity*c.Price) as Sales
from retail_case_study_1.tr_orderdetails a
left join retail_case_study_1.tr_propertyinfo b on a.PropertyID = b.`Prop ID`
left join retail_case_study_1.tr_products c on a.ProductID = c.ProductID 
#where a.Quantity*c.Price > 600
group by
  a.PropertyID
, b.PropertyCity 
having Sales > 27000
order by 3 desc
;


select * from tr_orderdetails
where ProductID in (select productID from tr_top5_quantity)


select * from tr_orderdetails
where ProductId in (select distinct productID from tr_orderdetails where Quantity = 2)




















