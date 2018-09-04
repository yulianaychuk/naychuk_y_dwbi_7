-- second transactions updates data
use [Grocery_goods_store]
go

begin transaction

update [dbo].[product] 
set [description] = '15% chocolate, 80% milk and 5% sugar' 
where name = 'Romashka'

commit transaction