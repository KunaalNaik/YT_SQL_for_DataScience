-- Check Data
Select * from dbo.eCommerce_Customer_Revenue

-- IF THEN 
-- ** Use Single Quotes for creating Segements
Select * 
    , IIF(Revenue >= 7000, 'High', 'Rest') as Segement
from dbo.eCommerce_Customer_Revenue

-- Multiple IF THEN
-- IIF is not valid for SQL Server 2008 R2 and any version before that.
Select * 
    , IIF(Revenue >= 7000, 'High', IFF(Revenue >= 4000 and Revenue < 7000, 'Medium', 'Low')) as Segement
from dbo.eCommerce_Customer_Revenue

-- CASE WHEN
Select * 
    , Case when Revenue >= 7000 then 'High'
           when Revenue >= 4000 and Revenue < 7000 then 'Medium'
           Else 'Low'
    end as Segment
from dbo.eCommerce_Customer_Revenue
