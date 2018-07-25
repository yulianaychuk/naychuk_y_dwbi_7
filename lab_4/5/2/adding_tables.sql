use Y_Naychuk_Library
go

alter table [Y_Naychuk_L].[Books] drop constraint [FK_Publisher_ID]
alter table [Y_Naychuk_L].[BooksAuthors] drop constraint [FK_ISBN]
alter table [Y_Naychuk_L].[BooksAuthors] drop constraint [FK_Author_Id]

GO

drop table if exists Y_Naychuk_L.Authors
go
SELECT name, type, schema_id FROM sys.all_objects where name = 'xml_schema_namespace'

CREATE TABLE Y_Naychuk_L.Authors (
Author_Id		int NOT NULL,
Name			varchar(20) NOT NULL,
URL				varchar(200) DEFAULT 'www.author_name.com',
inserted		datetime NOT NULL DEFAULT GETDATE(),
inserted_by		varchar(20) DEFAULT 'system_user',
updated			datetime DEFAULT GETDATE(),
updated_by		varchar(20) NULL,

--- define default value (row level constraint)
	  -- constraint details_weight_df default (0)
--- define check constraint (row level constraint)
	  -- constraint details_weight_chk check (weight >=0) ,
       --city                 varchar(20) NULL

----define primary key (table level constraint)
	   constraint PK_Authors primary key clustered (Author_Id ASC),

----define unique key (alternate key, table level constraint)
	   constraint IX_Authors unique (Name ASC)
)
go
drop table if exists Y_Naychuk_L.Books
go

CREATE TABLE Y_Naychuk_L.Books (
ISBN	varchar(20) NOT NULL,
Publisher_Id	int NOT NULL,	
[URL]	varchar(200) NOT NULL,
Price	money DEFAULT 0, 	
inserted	datetime NOT NULL DEFAULT GETDATE(),	
inserted_by	varchar(20) DEFAULT 'system_user',	
updated	datetime DEFAULT GETDATE(),	
updated_by	varchar(20) NULL,	

--- define default value (row level constraint)
	  -- constraint details_weight_df default (0)
--- define check constraint (row level constraint)
	   constraint Price_chk check (Price >=0),
       
----define primary key (table level constraint)
	   
	   constraint PK_Books primary key clustered ([ISBN]),

----define unique key (alternate key, table level constraint)
	   constraint IX_Books unique NONCLUSTERED
	   (
	   [URL] ASC
	   )
	   WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

drop table if exists Y_Naychuk_L.BooksAuthors
go
CREATE TABLE Y_Naychuk_L.BooksAuthors (
BooksAuthors_id	int DEFAULT 1,
ISBN	varchar(20) NOT NULL,	
Author_Id	int NOT NULL,	
Seq_No	int DEFAULT 1,	
inserted	datetime NOT NULL DEFAULT GETDATE(),	
inserted_by	varchar(20) DEFAULT 'system_user',	
updated	datetime DEFAULT GETDATE(),	
updated_by	varchar(20) NULL,	

--- define default value (row level constraint)
	  -- constraint details_weight_df default (0)
--- define check constraint (row level constraint)
		constraint BooksAuthors_id_chk check (BooksAuthors_id >=1),
		constraint Seq_No_chk check (Seq_No >=1),	   
       
----define primary key (table level constraint)
	   constraint PK_BooksAuthors primary key clustered (BooksAuthors_id ASC),

----define unique key (alternate key, table level constraint)
	   constraint IX_ISBN unique (ISBN ASC),
	   constraint IX_Author_Id unique (Author_Id ASC)
)
drop table if exists Y_Naychuk_L.Publishers
go

CREATE TABLE Y_Naychuk_L.Publishers (
		Publisher_Id	int NOT NULL,
		Name	varchar(20) NOT NULL,	
		URL	varchar(20) DEFAULT 'www.publisher_name.com',
		inserted	datetime NOT NULL DEFAULT GETDATE(),	
		inserted_by	 varchar(20) DEFAULT 'system_user',
		updated	datetime DEFAULT GETDATE(),	
		updated_by	varchar(20) NULL,	

--- define default value (row level constraint)
	  -- constraint details_weight_df default (0)
--- define check constraint (row level constraint)
       
----define primary key (table level constraint)
	   constraint PK_Publishers primary key clustered (Publisher_Id ASC),

----define unique key (alternate key, table level constraint)
	   constraint IX_Name unique (Name ASC),

)

drop table if exists Y_Naychuk_L.Authors_log
go
CREATE TABLE Y_Naychuk_L.Authors_log (
		operation_id	int IDENTITY(1,1) NOT NULL,
		Author_Id_new	int NULL,	
		Name_new	varchar(20) NULL,	
		URL_new	varchar(20) NULL,	
		Author_Id_old	int NULL,
		Name_old	varchar(20) NULL,	
		URL_old	varchar(20) NULL,	
		operation_type	varchar(20) NOT NULL,	
		operation_datetime	datetime NOT NULL DEFAULT GETDATE(),	

--- define default value (row level constraint)
	  -- constraint details_weight_df default (0)
--- define check constraint (row level constraint)
  
       
----define primary key (table level constraint)
	   constraint PK_Authors_log primary key clustered (operation_id ASC),

----define unique key (alternate key, table level constraint)

)


ALTER TABLE [Y_Naychuk_L].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Publisher_ID] FOREIGN KEY([Publisher_Id])
REFERENCES [Y_Naychuk_L].[Publishers] ([Publisher_Id])
GO

ALTER TABLE [Y_Naychuk_L].[Books] CHECK CONSTRAINT [FK_Publisher_ID]
GO


ALTER TABLE [Y_Naychuk_L].[BooksAuthors]
--WITH CHECK
ADD  CONSTRAINT [FK_ISBN]
FOREIGN KEY([ISBN]) REFERENCES [Y_Naychuk_L].[Books] ([ISBN])
ON UPDATE CASCADE
ON DELETE NO ACTION
GO

ALTER TABLE [Y_Naychuk_L].[BooksAuthors] CHECK CONSTRAINT [FK_ISBN]
GO

ALTER TABLE [Y_Naychuk_L].[BooksAuthors]  WITH CHECK ADD  CONSTRAINT [FK_Author_Id] FOREIGN KEY([Author_Id])
REFERENCES [Y_Naychuk_L].[Authors] ([Author_Id])
ON UPDATE NO ACTION
ON DELETE NO ACTION
GO

ALTER TABLE [Y_Naychuk_L].[BooksAuthors] CHECK CONSTRAINT [FK_Author_Id]
GO

