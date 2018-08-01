USE [master]
GO
/****** Object:  Database [biblioteca]    Script Date: 12/05/2018 8:59:42 p. m. ******/
CREATE DATABASE [biblioteca]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'biblioteca', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PUCHOSERVER\MSSQL\DATA\biblioteca.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'biblioteca_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.PUCHOSERVER\MSSQL\DATA\biblioteca_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [biblioteca] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [biblioteca].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [biblioteca] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [biblioteca] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [biblioteca] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [biblioteca] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [biblioteca] SET ARITHABORT OFF 
GO
ALTER DATABASE [biblioteca] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [biblioteca] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [biblioteca] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [biblioteca] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [biblioteca] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [biblioteca] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [biblioteca] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [biblioteca] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [biblioteca] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [biblioteca] SET  DISABLE_BROKER 
GO
ALTER DATABASE [biblioteca] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [biblioteca] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [biblioteca] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [biblioteca] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [biblioteca] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [biblioteca] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [biblioteca] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [biblioteca] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [biblioteca] SET  MULTI_USER 
GO
ALTER DATABASE [biblioteca] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [biblioteca] SET DB_CHAINING OFF 
GO
ALTER DATABASE [biblioteca] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [biblioteca] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [biblioteca] SET DELAYED_DURABILITY = DISABLED 
GO
USE [biblioteca]
GO
/****** Object:  User [pucho]    Script Date: 12/05/2018 8:59:42 p. m. ******/
CREATE USER [pucho] FOR LOGIN [pucho] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [pucho]
GO
ALTER ROLE [db_datareader] ADD MEMBER [pucho]
GO
/****** Object:  Table [dbo].[AUTOR]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AUTOR](
	[IDAUTOR] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[DIRECCION] [varchar](50) NOT NULL,
	[TELEFONO] [varchar](12) NOT NULL,
	[EMAIL] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AUTOR] PRIMARY KEY CLUSTERED 
(
	[IDAUTOR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CATEGORIA]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CATEGORIA](
	[IDCATEGORIA] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CATEGORIA] PRIMARY KEY CLUSTERED 
(
	[IDCATEGORIA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[IDCLEINTE] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[APELLIDO] [varchar](50) NOT NULL,
	[DIRECCION] [varchar](50) NOT NULL,
	[TELEFONO] [varchar](12) NOT NULL,
	[IDENTIFICACION] [varchar](50) NOT NULL,
	[CARGO] [varchar](50) NOT NULL,
	[IMAGEN] [image] NOT NULL,
	[SEXO] [varchar](50) NOT NULL,
	[FECHA] [date] NOT NULL,
 CONSTRAINT [PK_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[IDCLEINTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DETALLE_DONACION]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLE_DONACION](
	[IDDETALLE_DONACION] [int] IDENTITY(1,1) NOT NULL,
	[IDDONACION] [int] NOT NULL,
	[IDLIBRO] [int] NOT NULL,
	[FECHA] [date] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
 CONSTRAINT [PK_DETALLE_DONACION] PRIMARY KEY CLUSTERED 
(
	[IDDETALLE_DONACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONACION]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DONACION](
	[IDDONACION] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[DIRECCION] [varchar](50) NOT NULL,
	[TELEFONO] [varchar](12) NOT NULL,
	[EMAIL] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DONACION] PRIMARY KEY CLUSTERED 
(
	[IDDONACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EDITORIAL]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EDITORIAL](
	[IDEDITORIAL] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EDITORIAL] PRIMARY KEY CLUSTERED 
(
	[IDEDITORIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ESTADO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ESTADO](
	[IDESTADO] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ESTADO] PRIMARY KEY CLUSTERED 
(
	[IDESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LIBRO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LIBRO](
	[IDLIBRO] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO] [varchar](50) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[FECHALIBRO] [date] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[IDCATEGORIA] [int] NOT NULL,
	[IDAUTOR] [int] NOT NULL,
	[IDESTADO] [int] NOT NULL,
	[IDUBICACION] [int] NOT NULL,
	[IMAGEN] [image] NOT NULL,
	[DISPONIBLES] [int] NOT NULL,
	[DESCRIPCION] [varchar](200) NOT NULL,
	[PAGINAS] [int] NOT NULL,
	[IDEDITORIAL] [int] NOT NULL,
 CONSTRAINT [PK_LIBRO] PRIMARY KEY CLUSTERED 
(
	[IDLIBRO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PRESTAMO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRESTAMO](
	[IDPRESTADO] [int] NOT NULL,
	[IDUSUARIO] [int] NOT NULL,
	[IDCLIENTE] [int] NOT NULL,
	[CANTIDAD] [int] NOT NULL,
	[FECHA] [date] NOT NULL,
	[IDLIBRO] [int] NOT NULL,
	[FECHAFIN] [date] NOT NULL,
 CONSTRAINT [PK_PRESTAMO] PRIMARY KEY CLUSTERED 
(
	[IDPRESTADO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UBICACION]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UBICACION](
	[IDUBICACION] [int] IDENTITY(1,1) NOT NULL,
	[NOMBRE_ESTANTERIA] [varchar](40) NOT NULL,
	[NUMERO_FILA] [int] NOT NULL,
 CONSTRAINT [PK_UBICACION] PRIMARY KEY CLUSTERED 
(
	[IDUBICACION] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[USUARIO](
	[IDUSUARIO] [int] IDENTITY(1,1) NOT NULL,
	[CODIGO] [varchar](8) NOT NULL,
	[NOMBRE] [varchar](50) NOT NULL,
	[APELLIDO] [varchar](50) NOT NULL,
	[DPI] [nvarchar](12) NOT NULL,
	[USUARIO] [varchar](50) NOT NULL,
	[PASS] [varchar](50) NOT NULL,
	[FECHA] [date] NOT NULL,
	[EMAIL] [varchar](50) NOT NULL,
	[TELEFONO] [varchar](12) NOT NULL,
	[TIPOUSUARIO] [varchar](30) NOT NULL,
	[ACCESO] [varchar](1) NOT NULL,
	[IMAGEN] [image] NOT NULL,
 CONSTRAINT [PK_USUARIO] PRIMARY KEY CLUSTERED 
(
	[IDUSUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DETALLE_DONACION]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_DONACION_DONACION] FOREIGN KEY([IDDONACION])
REFERENCES [dbo].[DONACION] ([IDDONACION])
GO
ALTER TABLE [dbo].[DETALLE_DONACION] CHECK CONSTRAINT [FK_DETALLE_DONACION_DONACION]
GO
ALTER TABLE [dbo].[DETALLE_DONACION]  WITH CHECK ADD  CONSTRAINT [FK_DETALLE_DONACION_LIBRO] FOREIGN KEY([IDLIBRO])
REFERENCES [dbo].[LIBRO] ([IDLIBRO])
GO
ALTER TABLE [dbo].[DETALLE_DONACION] CHECK CONSTRAINT [FK_DETALLE_DONACION_LIBRO]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_AUTOR] FOREIGN KEY([IDAUTOR])
REFERENCES [dbo].[AUTOR] ([IDAUTOR])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_AUTOR]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_CATEGORIA] FOREIGN KEY([IDCATEGORIA])
REFERENCES [dbo].[CATEGORIA] ([IDCATEGORIA])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_CATEGORIA]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_EDITORIAL] FOREIGN KEY([IDEDITORIAL])
REFERENCES [dbo].[EDITORIAL] ([IDEDITORIAL])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_EDITORIAL]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_ESTADO] FOREIGN KEY([IDESTADO])
REFERENCES [dbo].[ESTADO] ([IDESTADO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_ESTADO]
GO
ALTER TABLE [dbo].[LIBRO]  WITH CHECK ADD  CONSTRAINT [FK_LIBRO_UBICACION] FOREIGN KEY([IDUBICACION])
REFERENCES [dbo].[UBICACION] ([IDUBICACION])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[LIBRO] CHECK CONSTRAINT [FK_LIBRO_UBICACION]
GO
ALTER TABLE [dbo].[PRESTAMO]  WITH CHECK ADD  CONSTRAINT [FK_PRESTAMO_CLIENTE] FOREIGN KEY([IDCLIENTE])
REFERENCES [dbo].[CLIENTE] ([IDCLEINTE])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRESTAMO] CHECK CONSTRAINT [FK_PRESTAMO_CLIENTE]
GO
ALTER TABLE [dbo].[PRESTAMO]  WITH CHECK ADD  CONSTRAINT [FK_PRESTAMO_LIBRO] FOREIGN KEY([IDLIBRO])
REFERENCES [dbo].[LIBRO] ([IDLIBRO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRESTAMO] CHECK CONSTRAINT [FK_PRESTAMO_LIBRO]
GO
ALTER TABLE [dbo].[PRESTAMO]  WITH CHECK ADD  CONSTRAINT [FK_PRESTAMO_USUARIO] FOREIGN KEY([IDUSUARIO])
REFERENCES [dbo].[USUARIO] ([IDUSUARIO])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PRESTAMO] CHECK CONSTRAINT [FK_PRESTAMO_USUARIO]
GO
/****** Object:  StoredProcedure [dbo].[editar_autor]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_autor]
@IDAUTOR integer,
@NOMBRE varchar (50),
@DIRECCION varchar (50),
@TELEFONO varchar (12),
@EMAIL varchar (50)
as
update AUTOR set NOMBRE=@NOMBRE, DIRECCION=@DIRECCION, TELEFONO=@TELEFONO, EMAIL=@EMAIL
where IDAUTOR=@IDAUTOR

GO
/****** Object:  StoredProcedure [dbo].[editar_categoria]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_categoria]
@IDCATEGORIA integer,
@NOMBRE varchar (50)
as
update CATEGORIA set NOMBRE=@NOMBRE
where IDCATEGORIA=@IDCATEGORIA

GO
/****** Object:  StoredProcedure [dbo].[editar_cliente]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_cliente]
@IDCLIENTE integer,
@NOMBRE varchar (50),
@APELLIDO varchar (50),
@DIRECCION varchar (50),
@TELEFONO varchar (12),
@IDENTIFICACION varchar (50),
@CARGO varchar (50),
@IMAGEN image,
@SEXO varchar (50),
@FECHA date
as
update CLIENTE set NOMBRE=@NOMBRE, APELLIDO=@APELLIDO ,DIRECCION=@DIRECCION, TELEFONO=@TELEFONO, IDENTIFICACION=@IDENTIFICACION, CARGO=@CARGO,
IMAGEN=@IMAGEN, SEXO=@SEXO, FECHA=@FECHA
where IDCLEINTE=@IDCLIENTE
GO
/****** Object:  StoredProcedure [dbo].[editar_detalle_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_detalle_donacion]
@IDDETALLE_DONACION integer,
@IDDONACION integer,
@IDLIBRO integer,
@FECHA date,
@CANTIDAD integer
as
update DETALLE_DONACION set @IDDONACION=@IDDONACION, IDLIBRO=@IDLIBRO, FECHA=@FECHA, CANTIDAD=@CANTIDAD
where IDDETALLE_DONACION=@IDDETALLE_DONACION
GO
/****** Object:  StoredProcedure [dbo].[editar_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_donacion]
@IDDONACION integer,
@NOMBRE varchar (50),
@DIRECCION varchar (50),
@TELEFONO varchar (12),
@EMAIL varchar (50)
as
update DONACION set NOMBRE=@NOMBRE, DIRECCION=@DIRECCION, TELEFONO=@TELEFONO, EMAIL=@EMAIL
where IDDONACION=@IDDONACION

GO
/****** Object:  StoredProcedure [dbo].[editar_EDITORIAL]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_EDITORIAL]
@IDEDITORIAL integer,
@NOMBRE varchar (50)
as
update EDITORIAL set NOMBRE=@NOMBRE
where IDEDITORIAL=@IDEDITORIAL

GO
/****** Object:  StoredProcedure [dbo].[editar_estado]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_estado]
@IDESTADO integer,
@NOMBRE varchar (50)
as
update ESTADO set NOMBRE=@NOMBRE
where IDESTADO=@IDESTADO

GO
/****** Object:  StoredProcedure [dbo].[editar_libro]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_libro]
@IDLIBRO integer,
@CODIGO varchar (50),
@NOMBRE varchar (50),
@FECHALIBRO date,
@CANTIDAD integer,
@IDCATEGORIA integer,
@IDAUTOR integer,
@IDESTADO integer,
@IDUBICACION integer,
@IMAGEN image,
@DISPONIBLES integer,
@DESCRIPCION varchar (230),
@PAGINAS integer,
@IDEDITORIAL integer
as
update LIBRO set CODIGO=@CODIGO, NOMBRE=@NOMBRE, FECHALIBRO=@FECHALIBRO, CANTIDAD=@CANTIDAD,
IDCATEGORIA=@IDCATEGORIA, IDAUTOR=@IDAUTOR, IDESTADO=@IDESTADO, IDUBICACION=@IDUBICACION, IMAGEN=@IMAGEN, DISPONIBLES=@DISPONIBLES,
DESCRIPCION=@DESCRIPCION, PAGINAS=@PAGINAS, IDEDITORIAL=@IDEDITORIAL
where IDLIBRO=@IDLIBRO
GO
/****** Object:  StoredProcedure [dbo].[editar_PRESTADO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_PRESTADO]
@IDPRESTADO integer,
@IDUSUARIO integer,
@IDCLIENTE integer,
@CANTIDAD integer,
@FECHA date
as
update PRESTAMO set  IDUSUARIO=@IDUSUARIO, @IDUSUARIO=@IDUSUARIO,  IDCLIENTE=@IDCLIENTE, CANTIDAD=@CANTIDAD ,FECHA=@FECHA
where IDPRESTADO=@IDPRESTADO

GO
/****** Object:  StoredProcedure [dbo].[editar_ubicacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[editar_ubicacion]
@IDUBICACION integer,
@NOMBRE_ESTANTERIA varchar (40),
@NUMERO_FILA integer
as
update UBICACION set NOMBRE_ESTANTERIA=@NOMBRE_ESTANTERIA, NUMERO_FILA=@NUMERO_FILA
where IDUBICACION=@IDUBICACION

GO
/****** Object:  StoredProcedure [dbo].[editar_usuario]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[editar_usuario]
@IDUSUARIO integer,
@CODIGO VARCHAR(8),
@NOMBRE varchar (50),
@APELLIDO VARCHAR (50),
@DPI NVARCHAR (12),
@USUARIO varchar (50),
@PASS varchar (50),
@FECHA DATE,
@EMAIL varchar (50),
@TELEFONO varchar (12),
@TIPOUSUARIO varchar (30),
@ACCESO varchar (1),
@IMAGEN image
as
update USUARIO set CODIGO=@CODIGO, NOMBRE=@NOMBRE, APELLIDO=@APELLIDO, DPI=@DPI, USUARIO=@USUARIO, PASS=@PASS, FECHA=@FECHA, EMAIL=@EMAIL, TELEFONO=@TELEFONO, TIPOUSUARIO=@TIPOUSUARIO, ACCESO=@ACCESO, IMAGEN=@IMAGEN
where IDUSUARIO=@IDUSUARIO
GO
/****** Object:  StoredProcedure [dbo].[eliminar_autor]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_autor]
@IDAUTOR integer
as
delete from AUTOR where IDAUTOR=@IDAUTOR

GO
/****** Object:  StoredProcedure [dbo].[eliminar_categoria]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_categoria]
@IDCATEGORIA integer
as
delete from CATEGORIA  where IDCATEGORIA=@IDCATEGORIA

GO
/****** Object:  StoredProcedure [dbo].[eliminar_cliente]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_cliente]
@IDCLIENTE integer
as
delete from CLIENTE where IDCLEINTE=@IDCLIENTE

GO
/****** Object:  StoredProcedure [dbo].[eliminar_detalle_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_detalle_donacion]
@IDDETALLE_DONACION integer
as
delete from DETALLE_DONACION where IDDETALLE_DONACION=@IDDETALLE_DONACION

GO
/****** Object:  StoredProcedure [dbo].[eliminar_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_donacion]
@IDDONACION integer
as
delete from DONACION where IDDONACION=@IDDONACION

GO
/****** Object:  StoredProcedure [dbo].[eliminar_EDITORIAL]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_EDITORIAL]
@IDEDITORIAL integer
as
delete from EDITORIAL where IDEDITORIAL=@IDEDITORIAL

GO
/****** Object:  StoredProcedure [dbo].[eliminar_estado]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_estado]
@IDESTADO integer
as
delete from ESTADO  where IDESTADO=@IDESTADO

GO
/****** Object:  StoredProcedure [dbo].[eliminar_libro]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_libro]
@IDLIBRO integer
as
delete from LIBRO where IDLIBRO=@IDLIBRO

GO
/****** Object:  StoredProcedure [dbo].[eliminar_PRESTAMO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[eliminar_PRESTAMO]
@IDPRESTADO integer
as
delete from PRESTAMO where IDPRESTADO=@IDPRESTADO
GO
/****** Object:  StoredProcedure [dbo].[eliminar_ubicacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_ubicacion]
@IDUBICACION integer
as
delete from UBICACION where IDUBICACION=@IDUBICACION

GO
/****** Object:  StoredProcedure [dbo].[eliminar_usuario]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminar_usuario]
@IDUSUARIO integer
as
delete from USUARIO where IDUSUARIO=@IDUSUARIO

GO
/****** Object:  StoredProcedure [dbo].[Generar_Libros]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Generar_Libros]
as
SELECT        dbo.LIBRO.IDLIBRO, dbo.LIBRO.CODIGO, dbo.LIBRO.NOMBRE, dbo.LIBRO.CANTIDAD, dbo.CATEGORIA.NOMBRE AS CATEGORIA, dbo.AUTOR.NOMBRE AS AUTOR, dbo.ESTADO.NOMBRE AS ESTADO
FROM            dbo.AUTOR INNER JOIN
                         dbo.LIBRO ON dbo.AUTOR.IDAUTOR = dbo.LIBRO.IDAUTOR INNER JOIN
                         dbo.CATEGORIA ON dbo.LIBRO.IDCATEGORIA = dbo.CATEGORIA.IDCATEGORIA INNER JOIN
                         dbo.ESTADO ON dbo.LIBRO.IDESTADO = dbo.ESTADO.IDESTADO

GO
/****** Object:  StoredProcedure [dbo].[insertar_autor]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_autor]
@NOMBRE varchar (50),
@DIRECCION varchar (50),
@TELEFONO varchar (12),
@EMAIL varchar (50)
as
insert into AUTOR(NOMBRE, DIRECCION, TELEFONO, EMAIL) 
values (@NOMBRE, @DIRECCION, @TELEFONO, @EMAIL)

GO
/****** Object:  StoredProcedure [dbo].[insertar_categoria]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_categoria]
@NOMBRE varchar (50)
as
insert into CATEGORIA(NOMBRE) values (@NOMBRE)

GO
/****** Object:  StoredProcedure [dbo].[insertar_cliente]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_cliente]
@NOMBRE varchar (50),
@APELLIDO varchar (50),
@DIRECCION varchar (50),
@TELEFONO varchar (12),
@IDENTIFICACION varchar (50),
@CARGO varchar (50),
@IMAGEN image,
@SEXO varchar (50),
@FECHA date
as
insert into CLIENTE(NOMBRE, APELLIDO ,DIRECCION, TELEFONO, IDENTIFICACION, CARGO, IMAGEN, SEXO, FECHA) 
values (@NOMBRE, @APELLIDO ,@DIRECCION, @TELEFONO, @IDENTIFICACION, @CARGO, @IMAGEN, @SEXO, @FECHA)
GO
/****** Object:  StoredProcedure [dbo].[insertar_detalle_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_detalle_donacion]
@IDDONACION integer,
@IDLIBRO integer,
@FECHA date,
@CANTIDAD integer
as 
insert into DETALLE_DONACION(IDDONACION, IDLIBRO, FECHA, CANTIDAD)
values (@IDDONACION, @IDLIBRO, @FECHA, @CANTIDAD)
GO
/****** Object:  StoredProcedure [dbo].[insertar_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_donacion]
@NOMBRE varchar (50),
@DIRECCION varchar (50),
@TELEFONO varchar (12),
@EMAIL varchar (50)
as
insert into DONACION(NOMBRE, DIRECCION, TELEFONO, EMAIL) 
values (@NOMBRE, @DIRECCION, @TELEFONO, @EMAIL)

GO
/****** Object:  StoredProcedure [dbo].[insertar_EDITORIAL]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_EDITORIAL]
@NOMBRE varchar (50)
as
insert into EDITORIAL(NOMBRE) 
values (@NOMBRE)

GO
/****** Object:  StoredProcedure [dbo].[insertar_estado]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_estado]
@NOMBRE varchar (50)
as
insert into ESTADO(NOMBRE) values (@NOMBRE)

GO
/****** Object:  StoredProcedure [dbo].[insertar_libro]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_libro]
@CODIGO varchar (50),
@NOMBRE varchar (50),
@FECHALIBRO date,
@CANTIDAD integer,
@IDCATEGORIA integer,
@IDAUTOR integer,
@IDESTADO integer,
@IDUBICACION integer,
@IMAGEN image,
@DISPONIBLES integer,
@DESCRIPCION varchar (230),
@PAGINAS integer,
@IDEDITORIAL integer
as 
insert into LIBRO(CODIGO, NOMBRE, FECHALIBRO, CANTIDAD, IDCATEGORIA, IDAUTOR, IDESTADO, IDUBICACION, IMAGEN, DISPONIBLES, DESCRIPCION, PAGINAS, IDEDITORIAL)
values (@CODIGO, @NOMBRE, @FECHALIBRO, @CANTIDAD, @IDCATEGORIA, @IDAUTOR, @IDESTADO, @IDUBICACION, @IMAGEN, @DISPONIBLES, @DESCRIPCION, @PAGINAS, @IDEDITORIAL)
GO
/****** Object:  StoredProcedure [dbo].[insertar_PRESTAMO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_PRESTAMO]
@IDUSUARIO integer,
@IDCLIENTE integer,
@CANTIDAD integer,
@FECHA date
as 
insert into PRESTAMO(IDUSUARIO, IDCLIENTE, CANTIDAD, FECHA)
values (@IDUSUARIO, @IDCLIENTE, @CANTIDAD, @FECHA)
GO
/****** Object:  StoredProcedure [dbo].[insertar_ubicacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[insertar_ubicacion]
@NOMBRE_ESTANTERIA varchar (40),
@NUMERO_FILA integer
as
insert into UBICACION(NOMBRE_ESTANTERIA, NUMERO_FILA) 
values (@NOMBRE_ESTANTERIA, @NUMERO_FILA)

GO
/****** Object:  StoredProcedure [dbo].[insertar_usuario]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[insertar_usuario]
@CODIGO VARCHAR(8),
@NOMBRE varchar (50),
@APELLIDO VARCHAR (50),
@DPI NVARCHAR (12),
@USUARIO varchar (50),
@PASS varchar (50),
@FECHA DATE,
@EMAIL varchar (50),
@TELEFONO varchar (12),
@TIPOUSUARIO varchar (30),
@ACCESO varchar (1),
@IMAGEN image
as
insert into USUARIO(CODIGO,NOMBRE, APELLIDO, DPI, USUARIO, PASS, FECHA, EMAIL, TELEFONO, TIPOUSUARIO, ACCESO, IMAGEN) 
values (@CODIGO, @NOMBRE, @APELLIDO, @DPI, @USUARIO, @PASS, @FECHA, @EMAIL, @TELEFONO, @TIPOUSUARIO,@ACCESO, @IMAGEN)
GO
/****** Object:  StoredProcedure [dbo].[mostra_categoria]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostra_categoria]
as
select * from CATEGORIA order by IDCATEGORIA desc

GO
/****** Object:  StoredProcedure [dbo].[mostra_estado]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostra_estado]
as
select * from ESTADO order by IDESTADO desc

GO
/****** Object:  StoredProcedure [dbo].[mostrar_autor]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_autor]
as
select * from AUTOR order by IDAUTOR desc

GO
/****** Object:  StoredProcedure [dbo].[mostrar_cliente]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_cliente]
as
select * from CLIENTE order by IDCLEINTE desc

GO
/****** Object:  StoredProcedure [dbo].[mostrar_detalle_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_detalle_donacion]
as
select DETALLE_DONACION.IDDETALLE_DONACION, DETALLE_DONACION.IDDONACION, DONACION.NOMBRE, DETALLE_DONACION.IDLIBRO, LIBRO.NOMBRE, 
DETALLE_DONACION.FECHA, DETALLE_DONACION.CANTIDAD
from DETALLE_DONACION 
inner join DONACION on DETALLE_DONACION.IDDONACION= DONACION.IDDONACION
inner join LIBRO on DETALLE_DONACION.IDLIBRO= LIBRO.IDLIBRO
order by DETALLE_DONACION.IDDETALLE_DONACION asc
GO
/****** Object:  StoredProcedure [dbo].[mostrar_detalledonacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_detalledonacion]
as
select DETALLE_DONACION.IDDETALLE_DONACION, DETALLE_DONACION.IDDONACION, DONACION.NOMBRE, DETALLE_DONACION.IDLIBRO, LIBRO.NOMBRE,
DETALLE_DONACION.FECHA, DETALLE_DONACION.CANTIDAD
from DETALLE_DONACION
inner join DONACION on DETALLE_DONACION.IDDONACION= DONACION.IDDONACION
inner join LIBRO on DETALLE_DONACION.IDLIBRO= LIBRO.IDLIBRO
order by DETALLE_DONACION.IDDETALLE_DONACION desc
GO
/****** Object:  StoredProcedure [dbo].[mostrar_donacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_donacion]
as
select * from DONACION order by IDDONACION desc

GO
/****** Object:  StoredProcedure [dbo].[mostrar_EDITORIAL]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_EDITORIAL]
as
select * from EDITORIAL order by IDEDITORIAL desc

GO
/****** Object:  StoredProcedure [dbo].[mostrar_libro]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_libro]
as
select LIBRO.IDLIBRO, LIBRO.CODIGO, LIBRO.NOMBRE, LIBRO.FECHALIBRO, LIBRO.CANTIDAD, 
LIBRO.IDCATEGORIA, CATEGORIA.NOMBRE, 
LIBRO.IDAUTOR, AUTOR.NOMBRE, 
LIBRO.IDESTADO, ESTADO.NOMBRE,
LIBRO.IDUBICACION, UBICACION.NOMBRE_ESTANTERIA, 
LIBRO.IMAGEN, LIBRO.DISPONIBLES, LIBRO.DESCRIPCION, LIBRO.PAGINAS, 
LIBRO.IDEDITORIAL, EDITORIAL.NOMBRE
from LIBRO inner join CATEGORIA on LIBRO.IDCATEGORIA=CATEGORIA.IDCATEGORIA
inner join AUTOR ON LIBRO.IDAUTOR = AUTOR.IDAUTOR
inner join ESTADO on LIBRO.IDESTADO = ESTADO.IDESTADO
inner join UBICACION on LIBRO.IDUBICACION = UBICACION.IDUBICACION
inner join EDITORIAL on LIBRO.IDEDITORIAL = EDITORIAL.IDEDITORIAL
order by LIBRO.IDLIBRO desc
GO
/****** Object:  StoredProcedure [dbo].[mostrar_PRESTAMO]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mostrar_PRESTAMO]
as
select PRESTAMO.IDPRESTADO, PRESTAMO.IDUSUARIO, USUARIO.NOMBRE, PRESTAMO.IDCLIENTE, CLIENTE.NOMBRE,
PRESTAMO.CANTIDAD, PRESTAMO.FECHA
from PRESTAMO
inner join USUARIO on PRESTAMO.IDUSUARIO= USUARIO.IDUSUARIO
inner join CLIENTE on PRESTAMO.IDCLIENTE= CLIENTE.IDCLEINTE
order by PRESTAMO.IDPRESTADO desc
GO
/****** Object:  StoredProcedure [dbo].[mostrar_ubicacion]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_ubicacion]
as
select * from UBICACION order by IDUBICACION desc

GO
/****** Object:  StoredProcedure [dbo].[mostrar_usuario]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrar_usuario]
as
select * from USUARIO order by IDUSUARIO desc

GO
/****** Object:  StoredProcedure [dbo].[mostrarTotalCliente]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[mostrarTotalCliente]
as
select count(*) from cliente
GO
/****** Object:  StoredProcedure [dbo].[reporteclientegenero]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[reporteclientegenero]
@SEXO varchar (50)
as
select * from CLIENTE
where cliente.SEXO = @SEXO
GO
/****** Object:  StoredProcedure [dbo].[reportedonador]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[reportedonador]
@NOMBRE varchar (50)
as
select DETALLE_DONACION.IDDETALLE_DONACION, DETALLE_DONACION.IDDONACION, DONACION.NOMBRE, DETALLE_DONACION.IDLIBRO, LIBRO.NOMBRE, 
DETALLE_DONACION.FECHA, DETALLE_DONACION.CANTIDAD
from DETALLE_DONACION 
inner join DONACION on DETALLE_DONACION.IDDONACION= DONACION.IDDONACION
inner join LIBRO on DETALLE_DONACION.IDLIBRO= LIBRO.IDLIBRO
		 where DONACION.NOMBRE=@NOMBRE
GO
/****** Object:  StoredProcedure [dbo].[reportelibros]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[reportelibros]
as
select LIBRO.CODIGO, LIBRO.NOMBRE, LIBRO.CANTIDAD, 
CATEGORIA.NOMBRE, 
LIBRO.IDAUTOR, AUTOR.NOMBRE, 
LIBRO.IDESTADO, ESTADO.NOMBRE,
LIBRO.IDUBICACION, UBICACION.NOMBRE_ESTANTERIA, 
LIBRO.IMAGEN
from LIBRO inner join CATEGORIA on LIBRO.IDCATEGORIA=CATEGORIA.IDCATEGORIA
inner join AUTOR ON LIBRO.IDAUTOR = AUTOR.IDAUTOR
inner join ESTADO on LIBRO.IDESTADO = ESTADO.IDESTADO
inner join UBICACION on LIBRO.IDUBICACION = UBICACION.IDUBICACION
order by LIBRO.IDLIBRO desc
GO
/****** Object:  StoredProcedure [dbo].[validar_usaurio]    Script Date: 12/05/2018 8:59:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[validar_usaurio]
@USUARIO varchar (50),
@PASS varchar (50)
as
select * from USUARIO 
where USUARIO=@USUARIO and PASS=@PASS and ACCESO='1'

GO
USE [master]
GO
ALTER DATABASE [biblioteca] SET  READ_WRITE 
GO
