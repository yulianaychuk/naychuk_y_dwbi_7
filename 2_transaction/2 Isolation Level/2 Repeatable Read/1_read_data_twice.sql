use [Grocery_goods_store]
go

set transaction isolation level repeatable read

begin transaction

select * from [dbo].[product] 

---- other statements
---- wait, another transaction updates data
waitfor delay '00:00:20'
---- read data again

select * from [dbo].[product] 

commit transaction

---- rollback changes
update [dbo].[product] 
set [description] = '90% chocolate, 9% milk and 1% sugar' 
where name = 'Romashka'
