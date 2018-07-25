USE [master]
go

ALTER DATABASE [Y_Naychuk_Library] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO

/* Query to Drop Databasein SQL Server  */
drop database if exists [Y_Naychuk_Library]
go

-- create using dbo priviliges
-- grant permisions to another user 
CREATE DATABASE [Y_Naychuk_Library]
go