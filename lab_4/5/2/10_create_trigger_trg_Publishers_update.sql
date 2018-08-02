USE [Y_Naychuk_Library]
GO

DROP TRIGGER IF EXISTS [Y_Naychuk_Library].[trg_Publishers_update]
GO

CREATE TRIGGER trg_Publishers_update


ON Y_Naychuk_L.Publishers
AFTER UPDATE
AS
    UPDATE Y_Naychuk_L.Publishers
    SET
	updated = GETDATE(),
	updated_by = CURRENT_USER
    WHERE Publisher_Id IN (SELECT DISTINCT Publisher_Id FROM Inserted)
GO	