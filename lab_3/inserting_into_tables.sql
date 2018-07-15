USE [Y_N_module_3]
GO

INSERT INTO [dbo].[Country]
           ([ID]
           ,[Name])
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

INSERT INTO [dbo].[Address]
           ([ID]
           ,[ID_Country]
           ,[City]
           ,[Street]
           ,[Building]
           ,[Appartment]
           ,[Zipcode])
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

INSERT INTO [dbo].[Director]
           ([ID]
           ,[Surname]
           ,[Name]
           ,[Middle_Name])
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


INSERT INTO [dbo].[Image]
           ([ID]
           ,[Image])
     
	 Select 1, BulkColumn 
from Openrowset (Bulk 'D:\Development\EPAM_DWBI\task_3_sql_schema_and_script\create_tables\candy.jpg', Single_Blob) as Image
GO

INSERT INTO [dbo].[Contragent]
           ([ID_Contragent]
           ,[Name]
           ,[Telephone_Number]
           ,[ID_Address]
           ,[ID_Director])
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

INSERT INTO [dbo].[Operation_Type]
           ([ID]
           ,[Name])
     VALUES
           (1
           ,'income'),
		   (2
           ,'outcome')
GO

INSERT INTO [dbo].[Type]
           ([ID]
           ,[Name])
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

INSERT INTO [dbo].[Units_of_Measure]
           ([ID]
           ,[Name])
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

INSERT INTO [dbo].[Packing]
           ([ID]
           ,[Name]
           ,[Amount_of_Units]
           ,[ID_Units_of_Measure])
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

INSERT INTO [dbo].[Product]
           ([ID]
           ,[ID_Type]
           ,[Name]
           ,[ID_Image]
           ,[ID_Packing]
           ,[Description])
     VALUES
           (1
           ,1
           ,'Romashka'
           ,1
           ,1
           ,'71% chocolate and 29% milk')
GO


INSERT INTO [dbo].[Invoice]
           ([ID]
           ,[Number]
           ,[ID_Operation_Type]
           ,[Date]
           ,[ID_Contragent]
           ,[ID_Product]
           ,[Amount]
           ,[Price]
           )
     VALUES
           (1
           ,'6A9619FF-8B86-D011-B42D-00C04FC964FF'
           ,1
           ,'2018-07-10T00:00:00'
           ,1
           ,1
           ,5
           ,$10
           ),
		   (2
           ,'1A9619FF-8B86-D011-B42D-00C04FC964FF'
           ,1
           ,GETDATE()
           ,1
           ,1
           ,5
           ,$5
           )
GO
INSERT INTO [dbo].[Invoice]
           ([ID]
           ,[ID_Operation_Type]
           ,[Date]
           ,[ID_Contragent]
           ,[ID_Product]
           ,[Amount]
           ,[Price]
           )
     VALUES
           (3
           ,1
           ,GETDATE()
           ,1
           ,1
           ,5
           ,$10
 	       )
GO

INSERT INTO [dbo].[Ware]
           ([ID]
           ,[ID_Ware]
           ,[ID_Price]
           ,[Expiration_Date])
     VALUES
           (1
           ,1
           ,10
           ,'2018-07-20')
GO


