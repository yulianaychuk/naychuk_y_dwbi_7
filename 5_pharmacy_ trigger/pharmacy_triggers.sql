USE [master]
GO

CREATE DATABASE [farmacy_db]
GO
USE [farmacy_db]
GO

CREATE TABLE [employee](
    id                 INT               IDENTITY(1,1),
    surname            VARCHAR(30)       NOT NULL,
    name               CHAR(30)          NOT NULL,
    midle_name         VARCHAR(30),
    identity_number    CHAR(10),
    passport           CHAR(10),
    experience         DECIMAL(10, 1),
    birthday           DATE,
    post               VARCHAR(15)       NOT NULL,
    pharmacy_id        INT,
    PRIMARY KEY (id)
)

CREATE TABLE [medicine](
    id               INT            IDENTITY(1,1),
    name             VARCHAR(30)    NOT NULL,
    ministry_code    CHAR(10),
    recipe           BIT,
    narcotic         BIT,
    psychotropic     BIT,
    PRIMARY KEY (id)
)

CREATE TABLE [medicine_zone](
    medicine_id    INT    NOT NULL,
    zone_id        INT    NOT NULL,
    PRIMARY KEY (medicine_id, zone_id)
)

CREATE TABLE [pharmacy](
    id                 INT            IDENTITY(1,1),
    name               VARCHAR(15)    NOT NULL,
    building_number    VARCHAR(10),
    www                VARCHAR(40),
    work_time          TIME,
    saturday           BIT,
    sunday             BIT,
    street             VARCHAR(25),
    PRIMARY KEY (id)
)

CREATE TABLE [pharmacy_medicine](
    pharmacy_id    INT    NOT NULL,
    medicine_id    INT    NOT NULL,
    PRIMARY KEY (pharmacy_id, medicine_id)
)

CREATE TABLE [post](
    post    VARCHAR(15)    NOT NULL,
    PRIMARY KEY (post)
)

CREATE TABLE [street](
    street    VARCHAR(25)    NOT NULL,
    PRIMARY KEY (street)
)

CREATE TABLE [zone](
    id      INT            IDENTITY(1,1),
    name    VARCHAR(25)    NOT NULL,
    PRIMARY KEY (id)
)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
----insert data---

insert into dbo.employee (surname, name, midle_name, identity_number, passport, experience, birthday, post , pharmacy_id) 
values 
('Naychuk', 'Yuliya', Null, 1, 1111111111, 1, '1985-01-28', 'developer', 9),
('Batrshyn', 'Maryana', Null, 2, 222222222, 1, '1985-05-22', 'developer', 7),
('Hudzyk', 'Tetyana', Null, 3, 333333333, 1, '1963-03-24', 'director', 10),
('Dytynyak', 'Olha', Null, 4, 444444444, 1, '1987-03-08', 'worker', 1);

insert into dbo.medicine (name, ministry_code,  recipe, narcotic , psychotropic) 
values 
('tonzilotren', '1111111111', 0, 0, 0),
('khlorhexydyn', '2222222222', 0, 0, 0),
('nurofen', '3333333333', 0, 0, 0),
('vyhillya', '4444444444', 1, 1, 1);

insert into dbo.medicine_zone (medicine_id, zone_id) 
values 
(1, 1),
(2, 2),
(3, 3),
(4, 4);

insert into dbo.zone (name) 
values 
('throat'),
('general'),
('heart'),
('stomach');

insert into dbo.pharmacy(name, building_number,  www, work_time , saturday, sunday,street) 
values 
('Pharm1', '1', 'www.pharmacy.com', '08:00:22:00' , 1,1, 'Vyhovskoho'),
('Pharm2', '2',  'www.pharmacy.com', '08:00:22:00', 1,1, 'Bandery'),
('Pharm3', '3', 'www.pharmacy.com', '08:00:22:00', 1,1, 'Volodymyra Velykoho');

insert into dbo.pharmacy_medicine (pharmacy_id, medicine_id) 
values 
(1, 1),
(2, 2),
(3, 4);

insert into [post] 
values 
('director'),
('developer'),
('worker');

insert into street
values 
('Vyhovskoho'),
('Bandery'),
('Volodymyra Velykoho'),
('Chornovola');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--create triggers-- 


 ---TRIGGER UPDATE_POST ON DBO.POST---
create trigger update_post on dbo.post
after update
as 
if update (post)  
begin
print 'trigger update_post on dbo.post'
rollback transaction 
end

update dbo.post
set  post = '5'
where post = 'developer'


create trigger name on employee
after insert
as
declare @identity_number char(10)
select @identity_number=identity_number from inserted
if @identity_number like '%00'
        begin
	print 'Identity_number not ending 00 trigger'
	rollback transaction
       end

	   insert into employee (surname,name,midle_name,identity_number,passport,experience, birthday,post, pharmacy_id) 
	   values
	   ('Harasym','Yaroslav',Null,'7777777700','7777777777','100.0','2000-01-01','developer',1);
