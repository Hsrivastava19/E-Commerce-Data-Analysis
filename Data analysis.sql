--Displaying all the orders placed

select * from E_Commerce..OrderList
order by 1



--Displaying all the order details

select * from E_Commerce..OrderDetails
order by 1


-- Display the total number of Orders Placed

select count(distinct(order_id)) as [Total Entries] from E_Commerce..OrderDetails 




-- Display the total amount spent by each customer

select ol.Order_ID, ol.CustomerName, sum(od.Amount) as [Total amount spent]

into E_commerce..#Temp_CustAmountSpent

from E_commerce..OrderList ol 
inner join E_Commerce..OrderDetails od

on ol.Order_ID= od.Order_ID
group by ol.order_id,ol.CustomerName

select CustomerName
from E_commerce..#Temp_CustAmountSpent



-- Sum of total amount spent by customers

declare @totalSpent as float

set @totalSpent= (select sum([Total amount spent])
from E_commerce..#Temp_CustAmountSpent)

select @totalSpent



--Diaplay total profit per customer

select ol.Order_ID, ol.CustomerName, sum(od.Profit) as [Profit per customer]

into E_commerce..#Temp_ProfitperCust


from E_commerce..OrderList ol 
inner join E_Commerce..OrderDetails od

on ol.Order_ID= od.Order_ID
group by ol.order_id,ol.CustomerName

select * 
from E_commerce..#Temp_ProfitperCust




-- Overall profit

declare @totalProfit as float

select @totalProfit = sum([Profit per customer])
from E_commerce..#Temp_ProfitperCust

select @totalProfit





-- Finding out the Profit percentage

create procedure ProfitPercentage
as

declare @totalProfit as float
declare @totalSpent as float
declare @profitPercentage as float

set @totalSpent= (select sum([Total amount spent])
from #Temp_CustAmountSpent)

set @totalProfit = (select sum([Profit per customer])
from #Temp_ProfitperCust)

set @profitPercentage= (@totalProfit/@totalSpent)*100

print 'Your Total Profit percentage is ' + cast(@profitPercentage as varchar) + '%'



Execute ProfitPercentage


-- If you want to drop the stored procedure execute the following 
-- Drop Procedure ProfitPercentage









