USE [Y_Naychuk_Library]
GO

DROP TRIGGER IF EXISTS [Y_Naychuk_L].[trg_Books_update]
GO

CREATE TRIGGER trg_Books_update


ON Y_Naychuk_L.Books
AFTER UPDATE
AS
    UPDATE Y_Naychuk_L.Books
    SET
	updated = GETDATE(),
	updated_by = CURRENT_USER
    WHERE ISBN IN (SELECT DISTINCT ISBN FROM Inserted)
GO	