USE [Y_N_module_3]
GO

-- view creation
CREATE OR ALTER VIEW dbo.my_invoice_by_price
AS SELECT
     [ID] 
	,[Number]
	,[ID_Operation_Type]
	,[Date]
	,[ID_Contragent]
	,[ID_Product]
	,[Amount]
	,[Price]
	,[TOTAL]
  FROM [dbo].[Invoice]
  WHERE [Price] >10 
  WITH CHECK OPTION
GO

-- get data
select * from dbo.my_invoice_by_price
go

-- update view
update dbo.my_invoice_by_price 
set Price = 107 
where ID_Product = 1
go

-- get data (updated)
select * from dbo.my_invoice_by_price
go

--- 'invisible insert'
INSERT INTO [dbo].[my_invoice_by_price]
           ([ID]
			,[ID_Operation_Type]
			,[Date]
			,[ID_Contragent]
			,[ID_Product]
			,[Amount]
			,[Price]
			)
     VALUES
           (5
           ,1
           ,GETDATE()
           ,1
           ,1
           ,5
           ,$100
 	       )

-- get data (no new record)
select * from dbo.my_invoice_by_price
go

--- re-create view with check option
create OR  alter view dbo.my_invoice_by_price
as
  SELECT 	[ID] 
			,[Number]
			,[ID_Operation_Type]
			,[Date]
			,[ID_Contragent]
			,[ID_Product]
			,[Amount]
			,[Price]
			,[TOTAL]
  FROM [dbo].[Invoice]
  WHERE [Price] = 100
  WITH CHECK OPTION
  go

--- trying to insert records
INSERT INTO [dbo].[my_invoice_by_price]
           ( [ID] 
			,[ID_Operation_Type]
			,[Date]
			,[ID_Contragent]
			,[ID_Product]
			,[Amount]
			,[Price])
     VALUES
           (7
           ,1
           ,GETDATE()
           ,1
           ,1
           ,1           
 	       ,100)
go
