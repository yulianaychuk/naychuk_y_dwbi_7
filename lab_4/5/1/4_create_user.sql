--- create user in database, 
--- add into dbo_owner role
USE [demo_database]
GO
CREATE USER [demo_user] FOR LOGIN [demo_user]
GO
USE [demo_database]
GO
ALTER USER [demo_user] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [demo_database]
GO
ALTER ROLE [db_owner] ADD MEMBER [demo_user]
GO
