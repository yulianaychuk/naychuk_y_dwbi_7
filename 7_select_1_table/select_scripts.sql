use master
go
create database [labor_sql];
go
use [labor_sql];
go

CREATE TABLE [laptop] (
	[code] int NOT NULL ,
	[model] varchar (50) NOT NULL ,
	[speed] smallint NOT NULL ,
	[ram] smallint NOT NULL ,
	[hd] real NOT NULL ,
	[price] decimal(8,2) NULL ,
	[screen] tinyint NOT NULL 
);

CREATE TABLE [pc] (
	[code] int NOT NULL ,
	[model] varchar (50) NOT NULL ,
	[speed] smallint NOT NULL ,
	[ram] smallint NOT NULL ,
	[hd] real NOT NULL ,
	[cd] varchar (10) NOT NULL ,
	[price] decimal(8,2) NULL 
);

CREATE TABLE [product] (
	[maker] varchar (10) NOT NULL ,
	[model] varchar (50) NOT NULL ,
	[type] varchar (50) NOT NULL 
);

CREATE TABLE [printer] (
	[code] int NOT NULL ,
	[model] varchar (50) NOT NULL ,
	[color] char (1) NOT NULL ,
	[type] varchar (10) NOT NULL ,
	[price] decimal(8,2) NULL 
);
go

ALTER TABLE [laptop] ADD 
	CONSTRAINT PK_laptop PRIMARY KEY  NONCLUSTERED 
	([code]);

ALTER TABLE [pc] ADD 
	CONSTRAINT PK_pc PRIMARY KEY  NONCLUSTERED 
	([code]);

ALTER TABLE [product]  ADD 
	CONSTRAINT PK_product PRIMARY KEY  NONCLUSTERED 
	([model]); 


ALTER TABLE [printer]  ADD 
	CONSTRAINT PK_printer PRIMARY KEY  NONCLUSTERED 
	([code]); 

ALTER TABLE [laptop] ADD 
	CONSTRAINT FK_laptop_product FOREIGN KEY ([model]) 
	REFERENCES [product] ([model]);

ALTER TABLE [pc] ADD 
	CONSTRAINT FK_pc_product FOREIGN KEY ([model]) 
	REFERENCES [product] ([model]);

ALTER TABLE [printer] ADD 
	CONSTRAINT FK_printer_product FOREIGN KEY ([model]) 
	REFERENCES [product] ([model]);
go

---[product]-----------------------------------------------
insert into [product] values('B','1121','pc');
insert into [product] values('A','1232','pc');
insert into [product] values('A','1233','pc');
insert into [product] values('E','1260','pc');
insert into [product] values('A','1276','printer');
insert into [product] values('D','1288','printer');
insert into [product] values('A','1298','laptop');
insert into [product] values('C','1321','laptop');
insert into [product] values('A','1401','printer');
insert into [product] values('A','1408','printer');
insert into [product] values('D','1433','printer');
insert into [product] values('E','1434','printer');
insert into [product] values('B','1750','laptop');
insert into [product] values('A','1752','laptop');
insert into [product] values('E','2111','pc');
insert into [product] values('E','2112','pc');
                                                                                                                                                                                                                                                                 
---[pc]------------------------------------------------------
insert into [pc] values(1,'1232',500,64,5,'12x',600);
insert into [pc] values(2,'1121',750,128,14,'40x',850);
insert into [pc] values(3,'1233',500,64,5,'12x',600);
insert into [pc] values(4,'1121',600,128,14,'40x',850);
insert into [pc] values(5,'1121',600,128,8,'40x',850);
insert into [pc] values(6,'1233',750,128,20,'50x',950);
insert into [pc] values(7,'1232',500,32,10,'12x',400);
insert into [pc] values(8,'1232',450,64,8,'24x',350);
insert into [pc] values(9,'1232',450,32,10,'24x',350);
insert into [pc] values(10,'1260',500,32,10,'12x',350);
insert into [pc] values(11,'1233',900,128,40,'40x',980);
                                                                                                                                                                                                                                                                 
---[laptop]--------------------------------------------------
insert into [laptop] values(1,'1298',350,32,4,700,11);
insert into [laptop] values(2,'1321',500,64,8,970,12);
insert into [laptop] values(3,'1750',750,128,12,1200,14);
insert into [laptop] values(4,'1298',600,64,10,1050,15);
insert into [laptop] values(5,'1752',750,128,10,1150,14);
insert into [laptop] values(6,'1298',450,64,10,950,12);
                                                                                                                                                                                                                                                                 
