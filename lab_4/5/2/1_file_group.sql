/*create new file group*/
USE [master]
GO
ALTER DATABASE [Y_Naychuk_Library] ADD FILEGROUP [Data]
GO
/*create new data file */
USE [master]
GO
ALTER DATABASE [Y_Naychuk_Library] 
ADD FILE ( NAME = N'Y_Naychuk_Library_data', 
FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Y_Naychuk_Library_data.mdf' , 
SIZE = 5120KB , FILEGROWTH = 1024KB ) TO FILEGROUP [Data]
GO
/*set default file group*/
USE [Y_Naychuk_Library]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'Data') 
	ALTER DATABASE [Y_Naychuk_Library] MODIFY FILEGROUP [Data] DEFAULT
GO

