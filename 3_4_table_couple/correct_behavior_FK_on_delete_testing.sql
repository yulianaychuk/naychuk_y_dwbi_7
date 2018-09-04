-- transaction A

use [Y_N_module_3]
go

begin transaction
select * from [dbo].[Country]   
select * from [dbo].[Address]   
select * from [dbo].[Director]
select * from [dbo].[Contragent]   
select * from [dbo].[Invoice]
select * from [dbo].[Product]
select * from [dbo].[Ware]
select * from [dbo].[Packing]
select * from [dbo].[Operation_Type]

delete from  [dbo].[Country] where [Country].[Name] = 'Ukraine'

select * from [dbo].[Country]   
select * from [dbo].[Address]   
select * from [dbo].[Director]
select * from [dbo].[Contragent]   
select * from [dbo].[Invoice]
select * from [dbo].[Product]
select * from [dbo].[Product]
select * from [dbo].[Ware]
select * from [dbo].[Packing]
select * from [dbo].[Operation_Type]
waitfor delay '00:00:10'

rollback transaction
