USE [master]
GO
/****** Object:  Database [TPIntegradorGrupo6]    Script Date: 11/12/2023 4:05:03 ******/
CREATE DATABASE [TPIntegradorGrupo6]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TPIntegradorGrupo6', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TPIntegradorGrupo6.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TPIntegradorGrupo6_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TPIntegradorGrupo6_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TPIntegradorGrupo6] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TPIntegradorGrupo6].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ARITHABORT OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET  MULTI_USER 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TPIntegradorGrupo6] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TPIntegradorGrupo6] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TPIntegradorGrupo6] SET QUERY_STORE = OFF
GO
USE [TPIntegradorGrupo6]
GO
/****** Object:  Table [dbo].[ARTICULOS]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ARTICULOS](
	[IDArticulo] [int] IDENTITY(10000,1) NOT NULL,
	[NombreArticulo] [varchar](50) NULL,
	[IDCategoria] [int] NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[PrecioDeVenta] [money] NOT NULL,
	[PrecioDeCompra] [money] NOT NULL,
	[Stock] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIAS]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIAS](
	[IDCategoria] [int] IDENTITY(1,1) NOT NULL,
	[NombreCategoria] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[IDCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CIUDAD]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CIUDAD](
	[CodigoCiudad] [int] IDENTITY(1,1) NOT NULL,
	[NombreCiudad] [varchar](50) NOT NULL,
	[CodigoProvincia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTES]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTES](
	[DNI] [bigint] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Alias] [varchar](30) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[EMail] [varchar](50) NULL,
	[Direccion] [varchar](100) NOT NULL,
	[CodigoCiudad] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DNI] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DETALLEVENTAS]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DETALLEVENTAS](
	[IDVenta] [bigint] NOT NULL,
	[IDArticulo] [int] NOT NULL,
	[PrecioUnitario] [money] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_DETALLEVENTAS] PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC,
	[IDArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOGINUSUARIOS]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LOGINUSUARIOS](
	[Alias] [varchar](30) NOT NULL,
	[Contrasenia] [varchar](12) MASKED WITH (FUNCTION = 'default()') NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Alias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEDIDOS]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEDIDOS](
	[IDPedido] [bigint] IDENTITY(1,1) NOT NULL,
	[IDArticulo] [int] NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[FechaPedido] [date] NOT NULL,
	[CostoTotal] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVEEDORES]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVEEDORES](
	[IDProveedor] [int] IDENTITY(100,1) NOT NULL,
	[NombreProveedor] [varchar](50) NOT NULL,
	[Telefono] [varchar](30) NOT NULL,
	[EMail] [varchar](50) NULL,
	[Direccion] [varchar](100) NOT NULL,
	[CodigoCiudad] [int] NOT NULL,
	[Estado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVINCIA]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVINCIA](
	[CodigoProvincia] [int] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CodigoProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VENTAS]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VENTAS](
	[IDVenta] [bigint] IDENTITY(1,1) NOT NULL,
	[DNICliente] [bigint] NOT NULL,
	[PrecioTotal] [money] NOT NULL,
	[FechaVenta] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IDVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ARTICULOS] ON 

INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10000, N'Alicate', 3, 101, 2100.0000, 1050.0000, 121, 0)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10001, N'Capacitor', 2, 100, 830.0000, 415.0000, 350, 0)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10002, N'Crimpeadora', 3, 100, 13500.0000, 6750.0000, 250, 0)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10003, N'Luz Led Roja', 2, 100, 3180.0000, 1590.0000, 600, 1)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10004, N'Potenciometro', 2, 100, 500.0000, 250.0000, 600, 1)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10005, N'Resistencias', 2, 100, 30.0000, 15.0000, 700, 1)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10006, N'Soldador', 3, 101, 10800.0000, 5400.0000, 300, 1)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10007, N'Téster', 4, 101, 15000.0000, 7500.0000, 400, 1)
INSERT [dbo].[ARTICULOS] ([IDArticulo], [NombreArticulo], [IDCategoria], [IDProveedor], [PrecioDeVenta], [PrecioDeCompra], [Stock], [Estado]) VALUES (10008, N'1234', 1, 100, 123.0000, 123.0000, 123, 1)
SET IDENTITY_INSERT [dbo].[ARTICULOS] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORIAS] ON 

INSERT [dbo].[CATEGORIAS] ([IDCategoria], [NombreCategoria], [Descripcion]) VALUES (1, N'Arduino', N'Descripcion')
INSERT [dbo].[CATEGORIAS] ([IDCategoria], [NombreCategoria], [Descripcion]) VALUES (2, N'Componentes', NULL)
INSERT [dbo].[CATEGORIAS] ([IDCategoria], [NombreCategoria], [Descripcion]) VALUES (3, N'Herramientas', NULL)
INSERT [dbo].[CATEGORIAS] ([IDCategoria], [NombreCategoria], [Descripcion]) VALUES (4, N'Instrumentos de Medición', NULL)
SET IDENTITY_INSERT [dbo].[CATEGORIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[CIUDAD] ON 

INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (1, N'Aimogasta', 11)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (2, N'Allen', 15)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (3, N'Alta Gracia', 5)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (4, N'Andalgalá', 2)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (5, N'Añatuya', 21)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (6, N'Apóstoles', 13)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (7, N'Belén', 2)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (8, N'CABA', 1)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (9, N'Cafayate', 16)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (10, N'Caleta Olivia', 19)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (11, N'Castelli', 3)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (12, N'Caucete', 17)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (13, N'Chepes', 11)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (14, N'Chilecito', 11)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (15, N'Chimbas', 17)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (16, N'Cipolletti', 15)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (17, N'Clorinda', 8)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (18, N'Comodoro Rivadavia', 4)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (19, N'Concepción', 23)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (20, N'Concepción del Uruguay', 7)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (21, N'Concordia', 7)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (22, N'Córdoba', 5)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (23, N'Corrientes', 6)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (24, N'Curuzú Cuatiá', 6)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (25, N'Cutral-Có', 14)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (26, N'El Calafate', 19)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (27, N'El Colorado', 8)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (28, N'Eldorado', 13)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (29, N'Esquel', 4)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (30, N'Fernández', 21)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (31, N'Formosa', 8)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (32, N'General Pico', 10)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (33, N'General Roca', 15)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (34, N'General San Martín', 3)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (35, N'Godoy Cruz', 12)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (36, N'Goya', 6)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (37, N'Gualeguaychú', 7)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (38, N'Humahuaca', 9)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (39, N'Jesús María', 5)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (40, N'Junín de los Andes', 14)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (41, N'La Banda', 21)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (42, N'La Plata', 1)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (43, N'La Quiaca', 9)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (44, N'La Rioja', 2)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (45, N'La Rioja', 11)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (46, N'La Toma', 18)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (47, N'Las Lomitas', 8)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (48, N'Luján de Cuyo', 12)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (49, N'Macachín', 10)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (50, N'Maipú', 12)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (51, N'Mendoza', 12)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (52, N'Mercedes', 6)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (53, N'Monteros', 23)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (54, N'Neuquén', 14)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (55, N'Oberá', 13)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (56, N'Orán', 16)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (57, N'Palpalá', 9)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (58, N'Paraná', 7)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (59, N'Paso de los Libres', 6)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (60, N'Pico Truncado', 19)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (61, N'Pirané', 8)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (62, N'Pocito', 17)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (63, N'Posadas', 13)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (64, N'Presidencia Roque Sáenz Peña', 3)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (65, N'Puerto Deseado', 19)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (66, N'Puerto Iguazú', 13)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (67, N'Puerto Madryn', 4)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (68, N'Rafaela', 20)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (69, N'Rawson', 4)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (70, N'Reconquista', 20)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (71, N'Resistencia', 3)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (72, N'Río Cuarto', 5)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (73, N'Río Gallegos', 19)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (74, N'Río Grande', 22)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (75, N'Rivadavia', 17)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (76, N'Roque Sáenz Peña', 3)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (77, N'Rosario', 20)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (78, N'Salta', 16)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (79, N'San Carlos de Bariloche', 15)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (80, N'San Fernando', 1)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (81, N'San Fernando del Valle de Catamarca', 2)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (82, N'San Francisco del Monte de Oro', 18)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (83, N'San Isidro', 1)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (84, N'San Juan', 17)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (85, N'San Luis', 18)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (86, N'San Martín de los Andes', 14)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (87, N'San Miguel de Tucumán', 23)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (88, N'San Pedro', 9)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (89, N'San Rafael', 12)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (90, N'San Salvador de Jujuy', 9)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (91, N'San Salvador de Jujuy', 16)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (92, N'Santa Fe', 20)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (93, N'Santa María', 2)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (94, N'Santa Rosa', 10)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (95, N'Santa Rosa del Conlara', 18)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (96, N'Santiago del Estero', 21)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (97, N'Tafí del Valle', 23)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (98, N'Tartagal', 16)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (99, N'Termas de Río Hondo', 21)
GO
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (100, N'TIGRE', 1)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (101, N'Toay', 10)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (102, N'Tolhuin', 22)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (103, N'Trelew', 4)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (104, N'Ushuaia', 22)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (105, N'Venado Tuerto', 20)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (106, N'Victorica', 10)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (107, N'Viedma', 15)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (108, N'Villa Carlos Paz', 5)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (109, N'Villa Mercedes', 18)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (110, N'Villa Unión', 11)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (111, N'Villaguay', 7)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (112, N'Yerba Buena', 23)
INSERT [dbo].[CIUDAD] ([CodigoCiudad], [NombreCiudad], [CodigoProvincia]) VALUES (113, N'Zapala', 14)
SET IDENTITY_INSERT [dbo].[CIUDAD] OFF
GO
INSERT [dbo].[CLIENTES] ([DNI], [Apellido], [Nombre], [Alias], [Telefono], [EMail], [Direccion], [CodigoCiudad], [Estado]) VALUES (30222555, N'Martínez', N'Mario', N'MarioMartinez', N'47223366', N'MarioMartinez@gmail.com', N'Alsina 502', 2, 1)
INSERT [dbo].[CLIENTES] ([DNI], [Apellido], [Nombre], [Alias], [Telefono], [EMail], [Direccion], [CodigoCiudad], [Estado]) VALUES (32500400, N'Alcázar', N'Pedro', N'PedroAlcazar', N'47445102', N'PedroAlcazar@gmail.com', N'Av. Sobremonte 126', 14, 1)
INSERT [dbo].[CLIENTES] ([DNI], [Apellido], [Nombre], [Alias], [Telefono], [EMail], [Direccion], [CodigoCiudad], [Estado]) VALUES (34556880, N'Miller', N'Diana', N'DianaMiller', N'47982412', N'DianaMiller@gmail.com', N'Madero 444', 2, 1)
GO
INSERT [dbo].[LOGINUSUARIOS] ([Alias], [Contrasenia], [Tipo], [Estado]) VALUES (N'DianaMiller', N'DianaM123', N'C', 1)
INSERT [dbo].[LOGINUSUARIOS] ([Alias], [Contrasenia], [Tipo], [Estado]) VALUES (N'MarioMartinez', N'MarioM123', N'V', 1)
INSERT [dbo].[LOGINUSUARIOS] ([Alias], [Contrasenia], [Tipo], [Estado]) VALUES (N'PedroAlcazar', N'PedroA123', N'C', 1)
GO
SET IDENTITY_INSERT [dbo].[PEDIDOS] ON 

INSERT [dbo].[PEDIDOS] ([IDPedido], [IDArticulo], [IDProveedor], [Cantidad], [FechaPedido], [CostoTotal]) VALUES (1, 10004, 100, 12, CAST(N'2023-01-10' AS Date), 3000.0000)
INSERT [dbo].[PEDIDOS] ([IDPedido], [IDArticulo], [IDProveedor], [Cantidad], [FechaPedido], [CostoTotal]) VALUES (2, 10006, 101, 15, CAST(N'2023-03-10' AS Date), 81000.0000)
SET IDENTITY_INSERT [dbo].[PEDIDOS] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVEEDORES] ON 

INSERT [dbo].[PROVEEDORES] ([IDProveedor], [NombreProveedor], [Telefono], [EMail], [Direccion], [CodigoCiudad], [Estado]) VALUES (100, N'Siemens', N'23023023', N'SiemensProv@gmail.com', N'Av. Córdoba 1200', 5, 0)
INSERT [dbo].[PROVEEDORES] ([IDProveedor], [NombreProveedor], [Telefono], [EMail], [Direccion], [CodigoCiudad], [Estado]) VALUES (101, N'Sica', N'1123332211', N'SicaProv@gmail.com', N'Av. Libertador 7002', 1, 1)
INSERT [dbo].[PROVEEDORES] ([IDProveedor], [NombreProveedor], [Telefono], [EMail], [Direccion], [CodigoCiudad], [Estado]) VALUES (102, N'Proveedor', N'1234565', N'proveedor@proveedor.com', N'Av. Proveedor 123', 83, 1)
SET IDENTITY_INSERT [dbo].[PROVEEDORES] OFF
GO
SET IDENTITY_INSERT [dbo].[PROVINCIA] ON 

INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (1, N'Buenos Aires')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (2, N'Catamarca')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (3, N'Chaco')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (4, N'Chubut')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (5, N'Córdoba')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (6, N'Corrientes')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (7, N'Entre Ríos')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (8, N'Formosa')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (9, N'Jujuy')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (10, N'La Pampa')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (11, N'La Rioja')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (12, N'Mendoza')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (13, N'Misiones')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (14, N'Neuquén')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (15, N'Río Negro')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (16, N'Salta')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (17, N'San Juan')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (18, N'San Luis')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (19, N'Santa Cruz')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (20, N'Santa Fe')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (21, N'Santiago del Estero')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (22, N'Tierra del Fuego')
INSERT [dbo].[PROVINCIA] ([CodigoProvincia], [NombreProvincia]) VALUES (23, N'Tucumán')
SET IDENTITY_INSERT [dbo].[PROVINCIA] OFF
GO
ALTER TABLE [dbo].[ARTICULOS] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[CLIENTES] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[LOGINUSUARIOS] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[PROVEEDORES] ADD  DEFAULT ((1)) FOR [Estado]
GO
ALTER TABLE [dbo].[VENTAS] ADD  CONSTRAINT [DF_VENTAS_FechaVenta]  DEFAULT (getdate()) FOR [FechaVenta]
GO
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD FOREIGN KEY([IDCategoria])
REFERENCES [dbo].[CATEGORIAS] ([IDCategoria])
GO
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[PROVEEDORES] ([IDProveedor])
GO
ALTER TABLE [dbo].[CIUDAD]  WITH CHECK ADD FOREIGN KEY([CodigoProvincia])
REFERENCES [dbo].[PROVINCIA] ([CodigoProvincia])
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD FOREIGN KEY([Alias])
REFERENCES [dbo].[LOGINUSUARIOS] ([Alias])
GO
ALTER TABLE [dbo].[CLIENTES]  WITH CHECK ADD FOREIGN KEY([CodigoCiudad])
REFERENCES [dbo].[CIUDAD] ([CodigoCiudad])
GO
ALTER TABLE [dbo].[DETALLEVENTAS]  WITH CHECK ADD  CONSTRAINT [FK_DETALLEVENTAS_ARTICULOS] FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[ARTICULOS] ([IDArticulo])
GO
ALTER TABLE [dbo].[DETALLEVENTAS] CHECK CONSTRAINT [FK_DETALLEVENTAS_ARTICULOS]
GO
ALTER TABLE [dbo].[DETALLEVENTAS]  WITH CHECK ADD  CONSTRAINT [FK_DETALLEVENTAS_VENTAS] FOREIGN KEY([IDVenta])
REFERENCES [dbo].[VENTAS] ([IDVenta])
GO
ALTER TABLE [dbo].[DETALLEVENTAS] CHECK CONSTRAINT [FK_DETALLEVENTAS_VENTAS]
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD FOREIGN KEY([IDArticulo])
REFERENCES [dbo].[ARTICULOS] ([IDArticulo])
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[PROVEEDORES] ([IDProveedor])
GO
ALTER TABLE [dbo].[PROVEEDORES]  WITH CHECK ADD FOREIGN KEY([CodigoCiudad])
REFERENCES [dbo].[CIUDAD] ([CodigoCiudad])
GO
ALTER TABLE [dbo].[VENTAS]  WITH CHECK ADD FOREIGN KEY([DNICliente])
REFERENCES [dbo].[CLIENTES] ([DNI])
GO
ALTER TABLE [dbo].[ARTICULOS]  WITH CHECK ADD CHECK  (([Stock]>=(0)))
GO
ALTER TABLE [dbo].[LOGINUSUARIOS]  WITH CHECK ADD CHECK  (([Tipo]='V' OR [Tipo]='C'))
GO
ALTER TABLE [dbo].[PEDIDOS]  WITH CHECK ADD CHECK  (([Cantidad]>(0)))
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarArticulo]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarArticulo] 
	@NOMBRE varchar(50),
	@IDCATEGORIA int,
	@IDPROVEEDOR int,
	@PRECIOVENTA money,
	@PRECIOCOMPRA money,
	@STOCK int
AS
BEGIN
	INSERT INTO ARTICULOS (NombreArticulo, IDCategoria, IDProveedor, PrecioDeVenta, PrecioDeCompra, Stock)
	VALUES (@NOMBRE, @IDCATEGORIA, @IDPROVEEDOR, @PRECIOVENTA, @PRECIOCOMPRA, @STOCK)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarCategoria]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[sp_AgregarCategoria]
	@NOMBRECAT VARCHAR(50),
	@DESCRIP VARCHAR(100)
AS
BEGIN
	INSERT INTO CATEGORIAS(NombreCategoria, Descripcion)
	VALUES (@NOMBRECAT, @DESCRIP)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarDetalleVenta]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AgregarDetalleVenta]
	-- Add the parameters for the stored procedure here
	@IDVENTA BIGINT,
	@IDARTICULO INT,
	@CANTIDAD INT,
	@PRECIOUNITARIO MONEY
AS
BEGIN
    -- Insert statements for procedure here
	INSERT INTO DETALLEVENTAS (IDVenta, IDArticulo, Cantidad, PrecioUnitario) VALUES (@IDVENTA, @IDARTICULO, @CANTIDAD, @PRECIOUNITARIO)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarPedidoMercaderia]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AgregarPedidoMercaderia](
    @IDArticulo INT,
    @Cantidad INT
)
AS 
    BEGIN
    DECLARE @IDProveedor INT
    SELECT @IDProveedor = IDProveedor FROM ARTICULOS WHERE IDArticulo = @IDArticulo

    DECLARE @TOTAL MONEY
    SET @TOTAL = @Cantidad * (SELECT PrecioDeCompra FROM ARTICULOS WHERE IDArticulo = @IDArticulo)

    INSERT INTO PEDIDOS (IDArticulo,IDProveedor,Cantidad,FechaPedido,CostoTotal)
    VALUES (@IDArticulo,@IDProveedor,@Cantidad,GETDATE(),@TOTAL)

    END 
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarProveedor]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_AgregarProveedor]
	@NOMBRE VARCHAR(50),
	@TELEFONO VARCHAR(30),
	@EMAIL VARCHAR(50),
	@DIRECCION VARCHAR(100),
	@CODCIUDAD INT
AS
BEGIN
	INSERT INTO PROVEEDORES (NombreProveedor, Telefono, EMail, Direccion, CodigoCiudad)
	VALUES (@NOMBRE, @TELEFONO, @EMAIL, @DIRECCION, @CODCIUDAD)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AgregarVenta]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_AgregarVenta](
    @DNICliente BIGINT,
	@TOTAL MONEY
)
AS 
    BEGIN
    INSERT INTO VENTAS (DNICliente,PrecioTotal)
    VALUES (@DNICliente,@TOTAL)
	SELECT SCOPE_IDENTITY() AS ID
    END 
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarArticulo]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarArticulo]
	@IDARTICULO int,
	@NOMBRE varchar(50),
	@IDCATEGORIA int,
	@IDPROVEEDOR int,
	@PRECIOVENTA money,
	@PRECIOCOMPRA money,
	@STOCK int
AS
BEGIN
	UPDATE ARTICULOS SET 
		NombreArticulo = @NOMBRE, 
		IDCategoria = @IDCATEGORIA,
		IDProveedor = @IDPROVEEDOR,
		PrecioDeVenta = @PRECIOVENTA,
		PrecioDeCompra = @PRECIOCOMPRA,
		Stock = @STOCK
	WHERE IDArticulo = @IDARTICULO
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCategoria]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CATEGORIAS

CREATE PROCEDURE [dbo].[sp_ModificarCategoria]
	@IDCAT INT,
	@NOMBRECAT VARCHAR(50),
	@DESCRIP VARCHAR(100)
AS
BEGIN 
	UPDATE CATEGORIAS SET

		NombreCategoria = @NOMBRECAT,
		Descripcion = @DESCRIP
	WHERE IDCategoria = @IDCAT
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarCliente]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_ModificarCliente]
	@DNI bigint,
	@APELLIDO varchar(50),
	@NOMBRE varchar(50),
	@TELEFONO varchar(50),
	@EMAIL varchar(50),
	@DIRECCION varchar(100),
	@CODCIUDAD int
AS
BEGIN
	UPDATE CLIENTES SET
		Apellido = @APELLIDO,
		Nombre = @NOMBRE,
		Telefono = @TELEFONO,
		EMail = @EMAIL,
		Direccion = @DIRECCION,
		CodigoCiudad = @CODCIUDAD
	WHERE DNI = @DNI
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarProveedor]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_ModificarProveedor]
	@IDPROVEEDOR INT,
	@NOMBRE VARCHAR(50),
	@TELEFONO VARCHAR(30),
	@EMAIL VARCHAR(50),
	@DIRECCION VARCHAR(100),
	@CODCIUDAD INT
AS
BEGIN 
	UPDATE PROVEEDORES SET
		NombreProveedor = @NOMBRE,
		Telefono = @TELEFONO,
		EMail = @EMAIL,
		Direccion = @DIRECCION,
		CodigoCiudad = @CODCIUDAD
	WHERE IDProveedor = @IDPROVEEDOR
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RegistrarCliente]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_RegistrarCliente](
    @Alias VARCHAR(30),
    @Contrasenia VARCHAR(12),

    @DNI INT,
    @Apellido VARCHAR(50),
    @Nombre VARCHAR(50),
    @Telefono VARCHAR(50),
    @EMail VARCHAR(50),
    @Direccion VARCHAR(100),
    @CodigoCiudad INT
)
AS 
BEGIN
    BEGIN TRY 
    BEGIN TRANSACTION
    INSERT INTO LOGINUSUARIOS (Alias,Contrasenia,Tipo)
    VALUES (@Alias,@Contrasenia,'C')

    INSERT INTO CLIENTES
    VALUES(@DNI,@Apellido,@Nombre,@Alias,@Telefono,@Direccion,@EMail,@CodigoCiudad,1)
    COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH
    RAISERROR ('Error al intentar el registro',16,1)
    ROLLBACK TRANSACTION
    END CATCH
END





















GO
/****** Object:  Trigger [dbo].[tr_BajaLogicaArticulo]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_BajaLogicaArticulo] ON [dbo].[ARTICULOS]
INSTEAD OF DELETE
AS 
BEGIN
    UPDATE ARTICULOS SET Estado = 0
    WHERE IDArticulo = (SELECT IDArticulo FROM DELETED)
END 
GO
ALTER TABLE [dbo].[ARTICULOS] ENABLE TRIGGER [tr_BajaLogicaArticulo]
GO
/****** Object:  Trigger [dbo].[tr_BajaLogicaCliente]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[tr_BajaLogicaCliente] on [dbo].[CLIENTES] 
INSTEAD OF DELETE 
AS 
BEGIN 
    BEGIN TRY 
    BEGIN TRANSACTION
    UPDATE CLIENTES SET Estado = 0
    WHERE DNI = (SELECT DNI FROM DELETED)

    UPDATE LOGINUSUARIOS SET Estado = 0
    WHERE Alias LIKE (SELECT Alias FROM DELETED)
    COMMIT TRANSACTION
    END TRY 
    BEGIN CATCH
    ROLLBACK TRANSACTION
    END CATCH
END 
GO
ALTER TABLE [dbo].[CLIENTES] ENABLE TRIGGER [tr_BajaLogicaCliente]
GO
/****** Object:  Trigger [dbo].[tr_ReducirStock]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[tr_ReducirStock]
   ON [dbo].[DETALLEVENTAS]
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE ARTICULOS 
	SET STOCK = (SELECT STOCK FROM ARTICULOS WHERE IDArticulo = (SELECT IDArticulo FROM INSERTED)) - (SELECT Cantidad FROM INSERTED)
    WHERE IDArticulo = (SELECT IDArticulo FROM INSERTED)
    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[DETALLEVENTAS] ENABLE TRIGGER [tr_ReducirStock]
GO
/****** Object:  Trigger [dbo].[tr_BajaLogicaLoginUsuario]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_BajaLogicaLoginUsuario] ON [dbo].[LOGINUSUARIOS]
INSTEAD OF DELETE
AS 
BEGIN 
    UPDATE LOGINUSUARIOS SET Estado = 0
    WHERE Alias LIKE (SELECT Alias FROM DELETED)
END 

GO
ALTER TABLE [dbo].[LOGINUSUARIOS] ENABLE TRIGGER [tr_BajaLogicaLoginUsuario]
GO
/****** Object:  Trigger [dbo].[tr_BajaLogicaProveedor]    Script Date: 11/12/2023 4:05:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[tr_BajaLogicaProveedor] ON [dbo].[PROVEEDORES]
INSTEAD OF DELETE 
AS 
BEGIN
    UPDATE PROVEEDORES SET Estado = 0
    WHERE IDProveedor = (SELECT IDProveedor FROM DELETED)
END 
GO
ALTER TABLE [dbo].[PROVEEDORES] ENABLE TRIGGER [tr_BajaLogicaProveedor]
GO
USE [master]
GO
ALTER DATABASE [TPIntegradorGrupo6] SET  READ_WRITE 
GO
