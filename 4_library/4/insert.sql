	USE [Y_N_module_3]
	GO

	INSERT INTO [Y_Naychuk].Invoice
           ([ID]
           ,[ID_Operation_Type]
           ,[Date]
           ,[ID_Contragent]
           ,[ID_Product]
           ,[Amount]
           ,[Price]
           )
     VALUES
		   (93
           ,1
           ,GETDATE()
           ,1
           ,1
           ,5
           ,$10
           )
	GO