use [Grocery_goods_store]
go


begin transaction

select * from [dbo].[product]

---- other statements
---- wait, another transaction updates data
waitfor delay '00:00:05'
---- read data again

select * from [dbo].[product]

commit transaction

---- rollback changes
update [dbo].[product] 
set [description] = '80% chocolate and 20% milk' 
where name = 'Romashka'
