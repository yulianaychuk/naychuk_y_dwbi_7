use Y_Naychuk_Library
go

drop sequence if exists Y_Naychuk_L.Publishers_Id_seq

CREATE SEQUENCE Y_Naychuk_L.Publishers_Id_seq
	START WITH 100
	INCREMENT BY 100
	NO CACHE
	;
GO