USE [Y_Naychuk_Library]
GO

SELECT * FROM Y_Naychuk_L.Authors_log

DELETE FROM [Y_Naychuk_L].[Authors_log]
      WHERE [operation_id] = 1
GO

SELECT * FROM Y_Naychuk_L.Authors_log