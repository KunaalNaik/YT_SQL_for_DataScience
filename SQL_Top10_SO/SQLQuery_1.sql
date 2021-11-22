Select 
  ProductCategory
, SUM(Sales) as Total_Sales 
from [dbo].[retail_OrderDetails] 
group by ProductCategory
