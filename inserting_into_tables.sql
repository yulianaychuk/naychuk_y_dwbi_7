USE [Grocery_goods_store]
GO

INSERT INTO [dbo].[country]
           ([id]
           ,[name])
     VALUES
           (1,
		   'Ukraine'),
		   (2,
		   'Poland'),
		   (3,
		   'Sweden'),
		   (4,
		   'England'),
		   (5,
		   'Italy')
GO

INSERT INTO [dbo].[address]
           ([id]
           ,[country_id]
           ,[city]
           ,[street]
           ,[building]
           ,[appartment]
           ,[zipcode])
     VALUES
           (1
           ,1
           ,'Lviv'
           ,'Shevchenka'
           ,1
           ,1
           ,'79000'),
		   (2
           ,2
           ,'Krakow'
           ,'Shevchenka'
           ,1
           ,1
           ,'80000'),
		   (3
           ,3
           ,'Linkoping'
           ,'Lingren'
           ,3
           ,3
           ,'90000')
GO

INSERT INTO [dbo].[director]
           ([id]
           ,[surname]
           ,[name]
           ,[middle_name])
     VALUES
           (1
           ,'Pavelchak'
           ,'Аndriy'
           ,'Pavlovych'),
		   (2
           ,'Naychuk'
           ,'Yuliya'
           ,'Oleksandrivna')

GO


INSERT INTO [dbo].[image]
           ([id]
           ,[image])
     
	 Select 1, BulkColumn 
from Openrowset (Bulk 'D:\Development\EPAM_DWBI\task_3_sql_schema_and_script\create_tables\candy.jpg', Single_Blob) as Image
GO

INSERT INTO [dbo].[contragent]
           ([contragent_id]
           ,[name]
           ,[telephone_number]
           ,[address_id]
           ,[director_id])
     VALUES
           (1
           ,'Roshen'
           ,'12345678'
           ,1
           ,1),
		   (2
           ,'Svitoch'
           ,'87654321'
           ,2
           ,2)
GO

INSERT INTO [dbo].[operation_type]
           ([id]
           ,[name])
     VALUES
           (1
           ,'income'),
		   (2
           ,'outcome')
GO

INSERT INTO [dbo].[type]
           ([id]
           ,[name])
     VALUES
           (1
           ,'chocolates'),
		   (2
           ,'milk'),
		   (3
           ,'meat'),
		   (4
           ,'bread'),
		   (5
           ,'bananas')
GO

INSERT INTO [dbo].[units_of_measure]
           ([id]
           ,[name])
     VALUES
           (1
           ,'kg'),
		   (2
           ,'g'),
		   (3
           ,'L'),
		   (4
           ,'mL')
		  
GO

INSERT INTO [dbo].[packing]
           ([id]
           ,[name]
           ,[amount_of_units]
           ,[units_of_measure_id])
     VALUES
           (1
           ,'pack'
           ,1
           ,1),
		   (2
           ,'pack'
           ,500
           ,2),
		   (3
           ,'bottle'
           ,1
           ,3),
		   (4
           ,'bottle'
           ,300
           ,4)
GO

INSERT INTO [dbo].[product]
           ([id]
           ,[type_id]
           ,[name]
           ,[image_id]
           ,[packing_id]
           ,[description])
     VALUES
           (1
           ,1
           ,'Romashka'
           ,1
           ,1
           ,'71% chocolate and 29% milk')
GO


INSERT INTO [dbo].[invoice]
           ([id]
           ,[number]
           ,[operation_type_id]
           ,[date]
           ,[contragent_id]
           ,[product_id]
           ,[amount]
           ,[price]
           ,[sum]][TOTAL AS amount*price])
     VALUES
           (1
           ,'6A9619FF-8B86-D011-B42D-00C04FC964FF'
           ,1
           ,'2018-07-10T00:00:00'
           ,1
           ,1
           ,5
           ,$10
           ,50)
GO

INSERT INTO [dbo].[ware]
           ([id]
           ,[ware_id]
           ,[price_id]
           ,[expiration_date])
     VALUES
           (1
           ,1
           ,10
           ,'2018-07-20')
GO


