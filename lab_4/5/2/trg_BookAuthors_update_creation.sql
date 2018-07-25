USE [Y_Naychuk_Library]
GO

DROP TRIGGER IF EXISTS trg_BooksAuthors_update
GO

CREATE TRIGGER trg_BooksAuthors_update


ON Y_Naychuk_L.BooksAuthors
AFTER UPDATE
AS
    UPDATE Y_Naychuk_L.BooksAuthors
    SET
	updated = GETDATE(),
	updated_by = CURRENT_USER
    WHERE BooksAuthors_id IN (SELECT DISTINCT BooksAuthors_id FROM Inserted)
GO	