-- first transaction updada data
Data Source=YULIA_PC;Initial Catalog=[Grocery_goods_store];Integrated Security=SSPI;
User ID=sa;Password=admin123;


use [Grocery_goods_store]
go

begin transaction

update [dbo].[address] 
set [city] = 'Kyiv' 
where country_id = 1

--wait, first transaction read uncommitted data

waitfor delay '00:00:20'

rollback transaction