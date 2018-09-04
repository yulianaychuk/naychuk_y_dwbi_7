Data Source=YULIA_PC;Initial Catalog=[Grocery_goods_store];Trusted_Connection=True;

use [Grocery_goods_store]
go

set transaction isolation level read uncommitted
go

begin transaction
select * from [dbo].[address]
---- other statements

commit transaction