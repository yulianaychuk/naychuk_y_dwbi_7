USE [Grocery_goods_store]
GO
/****** Object:  Table [dbo].[address]    Script Date: 11.07.2018 17:03:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[id] [int] NOT NULL,
	[country_id] [int] NULL,
	[city] [nvarchar](20) NULL,
	[street] [nvarchar](20) NULL,
	[building] [int] NULL,
	[appartment] [int] NULL,
	[zipcode] [nchar](10) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contragent]    Script Date: 13.07.2018 19:03:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contragent](
	[contragent_id] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[telephone_number] [nchar](8) NULL,
	[address_id] [int] NULL,
	[director_id] [int] NULL,
 CONSTRAINT [PK_contragent] PRIMARY KEY CLUSTERED 
(
	[contragent_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 13.07.2018 19:03:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] NOT NULL,
	[name] [nvarchar](20) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[director]    Script Date: 13.07.2018 19:03:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[director](
	[id] [int] NOT NULL,
	[surname] [nvarchar](20) NULL,
	[name] [nvarchar](20) NULL,
	[middle_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_director] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_director] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[surname] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 13.07.2018 19:03:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [int] NOT NULL,
	[image] [image] NULL,
 CONSTRAINT [PK_image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[invoice]    Script Date: 13.07.2018 19:03:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[invoice](
	[id] [int] NOT NULL,
	[number] [uniqueidentifier] NULL,
	[operation_type_id] [int] NULL,
	[date] [datetime] NULL,
	[contragent_id] [int] NULL,
	[product_id] [int] NULL,
	[amount] [int] NULL,
	[price] [money] NULL,
	[sum]][TOTAL AS amount*price] [money] NULL,
 CONSTRAINT [PK_invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_invoice] UNIQUE NONCLUSTERED 
(
	[number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[operation_type]    Script Date: 13.07.2018 19:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[operation_type](
	[id] [int] NOT NULL,
	[name] [varchar](10) NULL,
 CONSTRAINT [PK_operation_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[packing]    Script Date: 13.07.2018 19:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[packing](
	[id] [int] NOT NULL,
	[name] [nvarchar](20) NULL,
	[amount_of_units] [int] NULL,
	[units_of_measure_id] [smallint] NULL,
 CONSTRAINT [PK_packing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_packing] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[amount_of_units] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 13.07.2018 19:03:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] NOT NULL,
	[type_id] [int] NULL,
	[name] [nvarchar](20) NULL,
	[image_id] [int] NULL,
	[packing_id] [int] NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[type]    Script Date: 13.07.2018 19:03:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[type](
	[id] [int] NOT NULL,
	[name] [nvarchar](20) NULL,
 CONSTRAINT [PK_type] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_type] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[units_of_measure]    Script Date: 13.07.2018 19:03:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[units_of_measure](
	[id] [smallint] NOT NULL,
	[name] [nvarchar](20) NULL,
 CONSTRAINT [PK_units_of_measure] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_units_of_measure] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ware]    Script Date: 13.07.2018 19:03:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ware](
	[id] [int] NOT NULL,
	[ware_id] [int] NULL,
	[price_id] [int] NULL,
	[expiration_date] [date] NULL,
 CONSTRAINT [PK_ware] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[address]  WITH CHECK ADD  CONSTRAINT [FK_address_country] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[address] CHECK CONSTRAINT [FK_address_country]
GO
ALTER TABLE [dbo].[contragent]  WITH CHECK ADD  CONSTRAINT [FK_contragent_address] FOREIGN KEY([address_id])
REFERENCES [dbo].[address] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contragent] CHECK CONSTRAINT [FK_contragent_address]
GO
ALTER TABLE [dbo].[contragent]  WITH CHECK ADD  CONSTRAINT [FK_contragent_director] FOREIGN KEY([director_id])
REFERENCES [dbo].[director] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[contragent] CHECK CONSTRAINT [FK_contragent_director]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_contragent] FOREIGN KEY([contragent_id])
REFERENCES [dbo].[contragent] ([contragent_id])
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_contragent]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_operation_type] FOREIGN KEY([operation_type_id])
REFERENCES [dbo].[operation_type] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_operation_type]
GO
ALTER TABLE [dbo].[invoice]  WITH CHECK ADD  CONSTRAINT [FK_invoice_product] FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[invoice] CHECK CONSTRAINT [FK_invoice_product]
GO
ALTER TABLE [dbo].[packing]  WITH CHECK ADD  CONSTRAINT [FK_packing_units_of_measure] FOREIGN KEY([units_of_measure_id])
REFERENCES [dbo].[units_of_measure] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[packing] CHECK CONSTRAINT [FK_packing_units_of_measure]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_image] FOREIGN KEY([image_id])
REFERENCES [dbo].[image] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_image]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_packing] FOREIGN KEY([packing_id])
REFERENCES [dbo].[packing] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_packing]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD  CONSTRAINT [FK_product_type] FOREIGN KEY([type_id])
REFERENCES [dbo].[type] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product] CHECK CONSTRAINT [FK_product_type]
GO
ALTER TABLE [dbo].[ware]  WITH CHECK ADD  CONSTRAINT [FK_ware_product] FOREIGN KEY([ware_id])
REFERENCES [dbo].[product] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ware] CHECK CONSTRAINT [FK_ware_product]
GO