---[printer]---------------------------------------------------
insert into [printer] values(1,'1276','n','Laser',400);
insert into [printer] values(2,'1433','y','Jet',270);
insert into [printer] values(3,'1434','y','Jet',290);
insert into [printer] values(4,'1401','n','Matrix',150);
insert into [printer] values(5,'1408','n','Matrix',270);
insert into [printer] values(6,'1288','n','Laser',400);
go

CREATE TABLE [income] (
	[code] int NOT NULL ,
	[point] tinyint NOT NULL ,
	[date] datetime NOT NULL ,
	[inc] decimal(8,2) NOT NULL 
); 

CREATE TABLE [outcome] (
	[code]  int NOT NULL ,
	[point] tinyint NOT NULL ,
	[date]  datetime NOT NULL ,
	[out]   decimal(8,2) NOT NULL 
); 

CREATE TABLE [income_o] (
	[point] tinyint NOT NULL ,
	[date]  datetime NOT NULL ,
	[inc]   decimal(8,2) NOT NULL 
); 

CREATE TABLE [outcome_o] (
	[point] tinyint NOT NULL ,
	[date]  datetime NOT NULL ,
	[out]   decimal(8,2) NOT NULL 
); 
go

ALTER TABLE [income]  ADD 
	CONSTRAINT PK_Income PRIMARY KEY  NONCLUSTERED 
	([code]);   

ALTER TABLE [outcome]  ADD 
	CONSTRAINT PK_Outcome PRIMARY KEY  NONCLUSTERED 
	([code]);  

ALTER TABLE [income_o]  ADD 
	CONSTRAINT PK_Income_o PRIMARY KEY  NONCLUSTERED 
	([point], [date]);   

ALTER TABLE [outcome_o]  ADD 
	CONSTRAINT PK_Outcome_o PRIMARY KEY  NONCLUSTERED 
	([point], [date]);   
go   
                                                                                                                                                                                                                                                                 
---[income]---------------------------------------------------------
insert into [income] values(1,1,'2001-03-22 00:00:00.000',15000.00);
insert into [income] values(2,1,'2001-03-23 00:00:00.000',15000.00);
insert into [income] values(3,1,'2001-03-24 00:00:00.000',3600.00);
insert into [income] values(4,2,'2001-03-22 00:00:00.000',10000.00);
insert into [income] values(5,2,'2001-03-24 00:00:00.000',1500.00);
insert into [income] values(6,1,'2001-04-13 00:00:00.000',5000.00);
insert into [income] values(7,1,'2001-05-11 00:00:00.000',4500.00);
insert into [income] values(8,1,'2001-03-22 00:00:00.000',15000.00);
insert into [income] values(9,2,'2001-03-24 00:00:00.000',1500.00);
insert into [income] values(10,1,'2001-04-13 00:00:00.000',5000.00);
insert into [income] values(11,1,'2001-03-24 00:00:00.000',3400.00);
insert into [income] values(12,3,'2001-09-13 00:00:00.000',1350.00);
insert into [income] values(13,3,'2001-09-13 00:00:00.000',1750.00);
                                                                                                                                                                                                                                                                 
-----[outcome]-------------------------------------------------------- 
insert into [outcome] values(1,1,'2001-03-14 00:00:00.000',15348.00);
insert into [outcome] values(2,1,'2001-03-24 00:00:00.000',3663.00);
insert into [outcome] values(3,1,'2001-03-26 00:00:00.000',1221.00);
insert into [outcome] values(4,1,'2001-03-28 00:00:00.000',2075.00);
insert into [outcome] values(5,1,'2001-03-29 00:00:00.000',2004.00);
insert into [outcome] values(6,1,'2001-04-11 00:00:00.000',3195.04);
insert into [outcome] values(7,1,'2001-04-13 00:00:00.000',4490.00);
insert into [outcome] values(8,1,'2001-04-27 00:00:00.000',3110.00);
insert into [outcome] values(9,1,'2001-05-11 00:00:00.000',2530.00);
insert into [outcome] values(10,2,'2001-03-22 00:00:00.000',1440.00);
insert into [outcome] values(11,2,'2001-03-29 00:00:00.000',7848.00);
insert into [outcome] values(12,2,'2001-04-02 00:00:00.000',2040.00);
insert into [outcome] values(13,1,'2001-03-24 00:00:00.000',3500.00);
insert into [outcome] values(14,2,'2001-03-22 00:00:00.000',1440.00);
insert into [outcome] values(15,1,'2001-03-29 00:00:00.000',2006.00);
insert into [outcome] values(16,3,'2001-09-13 00:00:00.000',1200.00);
insert into [outcome] values(17,3,'2001-09-13 00:00:00.000',1500.00);
insert into [outcome] values(18,3,'2001-09-14 00:00:00.000',1150.00);
                                                                                                                                                                                                                                                                
