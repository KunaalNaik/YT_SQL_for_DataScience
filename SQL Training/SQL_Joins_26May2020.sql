#SELECT * FROM retail_case_study_1.tr_orderdetails;

SELECT 
ProductID
, sum(Quantity) as  Quantity
FROM retail_case_study_1.tr_orderdetails
group by ProductID
order by 2 desc; 

SELECT 
A.*, B.ProductName, B.ProductCategory, B.Price
FROM retail_case_study_1.tr_orderdetails as A
LEFT JOIN retail_case_study_1.tr_products as B
on A.ProductID = B.ProductID
; 

# Highest Quantity Sold
SELECT 
  A.ProductID 
, B.ProductName
, sum(A.Quantity) as Quantity
FROM retail_case_study_1.tr_orderdetails as A
LEFT JOIN retail_case_study_1.tr_products as B
on A.ProductID = B.ProductID
group by B.ProductName
order by 3 desc
; 

# Top 5 and Botton 5 in One Table
SELECT 
  A.ProductID 
, B.ProductName
, sum(A.Quantity) as Quantity
FROM retail_case_study_1.tr_orderdetails as A
LEFT JOIN retail_case_study_1.tr_products as B
on A.ProductID = B.ProductID
group by B.ProductName
order by 3 desc
LIMIT 5;

SELECT 
  A.ProductID 
, B.ProductName
, sum(A.Quantity) as Quantity
FROM retail_case_study_1.tr_orderdetails as A
LEFT JOIN retail_case_study_1.tr_products as B
on A.ProductID = B.ProductID
group by B.ProductName
order by 3 asc
LIMIT 5
; 





