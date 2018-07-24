---- updating data
use [Y_N_module_3]
go


update dbo.[Invoice] 
set [Amount] = 500 
where ID = 2
go

select * from dbo.[Invoice] 
go