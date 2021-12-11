-- Quarter 1 training
select * from dbo.Q1_Training

-- Quarter 2 training
select * from dbo.Q2_Training

-- Consecutive Attendees 
select * 
from dbo.Q1_Training q1
inner join dbo.Q2_Training q2 on q1.Name = q2.Name

-- Create New Table
select * into dbo.Consecutive from
(
    select * 
    from dbo.Q1_Training q1
    inner join dbo.Q2_Training q2 on q1.Name = q2.Name
) temp

-- Select Required Columns and Rename Duplicate ones
select q1.Name
    , q1.Trainings as Q1_Trainings 
    , q2.Trainings as Q2_Trainings 
from dbo.Q1_Training q1
inner join dbo.Q2_Training q2 on q1.Name = q2.Name

-- Create table with Unique Names
drop table dbo.Consecutive
select * into dbo.Consecutive from
(
    select q1.Name
        , q1.Trainings as Q1_Trainings 
        , q2.Trainings as Q2_Trainings 
    from dbo.Q1_Training q1
    inner join dbo.Q2_Training q2 on q1.Name = q2.Name
) temp

--Check Data
select Name
    , Q1_Trainings + Q1_Trainings as Total_Trainings 
from dbo.Consecutive
