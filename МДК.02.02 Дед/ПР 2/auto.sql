USE [master]
GO
/****** Object:  Database [Autoservice]    Script Date: 01.10.2024 15:31:07 ******/
CREATE DATABASE [Autoservice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Autoservice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Autoservice.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Autoservice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Autoservice_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Autoservice] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Autoservice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Autoservice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Autoservice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Autoservice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Autoservice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Autoservice] SET ARITHABORT OFF 
GO
ALTER DATABASE [Autoservice] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Autoservice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Autoservice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Autoservice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Autoservice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Autoservice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Autoservice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Autoservice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Autoservice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Autoservice] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Autoservice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Autoservice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Autoservice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Autoservice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Autoservice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Autoservice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Autoservice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Autoservice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Autoservice] SET  MULTI_USER 
GO
ALTER DATABASE [Autoservice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Autoservice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Autoservice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Autoservice] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Autoservice] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Autoservice] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Autoservice] SET QUERY_STORE = ON
GO
ALTER DATABASE [Autoservice] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Autoservice]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test]    Script Date: 01.10.2024 15:31:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test](
	[Клиент] [nvarchar](max) NOT NULL,
	[Начало оказания услуги] [datetime] NOT NULL,
	[Услуга] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (1, N'Голубев', N'Иосиф', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'smcnabb@att.net', N'7(78)972-73-11 ', N'м', N'963f7659-e170-4869-9fab-859b245528ff.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Ермакова', N'Алла', N'мироновна', CAST(N'1976-01-22' AS Date), CAST(N'2017-02-09T00:00:00.000' AS DateTime), N'whimsy@aol.com', N'7(06)437-13-73 ', N'ж', N'36a750b0-d636-40e9-b4bc-e7053359a364.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Селиверстов', N'Глеб', N'максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'м', N'37.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Агафонов', N'Юстиниан', N'Олегович', CAST(N'1997-02-02' AS Date), CAST(N'2016-06-08T00:00:00.000' AS DateTime), N'staffelb@sbcglobal.net', N'7(303)810-28-78 ', N'м', N'3257a920-b56d-4ee0-8dd4-886896b29bbe.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Колобова', N'Злата', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'ж', N'18.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Сысоева', N'Дарина', N'Ярославовна', CAST(N'1982-02-03' AS Date), CAST(N'2016-05-13T00:00:00.000' AS DateTime), N'treit@verizon.net', N'7(0698)387-96-04 ', N'ж', N'95219bd4-59b4-46b5-9e35-98c10fd81fa6.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Некрасов', N'Варлам', N'михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'м', N'3d820b84-a040-4a81-a64d-88fc872dc934.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01T00:00:00.000' AS DateTime), N'floxy@hotmail.com', N'7(81)657-88-92 ', N'м', N'm30.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Сидорова', N'Татьяна', N'михайловна', CAST(N'1974-04-24' AS Date), CAST(N'2018-10-03T00:00:00.000' AS DateTime), N'tbeck@mac.com', N'7(51)732-91-79 ', N'ж', N'42.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Трофимова', N'Альжбета', N'Якововна', CAST(N'1988-10-22' AS Date), CAST(N'2017-09-21T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(1084)658-92-95 ', N'ж', N'25.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Новиков', N'Адриан', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'multiplx@verizon.net', N'7(70)572-33-62 ', N'м', N'fc4e7844-fba5-4458-b5db-86db564246cc.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'мишина', N'Иветта', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', N'ж', N'30.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Шестаков', N'Геннадий', N'Рубенович', CAST(N'2001-07-01' AS Date), CAST(N'2018-12-08T00:00:00.000' AS DateTime), N'tokuhirom@live.com', N'7(2066)037-11-60 ', N'м', N'm41.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Зуев', N'матвей', N'Иванович', CAST(N'1981-03-28' AS Date), CAST(N'2018-12-18T00:00:00.000' AS DateTime), N'brickbat@verizon.net', N'7(5383)893-04-66 ', N'м', N'm38.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Турова', N'Георгина', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'ж', N'27.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Анисимов', N'Валентин', N'Пантелеймонович', CAST(N'2000-12-10' AS Date), CAST(N'2018-01-20T00:00:00.000' AS DateTime), N'aaribaud@hotmail.com', N'7(700)326-70-24 ', N'м', N'd28f50a0-d92e-4e72-a2db-42e502474d1c.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Анисимова', N'Тамара', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'schwaang@mac.com', N'7(66)128-04-10 ', N'ж', N'a1f438dd-7d6d-4b96-a204-8afb6aab0da1.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Колобов', N'Орест', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'м', N'm27.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Филатов', N'Аристарх', N'Дмитриевич', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11T00:00:00.000' AS DateTime), N'hampton@att.net', N'7(696)235-29-24 ', N'м', N'm43.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Орлова', N'Влада', N'мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'ж', N'22.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Алексеева', N'Элина', N'матвеевна', CAST(N'2002-05-07' AS Date), CAST(N'2018-03-28T00:00:00.000' AS DateTime), N'pthomsen@verizon.net', N'7(8086)245-64-81 ', N'ж', N'1.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Бобров', N'Агафон', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), CAST(N'2017-05-09T00:00:00.000' AS DateTime), N'petersen@comcast.net', N'7(2159)507-39-57 ', N'м', N'm35.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Бирюкова', N'Инара', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'smpeters@hotmail.com', N'7(098)346-50-58 ', N'ж', N'5.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Панфилов', N'марк', N'Рудольфович', CAST(N'1991-04-13' AS Date), CAST(N'2016-02-23T00:00:00.000' AS DateTime), N'cremonini@optonline.net', N'7(764)282-55-22 ', N'м', N'm45.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Колесникова', N'Алина', N'Еремеевна', CAST(N'2001-04-19' AS Date), CAST(N'2017-01-18T00:00:00.000' AS DateTime), N'gfxguy@outlook.com', N'7(74)977-39-71 ', N'ж', N'40.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'морозов', N'Наум', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'м', N'm49.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Горбачёв', N'Давид', N'Тимурович', CAST(N'1983-05-22' AS Date), CAST(N'2018-12-17T00:00:00.000' AS DateTime), N'hedwig@att.net', N'7(53)602-85-41 ', N'м', N'm36.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Васильев', N'Оскар', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29 ', N'м', N'm15.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Ершова', N'Номи', N'Андреевна', CAST(N'2001-09-13' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'miltchev@mac.com', N'7(7757)315-90-99 ', N'ж', N'14.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'медведев', N'Святослав', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'м', N'm13.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Баранова', N'Эльмира', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'ж', N'4.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Попова', N'Харита', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'ж', N'36.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Кудряшов', N'Аверкий', N'Константинович', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08T00:00:00.000' AS DateTime), N'nanop@msn.com', N'7(88)732-96-30 ', N'м', N'm33.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Горшкова', N'марта', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(544)650-59-03', N'ж', N'9.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Кудрявцев', N'Богдан', N'Христофорович', CAST(N'1988-02-27' AS Date), CAST(N'2016-10-07T00:00:00.000' AS DateTime), N'lukka@hotmail.com', N'7(20)131-84-09 ', N'м', N'm31.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Гусев', N'Яков', N'Авксентьевич', CAST(N'1995-12-10' AS Date), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N'jdhedden@icloud.com', N'7(0972)781-11-37 ', N'м', N'm20.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Крюкова', N'Авигея', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'simone@gmail.com', N'7(499)318-88-53 ', N'ж', N'19.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Степанова', N'Амелия', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'ж', N'15.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Суворова', N'Божена', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'ж', N'34.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Борисов', N'Аввакум', N'Артемович', CAST(N'1974-04-25' AS Date), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N'chlim@live.com', N'7(2296)930-08-88 ', N'м', N'm12.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Бобылёв', N'Георгий', N'Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'2018-04-06T00:00:00.000' AS DateTime), N'csilvers@mac.com', N'7(88)685-13-51 ', N'м', N'm11.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Дроздов', N'Вольдемар', N'Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18T00:00:00.000' AS DateTime), N'smpeters@me.com', N'7(307)456-99-05 ', N'м', N'm21.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Беляева', N'Сабрина', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'ж', N'47.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Блохин', N'Пантелеймон', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'м', N'm8.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Шашкова', N'Гелла', N'Эдуардовна', CAST(N'1979-02-24' AS Date), CAST(N'2016-11-16T00:00:00.000' AS DateTime), N'jadavis@mac.com', N'7(57)446-21-04 ', N'ж', N'43.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Калашников', N'Артур', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21 ', N'м', N'm10.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Корнилова', N'Анэля', N'михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'ж', N'26.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Гущина', N'Янита', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'ж', N'11.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Волков', N'Людвиг', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'м', N'm50.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Князев', N'Терентий', N'Валерьевич', CAST(N'1991-06-19' AS Date), CAST(N'2018-06-25T00:00:00.000' AS DateTime), N'rjones@aol.com', N'7(98)397-23-23 ', N'м', N'm26.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (51, N'Силин', N'Гаянэ', N'Анатольевич', CAST(N'1976-05-27' AS Date), CAST(N'2017-05-05T00:00:00.000' AS DateTime), N'multiplx@comcast.net', N'7(4547)615-22-69 ', N'м', N'm46.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (52, N'Казаков', N'Дмитрий', N'Русланович', CAST(N'1978-12-15' AS Date), CAST(N'2016-05-21T00:00:00.000' AS DateTime), N'ozawa@verizon.net', N'7(51)682-19-40 ', N'м', N'm44.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (53, N'Гусева', N'Роза', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'martyloo@live.com', N'7(23)064-51-84 ', N'ж', N'10.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (54, N'мамонтова', N'марфа', N'мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'ж', N'29.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (55, N'Галкин', N'Эрик', N'Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N'snunez@verizon.net', N'7(759)873-77-39 ', N'м', N'm16.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (56, N'Архипова', N'Прасковья', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'cgcra@live.com', N'7(86)540-10-21 ', N'ж', N'33.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (57, N'Овчинникова', N'Лаура', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'carcus@yahoo.ca', N'7(85)829-33-79 ', N'ж', N'35.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (58, N'Андреева', N'Патрисия', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'ж', N'37.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (59, N'Авдеев', N'Самуил', N'Улебович', CAST(N'1996-07-04' AS Date), CAST(N'2016-02-11T00:00:00.000' AS DateTime), N'cliffordj@mac.com', N'7(3168)043-63-31 ', N'м', N'm96.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (60, N'Бурова', N'Светлана', N'Лукьевна', CAST(N'1979-01-04' AS Date), CAST(N'2016-10-13T00:00:00.000' AS DateTime), N'wsnyder@aol.com', N'7(358)173-82-21 ', N'ж', N'39.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (61, N'Ершов', N'Глеб', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82 ', N'м', N'm23.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (62, N'Игнатов', N'Захар', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36 ', N'м', N'm98.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (63, N'Комиссарова', N'Амалия', N'Робертовна', CAST(N'1971-08-18' AS Date), CAST(N'2017-08-04T00:00:00.000' AS DateTime), N'jorgb@msn.com', N'7(22)647-46-32 ', N'ж', N'17.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (64, N'Быков', N'Трофим', N'Константинович', CAST(N'1994-12-20' AS Date), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N'jguyer@aol.com', N'7(3414)460-12-05 ', N'м', N'm14.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (65, N'Кузьмин', N'Леонтий', N'Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12T00:00:00.000' AS DateTime), N'msloan@hotmail.com', N'7(1340)148-90-68 ', N'м', N'm17.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (66, N'Белозёрова', N'Диана', N'Антоновна', CAST(N'1989-02-27' AS Date), CAST(N'2017-01-30T00:00:00.000' AS DateTime), N'dialworld@aol.com', N'7(9900)174-59-87 ', N'ж', N'7.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (67, N'Блинов', N'Евгений', N'мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'м', N'm7.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (68, N'Лазарев', N'Алексей', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48 ', N'м', N'm48.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (69, N'Афанасьева', N'Розалия', N'макаровна', CAST(N'1977-05-01' AS Date), CAST(N'2017-09-06T00:00:00.000' AS DateTime), N'malattia@hotmail.com', N'7(0661)413-23-32 ', N'ж', N'31.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (70, N'Дементьева', N'Эдита', N'Онисимовна', CAST(N'1975-09-17' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'frosal@hotmail.com', N'7(198)922-28-76 ', N'ж', N'38.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (71, N'Калинин', N'Петр', N'Иванович', CAST(N'1993-09-08' AS Date), CAST(N'2016-05-26T00:00:00.000' AS DateTime), N'aschmitz@hotmail.com', N'7(90)316-07-17 ', N'м', N'm47.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (72, N'Андреев', N'Станислав', N'максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28 ', N'м', N'm3.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (73, N'Киселёв', N'Устин', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'м', N'm25.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (74, N'Гордеев', N'Павел', N'Семенович', CAST(N'1984-09-06' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N'dawnsong@verizon.net', N'7(5243)599-66-72 ', N'м', N'm19.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (75, N'Горбачёва', N'Никки', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'chinthaka@att.net', N'7(94)789-69-20 ', N'ж', N'8.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (76, N'Копылов', N'Касьян', N'Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N'crobles@sbcglobal.net', N'7(5774)679-82-06 ', N'м', N'm29.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (77, N'Ефремов', N'Витольд', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'м', N'm28.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (78, N'Баранов', N'михаил', N'Романович', CAST(N'1997-07-12' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'bigmauler@outlook.com', N'7(750)985-94-13 ', N'м', N'm5.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (79, N'Дмитриева', N'Элина', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'ж', N'12.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (80, N'Федотов', N'Осип', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'breegster@hotmail.com', N'7(590)702-33-06 ', N'м', N'm9.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (81, N'Быкова', N'Тала', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'ganter@optonline.net', N'7(13)915-53-53 ', N'ж', N'6.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (82, N'Дементьев', N'Вадим', N'Ростиславович', CAST(N'1993-07-10' AS Date), CAST(N'2018-03-05T00:00:00.000' AS DateTime), N'jacks@aol.com', N'7(79)330-46-15 ', N'м', N'm39.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (83, N'Евсеев', N'макар', N'Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'2018-12-05T00:00:00.000' AS DateTime), N'parsimony@sbcglobal.net', N'7(2141)077-85-70 ', N'м', N'm22.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (84, N'Абрамов', N'Станислав', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79 ', N'м', N'm32.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (85, N'Артемьева', N'Лиза', N'максимовна', CAST(N'1996-05-17' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'snunez@yahoo.ca', N'7(696)972-70-21 ', N'ж', N'3.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (86, N'Кузьмина', N'Дэнна', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'ж', N'20.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (87, N'Ефимова', N'магда', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'ж', N'16.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (88, N'Ефимов', N'Альберт', N'Проклович', CAST(N'1997-10-29' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'houle@live.com', N'7(416)375-97-19 ', N'м', N'm6.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (89, N'Лазарева', N'Эльвина', N'Робертовна', CAST(N'1996-02-16' AS Date), CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'ahuillet@comcast.net', N'7(5564)609-81-37 ', N'ж', N'28.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (90, N'Воронова', N'Изабелла', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'ж', N'21.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (91, N'Куликова', N'Эвелина', N'Вячеславовна', CAST(N'1997-11-14' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'ilikered@hotmail.com', N'7(0236)682-42-78 ', N'ж', N'23.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (92, N'Егорова', N'Амалия', N'Дамировна', CAST(N'1999-09-28' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'drezet@yahoo.com', N'7(7486)408-12-26 ', N'ж', N'13.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (93, N'Александров', N'Станислав', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'м', N'm2.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (94, N'Цветков', N'Демьян', N'Львович', CAST(N'1996-03-29' AS Date), CAST(N'2016-02-12T00:00:00.000' AS DateTime), N'hauma@icloud.com', N'7(93)546-43-73 ', N'м', N'm4.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (95, N'Устинова', N'Юнона', N'Валентиновна', CAST(N'1982-08-08' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'kempsonc@live.com', N'7(33)367-13-07', N'ж', N'44.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (96, N'Костина', N'Любава', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'ж', N'41.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (97, N'Смирнов', N'мартын', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'haddawy@live.com', N'7(6251)589-02-43 ', N'м', N'm34.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (98, N'Федотова', N'Сандра', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'ж', N'24.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (100, N'Большаков', N'Вадим', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37 ', N'м', N'm97.jpg')
GO
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 57, 44, CAST(N'2019-06-10T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 17, 14, CAST(N'2019-02-16T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 75, 49, CAST(N'2019-06-21T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 62, 8, CAST(N'2019-10-14T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 46, 17, CAST(N'2019-04-22T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 87, 22, CAST(N'2019-06-22T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 20, 48, CAST(N'2019-04-21T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 43, 27, CAST(N'2019-10-05T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 49, 45, CAST(N'2019-12-05T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 32, 45, CAST(N'2019-09-17T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 30, 2, CAST(N'2019-07-07T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 32, 48, CAST(N'2019-05-28T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 65, 21, CAST(N'2019-05-01T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 65, 13, CAST(N'2019-04-15T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 11, 43, CAST(N'2019-10-16T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 34, 8, CAST(N'2019-07-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 23, 27, CAST(N'2019-03-23T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 33, 4, CAST(N'2019-05-23T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 39, 23, CAST(N'2019-07-30T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 86, 3, CAST(N'2019-08-24T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 76, 18, CAST(N'2019-12-23T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 30, 18, CAST(N'2019-08-02T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 56, 39, CAST(N'2019-02-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 75, 32, CAST(N'2019-12-28T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 18, 11, CAST(N'2019-04-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 20, 9, CAST(N'2019-12-18T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 61, 12, CAST(N'2019-07-30T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 19, 32, CAST(N'2019-06-15T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 100, 14, CAST(N'2019-07-28T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 56, 28, CAST(N'2019-07-12T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 44, 4, CAST(N'2019-07-02T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 53, 48, CAST(N'2019-09-09T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 55, 13, CAST(N'2019-01-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 11, 33, CAST(N'2019-01-19T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 72, 35, CAST(N'2019-07-05T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 100, 26, CAST(N'2019-10-10T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 67, 40, CAST(N'2019-12-07T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 19, 31, CAST(N'2019-06-05T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 84, 44, CAST(N'2019-04-05T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 73, 13, CAST(N'2019-06-24T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 18, 32, CAST(N'2019-09-05T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 33, 7, CAST(N'2019-11-27T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 17, 30, CAST(N'2019-02-21T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 75, 46, CAST(N'2019-11-26T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 86, 47, CAST(N'2019-04-26T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 7, 47, CAST(N'2019-11-23T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 17, 33, CAST(N'2019-08-25T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 46, 37, CAST(N'2019-05-09T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 18, 29, CAST(N'2019-08-08T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 68, 17, CAST(N'2019-12-30T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 76, 47, CAST(N'2019-09-05T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 62, 26, CAST(N'2019-12-24T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 68, 24, CAST(N'2019-04-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 12, 35, CAST(N'2019-08-12T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 23, 21, CAST(N'2019-08-12T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 55, 26, CAST(N'2019-07-29T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 26, 38, CAST(N'2019-04-14T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 62, 23, CAST(N'2019-12-15T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 75, 41, CAST(N'2019-11-30T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 46, 1, CAST(N'2019-11-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 61, 5, CAST(N'2019-06-14T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 30, 32, CAST(N'2019-03-22T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 42, 40, CAST(N'2019-10-09T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 33, 14, CAST(N'2019-03-16T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 72, 28, CAST(N'2019-12-16T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 56, 12, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 12, 42, CAST(N'2019-09-20T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 17, 27, CAST(N'2019-04-15T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 8, 17, CAST(N'2019-08-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 8, 13, CAST(N'2019-03-04T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 17, 30, CAST(N'2019-02-24T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 87, 41, CAST(N'2019-12-06T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 20, 47, CAST(N'2019-08-05T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 8, 25, CAST(N'2019-05-19T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 34, 5, CAST(N'2019-12-30T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 73, 17, CAST(N'2019-06-28T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 26, 29, CAST(N'2019-11-05T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 56, 24, CAST(N'2019-09-19T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 30, 11, CAST(N'2019-02-26T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 34, 49, CAST(N'2019-09-13T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 11, 48, CAST(N'2019-10-14T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 72, 35, CAST(N'2019-04-11T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 58, 49, CAST(N'2019-03-06T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 42, 12, CAST(N'2019-08-21T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 49, 48, CAST(N'2019-06-29T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 97, 46, CAST(N'2019-02-04T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 34, 12, CAST(N'2019-07-09T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 61, 48, CAST(N'2019-06-16T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 84, 5, CAST(N'2019-11-27T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 7, 21, CAST(N'2019-05-27T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 84, 48, CAST(N'2019-12-15T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 11, 1, CAST(N'2019-10-17T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 33, 43, CAST(N'2019-11-15T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 100, 2, CAST(N'2019-08-24T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 72, 31, CAST(N'2019-05-27T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 55, 11, CAST(N'2019-08-19T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 87, 50, CAST(N'2019-08-08T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 67, 4, CAST(N'2019-02-24T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 18, 39, CAST(N'2019-12-19T15:00:00.000' AS DateTime), NULL)
GO
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Замена сальника привода', 3820.0000, 34200, N'', 0.15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Замена кулисы АКПП', 3250.0000, 21600, N'', 0.1, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Замена тормозной жидкости', 2200.0000, 21600, N'', 0.1, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Ремонт компрессора кондиционера', 4760.0000, 9000, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Ремонт автоэлектрики', 4230.0000, 27000, N'', 0.1, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Наращивание ресниц', 1430.0000, 2400, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Замена лямбда зонда', 770.0000, 16200, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Кузовной ремонт', 2750.0000, 9000, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Замена подшипника задней ступицы', 1860.0000, 16200, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Замена масла в МКПП', 4490.0000, 32400, N'', 0.2, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Замена заднего сальника АКПП', 1510.0000, 23400, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Замена охлаждающей жидкости', 1590.0000, 12600, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Замена масла АКПП', 2430.0000, 27000, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Замена жидкости ГУР', 2380.0000, 32400, N'', 0.2, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Испанский массаж', 2190.0000, 2400, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Балансировка колес', 4690.0000, 23400, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Замена подшипника передней ступицы', 4020.0000, 19800, N'', 0.15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Ремонт двигателя', 2470.0000, 14400, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Замена сцепления', 4320.0000, 19800, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 1800, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Замена подшипника компрессора кондиционера', 1110.0000, 19800, N'', 0.2, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Диагностика рулевого редуктора', 2930.0000, 10800, N'', 0.1, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Замена фильтров', 530.0000, 12600, N'', 0.15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Ремонт глушителя', 2100.0000, 9000, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Чистка форсунок ультразвуком', 3920.0000, 14400, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Замена масла заднего редуктора (моста)', 840.0000, 25200, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Ремонт бензонасоса', 500.0000, 12600, N'', 0.15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Антибактериальная обработка кондиционера', 4580.0000, 27000, N'', 0.2, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Замена ремня кондиционера', 4650.0000, 28800, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Ремонт и замена катализатора', 500.0000, 16200, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Ремонт карданного вала', 780.0000, 12600, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Установка сигнализации', 1760.0000, 14400, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Ремонт кронштейна глушителя', 1410.0000, 34200, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Замена тки кондиционера', 2810.0000, 10800, N'', 0.15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Диагностика подвески', 1460.0000, 19800, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Замена масла в вариаторе', 4720.0000, 7200, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Замена тормозных колодок', 4260.0000, 28800, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Покраска', 2370.0000, 7200, N'', 0.15, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Ремонт сцепления', 3290.0000, 36000, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Диагностика трансмиссии', 2790.0000, 7200, N'', 0.2, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Диагностика выхлопной системы автомобиля', 2550.0000, 10800, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Диагностика инжектора', 3390.0000, 19800, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Замена троса сцепления', 4460.0000, 28800, N'', 0.05, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Замена маховика', 2400.0000, 36000, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Ремонт стартера', 2680.0000, 28800, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Снятие/установка форсунок', 1470.0000, 18000, N'', 0.25, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Замена ремня привода ГУР', 3350.0000, 36000, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Замена свечей', 2240.0000, 7200, N'', 0.1, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Развал-схождение', 3890.0000, 10800, N'', NULL, N'')
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Замена рулевой тяги', 570.0000, 10800, N'', NULL, N'')
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'Тэг1', N'Green ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'Тэг2', N'Yellow')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (5, N'Тэг3', N'Red   ')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (1, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (2, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (2, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (2, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (3, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (5, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (6, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (7, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (8, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (9, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (10, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (11, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (12, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (13, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (14, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (15, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (16, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (17, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (18, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (19, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (20, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (21, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (22, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (23, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (24, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (25, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (26, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (27, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (28, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (29, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (30, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (31, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (32, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (33, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (34, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (35, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (36, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (37, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (38, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (39, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (40, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (41, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (42, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (43, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (44, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (45, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (46, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (47, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (48, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (49, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (50, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (51, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (52, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (53, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (54, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (55, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (56, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (57, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (58, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (59, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (60, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (61, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (62, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (63, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (64, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (65, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (66, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (67, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (68, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (69, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (70, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (71, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (72, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (73, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (74, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (75, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (76, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (77, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (78, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (79, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (80, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (81, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (82, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (83, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (84, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (85, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (86, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (87, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (88, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (89, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (90, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (91, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (92, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (93, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (94, 3)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (95, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (96, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (97, 4)
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (98, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (100, 3)
GO
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Овчинникова', CAST(N'2019-06-10T16:40:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Анисимова', CAST(N'2019-02-16T09:40:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горбачёва', CAST(N'2019-06-21T14:50:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Игнатов', CAST(N'2019-10-14T12:00:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Калашников', CAST(N'2019-04-22T11:30:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Ефимова', CAST(N'2019-06-22T13:00:00.000' AS DateTime), N'Диагностика рулевого редуктора')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Орлова', CAST(N'2019-04-21T12:40:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Беляева', CAST(N'2019-10-05T18:30:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Волков', CAST(N'2019-12-05T18:10:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Попова', CAST(N'2019-09-17T11:30:00.000' AS DateTime), N'Ремонт стартера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Медведев', CAST(N'2019-07-07T09:30:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Попова', CAST(N'2019-05-28T11:10:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кузьмин', CAST(N'2019-05-01T10:20:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кузьмин', CAST(N'2019-04-15T13:30:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Новиков', CAST(N'2019-10-16T18:20:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горшкова', CAST(N'2019-07-09T18:50:00.000' AS DateTime), N'Кузовной ремонт')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Бирюкова', CAST(N'2019-03-23T16:40:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кудряшов', CAST(N'2019-05-23T11:40:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Суворова', CAST(N'2019-07-30T12:10:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кузьмина', CAST(N'2019-08-24T11:20:00.000' AS DateTime), N'Замена тормозной жидкости')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Копылов', CAST(N'2019-12-23T15:30:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Медведев', CAST(N'2019-08-02T18:50:00.000' AS DateTime), N'Ремонт двигателя')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Архипова', CAST(N'2019-02-15T17:30:00.000' AS DateTime), N'Ремонт сцепления')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горбачёва', CAST(N'2019-12-28T17:10:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Колобов', CAST(N'2019-04-14T15:00:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Орлова', CAST(N'2019-12-18T10:30:00.000' AS DateTime), N'Замена подшипника задней ступицы')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Ершов', CAST(N'2019-07-30T10:10:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Филатов', CAST(N'2019-06-15T09:30:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Большаков', CAST(N'2019-07-28T12:50:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Архипова', CAST(N'2019-07-12T19:30:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Блохин', CAST(N'2019-07-02T15:30:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Гусева', CAST(N'2019-09-09T17:40:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Галкин', CAST(N'2019-01-29T16:10:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Новиков', CAST(N'2019-01-19T11:50:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Андреев', CAST(N'2019-07-05T13:40:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Большаков', CAST(N'2019-10-10T13:40:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Блинов', CAST(N'2019-12-07T17:00:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Филатов', CAST(N'2019-06-05T10:50:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Абрамов', CAST(N'2019-04-05T10:10:00.000' AS DateTime), N'Замена маховика')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Киселёв', CAST(N'2019-06-24T14:10:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Колобов', CAST(N'2019-09-05T19:30:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кудряшов', CAST(N'2019-11-27T09:00:00.000' AS DateTime), N'Замена лямбда зонда')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Анисимова', CAST(N'2019-02-21T08:20:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горбачёва', CAST(N'2019-11-26T10:30:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кузьмина', CAST(N'2019-04-26T10:20:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Некрасов', CAST(N'2019-11-23T14:30:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Анисимова', CAST(N'2019-08-25T08:50:00.000' AS DateTime), N'Ремонт кронштейна глушителя')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Калашников', CAST(N'2019-05-09T10:00:00.000' AS DateTime), N'Замена тормозных колодок')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Колобов', CAST(N'2019-08-08T17:20:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Лазарев', CAST(N'2019-12-30T08:10:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Копылов', CAST(N'2019-09-05T14:10:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Игнатов', CAST(N'2019-12-24T09:30:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Лазарев', CAST(N'2019-04-06T11:50:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Мишина', CAST(N'2019-08-12T11:50:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Бирюкова', CAST(N'2019-08-12T15:40:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Галкин', CAST(N'2019-07-29T10:30:00.000' AS DateTime), N'Замена масла заднего редуктора (моста)')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Морозов', CAST(N'2019-04-14T14:20:00.000' AS DateTime), N'Покраска')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Гусева', CAST(N'2019-03-19T09:40:00.000' AS DateTime), N'Замена трубки кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Игнатов', CAST(N'2019-12-15T19:50:00.000' AS DateTime), N'Замена фильтров')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горбачёва', CAST(N'2019-11-30T18:00:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Калашников', CAST(N'2019-11-14T15:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Ершов', CAST(N'2019-06-14T18:30:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Медведев', CAST(N'2019-03-22T15:20:00.000' AS DateTime), N'Установка сигнализации')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Дроздов', CAST(N'2019-10-09T18:30:00.000' AS DateTime), N'Диагностика трансмиссии')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кудряшов', CAST(N'2019-03-16T10:20:00.000' AS DateTime), N'Замена жидкости ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Андреев', CAST(N'2019-12-16T19:40:00.000' AS DateTime), N'Антибактериальная обработка кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Архипова', CAST(N'2019-08-15T18:30:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Мишина', CAST(N'2019-09-20T08:20:00.000' AS DateTime), N'Диагностика инжектора')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Анисимова', CAST(N'2019-04-15T11:50:00.000' AS DateTime), N'Ремонт бензонасоса')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Крюков', CAST(N'2019-08-12T08:50:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Крюков', CAST(N'2019-03-04T11:30:00.000' AS DateTime), N'Замена масла АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Анисимова', CAST(N'2019-02-24T13:50:00.000' AS DateTime), N'Ремонт и замена катализатора')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Ефимова', CAST(N'2019-12-06T09:40:00.000' AS DateTime), N'Диагностика выхлопной системы автомобиля')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Орлова', CAST(N'2019-08-05T10:10:00.000' AS DateTime), N'Замена ремня привода ГУР')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Крюков', CAST(N'2019-05-19T16:50:00.000' AS DateTime), N'Чистка форсунок ультразвуком')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горшкова', CAST(N'2019-12-30T14:30:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Киселёв', CAST(N'2019-06-28T10:10:00.000' AS DateTime), N'Замена подшипника передней ступицы')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Морозов', CAST(N'2019-11-05T12:10:00.000' AS DateTime), N'Замена ремня кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Архипова', CAST(N'2019-09-19T16:10:00.000' AS DateTime), N'Ремонт глушителя')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Медведев', CAST(N'2019-02-26T17:40:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горшкова', CAST(N'2019-09-13T10:10:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Новиков', CAST(N'2019-10-14T19:40:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Андреев', CAST(N'2019-04-11T16:20:00.000' AS DateTime), N'Диагностика подвески')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Андреева', CAST(N'2019-03-06T12:10:00.000' AS DateTime), N'Развал-схождение')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Дроздов', CAST(N'2019-08-21T17:20:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Волков', CAST(N'2019-06-29T17:20:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Смирнов', CAST(N'2019-02-04T19:50:00.000' AS DateTime), N'Снятие/установка форсунок')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Горшкова', CAST(N'2019-07-09T16:50:00.000' AS DateTime), N'Замена охлаждающей жидкости')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Ершов', CAST(N'2019-06-16T12:00:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Абрамов', CAST(N'2019-11-27T13:30:00.000' AS DateTime), N'Ремонт автоэлектрики')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Некрасов', CAST(N'2019-05-27T08:00:00.000' AS DateTime), N'Замена подшипника компрессора кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Абрамов', CAST(N'2019-12-15T14:30:00.000' AS DateTime), N'Замена свечей')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Новиков', CAST(N'2019-10-17T19:00:00.000' AS DateTime), N'Замена сальника привода')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Кудряшов', CAST(N'2019-11-15T15:40:00.000' AS DateTime), N'Замена троса сцепления')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Большаков', CAST(N'2019-08-24T17:00:00.000' AS DateTime), N'Замена кулисы АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Андреев', CAST(N'2019-05-27T14:20:00.000' AS DateTime), N'Ремонт карданного вала')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Галкин', CAST(N'2019-08-19T17:50:00.000' AS DateTime), N'Замена заднего сальника АКПП')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Ефимова', CAST(N'2019-08-08T19:00:00.000' AS DateTime), N'Замена рулевой тяги')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Блинов', CAST(N'2019-02-24T13:00:00.000' AS DateTime), N'Ремонт компрессора кондиционера')
INSERT [dbo].[test] ([Клиент], [Начало оказания услуги], [Услуга]) VALUES (N'Колобов', CAST(N'2019-12-19T15:00:00.000' AS DateTime), N'Ремонт сцепления')
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Autoservice] SET  READ_WRITE 
GO
