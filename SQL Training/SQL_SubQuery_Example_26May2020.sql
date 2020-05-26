# Top 5 and Botton 5 in One Table
create table tr_top5_quantity as 
SELECT 
  A.ProductID 
, B.ProductName
, sum(A.Quantity) as Quantity
FROM retail_case_study_1.tr_orderdetails as A
LEFT JOIN retail_case_study_1.tr_products as B
on A.ProductID = B.ProductID
group by B.ProductName
order by 3 desc
LIMIT 5;

select * from tr_top5_quantity;

# Where Condition
select *
from retail_case_study_1.tr_orderdetails
where ProductID in (78,12,58,60,90);

# Sub Query Condition
select *
from retail_case_study_1.tr_orderdetails
where ProductID in (
select ProductID from tr_top5_quantity
);