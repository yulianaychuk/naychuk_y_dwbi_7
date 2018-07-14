use [Grocery_goods_store]
go


begin transaction

select * 
from [dbo].[product]  
where id > 0

---- other statements
---- wait, another transaction inserts new row
waitfor delay '00:00:20'
---- read data again


select * 
from [dbo].[product]  
where id > 0

commit transaction

---- rollback changes
delete from  [dbo].[product] 
where id = 2
