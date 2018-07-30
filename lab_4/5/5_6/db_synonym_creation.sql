USE [Y_Naychuk_Library]
go


drop synonym if exists  Y_Naychuk_L.Publishers_Library_synonym 
go
create synonym Y_Naychuk_L.Publishers_Library_synonym for Y_Naychuk_L.Publishers
go


drop synonym if exists  Y_Naychuk_L.Authors_log_Library_synonym 
go
create synonym Y_Naychuk_L.Authors_log_Library_synonym for Y_Naychuk_L.Authors_log
go


drop synonym if exists Y_Naychuk_L.Authors_Library_synonym 
go
create synonym Y_Naychuk_L.Authors_Library_synonym for Y_Naychuk_L.Authors
go


drop synonym if exists Y_Naychuk_L.Books_Library_synonym 
go
create synonym Y_Naychuk_L.Books_Library_synonym for Y_Naychuk_L.Books
go


drop synonym if exists Y_Naychuk_L.BooksAuthors_Library_synonym 
go
create synonym Y_Naychuk_L.BooksAuthors_Library_synonym for Y_Naychuk_L.BooksAuthors
go
