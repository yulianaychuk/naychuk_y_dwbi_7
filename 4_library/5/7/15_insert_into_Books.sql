USE [Y_Naychuk_Library]
GO

SELECT * FROM Y_Naychuk_L.Books
SELECT * FROM Y_Naychuk_L.Authors_log

INSERT INTO [Y_Naychuk_L].[Books]
           ([ISBN]
           ,[Publisher_Id]
           ,[URL]
           ,[Price]
           )
     VALUES
           ('11111'
           ,100
           ,'www.Tesla.com'
           ,10
           )
		   ,('22222'
           ,200
           ,'www.Edison.com'
           ,20
           )
		   ,('33333'
           ,300
           ,'www.UkrBook.com'
           ,5
           )
GO

SELECT * FROM Y_Naychuk_L.Books
SELECT * FROM Y_Naychuk_L.Authors_log
