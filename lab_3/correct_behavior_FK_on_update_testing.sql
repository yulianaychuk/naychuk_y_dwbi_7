-- transaction A

use [Y_N_module_3]
go

begin transaction
select * from [dbo].[Country]   
select * from [dbo].[Address]   

update [dbo].[Country]   set [ID] = 6 where [Name] = 'Ukraine' 

select * from [dbo].[Country]   
select * from [dbo].[Address]  
 
waitfor delay '00:00:05'

rollback transaction
