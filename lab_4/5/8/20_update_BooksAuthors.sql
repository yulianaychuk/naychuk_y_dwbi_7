USE [Y_Naychuk_Library]
GO
SELECT * FROM Y_Naychuk_L.BooksAuthors
SELECT * FROM Y_Naychuk_L.Authors_log

UPDATE [Y_Naychuk_L].[BooksAuthors]
   SET 
      [Seq_No] = 11111

 WHERE [ISBN] = '11111'
GO

SELECT * FROM Y_Naychuk_L.BooksAuthors
SELECT * FROM Y_Naychuk_L.Authors_log
