create view vw_superstore_orders as
SELECT 
 `Order Id` 
, max(`Order Date`) as `Order Date`
, max(`Ship Date`) as `Ship Date`
, `Ship Mode`
, count(`Product id`) as Product_Count
, sum(Sales) as Sales
, Sum(Quantity) as Quantity 
, sum(Profit) as Profit
FROM superstore.superstore_sales
group by 
  `Order Id`
, `Ship Mode` 
;