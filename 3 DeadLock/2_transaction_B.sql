-- transaction b
use [Grocery_goods_store]
go

begin transaction

update [dbo].[packing] set [name] = 'DeadLock' where id = 1

waitfor delay '00:00:05'
--- Transaction A continue

-- try to upgate 
update [dbo].[product] set [name] = 'DeadLock' where id = 1

commit transaction