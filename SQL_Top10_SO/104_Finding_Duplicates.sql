-- Finding Duplicate values using SQL table

-- Check Data
Select * 
FROM dbo.Data_wDuplicates

-- Find/Identify Duplicates (with Group by)
Select Name, Location, COUNT(*) as CNT
FROM dbo.Data_wDuplicates
GROUP BY Name, Location
HAVING COUNT(*) > 1

-- Removing Duplicates from Data (without Group by)
select ID, Name, Location from (
    Select *
        , ROW_NUMBER() OVER (PARTITION BY Name, Location ORDER BY ID DESC) as CNT
    FROM dbo.Data_wDuplicates
) temp
where CNT = 1





