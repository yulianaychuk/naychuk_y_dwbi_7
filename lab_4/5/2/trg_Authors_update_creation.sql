USE [Y_Naychuk_Library]
GO

DROP TRIGGER IF EXISTS trg_Authors_update
GO

CREATE TRIGGER trg_Authors_update


ON Y_Naychuk_L.Authors
AFTER UPDATE
AS
    UPDATE Y_Naychuk_L.Authors
    SET
	updated = GETDATE(),
	updated_by = CURRENT_USER
    WHERE Author_Id IN (SELECT DISTINCT Author_Id FROM Inserted)


	INSERT INTO Y_Naychuk_L.Authors_log
	(
	Author_Id_new,
	Name_new,
	URL_new,
	Author_Id_old,
	Name_old,
	URL_old,
	operation_type,
	operation_datetime
	)
	VALUES
	(
	(SELECT DISTINCT [Author_Id] FROM Inserted),
	(SELECT DISTINCT [Name] FROM Inserted),
	(SELECT DISTINCT [URL] FROM Inserted),
	(SELECT DISTINCT [Author_Id] FROM Deleted),
	(SELECT DISTINCT [Name] FROM Deleted),
	(SELECT DISTINCT [URL] FROM Deleted),
	'U',
	GETDATE()
	)


GO	