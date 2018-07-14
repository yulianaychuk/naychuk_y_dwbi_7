use [Grocery_goods_store]
go

set transaction isolation level serializable

begin transaction

select * from [dbo].[product]  
where id > 0

---- other statements
---- wait, another transaction insert row
waitfor delay '00:00:10'
---- read data again

select * from [dbo].[product]   
where id > 0

commit transaction

---- rollback changes
delete from  [dbo].[product]  
where id = 2
