USE [Y_Naychuk_Library]
GO

select * from [Y_Naychuk_L].[Authors]

ALTER TABLE [Y_Naychuk_L].[Authors]
ADD 
birthday DATE NULL,
book_amount INT NOT NULL DEFAULT 0 CHECK (book_amount > = 0),
issue_amount INT NOT NULL DEFAULT 0 CHECK(issue_amount >= 0),
total_edition INT NOT NULL DEFAULT 0 CHECK(total_edition >= 0)
GO

ALTER TABLE [Y_Naychuk_L].[BooksAuthors]
DROP CONSTRAINT [FK_ISBN]

ALTER TABLE [Y_Naychuk_L].[Books]
DROP CONSTRAINT [PK_Books]
GO

ALTER TABLE [Y_Naychuk_L].[Books]
ADD 
title VARCHAR(50) NOT NULL DEFAULT 'Title',
edition INT NOT NULL DEFAULT 1 CHECK(edition >= 1),
published DATE NULL,
issue INT NOT NULL DEFAULT 0

ALTER TABLE [Y_Naychuk_L].[Books]
ADD CONSTRAINT [PK_Books] PRIMARY KEY ([ISBN],[issue])
GO


ALTER TABLE [Y_Naychuk_L].[Publishers]
ADD
created DATE NOT NULL DEFAULT '1900-01-01',
country VARCHAR(20) NOT NULL DEFAULT 'USA',
City VARCHAR(20) NOT NULL DEFAULT 'NY',
book_amount INT NOT NULL DEFAULT 0 CHECK (book_amount >= 0),
issue_amount INT NOT NULL DEFAULT 0 CHECK (issue_amount >= 0),
total_edition INT NOT NULL DEFAULT 0 CHECK (total_edition >= 0)
GO

ALTER TABLE [Y_Naychuk_L].[Authors_log]
ADD
book_amount_old INT NULL,
issue_amount_old INT NULL,
total_edition_old INT NULL,
book_amount_new INT NULL,
issue_amount_new INT NULL,
total_edition_new INT NULL
GO

ALTER TABLE [Y_Naychuk_L].[BooksAuthors]
ADD
issue INT NOT NULL DEFAULT 0
GO

ALTER TABLE [Y_Naychuk_L].[BooksAuthors]
ADD 
CONSTRAINT [[FK_ISBN] 
FOREIGN KEY(ISBN,issue)
REFERENCES [Y_Naychuk_L].[Books]([ISBN],[issue])
ON UPDATE CASCADE
ON DELETE NO ACTION
GO
