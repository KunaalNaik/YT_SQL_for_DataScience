-- Finding Duplicate values using SQL table

-- Check Data
Select * 
FROM dbo.Data_wDuplicates

-- Find Duplicates
Select Name, Location, count(*)
FROM dbo.Data_wDuplicates
GROUP BY Name, Location
HAVING COUNT(*) > 1

-- Removing Duplicates from Data



