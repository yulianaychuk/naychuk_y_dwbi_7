USE [Y_Naychuk_Library]
GO
SELECT * FROM Y_Naychuk_L.Publishers
SELECT * FROM Y_Naychuk_L.Authors_log

UPDATE [Y_Naychuk_L].[Publishers]
   SET 
       [Name] = 'Ababa'
      ,[URL] = 'AbabaHalamaha.com.ua'

 WHERE [Publisher_Id] = 100

SELECT * FROM Y_Naychuk_L.Publishers
SELECT * FROM Y_Naychuk_L.Authors_log
