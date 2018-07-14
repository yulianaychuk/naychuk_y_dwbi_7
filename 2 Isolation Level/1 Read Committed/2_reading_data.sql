use [Grocery_goods_store]
go

set transaction isolation level read committed
go

begin transaction
select * from [dbo].[product]
---- other statements

commit transaction