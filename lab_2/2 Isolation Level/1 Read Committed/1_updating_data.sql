-- first transaction updada data
use [Grocery_goods_store]
go

begin transaction

update [dbo].[product] 
set [description] = '100% chocolate' 
where id = 1

--wait, first transaction read uncommitted data
waitfor delay '00:00:10'

rollback transaction