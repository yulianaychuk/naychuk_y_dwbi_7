--This trigger prevents removal of invoice,
--which Amount is not 0 or null.
--(defence against accident removal)

USE [Y_N_module_3]
GO
DROP TRIGGER IF EXISTS trg_Invoice_Delete
GO
CREATE TRIGGER trg_Invoice_Delete
ON dbo.Invoice
AFTER DELETE
AS
	print 'Delete trigger started, data to be deleted:'
	select * from Deleted
	IF (SELECT COUNT(Deleted.Amount) FROM Deleted WHERE Deleted.Amount!=0 AND Deleted.Amount IS NOT NULL)>0 
		begin
--			print 'rolled back';
			ROLLBACK
		end
	ELSE
		print 'Deleted'
	print 'Delete trigger finished, table after is'
	select * from dbo.Invoice
GO