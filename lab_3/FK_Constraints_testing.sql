-- transaction A

use [Grocery_goods_store]
go

begin transaction
select * from [dbo].[country]   
select * from [dbo].[address]   
select * from [dbo].[director]
select * from [dbo].[contragent]   
select * from [dbo].[invoice]
select * from [dbo].[product]
select * from [dbo].[ware]
select * from [dbo].[packing]
select * from [dbo].[operation_type]

delete from  [dbo].[country]  
where country.name = 'Ukraine'

select * from [dbo].[country]   
select * from [dbo].[address]   
select * from [dbo].[director]
select * from [dbo].[contragent]   
select * from [dbo].[invoice]
select * from [dbo].[product]
select * from [dbo].[product]
select * from [dbo].[ware]
select * from [dbo].[packing]
select * from [dbo].[operation_type]
waitfor delay '00:00:10'

rollback transaction
