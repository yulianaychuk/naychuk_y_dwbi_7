use Y_Naychuk_Library
go

drop sequence if exists Y_Naychuk_L.Authors_Id_seq

CREATE SEQUENCE Y_Naychuk_L.Authors_Id_seq
	START WITH 1
	INCREMENT BY 1
	NO CACHE
	;
GO