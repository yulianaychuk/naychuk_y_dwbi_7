USE [Y_Naychuk_Library]
GO

DROP TRIGGER IF EXISTS [Y_Naychuk_L].[trg_Books_update_to_Publishers]
GO

CREATE TRIGGER trg_Books_update_to_Publishers

ON Y_Naychuk_L.Books
AFTER INSERT
AS

	PRINT 'trg_Books_update_to_Publishers STARTED'

	--variables for update data
	DECLARE @pub_id INT
	DECLARE @issue INT
	DECLARE @edition INT

	-- variables for old data
	DECLARE @book_amount INT
	DECLARE @issue_amount INT
	DECLARE @total_edition INT

	--using cursorfor iteration over inserted table rows
	--see https://stackoverflow.com/questions/11852782/t-sql-loop-over-query-results
	DECLARE pub_curs CURSOR FOR (SELECT Publisher_Id, issue, edition FROM Inserted)
	OPEN pub_curs

	--iterating and handling of each record frominserted table by cursor
	FETCH NEXT
	FROM pub_curs
	INTO @pub_id, @issue, @edition

	WHILE @@FETCH_STATUS = 0
	BEGIN
	
		--fetch base data
		SELECT TOP 1
			@book_amount = book_amount,
			@issue_amount = issue_amount,
			@total_edition = total_edition
		FROM Y_Naychuk_L.Publishers
		WHERE Publisher_Id = @pub_id
	
		--update variables with data fetched from cursor
		SET @book_amount = @book_amount + 1
		SET @issue_amount = @issue_amount + @issue
		SET @total_edition = @total_edition + @edition

		--store updated data into table
		UPDATE [Y_Naychuk_L].[Publishers]
		SET  [book_amount] = @book_amount
			,[issue_amount] = @issue_amount
			,[total_edition] = @total_edition
		WHERE Publisher_Id = @pub_id

		--next iteration
		FETCH NEXT
		FROM pub_curs
		INTO @pub_id, @issue, @edition
	END

	CLOSE pub_curs
	DEALLOCATE pub_curs
	PRINT 'trg_Books_update_to_Publishers ENDED'

GO
