/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 12-jul.-2018 05:28:02 p. m. 				*/
/*  DBMS       : SQL Server 2012 						*/
/* ---------------------------------------------------- */

/* Drop Foreign Key Constraints */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_DetalleVenta_Servicio]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [DetalleVenta] DROP CONSTRAINT [FK_DetalleVenta_Servicio]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_DetalleVenta_Venta]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [DetalleVenta] DROP CONSTRAINT [FK_DetalleVenta_Venta]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Servicio_TipoServicio]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Servicio] DROP CONSTRAINT [FK_Servicio_TipoServicio]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ServicioNorma_Norma]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ServicioNorma] DROP CONSTRAINT [FK_ServicioNorma_Norma]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_ServicioNorma_Servicio]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [ServicioNorma] DROP CONSTRAINT [FK_ServicioNorma_Servicio]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Venta_Directorio_Cliente]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Venta] DROP CONSTRAINT [FK_Venta_Directorio_Cliente]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Venta_Directorio_Contacto]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Venta] DROP CONSTRAINT [FK_Venta_Directorio_Contacto]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_Venta_TipoTransaccion]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [Venta] DROP CONSTRAINT [FK_Venta_TipoTransaccion]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_VentaFormaPago_FormaPago]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [VentaFormaPago] DROP CONSTRAINT [FK_VentaFormaPago_FormaPago]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FK_VentaFormaPago_Venta]') AND OBJECTPROPERTY(id, N'IsForeignKey') = 1) 
ALTER TABLE [VentaFormaPago] DROP CONSTRAINT [FK_VentaFormaPago_Venta]
GO

/* Drop Tables */

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[DetalleVenta]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [DetalleVenta]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Directorio]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Directorio]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[FormaPago]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [FormaPago]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Norma]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Norma]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Servicio]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Servicio]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[ServicioNorma]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [ServicioNorma]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[TipoServicio]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [TipoServicio]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[TipoTransaccion]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [TipoTransaccion]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[Venta]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [Venta]
GO

IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE id = object_id(N'[VentaFormaPago]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1) 
DROP TABLE [VentaFormaPago]
GO

/* Create Tables */

CREATE TABLE [DetalleVenta]
(
	[venDetId] int NOT NULL IDENTITY (1, 1),
	[venId] varchar(50) NULL,
	[serId] varchar(50) NULL,
	[venDetCantidad] decimal(18,6) NULL,
	[venDetCosto] decimal(18,6) NULL,
	[venDetObservacion] varchar(256) NULL
)
GO

CREATE TABLE [Directorio]
(
	[dirId] varchar(50) NOT NULL,
	[dirNombre] varchar(256) NULL,
	[dirNIT] varchar(50) NULL,
	[dirTelefonoFijo] varchar(50) NULL,
	[dirCelular] varchar(50) NULL,
	[dirDireccion] varchar(256) NULL,
	[dirEsEmpresa] bit NULL,
	[dirEsPersona] bit NULL
)
GO

CREATE TABLE [FormaPago]
(
	[forPagId] varchar(50) NOT NULL,
	[forPagNombre] varchar(50) NULL
)
GO

CREATE TABLE [Norma]
(
	[norId] varchar(50) NOT NULL,
	[norNombre] varchar(256) NULL
)
GO

CREATE TABLE [Servicio]
(
	[serId] varchar(50) NOT NULL,
	[norId] varchar(50) NULL,
	[tipSerId] varchar(50) NULL,
	[precio] decimal(18,6) NULL
)
GO

CREATE TABLE [ServicioNorma]
(
	[snoId] int NOT NULL IDENTITY (1, 1),
	[serId] varchar(50) NULL,
	[norId] varchar(50) NULL
)
GO

CREATE TABLE [TipoServicio]
(
	[tipSerId] varchar(50) NOT NULL,
	[tipSerNombre] varchar(256) NULL,
	[serId] varchar(50) NULL
)
GO

CREATE TABLE [TipoTransaccion]
(
	[tipTraId] varchar(50) NOT NULL,
	[tipTraNombre] varchar(256) NULL
)
GO

CREATE TABLE [Venta]
(
	[venId] varchar(50) NOT NULL,
	[tipTraId] varchar(50) NULL,
	[venEstado] varchar(1) NULL,
	[venFechaDocumento] varchar(50) NULL,
	[ClienteId] varchar(50) NULL,
	[ProId] varchar(50) NULL,
	[venUbicacion] varchar(256) NULL,
	[ContactoId] varchar(50) NULL,
	[venProcedenciaMaterial] varchar(256) NULL,
	[venObservacion] varchar(256) NULL,
	[venMontoServicio] decimal(18,6) NULL,
	[venDescuento] decimal(18,6) NULL,
	[venMontoTotal] varchar(50) NULL
)
GO

CREATE TABLE [VentaFormaPago]
(
	[vfpId] int NOT NULL IDENTITY (1, 1),
	[venId] varchar(50) NULL,
	[forPagId] varchar(50) NULL,
	[forPagNroDocumento] varchar(50) NULL
)
GO

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE [DetalleVenta] 
 ADD CONSTRAINT [PK_DetalleVenta]
	PRIMARY KEY CLUSTERED ([venDetId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_DetalleVenta_Servicio] 
 ON [DetalleVenta] ([serId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_DetalleVenta_Venta] 
 ON [DetalleVenta] ([venId] ASC)
GO

ALTER TABLE [Directorio] 
 ADD CONSTRAINT [PK_Directorio]
	PRIMARY KEY CLUSTERED ([dirId] ASC)
GO

ALTER TABLE [FormaPago] 
 ADD CONSTRAINT [PK_FormaPago]
	PRIMARY KEY CLUSTERED ([forPagId] ASC)
GO

ALTER TABLE [Norma] 
 ADD CONSTRAINT [PK_Norma]
	PRIMARY KEY CLUSTERED ([norId] ASC)
GO

ALTER TABLE [Servicio] 
 ADD CONSTRAINT [PK_Servicio]
	PRIMARY KEY CLUSTERED ([serId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Servicio_TipoServicio] 
 ON [Servicio] ([tipSerId] ASC)
GO

ALTER TABLE [ServicioNorma] 
 ADD CONSTRAINT [PK_ServicioNorma]
	PRIMARY KEY CLUSTERED ([snoId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_ServicioNorma_Norma] 
 ON [ServicioNorma] ([norId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_ServicioNorma_Servicio] 
 ON [ServicioNorma] ([serId] ASC)
GO

ALTER TABLE [TipoServicio] 
 ADD CONSTRAINT [PK_TipoServicio]
	PRIMARY KEY CLUSTERED ([tipSerId] ASC)
GO

ALTER TABLE [TipoTransaccion] 
 ADD CONSTRAINT [PK_TipoTransaccion]
	PRIMARY KEY CLUSTERED ([tipTraId] ASC)
GO

ALTER TABLE [Venta] 
 ADD CONSTRAINT [PK_Transaccion]
	PRIMARY KEY CLUSTERED ([venId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Venta_Directorio_Cliente] 
 ON [Venta] ([ClienteId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Venta_Directorio_Contacto] 
 ON [Venta] ([ContactoId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_Venta_TipoTransaccion] 
 ON [Venta] ([tipTraId] ASC)
GO

ALTER TABLE [VentaFormaPago] 
 ADD CONSTRAINT [PK_VentaFormaPago]
	PRIMARY KEY CLUSTERED ([vfpId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_VentaFormaPago_FormaPago] 
 ON [VentaFormaPago] ([forPagId] ASC)
GO

CREATE NONCLUSTERED INDEX [IXFK_VentaFormaPago_Venta] 
 ON [VentaFormaPago] ([venId] ASC)
GO

/* Create Foreign Key Constraints */

ALTER TABLE [DetalleVenta] ADD CONSTRAINT [FK_DetalleVenta_Servicio]
	FOREIGN KEY ([serId]) REFERENCES [Servicio] ([serId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [DetalleVenta] ADD CONSTRAINT [FK_DetalleVenta_Venta]
	FOREIGN KEY ([venId]) REFERENCES [Venta] ([venId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Servicio] ADD CONSTRAINT [FK_Servicio_TipoServicio]
	FOREIGN KEY ([tipSerId]) REFERENCES [TipoServicio] ([tipSerId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ServicioNorma] ADD CONSTRAINT [FK_ServicioNorma_Norma]
	FOREIGN KEY ([norId]) REFERENCES [Norma] ([norId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [ServicioNorma] ADD CONSTRAINT [FK_ServicioNorma_Servicio]
	FOREIGN KEY ([serId]) REFERENCES [Servicio] ([serId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_Directorio_Cliente]
	FOREIGN KEY ([ClienteId]) REFERENCES [Directorio] ([dirId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_Directorio_Contacto]
	FOREIGN KEY ([ContactoId]) REFERENCES [Directorio] ([dirId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [Venta] ADD CONSTRAINT [FK_Venta_TipoTransaccion]
	FOREIGN KEY ([tipTraId]) REFERENCES [TipoTransaccion] ([tipTraId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [VentaFormaPago] ADD CONSTRAINT [FK_VentaFormaPago_FormaPago]
	FOREIGN KEY ([forPagId]) REFERENCES [FormaPago] ([forPagId]) ON DELETE No Action ON UPDATE No Action
GO

ALTER TABLE [VentaFormaPago] ADD CONSTRAINT [FK_VentaFormaPago_Venta]
	FOREIGN KEY ([venId]) REFERENCES [Venta] ([venId]) ON DELETE No Action ON UPDATE No Action
GO
