# Find Customers who returned the order
SELECT DISTINCT
#S.*, 
C.`Customer Name`, R.Returned
FROM superstore.superstore_sales as S
left join superstore.superstore_customers as C on S.`Customer ID` = C.`Customer ID`
left join superstore.returned_orders R on S.`Order ID` = R.`Order Id`
where R.Returned = "Yes"
;

SELECT 
S.*, C.`Customer Name`, R.Returned
FROM superstore.superstore_sales as S
left join superstore.superstore_customers as C on S.`Customer ID` = C.`Customer ID`
left join superstore.returned_orders R on S.`Order ID` = R.`Order Id`
;