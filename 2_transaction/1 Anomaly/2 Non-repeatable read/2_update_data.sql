-- second transactions updates data
use [Grocery_goods_store]
go

begin transaction

update [dbo].[product] 
set [description] = '25% chocolate and 75% milk' 
where id = 1

commit transaction