---[income_o]---------------------------------------------------------
insert into [income_o] values(1,'2001-03-22 00:00:00.000',15000.00);
insert into [income_o] values(1,'2001-03-23 00:00:00.000',15000.00);
insert into [income_o] values(1,'2001-03-24 00:00:00.000',3400.00);
insert into [income_o] values(1,'2001-04-13 00:00:00.000',5000.00);
insert into [income_o] values(1,'2001-05-11 00:00:00.000',4500.00);
insert into [income_o] values(2,'2001-03-22 00:00:00.000',10000.00);
insert into [income_o] values(2,'2001-03-24 00:00:00.000',1500.00);
insert into [income_o] values(3,'2001-09-13 00:00:00.000',11500.00);
insert into [income_o] values(3,'2001-10-02 00:00:00.000',18000.00);
                                                                                                                                                                                                                                                                 
---[outcome_o]--------------------------------------------------------- 
insert into [outcome_o] values(1,'2001-03-14 00:00:00.000',15348.00);
insert into [outcome_o] values(1,'2001-03-24 00:00:00.000',3663.00);
insert into [outcome_o] values(1,'2001-03-26 00:00:00.000',1221.00);
insert into [outcome_o] values(1,'2001-03-28 00:00:00.000',2075.00);
insert into [outcome_o] values(1,'2001-03-29 00:00:00.000',2004.00);
insert into [outcome_o] values(1,'2001-04-11 00:00:00.000',3195.04);
insert into [outcome_o] values(1,'2001-04-13 00:00:00.000',4490.00);
insert into [outcome_o] values(1,'2001-04-27 00:00:00.000',3110.00);
insert into [outcome_o] values(1,'2001-05-11 00:00:00.000',2530.00);
insert into [outcome_o] values(2,'2001-03-22 00:00:00.000',1440.00);
insert into [outcome_o] values(2,'2001-03-29 00:00:00.000',7848.00);
insert into [outcome_o] values(2,'2001-04-02 00:00:00.000',2040.00);
insert into [outcome_o] values(3,'2001-09-13 00:00:00.000',1500.00);
insert into [outcome_o] values(3,'2001-09-14 00:00:00.000',2300.00);
insert into [outcome_o] values(3,'2002-09-16 00:00:00.000',2150.00);
go

CREATE TABLE [battles] (
	[name] varchar (20) NOT NULL ,
	[date] datetime NOT NULL 
); 

CREATE TABLE [classes] (
	[class]   varchar (50) NOT NULL ,
	[type]    varchar (2) NOT NULL ,
	[country] varchar (20) NOT NULL ,
	[numGuns] tinyint NULL ,
	[bore]    real NULL ,
	[displacement] int NULL 
); 

CREATE TABLE [ships] (
	[name]     varchar (50) NOT NULL ,
	[class]    varchar (50) NOT NULL ,
	[launched] smallint NULL 
); 

CREATE TABLE [outcomes] (
	[ship]   varchar (50) NOT NULL ,
	[battle] varchar (20) NOT NULL ,
	[result] varchar (10) NOT NULL 
); 

ALTER TABLE [battles] ADD 
	CONSTRAINT PK_battles PRIMARY KEY  CLUSTERED 
	([name]);   

ALTER TABLE [classes] ADD 
	CONSTRAINT PK_classes PRIMARY KEY  CLUSTERED 
	([class]);   

ALTER TABLE [ships] ADD 
	CONSTRAINT PK_ships PRIMARY KEY  CLUSTERED 
	([name]);   

ALTER TABLE [outcomes] ADD 
	CONSTRAINT PK_outcomes PRIMARY KEY  CLUSTERED 
	([ship], [battle]);   

ALTER TABLE [ships] ADD 
	CONSTRAINT FK_ships_Classes FOREIGN KEY ([class]) 
	REFERENCES [classes] ([class]);

ALTER TABLE [outcomes] ADD 
	CONSTRAINT FK_outcomes_battles FOREIGN KEY ([battle]) 
	REFERENCES [battles] ([name]);
                                                                                                                                                                                                                                                               
---[classes]--------------------------------------------------------
insert into [classes] values('Bismarck','bb','Germany',8,15,42000);
insert into [classes] values('Iowa','bb','USA',9,16,46000);
insert into [classes] values('Kon','bc','Japan',8,14,32000);
insert into [classes] values('North Carolina','bb','USA',12,16,37000);
insert into [classes] values('Renown','bc','Gt.Britain',6,15,32000);
insert into [classes] values('Revenge','bb','Gt.Britain',8,15,29000);
insert into [classes] values('Tennessee','bb','USA',12,14,32000);
insert into [classes] values('Yamato','bb','Japan',9,18,65000);
                                                                                                                                                                                                                                                                 
