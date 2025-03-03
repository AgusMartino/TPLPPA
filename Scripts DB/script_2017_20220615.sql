USE [master]
GO
/****** Object:  Database [TP_Integrador_G4_LPPA]    Script Date: 15/6/2022 14:00:26 ******/
CREATE DATABASE [TP_Integrador_G4_LPPA]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP_Integrador_G4_LPPA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TP_Integrador_G4_LPPA.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TP_Integrador_G4_LPPA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TP_Integrador_G4_LPPA_log.ldf' , SIZE = 1536KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP_Integrador_G4_LPPA].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET RECOVERY FULL 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET  MULTI_USER 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET QUERY_STORE = OFF
GO
USE [TP_Integrador_G4_LPPA]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[Id_usuario] [uniqueidentifier] NOT NULL,
	[Nombre_Usuario] [varchar](100) NOT NULL,
	[IdPregunta] [uniqueidentifier] NULL,
	[Respuesta] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[DNI] [varchar](20) NULL,
	[Contraseña] [varchar](100) NOT NULL,
	[Salt] [varchar](100) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permiso]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permiso](
	[Id_permiso] [uniqueidentifier] NOT NULL,
	[Permiso] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Permiso] PRIMARY KEY CLUSTERED 
(
	[Id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Permiso]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Permiso](
	[Id_usuario] [uniqueidentifier] NOT NULL,
	[Id_permiso] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Usuario_Permiso] PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC,
	[Id_permiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_Usuario_Permiso]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_Usuario_Permiso]
AS
SELECT        dbo.Usuario.Id_usuario, dbo.Permiso.Id_permiso, dbo.Usuario.Nombre_Usuario, dbo.Permiso.Permiso
FROM            dbo.Usuario INNER JOIN
                         dbo.Usuario_Permiso ON dbo.Usuario.Id_usuario = dbo.Usuario_Permiso.Id_usuario INNER JOIN
                         dbo.Permiso ON dbo.Usuario_Permiso.Id_permiso = dbo.Permiso.Id_permiso
