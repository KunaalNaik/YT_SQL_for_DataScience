# Home Work

Create table superstore_product as
select 	
distinct `Product Id`
, category
, `sub-category`
, `product name`
#, sales/quantity as Price
from superstore_sales;

ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN category;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN `sub-category`;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN `product name`;

 