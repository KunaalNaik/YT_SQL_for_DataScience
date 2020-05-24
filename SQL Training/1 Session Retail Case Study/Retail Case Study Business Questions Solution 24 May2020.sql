# Did the transactions increase Year on Year?
SELECT 
  *
#, STR_TO_DATE(trans_date,'%d,%MMM,%Y')
, right(trans_date,2) + 2000 as Year
#, year(trans_date) as Year
FROM retail_data_transactions
limit 5;




