USE [Y_N_module_3]
GO

DROP TRIGGER IF EXISTS TRG.U_D_I_BASE_T_SCHEMABINDING_VIEW_CREATED
GO

---- TRIGGER CREATION
CREATE TRIGGER TRG.I_U_D_BASE_T_SCHEMABINDING_VIEW_CREATED ON dbo.INVOICE
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
--SET NOCOUNT ON;  SET @@ROWCOUNT IN 0
IF @@ROWCOUNT = 0 RETURN
DECLARE @OPERATION CHAR(1)
DECLARE @INS INT = (SELECT COUNT(*) FROM INSERTED)
DECLARE @DEL INT = (SELECT COUNT(*) FROM DELETED)
SET @OPERATION = 
CASE 
	WHEN @INS > 0 AND @DEL > 0 THEN 'U'  
	WHEN @INS = 0 AND @DEL > 0 THEN 'D'  
	WHEN @INS > 0 AND @DEL = 0 THEN 'I'  
END 
---- INSERT
IF @OPERATION = 'I'
BEGIN
	INSERT INTO [dbo].[Invoice]
           ([ID]
           ,[ID_Operation_Type]
           ,[Date]
           ,[ID_Contragent]
           ,[ID_Product]
           ,[Amount]
           ,[Price]
           )
     VALUES
		   (10
           ,1
           ,GETDATE()
           ,1
           ,1
           ,5
           ,$5
           )
	GO
END
---- DELETE
IF @OPERATION = 'D'
BEGIN
	DELETE FROM  [dbo].[Invoice]  
	WHERE ID = 2
END
--- UPDATE
IF @OPERATION = 'U'
	BEGIN
		UPDATE dbo.Invoice
    SET [Date] = GETDATE()
    WHERE ID IN (SELECT DISTINCT ID FROM Inserted)
	END

END
GO