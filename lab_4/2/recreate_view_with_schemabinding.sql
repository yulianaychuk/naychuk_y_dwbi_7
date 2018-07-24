USE [Y_N_module_3]
GO
begin transaction
--- view  dbo.my_invoice has been created
--- alter table
ALTER TABLE dbo.Invoice 
ADD Operation_type_description varchar(35) NULL
GO

SELECT * FROM dbo.my_invoice

---- recreate view with schemabinding
USE [Y_N_module_3]
GO
CREATE OR ALTER VIEW dbo.my_invoice
WITH SCHEMABINDING
AS
 SELECT 
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
GO

--- try to alter table
ALTER TABLE dbo.Invoice 
ADD Operation_type_description varchar(35) NULL
GO
SELECT * FROM dbo.my_invoice
SELECT * FROM dbo.invoice

ALTER TABLE dbo.Invoice 
DROP COLUMN Price
GO
--- get error/ underline table has been altered

SELECT * FROM dbo.my_invoice
SELECT * FROM dbo.invoice

