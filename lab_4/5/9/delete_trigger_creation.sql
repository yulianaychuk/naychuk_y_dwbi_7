USE [Y_Naychuk_Library]
GO

DROP TRIGGER IF EXISTS trg_Authors_log_Delete
GO
CREATE TRIGGER trg_Authors_log_Delete
ON Y_Naychuk_L.Authors_log

AFTER DELETE
AS
	ROLLBACK
GO