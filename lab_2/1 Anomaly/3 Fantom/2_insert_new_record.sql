-- second transaction inserts row
use [Grocery_goods_store]
go

begin transaction

INSERT INTO [dbo].[product]
           ([id]
           ,[type_id]
           ,[name]
           ,[image_id]
           ,[packing_id]
           ,[description])
     VALUES
           (2
           ,1
           ,'Korivka'
           ,1
           ,NULL
           ,'90% milk and 10% sugar')


commit transaction