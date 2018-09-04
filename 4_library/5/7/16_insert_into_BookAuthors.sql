USE [Y_Naychuk_Library]
GO

SELECT * FROM Y_Naychuk_L.BooksAuthors
SELECT * FROM Y_Naychuk_L.Authors_log

INSERT INTO [Y_Naychuk_L].[BooksAuthors]
           ([BooksAuthors_id]
           ,[ISBN]
           ,[Author_Id]
		   )

     VALUES

           (
		   1,
           '33333'
           ,2
		   ),

           (
		   2,
           '11111'
           ,5
		   ),

           (
		   3,
           '22222'
           ,4
		   )

GO

SELECT * FROM Y_Naychuk_L.BooksAuthors
SELECT * FROM Y_Naychuk_L.Authors_log
