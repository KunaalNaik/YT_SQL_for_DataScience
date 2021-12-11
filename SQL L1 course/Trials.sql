
select * into #temp_summary from (
select *, YEAR(OrderDate) as YEAR from dbo.OrderDetails
) temp

select YEAR, sum(Quantity) as Quantity from dbo.#temp_summary group by Year