---[battles]----------------------------------------------------------
insert into [battles] values('Guadalcanal','1942-11-15 00:00:00.000');
insert into [battles] values('North Atlantic','1941-05-25 00:00:00.000');
insert into [battles] values('North Cape','1943-12-26 00:00:00.000');
insert into [battles] values('Surigao Strait','1944-10-25 00:00:00.000');
insert into [battles] values ('#Cuba62a'   , '1962-10-20');
insert into [battles] values ('#Cuba62b'   , '1962-10-25');
                                                                                                                                                                                                                                                                 
---[ships]-------------------------------------------------------------
insert into [ships] values('California','Tennessee',1921);
insert into [ships] values('Haruna','Kon',1916);
insert into [ships] values('Hiei','Kon',1914);
insert into [ships] values('Iowa','Iowa',1943);
insert into [ships] values('Kirishima','Kon',1915);
insert into [ships] values('Kon','Kon',1913);
insert into [ships] values('Missouri','Iowa',1944);
insert into [ships] values('Musashi','Yamato',1942);
insert into [ships] values('New Jersey','Iowa',1943);
insert into [ships] values('North Carolina','North Carolina',1941);
insert into [ships] values('Ramillies','Revenge',1917);
insert into [ships] values('Renown','Renown',1916);
insert into [ships] values('Repulse','Renown',1916);
insert into [ships] values('Resolution','Renown',1916);
insert into [ships] values('Revenge','Revenge',1916);
insert into [ships] values('Royal Oak','Revenge',1916);
insert into [ships] values('Royal Sovereign','Revenge',1916);
insert into [ships] values('Tennessee','Tennessee',1920);
insert into [ships] values('Washington','North Carolina',1941);
insert into [ships] values('Wisconsin','Iowa',1944);
insert into [ships] values('Yamato','Yamato',1941);
insert into [ships] values('South Dakota','North Carolina',1941); 
                                                                                                                                                                                                                                                             
---[outcomes]------------------------------------------------------
insert into [outcomes] values('Bismarck','North Atlantic','sunk');
insert into [outcomes] values('California','Surigao Strait','OK');
insert into [outcomes] values('Duke of York','North Cape','OK');
insert into [outcomes] values('Fuso','Surigao Strait','sunk');
insert into [outcomes] values('Hood','North Atlantic','sunk');
insert into [outcomes] values('King George V','North Atlantic','OK');
insert into [outcomes] values('Kirishima','Guadalcanal','sunk');
insert into [outcomes] values('Prince of Wales','North Atlantic','damaged');
insert into [outcomes] values('Rodney','North Atlantic','OK');
insert into [outcomes] values('Schamhorst','North Cape','sunk');
insert into [outcomes] values('South Dakota','Guadalcanal','damaged');
insert into [outcomes] values('Tennessee','Surigao Strait','OK');
insert into [outcomes] values('Washington','Guadalcanal','OK');
insert into [outcomes] values('West Virginia','Surigao Strait','OK');
insert into [outcomes] values('Yamashiro','Surigao Strait','sunk');
insert into [outcomes] values('California','Guadalcanal','damaged');


CREATE TABLE [company] (
	[id_comp] int NOT NULL ,
	[name]    char (10) NOT NULL 
);

CREATE TABLE [pass_in_trip] (
	[trip_no] int NOT NULL ,
	[date]    datetime NOT NULL ,
	[id_psg]  int NOT NULL ,
	[place]   char (10) NOT NULL 
);

CREATE TABLE [passenger] (
	[id_psg] int NOT NULL ,
	[name]   char (20) NOT NULL 
);

CREATE TABLE [trip] (
	[trip_no] int NOT NULL ,
	[id_comp] int NOT NULL ,
	[plane] char (10) NOT NULL ,
	[town_from] char (25) NOT NULL ,
	[town_to] char (25) NOT NULL ,
	[time_out] datetime NOT NULL ,
	[time_in] datetime NOT NULL 
);

ALTER TABLE company ADD 
	CONSTRAINT PK2 PRIMARY KEY  CLUSTERED 
	([id_comp]);   

ALTER TABLE pass_in_trip ADD 
	CONSTRAINT PK_pt PRIMARY KEY  CLUSTERED 
	([trip_no], [date], [id_psg]);   

ALTER TABLE passenger ADD 
	CONSTRAINT PK_psg PRIMARY KEY  CLUSTERED 
	([id_psg]);   

ALTER TABLE Trip ADD 
	CONSTRAINT PK_t PRIMARY KEY  CLUSTERED 
	([trip_no]);   

ALTER TABLE Pass_in_trip ADD 
	CONSTRAINT FK_pass_in_trip_passenger FOREIGN KEY 
	([id_psg]) REFERENCES Passenger ([id_psg]);
