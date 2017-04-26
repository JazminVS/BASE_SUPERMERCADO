USE [master]
GO
/****** Object:  Database [SANTAMARIA]    Script Date: 04/25/2017 00:46:56 ******/
CREATE DATABASE [SANTAMARIA] ON  PRIMARY 
( NAME = N'SANTAMARIA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SANTAMARIA.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SANTAMARIA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\SANTAMARIA_log.LDF' , SIZE = 576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SANTAMARIA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SANTAMARIA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SANTAMARIA] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SANTAMARIA] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SANTAMARIA] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SANTAMARIA] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SANTAMARIA] SET ARITHABORT OFF
GO
ALTER DATABASE [SANTAMARIA] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [SANTAMARIA] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [SANTAMARIA] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SANTAMARIA] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SANTAMARIA] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SANTAMARIA] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SANTAMARIA] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SANTAMARIA] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SANTAMARIA] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SANTAMARIA] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SANTAMARIA] SET  ENABLE_BROKER
GO
ALTER DATABASE [SANTAMARIA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SANTAMARIA] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SANTAMARIA] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SANTAMARIA] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SANTAMARIA] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SANTAMARIA] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SANTAMARIA] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SANTAMARIA] SET  READ_WRITE
GO
ALTER DATABASE [SANTAMARIA] SET RECOVERY FULL
GO
ALTER DATABASE [SANTAMARIA] SET  MULTI_USER
GO
ALTER DATABASE [SANTAMARIA] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SANTAMARIA] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'SANTAMARIA', N'ON'
GO
USE [SANTAMARIA]
GO
/****** Object:  Table [dbo].[PROMOCIONES]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PROMOCIONES](
	[ID_PROMO] [numeric](4, 0) NOT NULL,
	[ID_SUCUR] [numeric](4, 0) NOT NULL,
	[ID_PROD] [numeric](4, 0) NOT NULL,
	[FECHA_VIGENCIA_PROMO] [date] NOT NULL,
	[TIPO_PROMO] [varchar](25) NOT NULL,
	[DESCRIPCION_PROMO] [varchar](25) NOT NULL,
	[PRECIO_PROMO] [decimal](4, 0) NOT NULL,
 CONSTRAINT [PK_PROMOCIONES] PRIMARY KEY CLUSTERED 
(
	[ID_PROMO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [PROMOCIONES_PK] ON [dbo].[PROMOCIONES] 
(
	[ID_PROMO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_14_FK] ON [dbo].[PROMOCIONES] 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_15_FK] ON [dbo].[PROMOCIONES] 
(
	[ID_PROD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTOS]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRODUCTOS](
	[ID_PROD] [numeric](4, 0) NOT NULL,
	[ID_PROMO] [numeric](4, 0) NOT NULL,
	[ID_SUCUR] [numeric](4, 0) NOT NULL,
	[NUM_FACT] [numeric](6, 0) NOT NULL,
	[DESCRIPCION_PROD] [varchar](25) NOT NULL,
	[CANTIDAD_PROD] [numeric](4, 0) NOT NULL,
	[PRECIO_PROD] [decimal](4, 0) NOT NULL,
 CONSTRAINT [PK_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[ID_PROD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [PRODUCTOS_PK] ON [dbo].[PRODUCTOS] 
(
	[ID_PROD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_12_FK] ON [dbo].[PRODUCTOS] 
(
	[NUM_FACT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_16_FK] ON [dbo].[PRODUCTOS] 
(
	[ID_PROMO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_18_FK] ON [dbo].[PRODUCTOS] 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPRESA]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPRESA](
	[RUC_E] [numeric](10, 0) NOT NULL,
	[ID_SUCUR] [numeric](4, 0) NOT NULL,
	[NOMBRE_E] [varchar](25) NOT NULL,
	[DIRECCION_E] [varchar](25) NOT NULL,
	[TELF_E] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_EMPRESA] PRIMARY KEY CLUSTERED 
(
	[RUC_E] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [EMPRESA_PK] ON [dbo].[EMPRESA] 
(
	[RUC_E] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_1_FK] ON [dbo].[EMPRESA] 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EMPLEADOS]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EMPLEADOS](
	[CI_EMPLE] [numeric](10, 0) NOT NULL,
	[ID_SUCUR] [numeric](4, 0) NOT NULL,
	[NUM_FACT] [numeric](6, 0) NOT NULL,
	[NOMBRE_EMPLE] [varchar](25) NOT NULL,
	[CARGO_EMPLE] [varchar](25) NOT NULL,
 CONSTRAINT [PK_EMPLEADOS] PRIMARY KEY CLUSTERED 
(
	[CI_EMPLE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [EMPLEADOS_PK] ON [dbo].[EMPLEADOS] 
(
	[CI_EMPLE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_6_FK] ON [dbo].[EMPLEADOS] 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_7_FK] ON [dbo].[EMPLEADOS] 
(
	[NUM_FACT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SUCURSAL]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SUCURSAL](
	[ID_SUCUR] [numeric](4, 0) NOT NULL,
	[CI_EMPLE] [numeric](10, 0) NOT NULL,
	[RUC_E] [numeric](10, 0) NOT NULL,
	[ID_PROMO] [numeric](4, 0) NOT NULL,
	[ID_PROD] [numeric](4, 0) NOT NULL,
	[CI_CLI] [numeric](10, 0) NOT NULL,
	[DIRECCION_SUCUR] [varchar](25) NOT NULL,
	[TELEF_SUCUR] [numeric](10, 0) NOT NULL,
	[ENCARGADO_SUCUR] [varchar](25) NOT NULL,
 CONSTRAINT [PK_SUCURSAL] PRIMARY KEY CLUSTERED 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_13_FK] ON [dbo].[SUCURSAL] 
(
	[ID_PROMO] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_17_FK] ON [dbo].[SUCURSAL] 
(
	[ID_PROD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_2_FK] ON [dbo].[SUCURSAL] 
(
	[RUC_E] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_3_FK] ON [dbo].[SUCURSAL] 
(
	[CI_CLI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_5_FK] ON [dbo].[SUCURSAL] 
(
	[CI_EMPLE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [SUCURSAL_PK] ON [dbo].[SUCURSAL] 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACTURAS]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FACTURAS](
	[NUM_FACT] [numeric](6, 0) NOT NULL,
	[CI_EMPLE] [numeric](10, 0) NOT NULL,
	[CI_CLI] [numeric](10, 0) NOT NULL,
	[ID_PROD] [numeric](4, 0) NOT NULL,
	[FECHA_EMISION] [date] NOT NULL,
	[CLIENTE] [varchar](25) NOT NULL,
	[TELF] [numeric](10, 0) NOT NULL,
	[CANT_PROD] [numeric](4, 0) NOT NULL,
	[DESCRIP_PROD] [varchar](25) NOT NULL,
	[PRECIO_UNITARIO] [decimal](4, 0) NOT NULL,
	[PRECIO_TOTAL] [decimal](4, 0) NOT NULL,
	[DESCUENTO] [decimal](4, 0) NOT NULL,
	[IVA] [decimal](4, 0) NOT NULL,
	[TOTAL_A_PAGAR] [decimal](6, 0) NOT NULL,
 CONSTRAINT [PK_FACTURAS] PRIMARY KEY CLUSTERED 
(
	[NUM_FACT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [FACTURAS_PK] ON [dbo].[FACTURAS] 
(
	[NUM_FACT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_10_FK] ON [dbo].[FACTURAS] 
(
	[CI_CLI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_11_FK] ON [dbo].[FACTURAS] 
(
	[ID_PROD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_8_FK] ON [dbo].[FACTURAS] 
(
	[CI_EMPLE] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 04/25/2017 00:46:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[CI_CLI] [numeric](10, 0) NOT NULL,
	[NUM_FACT] [numeric](6, 0) NOT NULL,
	[ID_SUCUR] [numeric](4, 0) NOT NULL,
	[NOMBRE_CLI] [varchar](25) NOT NULL,
	[TELF_CLI] [numeric](10, 0) NOT NULL,
 CONSTRAINT [PK_CLIENTES] PRIMARY KEY CLUSTERED 
(
	[CI_CLI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [CLIENTES_PK] ON [dbo].[CLIENTES] 
(
	[CI_CLI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_4_FK] ON [dbo].[CLIENTES] 
(
	[ID_SUCUR] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [RELATIONSHIP_9_FK] ON [dbo].[CLIENTES] 
(
	[NUM_FACT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_PROMOCIO_RELATIONS_PRODUCTO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[PROMOCIONES]  WITH CHECK ADD  CONSTRAINT [FK_PROMOCIO_RELATIONS_PRODUCTO] FOREIGN KEY([ID_PROD])
REFERENCES [dbo].[PRODUCTOS] ([ID_PROD])
GO
ALTER TABLE [dbo].[PROMOCIONES] CHECK CONSTRAINT [FK_PROMOCIO_RELATIONS_PRODUCTO]
GO
/****** Object:  ForeignKey [FK_PROMOCIO_RELATIONS_SUCURSAL]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[PROMOCIONES]  WITH CHECK ADD  CONSTRAINT [FK_PROMOCIO_RELATIONS_SUCURSAL] FOREIGN KEY([ID_SUCUR])
REFERENCES [dbo].[SUCURSAL] ([ID_SUCUR])
GO
ALTER TABLE [dbo].[PROMOCIONES] CHECK CONSTRAINT [FK_PROMOCIO_RELATIONS_SUCURSAL]
GO
/****** Object:  ForeignKey [FK_PRODUCTO_RELATIONS_FACTURAS]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_RELATIONS_FACTURAS] FOREIGN KEY([NUM_FACT])
REFERENCES [dbo].[FACTURAS] ([NUM_FACT])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTO_RELATIONS_FACTURAS]
GO
/****** Object:  ForeignKey [FK_PRODUCTO_RELATIONS_PROMOCIO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_RELATIONS_PROMOCIO] FOREIGN KEY([ID_PROMO])
REFERENCES [dbo].[PROMOCIONES] ([ID_PROMO])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTO_RELATIONS_PROMOCIO]
GO
/****** Object:  ForeignKey [FK_PRODUCTO_RELATIONS_SUCURSAL]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_PRODUCTO_RELATIONS_SUCURSAL] FOREIGN KEY([ID_SUCUR])
REFERENCES [dbo].[SUCURSAL] ([ID_SUCUR])
GO
ALTER TABLE [dbo].[PRODUCTOS] CHECK CONSTRAINT [FK_PRODUCTO_RELATIONS_SUCURSAL]
GO
/****** Object:  ForeignKey [FK_EMPRESA_RELATIONS_SUCURSAL]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[EMPRESA]  WITH CHECK ADD  CONSTRAINT [FK_EMPRESA_RELATIONS_SUCURSAL] FOREIGN KEY([ID_SUCUR])
REFERENCES [dbo].[SUCURSAL] ([ID_SUCUR])
GO
ALTER TABLE [dbo].[EMPRESA] CHECK CONSTRAINT [FK_EMPRESA_RELATIONS_SUCURSAL]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_RELATIONS_FACTURAS]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_RELATIONS_FACTURAS] FOREIGN KEY([NUM_FACT])
REFERENCES [dbo].[FACTURAS] ([NUM_FACT])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADO_RELATIONS_FACTURAS]
GO
/****** Object:  ForeignKey [FK_EMPLEADO_RELATIONS_SUCURSAL]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[EMPLEADOS]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADO_RELATIONS_SUCURSAL] FOREIGN KEY([ID_SUCUR])
REFERENCES [dbo].[SUCURSAL] ([ID_SUCUR])
GO
ALTER TABLE [dbo].[EMPLEADOS] CHECK CONSTRAINT [FK_EMPLEADO_RELATIONS_SUCURSAL]
GO
/****** Object:  ForeignKey [FK_SUCURSAL_RELATIONS_CLIENTES]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSAL_RELATIONS_CLIENTES] FOREIGN KEY([CI_CLI])
REFERENCES [dbo].[CLIENTES] ([CI_CLI])
GO
ALTER TABLE [dbo].[SUCURSAL] CHECK CONSTRAINT [FK_SUCURSAL_RELATIONS_CLIENTES]
GO
/****** Object:  ForeignKey [FK_SUCURSAL_RELATIONS_EMPLEADO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSAL_RELATIONS_EMPLEADO] FOREIGN KEY([CI_EMPLE])
REFERENCES [dbo].[EMPLEADOS] ([CI_EMPLE])
GO
ALTER TABLE [dbo].[SUCURSAL] CHECK CONSTRAINT [FK_SUCURSAL_RELATIONS_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_SUCURSAL_RELATIONS_EMPRESA]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSAL_RELATIONS_EMPRESA] FOREIGN KEY([RUC_E])
REFERENCES [dbo].[EMPRESA] ([RUC_E])
GO
ALTER TABLE [dbo].[SUCURSAL] CHECK CONSTRAINT [FK_SUCURSAL_RELATIONS_EMPRESA]
GO
/****** Object:  ForeignKey [FK_SUCURSAL_RELATIONS_PRODUCTO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSAL_RELATIONS_PRODUCTO] FOREIGN KEY([ID_PROD])
REFERENCES [dbo].[PRODUCTOS] ([ID_PROD])
GO
ALTER TABLE [dbo].[SUCURSAL] CHECK CONSTRAINT [FK_SUCURSAL_RELATIONS_PRODUCTO]
GO
/****** Object:  ForeignKey [FK_SUCURSAL_RELATIONS_PROMOCIO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[SUCURSAL]  WITH CHECK ADD  CONSTRAINT [FK_SUCURSAL_RELATIONS_PROMOCIO] FOREIGN KEY([ID_PROMO])
REFERENCES [dbo].[PROMOCIONES] ([ID_PROMO])
GO
ALTER TABLE [dbo].[SUCURSAL] CHECK CONSTRAINT [FK_SUCURSAL_RELATIONS_PROMOCIO]
GO
/****** Object:  ForeignKey [FK_FACTURAS_RELATIONS_CLIENTES]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [FK_FACTURAS_RELATIONS_CLIENTES] FOREIGN KEY([CI_CLI])
REFERENCES [dbo].[CLIENTES] ([CI_CLI])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [FK_FACTURAS_RELATIONS_CLIENTES]
GO
/****** Object:  ForeignKey [FK_FACTURAS_RELATIONS_EMPLEADO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [FK_FACTURAS_RELATIONS_EMPLEADO] FOREIGN KEY([CI_EMPLE])
REFERENCES [dbo].[EMPLEADOS] ([CI_EMPLE])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [FK_FACTURAS_RELATIONS_EMPLEADO]
GO
/****** Object:  ForeignKey [FK_FACTURAS_RELATIONS_PRODUCTO]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[FACTURAS]  WITH CHECK ADD  CONSTRAINT [FK_FACTURAS_RELATIONS_PRODUCTO] FOREIGN KEY([ID_PROD])
REFERENCES [dbo].[PRODUCTOS] ([ID_PROD])
GO
ALTER TABLE [dbo].[FACTURAS] CHECK CONSTRAINT [FK_FACTURAS_RELATIONS_PRODUCTO]
GO
/****** Object:  ForeignKey [FK_CLIENTES_RELATIONS_FACTURAS]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTES_RELATIONS_FACTURAS] FOREIGN KEY([NUM_FACT])
REFERENCES [dbo].[FACTURAS] ([NUM_FACT])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [FK_CLIENTES_RELATIONS_FACTURAS]
GO
/****** Object:  ForeignKey [FK_CLIENTES_RELATIONS_SUCURSAL]    Script Date: 04/25/2017 00:46:57 ******/
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTES_RELATIONS_SUCURSAL] FOREIGN KEY([ID_SUCUR])
REFERENCES [dbo].[SUCURSAL] ([ID_SUCUR])
GO
ALTER TABLE [dbo].[CLIENTES] CHECK CONSTRAINT [FK_CLIENTES_RELATIONS_SUCURSAL]
GO
