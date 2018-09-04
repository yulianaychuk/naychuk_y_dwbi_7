---- updating data
use [Y_N_module_3]
go


update [Y_Naychuk].[Invoice] 
set [Amount] = 500 
where ID = 2
go

select * from [Y_Naychuk].[Invoice] 
go