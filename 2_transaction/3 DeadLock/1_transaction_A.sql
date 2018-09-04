-- transaction A
use [Grocery_goods_store]
go

begin transaction

update [dbo].[product]  set [name] = 'DeadLine' where id = 1

waitfor delay '00:00:05'
--- Transaction B started

-- try to Update
update [dbo].[packing] set [name] = 'DeadLine' where id = 1


commit transaction