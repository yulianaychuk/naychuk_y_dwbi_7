USE [Y_Naychuk_Library]
GO

SELECT * FROM Y_Naychuk_L.Books
SELECT * FROM Y_Naychuk_L.Authors_log

UPDATE [Y_Naychuk_L].[Books]
   SET 
	[Price] = 100

 WHERE [ISBN] = 11111
GO

SELECT * FROM Y_Naychuk_L.Books
SELECT * FROM Y_Naychuk_L.Authors_log
