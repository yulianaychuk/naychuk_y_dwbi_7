use [Y_N_module_3]
go

drop trigger if exists trg.u_d_i_base_t_schemabinding_view_created 
go

---- trigger creation
create trigger trg.u_d_i_base_t_schemabinding_view_created ON dbo.Invoice
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
--SET NOCOUNT ON;  set @@rowcount in 0
IF @@ROWCOUNT = 0 RETURN
DECLARE @operation char(1)
DECLARE @ins int = (select count(*) from INSERTED)
DECLARE @del int = (select count(*) from DELETED)
set @operation = 
case 
	when @ins > 0 and @del > 0 then 'U'  
	when @ins = 0 and @del > 0 then 'D'  
	when @ins > 0 and @del = 0 then 'I'  
end 
---- insert
begin
	SELECT * FROM [dbo.Invoice] AS b
	JOIN inserted AS i   
    ON b.ID = i.ID
	IF (SELECT COUNT(i.Price) FROM i WHERE i.Price=0)>0  
		ROLLBACK;  
	END;  
END 
		inserted.id, 
		@operation, 
		inserted.name
		inserted.ID
        inserted.ID_Operation_Type
        inserted.Date
        inserted.ID_Contragent
        inserted.ID_Product
        inserted.Amount
        inserted.Price
	FROM trg.u_d_i_base_t_schemabinding_view_created
	inner join inserted on trg.u_d_i_base_t_schemabinding_view_created.id = inserted.id
end
---- delete
if @operation = 'D'
begin
	insert into trg.audit_orders (orderid, 
		operationtype, old_name)
	Select 
		deleted.id, 
		@operation, 
		deleted.name
	FROM deleted 
end
--- update
if @operation = 'U'
	begin
		update trg.orders 
		set updated = getdate(), 
			updatecnt += 1
		from trg.orders 
			inner join inserted on trg.orders.id = inserted.id

		if update(description)
			insert into trg.audit_orders 
				(orderid, operationtype, old_name,new_name,comment)
			select
				inserted.id,
				@operation,
				deleted.name,
				inserted.name,
				'old description value: ' + isnull(deleted.description,'')
			FROM trg.orders 
				inner join  inserted on trg.orders.id = inserted.id
				inner join deleted on trg.orders.id = deleted.id
		else
			insert into trg.audit_orders 
				(orderid, operationtype, old_name,new_name)
			select
				inserted.id,
				@operation,
				deleted.name,
				inserted.name
			FROM trg.orders
				inner join  inserted on trg.orders.id = inserted.id
				inner join deleted on trg.orders.id = deleted.id
	end

END
GO