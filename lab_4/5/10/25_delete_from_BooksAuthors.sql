USE [Y_Naychuk_Library]
GO

DELETE FROM [Y_Naychuk_L].[BooksAuthors]
      WHERE [Author_Id] =2
GO

SELECT * FROM Y_Naychuk_L.Authors_log