GO
/****** Object:  Table [dbo].[Token]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Token](
	[Id_token] [uniqueidentifier] NOT NULL,
	[Id_usuario] [uniqueidentifier] NOT NULL,
	[Token] [varchar](200) NOT NULL,
	[Expiracion] [datetime] NULL,
	[Salt] [varchar](100) NULL,
 CONSTRAINT [PK_Token] PRIMARY KEY CLUSTERED 
(
	[Id_token] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_Usuario_Token]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_Usuario_Token]
AS
SELECT        dbo.Usuario.Id_usuario, dbo.Token.Id_token, dbo.Usuario.Nombre_Usuario, dbo.Token.Token, dbo.Token.Expiracion
FROM            dbo.Usuario INNER JOIN
                         dbo.Token ON dbo.Usuario.Id_usuario = dbo.Token.Id_usuario
GO
/****** Object:  Table [dbo].[Pregunta_seguridad]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta_seguridad](
	[Id_Pregunta_Seguridad] [uniqueidentifier] NOT NULL,
	[Pregunta_seguridad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Pregunta_seguridad] PRIMARY KEY CLUSTERED 
(
	[Id_Pregunta_Seguridad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vista_Usuario_Pregunta]    Script Date: 15/6/2022 14:00:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vista_Usuario_Pregunta]
AS
SELECT        dbo.Usuario.Id_usuario, dbo.Pregunta_seguridad.Id_Pregunta_Seguridad, dbo.Usuario.Nombre_Usuario, dbo.Pregunta_seguridad.Pregunta_seguridad
FROM            dbo.Usuario INNER JOIN
                         dbo.Pregunta_seguridad ON dbo.Usuario.IdPregunta = dbo.Pregunta_seguridad.Id_Pregunta_Seguridad
GO
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f', N'Actualización de Clientes')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'5e579f36-7059-4212-a80a-30c9b6eb1848', N'Lectura de Ventas')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'7480d3f6-dc14-4aa9-a232-56563bdc2448', N'Actualización de Pedidos')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c', N'Lectura de Bitácora')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'f47cd724-9e72-4667-8437-74823fd0bea7', N'Lectura de Clientes')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9', N'Actualización de Ventas')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'1aca42d9-137d-4e29-a37e-b9fab17c7426', N'Lectura de Pedidos')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'923e5de6-8f4c-4894-a313-f10ab2c822e1', N'Lectura de Productos')
INSERT [dbo].[Permiso] ([Id_permiso], [Permiso]) VALUES (N'5986d467-87e4-4752-96ab-f4b41a0c3ffa', N'Actualización de Productos')
GO
INSERT [dbo].[Pregunta_seguridad] ([Id_Pregunta_Seguridad], [Pregunta_seguridad]) VALUES (N'd037ef91-dfb4-4c1d-a2ae-0c7092ee06e2', N'¿Cuál es el nombre de tu abuelo?')
INSERT [dbo].[Pregunta_seguridad] ([Id_Pregunta_Seguridad], [Pregunta_seguridad]) VALUES (N'317ff8ba-096a-4a11-a258-64dd1ce65a79', N'¿Cuál fue tu primer auto?')
INSERT [dbo].[Pregunta_seguridad] ([Id_Pregunta_Seguridad], [Pregunta_seguridad]) VALUES (N'6c87109c-9fd2-4a50-bd0b-8350bcc35e47', N'¿Cuál es el nombre de tu gato?')
INSERT [dbo].[Pregunta_seguridad] ([Id_Pregunta_Seguridad], [Pregunta_seguridad]) VALUES (N'1fbf4f00-cbcb-4b47-a87c-8680511c8d4a', N'¿Cuál es tu color favorito?')
GO
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'a57eb747-f4b9-4699-862c-201b6e0e8c6c', N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'TGF1cmEuVmVsYXpjbw==', CAST(N'2022-07-15T09:57:51.677' AS DateTime), N'e36ebb56-fc57-482c-b642-2b6674e85c96')
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'b9e3c015-d4fe-4962-a035-57dc85c8f7ea', N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'Sm9yZ2UuUGVkcm8=', CAST(N'2022-07-15T10:03:24.680' AS DateTime), N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc')
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'ad3638c1-5c6e-47ae-a6c3-7d50cf004477', N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'Sm9hcXVpbi5Lb3Jh', CAST(N'2022-07-15T10:03:46.050' AS DateTime), N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c')
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'0a9ed6dd-ba47-4fd6-9b76-8f35276a2303', N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'Q3Jpc3RpYW5fMzI3', CAST(N'2022-07-15T10:04:03.293' AS DateTime), N'bae9e34e-b203-4ad0-9b68-ab831e74a423')
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'f4071dbb-d109-4ce2-8074-d85807cd41a0', N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'TWF0aWFzLlZlcmE=', CAST(N'2022-07-15T10:04:13.027' AS DateTime), N'652ad86e-b4c4-4419-80c4-88877a36cea0')
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'6484840e-6593-4b0b-91ef-e43bab6491e1', N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'RXplcXVpZWxfNzY3', CAST(N'2022-07-15T10:04:26.650' AS DateTime), N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4')
INSERT [dbo].[Token] ([Id_token], [Id_usuario], [Token], [Expiracion], [Salt]) VALUES (N'23d87cd0-2b63-449e-8e1b-ff4994168736', N'83362b52-398b-4376-8e6c-cab7f96a732b', N'THVpcy5TYWxpbmFz', CAST(N'2022-07-15T10:04:34.267' AS DateTime), N'83362b52-398b-4376-8e6c-cab7f96a732b')
GO
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'Yonatan.Ortega', N'd037ef91-dfb4-4c1d-a2ae-0c7092ee06e2', N'Pedro', N'Ortega@gmail.com', N'98765378', N'ssdfsdf807923jn', N'169084d4-7e59-4959-9c88-1016be5c5d80')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'Laura.Velazco', N'317ff8ba-096a-4a11-a258-64dd1ce65a79', N'Clio', N'VelazcoL@gmail.com', N'2342342342', N'lksjdfhsdñfjwlehbf', N'ebb6658b-c833-4f73-a793-9f572dc161e6')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'Joaquin.Kora', N'6c87109c-9fd2-4a50-bd0b-8350bcc35e47', N'PEPE', N'Kora.J@gmail.com', N'9273628934', N'sdfsdfsdfs8023hj2nfc', N'f08e47c6-c802-4920-8ed0-acbe1e60b718')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'Matias.Vera', N'6c87109c-9fd2-4a50-bd0b-8350bcc35e47', N'Miau', N'Vera.ja@gmail.com', N'997657833', N'sdcsdcsdcsdñkjcso8yycs', N'eaecf09f-034f-4494-a715-c9e296643c4c')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'Prueba 1', N'1fbf4f00-cbcb-4b47-a87c-8680511c8d4a', N'Verde', N'Cristian.Lopez4@gmail.com', NULL, N'prueba1', N'd544ff2b-0d46-4454-a670-52093e3ee402')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'Luis.Salinas', N'1fbf4f00-cbcb-4b47-a87c-8680511c8d4a', N'Rojo', N'Salinas.La@gmail.com', N'223422344', N'dfvddf', N'5d54151b-ad18-42c0-8edc-31af4a7a5669')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'Jorge.Pedro', N'317ff8ba-096a-4a11-a258-64dd1ce65a79', N'Palio', N'jorge@gmail.com', N'7865773665', N'Yhjhghjj', N'7702c41b-ba23-4f05-b8c2-d39f066cbc1b')
INSERT [dbo].[Usuario] ([Id_usuario], [Nombre_Usuario], [IdPregunta], [Respuesta], [Email], [DNI], [Contraseña], [Salt]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'Prueba 2', N'317ff8ba-096a-4a11-a258-64dd1ce65a79', N'Peugeot 206', N'Cristian.Lopez4@gmail.com', NULL, N'prueba2', N'32bd591a-bd31-43ae-9d36-6ace39ab3409')
GO
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'5f6cbe7f-1472-418c-9d15-044142ad8825', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'e36ebb56-fc57-482c-b642-2b6674e85c96', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'00bf5dd5-47e7-49da-975a-4ce64d8d1c4c', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'652ad86e-b4c4-4419-80c4-88877a36cea0', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'bae9e34e-b203-4ad0-9b68-ab831e74a423', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'83362b52-398b-4376-8e6c-cab7f96a732b', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'd20aaf4b-7d4e-4f10-8384-d1c91b9293cc', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'da3e3bb9-abf7-4f2a-a1cc-187b4c23f91f')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'5e579f36-7059-4212-a80a-30c9b6eb1848')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'7480d3f6-dc14-4aa9-a232-56563bdc2448')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'333f943a-4198-4ac0-8cc7-5a01bbb72a2c')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'f47cd724-9e72-4667-8437-74823fd0bea7')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'00b1fc06-df21-4a1d-9712-a8edd54bfbd9')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'1aca42d9-137d-4e29-a37e-b9fab17c7426')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'923e5de6-8f4c-4894-a313-f10ab2c822e1')
INSERT [dbo].[Usuario_Permiso] ([Id_usuario], [Id_permiso]) VALUES (N'1eb89fa0-ec5b-4f29-ac71-fcd99a5887e4', N'5986d467-87e4-4752-96ab-f4b41a0c3ffa')
GO
ALTER TABLE [dbo].[Permiso] ADD  CONSTRAINT [DF_Permiso_Id_permiso]  DEFAULT (newid()) FOR [Id_permiso]
GO
ALTER TABLE [dbo].[Pregunta_seguridad] ADD  CONSTRAINT [DF_Pregunta_seguridad_Id_Pregunta_Seguridad]  DEFAULT (newid()) FOR [Id_Pregunta_Seguridad]
GO
ALTER TABLE [dbo].[Token] ADD  CONSTRAINT [DF_Token_Id_token]  DEFAULT (newid()) FOR [Id_token]
GO
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [DF_Usuario_Id_usuario]  DEFAULT (newid()) FOR [Id_usuario]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[11] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Usuario_Permiso"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 102
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Permiso"
            Begin Extent = 
               Top = 6
               Left = 462
               Bottom = 102
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 2355
         Width = 2565
         Width = 2130
         Width = 2850
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_Usuario_Permiso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_Usuario_Permiso'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Pregunta_seguridad"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 102
               Right = 464
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_Usuario_Pregunta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_Usuario_Pregunta'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[9] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Usuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 217
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Token"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 172
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2820
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_Usuario_Token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vista_Usuario_Token'
GO
USE [master]
GO
ALTER DATABASE [TP_Integrador_G4_LPPA] SET  READ_WRITE 
GO
