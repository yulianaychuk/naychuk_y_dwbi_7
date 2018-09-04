--This trigger prevents adding of invoice,
--which Price is zero.
--(defence against dummy info insertion)

USE [Y_N_module_3]
GO
DROP TRIGGER IF EXISTS trg_Invoice_Insert 
GO
CREATE TRIGGER trg_Invoice_Insert 
ON dbo.Invoice
AFTER INSERT
AS
--	print 'Insert trigger started, data to be inserted:'
	select * from inserted
	IF (SELECT COUNT(inserted.Price) FROM inserted WHERE inserted.Price=0)>0  
		begin
--			print 'rolled back';
			ROLLBACK
		end
	ELSE
--		print 'inserted'
--	print 'Insert trigger finished, table after is'
	select * from dbo.Invoice
GO