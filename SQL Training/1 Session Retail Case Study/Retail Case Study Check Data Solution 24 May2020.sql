# Find the number of Customers
SELECT 
count(distinct customer_id)
FROM retail_data_transactions;

# Total transactions in the data
SELECT 
count(*)
FROM retail_data_transactions;

# Top 5 Customers with Maximum Sales
SELECT 
  customer_id 
, sum(tran_amount) as tran_amount
FROM retail_data_transactions
group by customer_id
ORDER by tran_amount desc limit 5;

# Top 5 Customers with Maximum Purchases
SELECT 
  customer_id 
, count(tran_amount) as purchases
FROM retail_data_transactions
group by customer_id
ORDER by 2 desc limit 5;


