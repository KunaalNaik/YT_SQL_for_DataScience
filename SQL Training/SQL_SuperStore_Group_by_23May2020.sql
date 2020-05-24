SELECT 
 `Order Id` 
, max(`Order Date`) as `Order Date`
, max(`Ship Date`) as `Ship Date`
, count(`Product id`) as Product_Count
FROM superstore.superstore_sales
group by `Order Id` ;