ALTER TABLE Pass_in_trip ADD     
	CONSTRAINT FK_pass_in_trip_trip FOREIGN KEY 
	([trip_no]) REFERENCES Trip ([trip_no]);
 
ALTER TABLE trip ADD 
	CONSTRAINT FK_trip_company FOREIGN KEY ([id_comp]) 
	REFERENCES [company] ([id_comp]);
                                                                                                                                                                                                                                                                 
---[company]--------------------------------
insert into [company] values(1,'Don_avia  ');
insert into [company] values(2,'Aeroflot  ');
insert into [company] values(3,'Dale_avia ');
insert into [company] values(4,'air_France');
insert into [company] values(5,'British_AW');
                                                                                                                                                                                                                                                                 
---Passenger-------------------------------------------
insert into [passenger] values(1,'Bruce Willis        ');
insert into [passenger] values(2,'George Clooney      ');
insert into [passenger] values(3,'Kevin Costner       ');
insert into [passenger] values(4,'Donald Sutherland   ');
insert into [passenger] values(5,'Jennifer Lopez      ');
insert into [passenger] values(6,'Ray Liotta          ');
insert into [passenger] values(7,'Samuel L. Jackson   ');
insert into [passenger] values(8,'Nikole Kidman       ');
insert into [passenger] values(9,'Alan Rickman        ');
insert into [passenger] values(10,'Kurt Russell        ');
insert into [passenger] values(11,'Harrison Ford       ');
insert into [passenger] values(12,'Russell Crowe       ');
insert into [passenger] values(13,'Steve Martin        ');
insert into [passenger] values(14,'Michael Caine       ');
insert into [passenger] values(15,'Angelina Jolie      ');
insert into [passenger] values(16,'Mel Gibson          ');
insert into [passenger] values(17,'Michael Douglas     ');
insert into [passenger] values(18,'John Travolta       ');
insert into [passenger] values(19,'Sylvester Stallone  ');
insert into [passenger] values(20,'Tommy Lee Jones     ');
insert into [passenger] values(21,'Catherine Zeta-Jones');
insert into [passenger] values(22,'Antonio Banderas    ');
insert into [passenger] values(23,'Kim Basinger        ');
insert into [passenger] values(24,'Sam Neill           ');
insert into [passenger] values(25,'Gary Oldman         ');
insert into [passenger] values(26,'Clint Eastwood      ');
insert into [passenger] values(27,'Brad Pitt           ');
insert into [passenger] values(28,'Johnny Depp         ');
insert into [passenger] values(29,'Pierce Brosnan      ');
insert into [passenger] values(30,'Sean Connery        ');
insert into [passenger] values(31,'Bruce Willis        ');
insert into [passenger] values(37,'Mullah Omar         ');
                                                                                                                                                                                                                                                                 