--------------------------------------------------------------------------------------------------------------------------------------------------------------
create trigger min_cod on medicine
after insert, update
as
	begin
		if exists(select * from inserted where ministry_code not like '[A-Z][A-Z]-[0-9][0-9][0-9]-[0-9][0-9]' or ministry_code like '[MP][MP]%')
			begin
				print 'min_cod on medicine trigger without M, P'
				rollback transaction
			end
	end

	insert into medicine (name,ministry_code,recipe,narcotic,psychotropic)values
	('korvalment','MP-111-11',1,1,1);

-------------------------------------------------------------------------------------------------------------------------------------------------------------
-----script for create table by cursor----
use farmacy_db;

declare @id as int, @surname as varchar(30),@name as varchar(30);
declare @sql_script as varchar(max);
declare @column_number as int;
declare @counter as int;
declare @table_name as varchar(100);
declare @type as varchar(10)


declare employee_full_name cursor
for 
	select id,surname,name from employee;

open employee_full_name;

fetch next from employee_full_name into @id,@surname,@name;
while @@fetch_status=0
	begin
		set @table_name=@surname+rtrim(@name)+cast(@id as varchar(3))
		set @sql_script='DROP TABLE IF EXISTS '+@table_name +' CREATE TABLE '
		set @counter=1;
		set @column_number=ABS(CHECKSUM(NEWID()))%9+1;
		set @sql_script=@sql_script+@table_name+'('
		while @counter<=@column_number
			begin
				if @counter%2=0
					  set @type='int'
				else
					  set @type='char(10)'					
				set @sql_script=@sql_script+'column'+cast(@counter as varchar(3))+' '+@type+','
				set @counter+=1;
			end;
		set @sql_script=left(@sql_script,len(@sql_script)-1)+')'
		exec(@sql_script);
		fetch next from employee_full_name into @id,@surname,@name;
	end;
close employee_full_name;
deallocate employee_full_name;

----script for dynamically creating tables-----
use farmacy_db;

declare @table1_name as char(18), @table2_name as char(18);
declare @sql_script_1 as varchar(max), @sql_script_2 as varchar(max);
declare @table_definition as varchar(max);
declare @row as varchar(max);
DECLARE @row_definition as varchar(max);

--column for new 2 tables
set @table_definition='(id INT NOT NULL, surname VARCHAR(30) NOT NULL, name CHAR(30) NOT NULL, midle_name VARCHAR(30),
    identity_number CHAR(10), passport CHAR(10), experience DECIMAL(10, 1), birthday DATE,
    post VARCHAR(15) NOT NULL, pharmacy_id INT)';

set @row_definition='(id,surname,name,midle_name,identity_number,passport,experience,birthday,post,pharmacy_id)'

--tables name
set @table1_name='[table_1_'+cast(cast(current_timestamp as time(0)) as char(8))+']';
set @table2_name='[table_2_'+cast(cast(current_timestamp as time(0)) as char(8))+']';

set @sql_script_1='create table '+ @table1_name + @table_definition +' '+
				'create table ' + @table2_name + @table_definition+';';

exec(@sql_script_1);

---from  employee insert rows into the following tables,with random distribution of lines between tables
--declare the variables for the cursor
declare @id as INT,@surname as VARCHAR(30),@name as CHAR(30),@midle_name as VARCHAR(30)
declare	@identity_number as CHAR(10),@passport as CHAR(10), @experience as DECIMAL(10, 1)
declare @birthday as DATE, @post as VARCHAR(15),@pharmacy_id as INT;

--declare cursor
declare cursor_for_rand_insertion cursor
for
	SELECT id,surname,name,midle_name,identity_number,
		   passport,experience,birthday,post,pharmacy_id
	FROM employee;

open cursor_for_rand_insertion;
fetch next from cursor_for_rand_insertion into @id,@surname,@name,@midle_name,
											  @identity_number,@passport,@experience,
											  @birthday,@post,@pharmacy_id;



while @@FETCH_STATUS=0
	begin
		set @row=RTRIM(cast(@id as varchar(3)))+','+''''+RTRIM(@surname)+''''+','+''''+RTRIM(@name)+''''+','
			+''''+RTRIM(@midle_name)+''''+','+''''+RTRIM(@identity_number)+''''+','
			+''''+RTRIM(@passport)+''''+','+RTRIM(cast(@experience as varchar(3)))+','+
			''''+RTRIM(cast(@birthday AS VARCHAR(10)))+''''+','
			+''''+RTRIM(@post)+''''+','+RTRIM(cast(@pharmacy_id as varchar(3)))

		if rand()>0.5
			begin
				set @sql_script_2='insert into '+@table1_name+@row_definition+' values('+@row+')'
			end
		else
			begin
				set @sql_script_2='insert into '+@table2_name+@row_definition+' values('+@row+')'
			end
		exec(@sql_script_2)

		fetch next from cursor_for_rand_insertion into @id,@surname,@name,@midle_name,
											  @identity_number,@passport,@experience,
											  @birthday,@post,@pharmacy_id;
	end
close cursor_for_rand_insertion;
deallocate cursor_for_rand_insertion;












