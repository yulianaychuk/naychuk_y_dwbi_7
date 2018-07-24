USE [Y_N_module_3]
GO

DROP TRIGGER IF EXISTS trg_Invoice_UpdateDate 
GO
CREATE TRIGGER trg_Invoice_UpdateDate
ON dbo.Invoice
AFTER UPDATE
AS
    UPDATE dbo.Invoice
    SET [Date] = GETDATE()
    WHERE ID IN (SELECT DISTINCT ID FROM Inserted)
GO	