---[trip]-------------------------------------------------------------------------------------------------------------------------------------------------
insert into [trip] values(1100,4,'Boeing    ','Rostov                   ','Paris                    ','1900-01-01 14:30:00.000','1900-01-01 17:50:00.000');
insert into [trip] values(1101,4,'Boeing    ','Paris                    ','Rostov                   ','1900-01-01 08:12:00.000','1900-01-01 11:45:00.000');
insert into [trip] values(1123,3,'TU-154    ','Rostov                   ','Vladivostok              ','1900-01-01 16:20:00.000','1900-01-01 03:40:00.000');
insert into [trip] values(1124,3,'TU-154    ','Vladivostok              ','Rostov                   ','1900-01-01 09:00:00.000','1900-01-01 19:50:00.000');
insert into [trip] values(1145,2,'IL-86     ','Moscow                   ','Rostov                   ','1900-01-01 09:35:00.000','1900-01-01 11:23:00.000');
insert into [trip] values(1146,2,'IL-86     ','Rostov                   ','Moscow                   ','1900-01-01 17:55:00.000','1900-01-01 20:01:00.000');
insert into [trip] values(1181,1,'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 06:12:00.000','1900-01-01 08:01:00.000');
insert into [trip] values(1182,1,'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 12:35:00.000','1900-01-01 14:30:00.000');
insert into [trip] values(1187,1,'TU-134    ','Rostov                   ','Moscow                   ','1900-01-01 15:42:00.000','1900-01-01 17:39:00.000');
insert into [trip] values(1188,1,'TU-134    ','Moscow                   ','Rostov                   ','1900-01-01 22:50:00.000','1900-01-01 00:48:00.000');
insert into [trip] values(1195,1,'TU-154    ','Rostov                   ','Moscow                   ','1900-01-01 23:30:00.000','1900-01-01 01:11:00.000');
insert into [trip] values(1196,1,'TU-154    ','Moscow                   ','Rostov                   ','1900-01-01 04:00:00.000','1900-01-01 05:45:00.000');
insert into [trip] values(7771,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 01:00:00.000','1900-01-01 11:00:00.000');
insert into [trip] values(7772,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 12:00:00.000','1900-01-01 02:00:00.000');
insert into [trip] values(7773,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 03:00:00.000','1900-01-01 13:00:00.000');
insert into [trip] values(7774,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 14:00:00.000','1900-01-01 06:00:00.000');
insert into [trip] values(7775,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 09:00:00.000','1900-01-01 20:00:00.000');
insert into [trip] values(7776,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 18:00:00.000','1900-01-01 08:00:00.000');
insert into [trip] values(7777,5,'Boeing    ','London                   ','Singapore                ','1900-01-01 18:00:00.000','1900-01-01 06:00:00.000');
insert into [trip] values(7778,5,'Boeing    ','Singapore                ','London                   ','1900-01-01 22:00:00.000','1900-01-01 12:00:00.000');
insert into [trip] values(8881,5,'Boeing    ','London                   ','Paris                    ','1900-01-01 03:00:00.000','1900-01-01 04:00:00.000');
insert into [trip] values(8882,5,'Boeing    ','Paris                    ','London                   ','1900-01-01 22:00:00.000','1900-01-01 23:00:00.000');
                                                                                                                                                                                                                                                                
---[pass_in_trip]----------------------------------------------------------------
insert into [pass_in_trip] values(1100,'2003-04-29 00:00:00.000',1,'1a        ');
insert into [pass_in_trip] values(1123,'2003-04-05 00:00:00.000',3,'2a        ');
insert into [pass_in_trip] values(1123,'2003-04-08 00:00:00.000',1,'4c        ');
insert into [pass_in_trip] values(1123,'2003-04-08 00:00:00.000',6,'4b        ');
insert into [pass_in_trip] values(1124,'2003-04-02 00:00:00.000',2,'2d        ');
insert into [pass_in_trip] values(1145,'2003-04-05 00:00:00.000',3,'2c        ');
insert into [pass_in_trip] values(1181,'2003-04-01 00:00:00.000',1,'1a        ');
insert into [pass_in_trip] values(1181,'2003-04-01 00:00:00.000',6,'1b        ');
insert into [pass_in_trip] values(1181,'2003-04-01 00:00:00.000',8,'3c        ');
insert into [pass_in_trip] values(1181,'2003-04-13 00:00:00.000',5,'1b        ');
insert into [pass_in_trip] values(1182,'2003-04-13 00:00:00.000',5,'4b        ');
insert into [pass_in_trip] values(1187,'2003-04-14 00:00:00.000',8,'3a        ');
insert into [pass_in_trip] values(1188,'2003-04-01 00:00:00.000',8,'3a        ');
insert into [pass_in_trip] values(1182,'2003-04-13 00:00:00.000',9,'6d        ');
insert into [pass_in_trip] values(1145,'2003-04-25 00:00:00.000',5,'1d        ');
insert into [pass_in_trip] values(1187,'2003-04-14 00:00:00.000',10,'3d        ');
insert into [pass_in_trip] values(8882,'2005-11-06 00:00:00.000',37,'1a        '); 
insert into [pass_in_trip] values(7771,'2005-11-07 00:00:00.000',37,'1c        '); 
insert into [pass_in_trip] values(7772,'2005-11-07 00:00:00.000',37,'1a        '); 
insert into [pass_in_trip] values(8881,'2005-11-08 00:00:00.000',37,'1d        '); 
insert into [pass_in_trip] values(7778,'2005-11-05 00:00:00.000',10,'2a        '); 
insert into [pass_in_trip] values(7772,'2005-11-29 00:00:00.000',10,'3a        ');
insert into [pass_in_trip] values(7771,'2005-11-04 00:00:00.000',11,'4a        ');
insert into [pass_in_trip] values(7771,'2005-11-07 00:00:00.000',11,'1b        ');
insert into [pass_in_trip] values(7771,'2005-11-09 00:00:00.000',11,'5a        ');
insert into [pass_in_trip] values(7772,'2005-11-07 00:00:00.000',12,'1d        ');
insert into [pass_in_trip] values(7773,'2005-11-07 00:00:00.000',13,'2d        ');
insert into [pass_in_trip] values(7772,'2005-11-29 00:00:00.000',13,'1b        ');
insert into [pass_in_trip] values(8882,'2005-11-13 00:00:00.000',14,'3d        ');
insert into [pass_in_trip] values(7771,'2005-11-14 00:00:00.000',14,'4d        ');
insert into [pass_in_trip] values(7771,'2005-11-16 00:00:00.000',14,'5d        ');
insert into [pass_in_trip] values(7772,'2005-11-29 00:00:00.000',14,'1c        ');
----------------------------------------------------------------------------------

use labor_sql
go
---------------------------
-----------23--------------
select trip_no,town_from,town_to
from trip
where town_from ='London' 
union all
select trip_no,town_from,town_to
from trip
where town_to ='London'
---------------------------
------------24-------------
select trip_no, plane, town_from, town_to
from trip
where plane ='TU-134'
order by time_out desc
---------------------------
-----------25--------------
select trip_no, plane, town_from, town_to
from trip
where plane not in('IL-86')
order by plane
---------------------------
-----------26--------------
select trip_no,town_from,town_to
from trip
where town_from not like 'Rostov' and town_to not like 'Rostov'
---------------------------
-----------34--------------
select * from trip
where time_out between '12:00:00' and '17:00:00'

---------------------------
-----------35--------------
select * from trip
where time_in between '17:00:00' and '23:00:00'

---------------------------
-----------36--------------
select * from trip
where time_in between '00:00:01'and'10:00:00'  or time_in between '21:00:00' and '23:59:59' 

---------------------------
-----------37--------------
select * from pass_in_trip
where place like '1%'

---------------------------
-----------38--------------
select * from pass_in_trip
where place like '%c'

---------------------------
-----------39--------------
select * from passenger
where name like '% c%'
---------------------------
-----------40--------------
select * from passenger
where name not like '% j%'
---------------------------
-----------45--------------
declare @PrintNumber nvarchar(50)
	DECLARE @PrintPlace nvarchar(50); 
	declare @number  char(10)=(select top(1) SUBSTRING(place,1,1) as number from pass_in_trip) 
	declare @place  char(10)=(select top(1) SUBSTRING(place,2,1) as place from pass_in_trip) 
SET @PrintNumber = N'��� = '   
	+RTRIM(CAST(@number AS varchar(30)))
	PRINT @PrintNumber; 
	SET @PrintPlace = N'���� = ' 
	+RTRIM(CAST(@place AS varchar(30))) 
PRINT @PrintPlace;  
GO 

---------------------------
-----------46--------------
--��������--
---------------------------
-----------47--------------
select CONCAT(trip_no,'-', id_comp,'-',
SUBSTRING(plane, 1, 1),SUBSTRING(plane, 5, 1),
SUBSTRING(town_from, 1, 1),SUBSTRING(town_from, 10, 1),
SUBSTRING(town_from, 1, 1),SUBSTRING(town_from, 10, 1),
SUBSTRING(town_to, 1, 1),SUBSTRING(town_to, 10, 1),
time_out,'-', time_in,'-') as association
from trip

---------------------------
-----------49--------------
select distinct town_from,town_to,count(town_from) + count(town_to) as count_all
from trip  
group by town_from,town_to
---------------------------
-----------52--------------

select (time_in - time_out) as flight_time 
from trip

---------------------------
-----------54--------------

select distinct trip_no,place ,count(place) as C_P from pass_in_trip
group by trip_no,place
---------------------------
-----------55--------------
select count(name) as Count_name from passenger
where name like '% [S,B,A]%' 

------------------------------------------------------

----------------1-----------------
select maker, type
from product
where type ='laptop'
order by maker asc
-----------------------------------
----------------2------------------
select model, ram, screen, price
from laptop 
where price > '1000'
order by ram asc, price desc
-------------------------------------
----------------3----------------
select * 
from printer 
where color = 'y'
order by price desc
----------------4---------------
Select model, speed, hd
from PC
where cd in ('12x','24x') and price < 600
order by speed desc
-------------------------------------------
--5-th in presentation is for ships--
----------------6---------------
select * 
from pc
where speed >= 500 and price < 800
order by price desc
-------------------------------------------
----------------7--------------
select *
from printer
where [type] != 'Matrix' and price < 300
order by [type] desc
-----------------------------------------
----------------8------------
select model, speed
from pc
where price  between 400 and 600
order by hd asc
-----------------------------------------
----------------9----------------
select model, speed, hd, price
from laptop
where screen >= 12
order by price desc
-------------------------------------------
------------------10-----------------------
select model, type, price
from printer
where price < 300
order by type desc
-------------------------------------------
------------------11-----------------------
select model, ram, price
from laptop
where ram = 64
order by screen asc 
-------------------------------------------
------------------12-----------------------
select model, ram, price
from pc
where ram > 64
order by hd asc
--------------------------------------------
-------------------13------------------------
select model, speed, price
from pc
where speed between 500 and 750
order by hd desc
---------------------------------------------
-------------------27------------------------
select model
from pc									
where model like '%1%1%'							 
----------------------------------------------
-------------------41------------------------


	DECLARE @PrintMessage nvarchar(50); 
	declare @price  decimal(8,2)=(select avg(price) as AVG_Price from laptop) 
SET @PrintMessage = N'avg price = '   
	+RTRIM(CAST(@price AS nvarchar(30)))
    + N'.';  
PRINT @PrintMessage;  
GO 


 
----------------------------------------------
-------------------42------------------------- 
	DECLARE @Printmodel nvarchar(50); 
	DECLARE @Printspeed nvarchar(50);
	DECLARE @Printram nvarchar(50);
	DECLARE @Printhd nvarchar(50);
	DECLARE @Printcd nvarchar(50);
	DECLARE @Printprice nvarchar(50);
	DECLARE @model varchar (50)=(select top(1)model from pc)
	DECLARE @speed smallint =(select top(1)speed from pc)
	DECLARE @ram smallint =(select top(1)ram from pc)
	DECLARE @hd real =(select top(1)hd from pc)
	DECLARE @cd varchar (10) =(select top(1)cd from pc) 
	DECLARE @price decimal(8,2)  =(select top(1)price from pc)
SET @Printmodel = N'������ = ' 
+RTRIM(CAST(@model AS nvarchar(30)))
PRINT @Printmodel;  
SET @Printspeed = N'�������� = ' 
+RTRIM(CAST(@speed AS nvarchar(30)))
PRINT @Printspeed; 
SET @Printram = N'��� ����� = ' 
+RTRIM(CAST(@ram AS nvarchar(30)))
PRINT @Printram; 
SET @Printhd = N'����� ����� = ' 
+RTRIM(CAST(@hd AS nvarchar(30)))
PRINT @Printhd; 
SET @Printcd = N'��� CD ������� = ' 
+RTRIM(CAST(@cd AS nvarchar(30))) 
PRINT @Printcd; 
SET @Printprice = N'���� = '  
	+RTRIM(CAST(@price AS nvarchar(30)))
    + N'.';  
PRINT @Printprice;  
GO 								


-----------------------------------------------
-------------------48--------------------------
select maker,count(model) as count_model from product
where type ='pc'
group by maker
having count(model)>=2

-----------------------------------------------
-------------------50--------------------------
select type ,count(model) as count_model from printer
group by type

------------------------------------------------
-------------------51--------------------------
select  distinct cd as count_cd,count(model) as count_model  
from pc
group by cd
------------------------------------------------

use labor_sql
go
-----------------------------
-------------5---------------
select name,class from ships
where name=class
order by name
-----------------------------
------------18---------------
select * from classes
where country='japan'
order by type desc
-----------------------------
------------19---------------
select name,launched
from ships
where launched between 1920 and 1942
order by launched desc
-----------------------------
------------20---------------
select * from outcomes
where battle='guadalcanal' and result in('damaged','ok')
order by ship desc
-----------------------------
------------21---------------
select * from outcomes
where  result= 'sunk'
order by ship desc
-----------------------------
------------22---------------
select class,displacement from classes
where displacement >= 40000
order by type
-----------------------------
------------30---------------
select name from ships
where name like 'W%n'
-----------------------------
------------31---------------
select name from ships
where name like '%e%e%'
-----------------------------
------------32---------------
select name ,launched from ships
where name not like '%e'
-----------------------------
------------33---------------
select name from battles
where name like '% %' and name not like '%c'
-----------------------------
------------44---------------
select ship,battle,result,
case result 
when 'sunk' then '����������'
when 'OK' then '�����'
else '�����������'
end as result
from outcomes

------------------------------------------------------------------------

-------------14------------
select out
from outcome_o
where out > 2000
order by [date] desc
---------------------------
-------------15------------
select inc
from income_o
where inc between 5000 and 10000
order by inc
---------------------------
-------------16------------
select *
from income
where point = 1
order by inc
---------------------------
-------------17------------
select *
from outcome
where point = 2
order by out
---------------------------
-------------28------------
select *
from outcome
where DATEPART(mm, date) = 03
---------------------------
-------------29------------
SELECT * FROM outcome_o where DATEPART(dd, date) = 14
---------------------------
-------------43------------
select code,point, CAST ([date] AS date)as [date],inc from income
--------------------------
-------------53------------
-------------53------------
create view point_sum as
select distinct point,sum(out) as sum_out from outcome
group by point

create view date_sum as 
select distinct date ,sum(out) as sum_out from outcome
group by date

select min(sum_out) as Min_out,max(sum_out) as Max_out from point_sum
 

select min(sum_out) as Min_out,max(sum_out) as Max_out from date_sum

drop view if exists point_sum

drop view if exists date_sum

--------------------------
























