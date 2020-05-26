# Did the transactions increase Year on Year?
SELECT 
  *
#, STR_TO_DATE(trans_date,'%d,%MMM,%Y')
, right(trans_date,2) + 2000 as Year
#, year(trans_date) as Year
FROM retail_data_transactions
limit 5;

#Year on Year
SELECT 
right(trans_date,2) + 2000 as Year
, count(customer_id) as purchases
FROM retail_data_transactions
group by right(trans_date,2) + 2000
order by 1 asc
;

SELECT trans_date,RIGHT(trans_date,2) + 2000 as Year
FROM retail_data_transactions
limit 5;





