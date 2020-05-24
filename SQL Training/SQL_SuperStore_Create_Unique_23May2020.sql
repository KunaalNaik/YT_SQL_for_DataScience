# Create and Unique Example

create table superstore_customers as 
SELECT 
  distinct `Customer ID`
, `Customer Name`
, Segment
, City
, State
, Country
, Region
, `Postal Code` 
FROM superstore.superstore_sales;


