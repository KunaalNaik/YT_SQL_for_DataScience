# Top 5 City in Sales
create table tr_top5_city as 
SELECT a.PropertyID , b.PropertyCity
, SUM(a.Quantity) AS Quantity 
FROM tr_orderdetails AS a 
LEFT JOIN tr_propertyinfo AS b ON a.PropertyID = b.`Prop Id` 
group by b.PropertyCity
ORDER BY quantity LIMIT 5;

# Get All tranactions for the Top 5 City
select *
from retail_case_study_1.tr_orderdetails
where PropertyID in (
select PropertyID from tr_top5_city
);