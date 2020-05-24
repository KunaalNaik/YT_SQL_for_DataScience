# Alter Table Example

create table superstore_sales_bk as 
SELECT * from superstore_sales;

ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN `Customer Name`;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN Segment;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN City;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN State;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN Country;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN Region;
ALTER TABLE `superstore`.`superstore_sales` DROP COLUMN `Postal Code` ;