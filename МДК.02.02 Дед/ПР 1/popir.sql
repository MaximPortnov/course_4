USE [master]
GO
/****** Object:  Database [Poprizhonok]    Script Date: 25.09.2024 18:39:54 ******/
CREATE DATABASE [Poprizhonok]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Poprizhonok', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Poprizhonok.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Poprizhonok_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Poprizhonok_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Poprizhonok] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Poprizhonok].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Poprizhonok] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Poprizhonok] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Poprizhonok] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Poprizhonok] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Poprizhonok] SET ARITHABORT OFF 
GO
ALTER DATABASE [Poprizhonok] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Poprizhonok] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Poprizhonok] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Poprizhonok] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Poprizhonok] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Poprizhonok] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Poprizhonok] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Poprizhonok] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Poprizhonok] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Poprizhonok] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Poprizhonok] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Poprizhonok] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Poprizhonok] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Poprizhonok] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Poprizhonok] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Poprizhonok] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Poprizhonok] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Poprizhonok] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Poprizhonok] SET  MULTI_USER 
GO
ALTER DATABASE [Poprizhonok] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Poprizhonok] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Poprizhonok] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Poprizhonok] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Poprizhonok] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Poprizhonok] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Poprizhonok] SET QUERY_STORE = ON
GO
ALTER DATABASE [Poprizhonok] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Poprizhonok]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentPriorityHistory]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agents_k_import]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agents_k_import](
	[Тип_агента] [nvarchar](50) NOT NULL,
	[Наименование_агента] [nvarchar](50) NOT NULL,
	[Электронная_почта_агента] [nvarchar](50) NOT NULL,
	[Телефон_агента] [nvarchar](50) NOT NULL,
	[Логотип_агента] [nvarchar](50) NOT NULL,
	[Юридический_адрес] [nvarchar](100) NOT NULL,
	[Приоритет] [nvarchar](50) NOT NULL,
	[Директор] [nvarchar](50) NOT NULL,
	[ИНН] [bigint] NOT NULL,
	[КПП] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AgentType]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialCountHistory]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialSupplier]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialType]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductCostHistory]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [datetime] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products_short_k_import]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products_short_k_import](
	[Наименование_продукции] [nvarchar](50) NOT NULL,
	[Тип_продукции] [nvarchar](50) NOT NULL,
	[Артикул] [int] NOT NULL,
	[Количество_человек_для_производства] [tinyint] NOT NULL,
	[Номер_цеха_производства] [tinyint] NOT NULL,
	[Минимальная_цена_для_агента] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Лист1$]    Script Date: 25.09.2024 18:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Лист1$](
	[Продукция] [nvarchar](255) NULL,
	[Наименование агента] [nvarchar](255) NULL,
	[Дата реализации] [datetime] NULL,
	[Количество продукции] [float] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (1, N'ВодТверьХозМашина', 1, N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'4174253174', N'522227145', N'Александра Дмитриевна Ждановаа', N'+7 (922) 849-91-96', N'', N'\agents\agent_56.png', -6)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (2, N'МясРеч', 1, N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'9254261217', N'656363498', N'Белоусоваа Ирина Максимовна', N'8-800-453-63-45', N'bkozlov@volkov.ru', N'\agents\agent_58.png', 355)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (3, N'Флот', 1, N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'1112170258', N'382584255', N'Василий Андреевич Ковалёв', N'8-800-144-25-38', N'gerasim.makarov@kornilov.ru', N'\agents\agent_87.png', 473)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (4, N'CибПивОмскСнаб', 1, N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'5676173945', N'256512286', N'Людмила Александровна Сафонова', N'+7 (922) 153-95-22', N'evorontova@potapova.ru', N'\agents\agent_46.png', 477)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (5, N'ЦементАсбоцемент', 1, N'619540, Курская область, город Раменское, пл. Балканская, 12', N'4345774724', N'352469905', N'Воронова Мария Александровна', N'(495) 184-87-92', N'email: polykov.veronika@artemeva.ru', N'отсутствует', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (6, N'ТелеГлавВекторСбыт', 1, N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'9504787157', N'419758597', N'Екатерина Фёдоровна Ковалёва', N'(35222) 56-15-37', N'', N'\agents\agent_31.png', 897)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (7, N'ЭлектроРемОрионЛизинг', 1, N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'1340072597', N'500478249', N'Тарасова Дан Львович', N'(495) 519-97-41', N'anfisa.fedotova@tvetkov.ru', N'\agents\agent_68.png', 198)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (8, N'ОрионСофтВодСнос', 1, N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'1522348613', N'977738715', N'Мухина Ян Фёдорович', N'(35222) 59-75-11', N'isukanov@sobolev.com', N'\agents\agent_97.png', 361)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (9, N'ЦементКрепТех-М', 1, N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'5359981084', N'680416300', N'Сергеев Владлен Александрович', N'(812) 838-79-58', N'email: yna.evdokimov@gordeeva.ru', N'\agents\agent_82.png', 189)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (10, N'БашкирЮпитерТомск', 1, N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'1606315697', N'217799345', N'Фадеева Раиса Александровна', N'(812) 189-59-57', N'dyckov.veniamin@kotova.ru', N'\agents\agent_59.png', 139)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (11, N'СервисХмельМонтаж', 1, N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'3459886235', N'356196105', N'Анжелика Дмитриевна Горбунова', N'+7 (922) 344-73-38', N'galina31@melnikov.ru', N'\agents\agent_92.png', 124)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (12, N'Рем', 1, N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'3203830728', N'456254820', N'Шароваа Елизавета Львовна', N'(495) 987-88-53', N'zanna25@nikiforova.com', N'\agents\agent_79.png', 329)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (13, N'Вод', 1, N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'1296063939', N'447430051', N'Зоя Романовна Селезнёва', N'(495) 142-19-84', N'email: savva86@zaiteva.ru', N'\agents\agent_129.png', 359)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (14, N'СофтРосБух', 1, N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'8321561226', N'807803984', N'Белова Полина Владимировна', N'+7 (922) 445-69-17', N'ivanova.antonin@rodionov.ru', N'\agents\agent_124.png', 69)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (15, N'УралСтройХмель', 1, N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'8773558039', N'402502867', N'Август Борисович Красильникова', N'(35222) 39-23-65', N'email: aleksandr95@kolobova.ru', N'\agents\agent_113.png', 372)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (16, N'ТекстильУралАвтоОпт', 1, N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'3930950057', N'678529397', N'Алина Сергеевна Дьячковаа', N'(35222) 98-76-54', N'hkononova@pavlova.ru', N'не указано', 176)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (17, N'Креп', 1, N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'4880732317', N'258673591', N'Назар Алексеевич Григорьева', N'(495) 217-46-29', N'savina.dominika@belousova.com', N'\agents\agent_39.png', 371)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (18, N'МонтажОрионУрал', 2, N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'1692286718', N'181380912', N'Давыдоваа Нина Евгеньевна', N'(35222) 67-39-26', N'email: pzaitev@blokin.org', N'\agents\agent_96.png', 100)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (19, N'МетизСтрой', 2, N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'4024742936', N'295608432', N'Ева Борисовна Беспалова', N'8-800-172-62-56', N'kristina.pakomov@burova.ru', N'\agents\agent_94.png', 100)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (20, N'Гор', 2, N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'7088187045', N'440309946', N'Нонна Львовна Одинцоваа', N'(495) 973-48-55', N'maiy12@koklov.net', N'\agents\agent_52.png', 100)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (21, N'ТверьХозМорСбыт', 2, N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'6681338084', N'460530907', N'Аким Львович Субботина', N'(495) 416-75-67', N'email: marina58@koroleva.com', N'\agents\agent_117.png', 207)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (22, N'ГазДизайнЖелДор', 2, N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'2396029740', N'458924890', N'Лев Иванович Третьяков', N'(495) 797-97-33', N'elizaveta.komarov@rybakov.net', N'\agents\agent_49.png', 236)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (23, N'ЮпитерЛенГараж-М', 2, N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'2038393690', N'259672761', N'Васильева Валерия Борисовна', N'(495) 327-58-25', N'larkipova@gorbunov.ru', N'\agents\agent_48.png', 470)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (24, N'CибГаз', 2, N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'6483417250', N'455013058', N'Вячеслав Романович Третьякова', N'(495) 945-37-25', N'inna.sarova@panfilov.ru', N'\agents\agent_103.png', 488)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (25, N'БашкирФлотМотор-H', 2, N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'1657476072', N'934931159', N'Марат Алексеевич Фролов', N'(495) 793-84-82', N'email: morozova.nika@kazakova.ru', N'\agents\agent_36.png', 416)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (26, N'ТелекомЮпитер', 2, N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'9383182378', N'944520594', N'Калинина Татьяна Ивановна', N'(812) 895-67-23', N'kulikov.adrian@zuravlev.org', N'\agents\agent_81.png', 302)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (27, N'CибБашкирТекстиль', 2, N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'7392007090', N'576103661', N'Григорий Владимирович Елисеева', N'(495) 285-78-38', N'vzimina@zdanova.com', N'\agents\agent_69.png', 218)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (28, N'МеталТекстильЛифтТрест', 2, N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'2971553297', N'821859486', N'Одинцов Назар Борисович', N'(812) 753-96-76', N'email: muravev.trofim@sazonov.net', N'\agents\agent_86.png', 425)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (29, N'Монтаж', 3, N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'6142194281', N'154457435', N'Блохина Сергей Максимович', N'(495) 867-76-15', N'email: zakar.sazonova@gavrilov.ru', N'не указано', 300)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (30, N'Газ', 3, N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'8876413796', N'955381891', N'Терентьев Илларион Максимович', N'(35222) 22-45-58', N'ulyna.antonov@noskov.ru', N'\agents\agent_76.png', 170)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (31, N'ГлавITФлотПроф', 3, N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'2561361494', N'525678825', N'Зыкова Стефан Максимович', N'(812) 146-66-46', N'savva.rybov@kolobov.ru', N'\agents\agent_64.png', 62)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (32, N'Гараж', 3, N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'2638464552', N'746822723', N'Панфилов Константин Максимович', N'(35222) 54-72-59', N'antonin51@korolev.com', N'\agents\agent_90.png', 107)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (33, N'СантехБашкир', 3, N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'4159215346', N'639267493', N'Виктор Иванович Молчанов', N'+7 (922) 155-87-39', N'email: nikodim81@kiseleva.com', N'\agents\agent_99.png', 369)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (34, N'ВостокКазРыб', 3, N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'7411284960', N'176779733', N'Самсонов Родион Романович', N'(495) 987-31-63', N'flukin@misin.org', N'\agents\agent_112.png', 361)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (35, N'Строй', 3, N'763019, Омская область, город Шатура, пл. Сталина, 56', N'6678884759', N'279288618', N'Кудрявцев Адриан Андреевич', N'(812) 447-45-59', N'soloveva.adam@andreev.ru', N'отсутствует', 12)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (36, N'АсбоцементТехАвто', 3, N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'7626076463', N'579234124', N'Сидорова Любовь Ивановна', N'+7 (922) 977-68-84', N'matveev.yliy@kiseleva.ru', N'\agents\agent_110.png', 247)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (37, N'Транс', 3, N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'9604275878', N'951258069', N'Евсеева Болеслав Сергеевич', N'8-800-954-23-89', N'artem.fadeev@polykov.com', N'\agents\agent_127.png', 38)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (38, N'Бух', 3, N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'1953785418', N'122905583', N'Татьяна Сергеевна Королёваа', N'+7 (922) 375-49-21', N'belova.vikentii@konstantinova.net', N'\agents\agent_78.png', 82)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (39, N'РадиоСевер', 4, N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'5889206249', N'372789083', N'Карпов Иосиф Максимович', N'(495) 368-86-51', N'maiy.belov@rogov.ru', N'\agents\agent_123.png', 431)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (40, N'Тех', 4, N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'9282924869', N'587356429', N'Аким Романович Логинова', N'+7 (922) 427-13-31', N'vasilisa99@belyev.ru', N'\agents\agent_61.png', 278)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (41, N'Инфо', 4, N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'6549468639', N'718386757', N'Баранова Виктор Романович', N'8-800-793-59-97', N'arsenii.mikailova@prokorov.com', N'\agents\agent_89.png', 304)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (42, N'МясТрансМоторЛизинг', 4, N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'6148685143', N'196332656', N'Тамара Дмитриевна Семёноваа', N'+7 (922) 676-34-94', N'email: vlad.sokolov@andreev.org', N'\agents\agent_62.png', 268)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (43, N'ЭлектроТранс', 4, N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'6019144874', N'450629885', N'Сава Александрович Титова', N'(812) 342-24-31', N'boleslav.zukova@nikiforova.com', N'\agents\agent_91.png', 129)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (44, N'Электро', 4, N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'7896029866', N'786038848', N'Шарапова Елена Дмитриевна', N'8-800-714-36-41', N'likacev.makar@antonov.ru', N'\agents\agent_93.png', 366)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (45, N'РемСантехОмскБанк', 4, N'289468, Омская область, город Видное, пер. Балканская, 33', N'6823050572', N'176488617', N'Фокина Искра Максимовна', N'(812) 182-44-77', N'anisimov.mark@vorobev.ru', N'\agents\agent_57.png', 442)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (46, N'ЭлектроМоторТрансСнос', 4, N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'6608362851', N'799760512', N'Людмила Евгеньевна Новиковаа', N'(35222) 43-62-19', N'inessa.voronov@sidorova.ru', N'отсутствует', 151)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (47, N'РемГаражЛифт', 4, N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'1656477206', N'988968838', N'Филатов Владимир Максимович', N'8-800-772-27-53', N'novikova.gleb@sestakov.ru', N'\agents\agent_65.png', 374)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (48, N'КазХоз', 4, N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'6503377671', N'232279972', N'Степанова Роман Иванович', N'+7 (922) 728-85-62', N'istrelkova@fomin.ru', N'нет', 213)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (49, N'ХозЮпитер', 4, N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'6667635058', N'380592865', N'Максимоваа Вера Фёдоровна', N'+7 (922) 332-48-96', N'jisakova@nazarova.com', N'\agents\agent_114.png', 375)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (50, N'ВодГараж', 4, N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'5575072431', N'684290320', N'Лаврентий Фёдорович Логинова', N'+7 (922) 363-86-67', N'email: pmaslov@fomiceva.com', N'\agents\agent_67.png', 250)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (51, N'СтройГорНефть', 4, N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'5916775587', N'398299418', N'Тарасова Макар Максимович', N'(812) 385-21-37', N'email: lysy.kolesnikova@molcanova.com', N'\agents\agent_37.png', 161)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (52, N'Софт', 4, N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'3889910123', N'952047511', N'Петухова Прохор Фёдорович', N'(35222) 12-82-65', N'jterentev@ersov.com', N'\agents\agent_122.png', 292)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (53, N'ТелекомГор', 4, N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'3748947224', N'766431901', N'Ксения Андреевна Михайлова', N'(35222) 78-93-21', N'gorskov.larisa@kalinin.com', N'\agents\agent_98.png', 255)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (54, N'ЮпитерТяжОрионЭкспедиция', 4, N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'6843174002', N'935556458', N'Валерий Евгеньевич Виноградов', N'(35222) 95-63-65', N'email: gblokin@orlov.net', N'\agents\agent_44.png', 446)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (55, N'РемВод', 4, N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'3986603105', N'811373078', N'Медведеваа Ярослава Фёдоровна', N'+7 (922) 353-31-72', N'komarov.elizaveta@agafonova.ru', N'\agents\agent_126.png', 1)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (56, N'ВодГор', 4, N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'4463113470', N'899603778', N'Фаина Фёдоровна Филиппова', N'(35222) 73-72-16', N'tvetkova.robert@sorokin.com', N'\agents\agent_125.png', 72)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (57, N'ТяжРадиоУралПроф', 4, N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'5688533246', N'401535045', N'София Алексеевна Мухина', N'+7 (922) 885-66-15', N'liliy62@grisina.ru', N'\agents\agent_88.png', 278)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (58, N'ГаражЛофт', 4, N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'2816939574', N'754741128', N'Клавдия Фёдоровна Кудряшова', N'(495) 427-55-66', N'lydmila.belyeva@karpov.ru', N'\agents\agent_108.png', 335)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (59, N'ITСтройАлмаз', 4, N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'7689065648', N'456612755', N'Алексеева Валериан Андреевич', N'8-800-185-78-91', N'fokin.eduard@samoilov.com', N'\agents\agent_83.png', 159)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (60, N'КазаньТекстиль', 4, N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'4584384019', N'149680499', N'Александров Бронислав Максимович', N'(35222) 86-74-21', N'osimonova@andreeva.com', N'\agents\agent_47.png', 156)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (61, N'КазЮпитерТомск', 4, N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'9201745524', N'510248846', N'Рафаил Андреевич Копылов', N'+7 (922) 772-33-58', N'tgavrilov@frolov.ru', N'\agents\agent_60.png', 244)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (62, N'Мобайл', 4, N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'7803888520', N'885703265', N'Екатерина Сергеевна Бобылёва', N'8-800-618-73-37', N'email: dsiryev@dementeva.com', N'\agents\agent_107.png', 464)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (63, N'БухМясМоторПром', 4, N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'7377410338', N'592041317', N'Нина Дмитриевна Черноваа', N'(35222) 83-23-59', N'varvara49@savin.ru', N'\agents\agent_95.png', 158)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (64, N'Компания КазАлмаз', 5, N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'3084797352', N'123190924', N'Марк Фёдорович Муравьёва', N'8-800-533-24-75', N'irina.gusina@vlasova.ru', N'\agents\agent_80.png', 396)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (65, N'Компания СервисРадиоГор', 5, N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'8880473721', N'729975116', N'Попов Вадим Александрович', N'8-800-676-32-86', N'nika.nekrasova@kovalev.ru', N'\agents\agent_40.png', 169)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (66, N'ТверьМетизУралСнос', 5, N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'1076095397', N'947828491', N'Зоя Андреевна Соболева', N'(35222) 57-92-75', N'email: rlazareva@novikov.ru', N'\agents\agent_109.png', 165)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (67, N'Компания ТелекомХмельГаражПром', 5, N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'1614623826', N'824882264', N'Костина Татьяна Борисовна', N'(812) 983-91-73', N'email: qkolesnikova@kalinina.ru', N'\agents\agent_71.png', 457)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (68, N'Компания Алмаз', 5, N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'6698862694', N'662876919', N'Фоминаа Лариса Романовна', N'+7 (922) 688-74-22', N'akalinina@zaitev.ru', N'\agents\agent_121.png', 259)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (69, N'ВостокГлав', 5, N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'3580946305', N'405017349', N'Инга Фёдоровна Дмитриева', N'(812) 949-29-26', N'gordei95@kirillov.ru', N'\agents\agent_63.png', 107)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (70, N'Компания Гараж', 5, N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'6190244524', N'399106161', N'Владлена Фёдоровна Ларионоваа', N'+7 (922) 848-38-54', N'email: asiryeva@andreeva.com', N'\agents\agent_66.png', 413)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (71, N'Компания ТомскХоз', 5, N'861543, Томская область, город Истра, бульвар Славы, 42', N'8430391035', N'961540858', N'Лазарева Аркадий Сергеевич', N'+7 (922) 849-13-37', N'email: nelli11@gureva.ru', N'\agents\agent_115.png', 464)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (72, N'Компания МясДизайнДизайн', 5, N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'8004989990', N'908629456', N'Клементина Сергеевна Стрелкова', N'(812) 535-17-25', N'email: gleb.gulyev@belyeva.com', N'\agents\agent_53.png', 491)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (73, N'Компания ЖелДорТверьМонтаж', 5, N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'3325722996', N'665766347', N'Нестор Максимович Гуляев', N'(495) 521-61-75', N'email: burova.zlata@zueva.ru', N'\agents\agent_85.png', 2)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (74, N'МетизТехАвтоПроф', 5, N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'2988890076', N'215491048', N'Егор Фёдорович Третьякова', N'(495) 581-42-46', N'anastasiy.gromov@samsonova.com', N'\agents\agent_33.png', 321)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (75, N'Компания КазМеталКазань', 5, N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'4598939812', N'303467543', N'Валерий Владимирович Хохлова', N'(495) 685-34-29', N'email: mmoiseev@teterin.ru', N'\agents\agent_130.png', 252)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (76, N'Компания Газ', 5, N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'2262431140', N'247369527', N'Давид Андреевич Фадеев', N'(35222) 75-96-85', N'alina56@zdanov.com', N'\agents\agent_120.png', 445)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (77, N'Компания Монтаж', 5, N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'6206428565', N'118570048', N'Силин Даниил Иванович', N'(35222) 92-45-98', N'afanasev.anastasiy@muravev.ru', N'\agents\agent_75.png', 124)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (78, N'СантехСеверЛенМашина', 5, N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'3506691089', N'830713603', N'Павел Максимович Рожков', N'(812) 918-88-43', N'email: pgorbacev@vasilev.net', N'\agents\agent_74.png', 201)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (79, N'Цемент', 5, N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'9662118663', N'650216214', N'Анфиса Фёдоровна Буроваа', N'8-800-517-78-47', N'', N'\agents\agent_54.png', 340)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (80, N'Компания Хмель', 5, N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'9004087602', N'297273898', N'Владимир Борисович Суворова', N'(812) 421-77-82', N'ermakov.mark@isakova.ru', N'отсутствует', 2)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (81, N'Компания ВодАлмазIT', 5, N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'2345297765', N'908449277', N'Гуляев Егор Евгеньевич', N'(35222) 52-76-16', N'zakar37@nikolaeva.ru', N'\agents\agent_111.png', 31)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (82, N'Компания ФинансСервис', 5, N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'7491491391', N'673621812', N'Клавдия Сергеевна Виноградова', N'(812) 878-42-71', N'email: robert.serbakov@safonova.ru', N'\agents\agent_38.png', 395)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (83, N'Лифт', 5, N'479565, Курганская область, город Клин, пл. Ленина, 54', N'6169713039', N'848972934', N'Вера Евгеньевна Денисоваа', N'(812) 484-92-38', N'email: zinaida01@bespalova.ru', N'\agents\agent_101.png', 92)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (84, N'Компания МоторТелекомЦемент-М', 5, N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'7326832482', N'440199498', N'Иван Евгеньевич Белоусова', N'(812) 857-95-57', N'larisa44@silin.org', N'\agents\agent_118.png', 237)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (85, N'РосАвтоМонтаж', 5, N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'4735043946', N'263682488', N'Диана Алексеевна Исаковаа', N'(495) 445-97-76', N'lapin.inessa@isaeva.com', N'\agents\agent_55.png', 10)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (86, N'Компания СервисТелеМотор', 5, N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'3248454160', N'138472695', N'Фролова Эдуард Борисович', N'+7 (922) 461-25-29', N'email: veronika.egorov@bespalova.com', N'\agents\agent_102.png', 81)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (87, N'Асбоцемент', 5, N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'1261407459', N'745921890', N'Никитинаа Антонина Андреевна', N'8-800-211-16-23', N'antonin19@panfilov.ru', N'\agents\agent_34.png', 273)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (88, N'Компания КрепЦемент', 5, N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'3025099903', N'606083992', N'Екатерина Львовна Суворова', N'(812) 963-77-87', N'rusakov.efim@nikiforov.ru', N'\agents\agent_50.png', 426)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (89, N'ОрионГлав', 6, N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'9032455179', N'763045792', N'Тимофеева Григорий Андреевич', N'+7 (922) 684-13-74', N'sermakova@sarova.net', N'\agents\agent_106.png', 482)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (90, N'ТверьМонтажОмск', 6, N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'2421347164', N'157370604', N'Матвей Романович Большакова', N'8-800-363-43-86', N'dteterina@selezneva.ru', N'\agents\agent_128.png', 272)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (91, N'БухВжух', 6, N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'2320989197', N'359282667', N'Тарасов Болеслав Александрович', N'(495) 367-21-41', N'valentina.bolsakova@aksenova.ru', N'отсутствует', 327)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (93, N'Орион', 6, N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'2670166502', N'716874456', N'Мартынов Михаил Борисович', N'8-800-621-61-93', N'email: aleksei63@kiselev.ru', N'\agents\agent_77.png', 166)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (94, N'БашкирРечТомск', 6, N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'7027724917', N'823811460', N'Назарова Вера Андреевна', N'8-800-254-71-85', N'email: aleksandra77@karpov.com', N'\agents\agent_100.png', 84)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (95, N'РемСтрем', 6, N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'9006569852', N'152177100', N'Альбина Александровна Романова', N'(35222) 55-28-24', N'rafail96@sukin.ru', N'\agents\agent_116.png', 88)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (96, N'АсбоцементЛифтРеч-H', 6, N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'6567878928', N'560960507', N'Кондратьева Таисия Андреевна', N'(495) 245-57-16', N'vladlena58@seliverstova.ru', N'\agents\agent_105.png', 407)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (97, N'ФинансТелеТверь', 6, N'687171, Томская область, город Лотошино, пл. Славы, 59', N'2646091050', N'971874277', N'Зайцеваа Дарья Сергеевна', N'(812) 115-56-93', N'email: medvedev.klim@afanasev.com', N'\agents\agent_45.png', 100)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (98, N'Радио', 6, N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'9077613654', N'657690787', N'Эмма Андреевна Колесникова', N'8-800-897-32-78', N'rtretykova@kozlov.ru', N'\agents\agent_43.png', 221)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (99, N'ОрионТомскТех', 6, N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'9351493429', N'583041591', N'Георгий Александрович Лукин', N'+7 (922) 542-89-15', N'faina.tikonova@veselov.com', N'\agents\agent_119.png', 73)
INSERT [dbo].[Agent] ([ID], [Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES (100, N'ЖелДорДизайнМетизТраст', 6, N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'7669116841', N'906390137', N'Игорь Львович Агафонова', N'(812) 123-63-47', N'lnikitina@kulikova.com', N'не указано', 290)
GO
SET IDENTITY_INSERT [dbo].[Agent] OFF
GO
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'МонтажОрионУрал', N'email: pzaitev@blokin.org', N'(35222) 67-39-26', N'\agents\agent_96.png', N'027573, Тамбовская область, город Коломна, ул. Ленина, 20', N'50', N'Давыдоваа Нина Евгеньевна', 1692286718, 181380912)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'МетизСтрой', N'kristina.pakomov@burova.ru', N'8-800-172-62-56', N'\agents\agent_94.png', N'254238, Нижегородская область, город Павловский Посад, проезд Балканская, 23', N'374', N'Ева Борисовна Беспалова', 4024742936, 295608432)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'РадиоСевер', N'maiy.belov@rogov.ru', N'(495) 368-86-51', N'\agents\agent_123.png', N'491360, Московская область, город Одинцово, въезд Ленина, 19', N'431', N'Карпов Иосиф Максимович', 5889206249, 372789083)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания КазАлмаз', N'irina.gusina@vlasova.ru', N'8-800-533-24-75', N'\agents\agent_80.png', N'848810, Кемеровская область, город Лотошино, пер. Ломоносова, 90', N'396', N'Марк Фёдорович Муравьёва', 3084797352, 123190924)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания СервисРадиоГор', N'nika.nekrasova@kovalev.ru', N'8-800-676-32-86', N'\agents\agent_40.png', N'547196, Ульяновская область, город Серебряные Пруды, въезд Балканская, 81', N'169', N'Попов Вадим Александрович', 8880473721, 729975116)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ВодТверьХозМашина', N'tkrylov@baranova.net', N'+7 (922) 849-91-96', N'\agents\agent_56.png', N'145030, Сахалинская область, город Шатура, въезд Гоголя, 79', N'8', N'Александра Дмитриевна Ждановаа', 4174253174, 522227145)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'Тех', N'vasilisa99@belyev.ru', N'+7 (922) 427-13-31', N'\agents\agent_61.png', N'731935, Калининградская область, город Павловский Посад, наб. Гагарина, 59', N'278', N'Аким Романович Логинова', 9282924869, 587356429)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'ТверьМетизУралСнос', N'email: rlazareva@novikov.ru', N'(35222) 57-92-75', N'\agents\agent_109.png', N'880551, Ленинградская область, город Красногорск, ул. Гоголя, 61', N'165', N'Зоя Андреевна Соболева', 1076095397, 947828491)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'МясРеч', N'bkozlov@volkov.ru', N'8-800-453-63-45', N'\agents\agent_58.png', N'903648, Калужская область, город Воскресенск, пр. Будапештсткая, 91', N'355', N'Белоусоваа Ирина Максимовна', 9254261217, 656363498)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'Флот', N'gerasim.makarov@kornilov.ru', N'8-800-144-25-38', N'\agents\agent_87.png', N'505562, Тюменская область, город Наро-Фоминск, пр. Косиора, 11', N'473', N'Василий Андреевич Ковалёв', 1112170258, 382584255)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'CибПивОмскСнаб', N'evorontova@potapova.ru', N'+7 (922) 153-95-22', N'\agents\agent_46.png', N'816260, Ивановская область, город Москва, ул. Гагарина, 31', N'477', N'Людмила Александровна Сафонова', 5676173945, 256512286)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ЦементАсбоцемент', N'email: polykov.veronika@artemeva.ru', N'(495) 184-87-92', N'отсутствует', N'619540, Курская область, город Раменское, пл. Балканская, 12', N'426', N'Воронова Мария Александровна', 4345774724, 352469905)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ТелеГлавВекторСбыт', N'nsitnikov@kovaleva.ru', N'(35222) 56-15-37', N'\agents\agent_31.png', N'062489, Челябинская область, город Пушкино, въезд Бухарестская, 07', N'185', N'Екатерина Фёдоровна Ковалёва', 9504787157, 419758597)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'Инфо', N'arsenii.mikailova@prokorov.com', N'8-800-793-59-97', N'\agents\agent_89.png', N'100469, Рязанская область, город Ногинск, шоссе Гагарина, 57', N'304', N'Баранова Виктор Романович', 6549468639, 718386757)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ЭлектроРемОрионЛизинг', N'anfisa.fedotova@tvetkov.ru', N'(495) 519-97-41', N'\agents\agent_68.png', N'594365, Ярославская область, город Павловский Посад, бульвар Космонавтов, 64', N'198', N'Тарасова Дан Львович', 1340072597, 500478249)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания ТелекомХмельГаражПром', N'email: qkolesnikova@kalinina.ru', N'(812) 983-91-73', N'\agents\agent_71.png', N'126668, Ростовская область, город Зарайск, наб. Гагарина, 69', N'457', N'Костина Татьяна Борисовна', 1614623826, 824882264)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания Алмаз', N'akalinina@zaitev.ru', N'+7 (922) 688-74-22', N'\agents\agent_121.png', N'016215, Воронежская область, город Зарайск, ул. Косиора, 48', N'259', N'Фоминаа Лариса Романовна', 6698862694, 662876919)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'МясТрансМоторЛизинг', N'email: vlad.sokolov@andreev.org', N'+7 (922) 676-34-94', N'\agents\agent_62.png', N'765320, Ивановская область, город Шатура, спуск Гоголя, 88', N'268', N'Тамара Дмитриевна Семёноваа', 6148685143, 196332656)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'Монтаж', N'email: zakar.sazonova@gavrilov.ru', N'(495) 867-76-15', N'не указано', N'066594, Магаданская область, город Шаховская, спуск Сталина, 59', N'300', N'Блохина Сергей Максимович', 6142194281, 154457435)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'ВостокГлав', N'gordei95@kirillov.ru', N'(812) 949-29-26', N'\agents\agent_63.png', N'217022, Ростовская область, город Озёры, ул. Домодедовская, 19', N'107', N'Инга Фёдоровна Дмитриева', 3580946305, 405017349)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'Газ', N'ulyna.antonov@noskov.ru', N'(35222) 22-45-58', N'\agents\agent_76.png', N'252821, Тамбовская область, город Пушкино, ул. Чехова, 40', N'170', N'Терентьев Илларион Максимович', 8876413796, 955381891)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ЭлектроТранс', N'boleslav.zukova@nikiforova.com', N'(812) 342-24-31', N'\agents\agent_91.png', N'434616, Калининградская область, город Павловский Посад, пл. Ладыгина, 83', N'129', N'Сава Александрович Титова', 6019144874, 450629885)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'Электро', N'likacev.makar@antonov.ru', N'8-800-714-36-41', N'\agents\agent_93.png', N'966815, Новгородская область, город Одинцово, пр. Космонавтов, 19', N'366', N'Шарапова Елена Дмитриевна', 7896029866, 786038848)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'Гор', N'maiy12@koklov.net', N'(495) 973-48-55', N'\agents\agent_52.png', N'376483, Калужская область, город Сергиев Посад, ул. Славы, 09', N'175', N'Нонна Львовна Одинцоваа', 7088187045, 440309946)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания Гараж', N'email: asiryeva@andreeva.com', N'+7 (922) 848-38-54', N'\agents\agent_66.png', N'395101, Белгородская область, город Балашиха, бульвар 1905 года, 00', N'413', N'Владлена Фёдоровна Ларионоваа', 6190244524, 399106161)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'ОрионГлав', N'sermakova@sarova.net', N'+7 (922) 684-13-74', N'\agents\agent_106.png', N'729639, Магаданская область, город Талдом, въезд Будапештсткая, 98', N'482', N'Тимофеева Григорий Андреевич', 9032455179, 763045792)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'ГлавITФлотПроф', N'savva.rybov@kolobov.ru', N'(812) 146-66-46', N'\agents\agent_64.png', N'447811, Мурманская область, город Егорьевск, ул. Ленина, 24', N'62', N'Зыкова Стефан Максимович', 2561361494, 525678825)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'ТверьМонтажОмск', N'dteterina@selezneva.ru', N'8-800-363-43-86', N'\agents\agent_128.png', N'761751, Амурская область, город Балашиха, шоссе Гоголя, 02', N'272', N'Матвей Романович Большакова', 2421347164, 157370604)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'РемСантехОмскБанк', N'anisimov.mark@vorobev.ru', N'(812) 182-44-77', N'\agents\agent_57.png', N'289468, Омская область, город Видное, пер. Балканская, 33', N'442', N'Фокина Искра Максимовна', 6823050572, 176488617)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ЭлектроМоторТрансСнос', N'inessa.voronov@sidorova.ru', N'(35222) 43-62-19', N'отсутствует', N'913777, Самарская область, город Красногорск, ул. Бухарестская, 49', N'151', N'Людмила Евгеньевна Новиковаа', 6608362851, 799760512)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'ТверьХозМорСбыт', N'email: marina58@koroleva.com', N'(495) 416-75-67', N'\agents\agent_117.png', N'252101, Ростовская область, город Дорохово, пер. Ленина, 85', N'207', N'Аким Львович Субботина', 6681338084, 460530907)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания ТомскХоз', N'email: nelli11@gureva.ru', N'+7 (922) 849-13-37', N'\agents\agent_115.png', N'861543, Томская область, город Истра, бульвар Славы, 42', N'464', N'Лазарева Аркадий Сергеевич', 8430391035, 961540858)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания МясДизайнДизайн', N'email: gleb.gulyev@belyeva.com', N'(812) 535-17-25', N'\agents\agent_53.png', N'557264, Брянская область, город Серпухов, въезд Гоголя, 34', N'491', N'Клементина Сергеевна Стрелкова', 8004989990, 908629456)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания ЖелДорТверьМонтаж', N'email: burova.zlata@zueva.ru', N'(495) 521-61-75', N'\agents\agent_85.png', N'152424, Рязанская область, город Сергиев Посад, ул. 1905 года, 27', N'2', N'Нестор Максимович Гуляев', 3325722996, 665766347)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'МетизТехАвтоПроф', N'anastasiy.gromov@samsonova.com', N'(495) 581-42-46', N'\agents\agent_33.png', N'713016, Брянская область, город Подольск, пл. Домодедовская, 93', N'321', N'Егор Фёдорович Третьякова', 2988890076, 215491048)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'Гараж', N'antonin51@korolev.com', N'(35222) 54-72-59', N'\agents\agent_90.png', N'585758, Самарская область, город Красногорск, бульвар Балканская, 13', N'107', N'Панфилов Константин Максимович', 2638464552, 746822723)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'ГазДизайнЖелДор', N'elizaveta.komarov@rybakov.net', N'(495) 797-97-33', N'\agents\agent_49.png', N'695230, Курская область, город Красногорск, пр. Гоголя, 64', N'236', N'Лев Иванович Третьяков', 2396029740, 458924890)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'РемГаражЛифт', N'novikova.gleb@sestakov.ru', N'8-800-772-27-53', N'\agents\agent_65.png', N'048715, Ивановская область, город Люберцы, проезд Космонавтов, 89', N'374', N'Филатов Владимир Максимович', 1656477206, 988968838)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'СантехБашкир', N'email: nikodim81@kiseleva.com', N'+7 (922) 155-87-39', N'\agents\agent_99.png', N'180288, Тверская область, город Одинцово, ул. Бухарестская, 37', N'369', N'Виктор Иванович Молчанов', 4159215346, 639267493)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'ЮпитерЛенГараж-М', N'larkipova@gorbunov.ru', N'(495) 327-58-25', N'\agents\agent_48.png', N'339507, Московская область, город Видное, ул. Космонавтов, 11', N'470', N'Васильева Валерия Борисовна', 2038393690, 259672761)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ОрионСофтВодСнос', N'isukanov@sobolev.com', N'(35222) 59-75-11', N'\agents\agent_97.png', N'577227, Калужская область, город Павловский Посад, наб. Чехова, 35', N'361', N'Мухина Ян Фёдорович', 1522348613, 977738715)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'КазХоз', N'istrelkova@fomin.ru', N'+7 (922) 728-85-62', N'нет', N'384162, Астраханская область, город Одинцово, бульвар Гагарина, 57', N'213', N'Степанова Роман Иванович', 6503377671, 232279972)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'БухВжух', N'valentina.bolsakova@aksenova.ru', N'(495) 367-21-41', N'отсутствует', N'481744, Амурская область, город Щёлково, пл. Сталина, 48', N'327', N'Тарасов Болеслав Александрович', 2320989197, 359282667)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ХозЮпитер', N'jisakova@nazarova.com', N'+7 (922) 332-48-96', N'\agents\agent_114.png', N'038182, Курганская область, город Москва, спуск Космонавтов, 16', N'375', N'Максимоваа Вера Фёдоровна', 6667635058, 380592865)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'ВостокКазРыб', N'flukin@misin.org', N'(495) 987-31-63', N'\agents\agent_112.png', N'059565, Оренбургская область, город Истра, шоссе Домодедовская, 27', N'361', N'Самсонов Родион Романович', 7411284960, 176779733)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ЦементКрепТех-М', N'email: yna.evdokimov@gordeeva.ru', N'(812) 838-79-58', N'\agents\agent_82.png', N'263764, Свердловская область, город Раменское, пер. Косиора, 28', N'189', N'Сергеев Владлен Александрович', 5359981084, 680416300)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'Строй', N'soloveva.adam@andreev.ru', N'(812) 447-45-59', N'отсутствует', N'763019, Омская область, город Шатура, пл. Сталина, 56', N'12', N'Кудрявцев Адриан Андреевич', 6678884759, 279288618)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'БашкирЮпитерТомск', N'dyckov.veniamin@kotova.ru', N'(812) 189-59-57', N'\agents\agent_59.png', N'035268, Сахалинская область, город Волоколамск, проезд Ладыгина, 51', N'139', N'Фадеева Раиса Александровна', 1606315697, 217799345)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания КазМеталКазань', N'email: mmoiseev@teterin.ru', N'(495) 685-34-29', N'\agents\agent_130.png', N'532703, Пензенская область, город Чехов, наб. Чехова, 81', N'252', N'Валерий Владимирович Хохлова', 4598939812, 303467543)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания Газ', N'alina56@zdanov.com', N'(35222) 75-96-85', N'\agents\agent_120.png', N'310403, Кировская область, город Солнечногорск, пл. Балканская, 76', N'445', N'Давид Андреевич Фадеев', 2262431140, 247369527)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания Монтаж', N'afanasev.anastasiy@muravev.ru', N'(35222) 92-45-98', N'\agents\agent_75.png', N'036381, Брянская область, город Кашира, бульвар Гагарина, 76', N'124', N'Силин Даниил Иванович', 6206428565, 118570048)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'СервисХмельМонтаж', N'galina31@melnikov.ru', N'+7 (922) 344-73-38', N'\agents\agent_92.png', N'928260, Нижегородская область, город Балашиха, пл. Косиора, 44', N'124', N'Анжелика Дмитриевна Горбунова', 3459886235, 356196105)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ВодГараж', N'email: pmaslov@fomiceva.com', N'+7 (922) 363-86-67', N'\agents\agent_67.png', N'988899, Саратовская область, город Раменское, пр. Славы, 40', N'250', N'Лаврентий Фёдорович Логинова', 5575072431, 684290320)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'CибГаз', N'inna.sarova@panfilov.ru', N'(495) 945-37-25', N'\agents\agent_103.png', N'365674, Архангельская область, город Серебряные Пруды, пр. Ленина, 29', N'488', N'Вячеслав Романович Третьякова', 6483417250, 455013058)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'БашкирФлотМотор-H', N'email: morozova.nika@kazakova.ru', N'(495) 793-84-82', N'\agents\agent_36.png', N'008081, Тюменская область, город Ногинск, въезд Гагарина, 94', N'416', N'Марат Алексеевич Фролов', 1657476072, 934931159)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'МеталСервисМор', N'xdanilov@titov.ru', N'(35222) 91-28-62', N'нет', N'293265, Иркутская область, город Клин, пр. Славы, 12', N'475', N'Коновалова Кирилл Львович', 6922817841, 580142825)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'Рем', N'zanna25@nikiforova.com', N'(495) 987-88-53', N'\agents\agent_79.png', N'707812, Иркутская область, город Шаховская, ул. Гагарина, 17', N'329', N'Шароваа Елизавета Львовна', 3203830728, 456254820)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'СантехСеверЛенМашина', N'email: pgorbacev@vasilev.net', N'(812) 918-88-43', N'\agents\agent_74.png', N'606990, Новосибирская область, город Павловский Посад, въезд Домодедовская, 38', N'201', N'Павел Максимович Рожков', 3506691089, 830713603)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Цемент', N'panova.klementina@bobrov.ru', N'8-800-517-78-47', N'\agents\agent_54.png', N'084315, Амурская область, город Шаховская, наб. Чехова, 62', N'340', N'Анфиса Фёдоровна Буроваа', 9662118663, 650216214)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'Вод', N'email: savva86@zaiteva.ru', N'(495) 142-19-84', N'\agents\agent_129.png', N'964386, Оренбургская область, город Чехов, пл. Косиора, 80', N'359', N'Зоя Романовна Селезнёва', 1296063939, 447430051)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'Орион', N'email: aleksei63@kiselev.ru', N'8-800-621-61-93', N'\agents\agent_77.png', N'951035, Ивановская область, город Ступино, шоссе Космонавтов, 73', N'166', N'Мартынов Михаил Борисович', 2670166502, 716874456)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'СтройГорНефть', N'email: lysy.kolesnikova@molcanova.com', N'(812) 385-21-37', N'\agents\agent_37.png', N'444539, Ульяновская область, город Лотошино, спуск Будапештсткая, 95', N'161', N'Тарасова Макар Максимович', 5916775587, 398299418)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания Хмель', N'ermakov.mark@isakova.ru', N'(812) 421-77-82', N'отсутствует', N'889757, Новосибирская область, город Раменское, бульвар 1905 года, 93', N'2', N'Владимир Борисович Суворова', 9004087602, 297273898)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания ВодАлмазIT', N'zakar37@nikolaeva.ru', N'(35222) 52-76-16', N'\agents\agent_111.png', N'302100, Нижегородская область, город Мытищи, пер. 1905 года, 63', N'31', N'Гуляев Егор Евгеньевич', 2345297765, 908449277)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'БашкирРечТомск', N'email: aleksandra77@karpov.com', N'8-800-254-71-85', N'\agents\agent_100.png', N'136886, Амурская область, город Видное, въезд Космонавтов, 39', N'84', N'Назарова Вера Андреевна', 7027724917, 823811460)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'СофтРосБух', N'ivanova.antonin@rodionov.ru', N'+7 (922) 445-69-17', N'\agents\agent_124.png', N'747695, Амурская область, город Сергиев Посад, въезд Бухарестская, 46', N'69', N'Белова Полина Владимировна', 8321561226, 807803984)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'ТелекомЮпитер', N'kulikov.adrian@zuravlev.org', N'(812) 895-67-23', N'\agents\agent_81.png', N'959793, Курская область, город Егорьевск, бульвар Ленина, 72', N'302', N'Калинина Татьяна Ивановна', 9383182378, 944520594)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'УралСтройХмель', N'email: aleksandr95@kolobova.ru', N'(35222) 39-23-65', N'\agents\agent_113.png', N'462632, Костромская область, город Шаховская, шоссе Сталина, 92', N'372', N'Август Борисович Красильникова', 8773558039, 402502867)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'АсбоцементТехАвто', N'matveev.yliy@kiseleva.ru', N'+7 (922) 977-68-84', N'\agents\agent_110.png', N'304975, Пензенская область, город Солнечногорск, шоссе Балканская, 76', N'247', N'Сидорова Любовь Ивановна', 7626076463, 579234124)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания ФинансСервис', N'email: robert.serbakov@safonova.ru', N'(812) 878-42-71', N'\agents\agent_38.png', N'841700, Брянская область, город Серпухов, спуск Домодедовская, 35', N'395', N'Клавдия Сергеевна Виноградова', 7491491391, 673621812)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'Софт', N'jterentev@ersov.com', N'(35222) 12-82-65', N'\agents\agent_122.png', N'453714, Смоленская область, город Одинцово, спуск Косиора, 84', N'292', N'Петухова Прохор Фёдорович', 3889910123, 952047511)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ТелекомГор', N'gorskov.larisa@kalinin.com', N'(35222) 78-93-21', N'\agents\agent_98.png', N'210024, Белгородская область, город Сергиев Посад, наб. Ломоносова, 43', N'255', N'Ксения Андреевна Михайлова', 3748947224, 766431901)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'РемСтрем', N'rafail96@sukin.ru', N'(35222) 55-28-24', N'\agents\agent_116.png', N'373761, Псковская область, город Наро-Фоминск, наб. Гагарина, 03', N'88', N'Альбина Александровна Романова', 9006569852, 152177100)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Лифт', N'email: zinaida01@bespalova.ru', N'(812) 484-92-38', N'\agents\agent_101.png', N'479565, Курганская область, город Клин, пл. Ленина, 54', N'92', N'Вера Евгеньевна Денисоваа', 6169713039, 848972934)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания МоторТелекомЦемент-М', N'larisa44@silin.org', N'(812) 857-95-57', N'\agents\agent_118.png', N'021293, Амурская область, город Наро-Фоминск, шоссе Славы, 40', N'237', N'Иван Евгеньевич Белоусова', 7326832482, 440199498)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ЮпитерТяжОрионЭкспедиция', N'email: gblokin@orlov.net', N'(35222) 95-63-65', N'\agents\agent_44.png', N'960726, Томская область, город Орехово-Зуево, въезд 1905 года, 51', N'446', N'Валерий Евгеньевич Виноградов', 6843174002, 935556458)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'Транс', N'artem.fadeev@polykov.com', N'8-800-954-23-89', N'\agents\agent_127.png', N'508299, Кемеровская область, город Кашира, пер. Гагарина, 42', N'38', N'Евсеева Болеслав Сергеевич', 9604275878, 951258069)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'РемВод', N'komarov.elizaveta@agafonova.ru', N'+7 (922) 353-31-72', N'\agents\agent_126.png', N'449723, Смоленская область, город Наро-Фоминск, пер. Ломоносова, 94', N'1', N'Медведеваа Ярослава Фёдоровна', 3986603105, 811373078)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'АсбоцементЛифтРеч-H', N'vladlena58@seliverstova.ru', N'(495) 245-57-16', N'\agents\agent_105.png', N'599158, Ростовская область, город Озёры, ул. Космонавтов, 05', N'407', N'Кондратьева Таисия Андреевна', 6567878928, 560960507)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'РосАвтоМонтаж', N'lapin.inessa@isaeva.com', N'(495) 445-97-76', N'\agents\agent_55.png', N'331914, Курская область, город Ногинск, спуск Ладыгина, 66', N'10', N'Диана Алексеевна Исаковаа', 4735043946, 263682488)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания СервисТелеМотор', N'email: veronika.egorov@bespalova.com', N'+7 (922) 461-25-29', N'\agents\agent_102.png', N'625988, Вологодская область, город Озёры, пр. Гоголя, 18', N'81', N'Фролова Эдуард Борисович', 3248454160, 138472695)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'ФинансТелеТверь', N'email: medvedev.klim@afanasev.com', N'(812) 115-56-93', N'\agents\agent_45.png', N'687171, Томская область, город Лотошино, пл. Славы, 59', N'100', N'Зайцеваа Дарья Сергеевна', 2646091050, 971874277)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ВодГор', N'tvetkova.robert@sorokin.com', N'(35222) 73-72-16', N'\agents\agent_125.png', N'265653, Калужская область, город Ступино, шоссе Гоголя, 89', N'72', N'Фаина Фёдоровна Филиппова', 4463113470, 899603778)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ТяжРадиоУралПроф', N'liliy62@grisina.ru', N'+7 (922) 885-66-15', N'\agents\agent_88.png', N'521087, Орловская область, город Егорьевск, шоссе Ладыгина, 14', N'278', N'София Алексеевна Мухина', 5688533246, 401535045)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ГаражЛофт', N'lydmila.belyeva@karpov.ru', N'(495) 427-55-66', N'\agents\agent_108.png', N'294596, Мурманская область, город Шаховская, пр. Домодедовская, 88', N'335', N'Клавдия Фёдоровна Кудряшова', 2816939574, 754741128)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'ITСтройАлмаз', N'fokin.eduard@samoilov.com', N'8-800-185-78-91', N'\agents\agent_83.png', N'361730, Костромская область, город Волоколамск, шоссе Славы, 36', N'159', N'Алексеева Валериан Андреевич', 7689065648, 456612755)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Асбоцемент', N'antonin19@panfilov.ru', N'8-800-211-16-23', N'\agents\agent_34.png', N'030119, Курганская область, город Дмитров, пер. Славы, 47', N'273', N'Никитинаа Антонина Андреевна', 1261407459, 745921890)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'ТекстильУралАвтоОпт', N'hkononova@pavlova.ru', N'(35222) 98-76-54', N'не указано', N'028936, Магаданская область, город Видное, ул. Гагарина, 54', N'176', N'Алина Сергеевна Дьячковаа', 3930950057, 678529397)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ООО', N'Компания КрепЦемент', N'rusakov.efim@nikiforov.ru', N'(812) 963-77-87', N'\agents\agent_50.png', N'423477, Мурманская область, город Кашира, бульвар Домодедовская, 61', N'426', N'Екатерина Львовна Суворова', 3025099903, 606083992)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'КазаньТекстиль', N'osimonova@andreeva.com', N'(35222) 86-74-21', N'\agents\agent_47.png', N'231891, Челябинская область, город Шатура, бульвар Ладыгина, 40', N'156', N'Александров Бронислав Максимович', 4584384019, 149680499)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'КазЮпитерТомск', N'tgavrilov@frolov.ru', N'+7 (922) 772-33-58', N'\agents\agent_60.png', N'393450, Тульская область, город Кашира, пр. 1905 года, 47', N'244', N'Рафаил Андреевич Копылов', 9201745524, 510248846)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МФО', N'Бух', N'belova.vikentii@konstantinova.net', N'+7 (922) 375-49-21', N'\agents\agent_78.png', N'409600, Новгородская область, город Ногинск, пл. Гагарина, 68', N'82', N'Татьяна Сергеевна Королёваа', 1953785418, 122905583)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'Радио', N'rtretykova@kozlov.ru', N'8-800-897-32-78', N'\agents\agent_43.png', N'798718, Ленинградская область, город Пушкино, бульвар Балканская, 37', N'221', N'Эмма Андреевна Колесникова', 9077613654, 657690787)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ЗАО', N'Креп', N'savina.dominika@belousova.com', N'(495) 217-46-29', N'\agents\agent_39.png', N'336489, Калининградская область, город Можайск, наб. Славы, 35', N'371', N'Назар Алексеевич Григорьева', 4880732317, 258673591)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'Мобайл', N'email: dsiryev@dementeva.com', N'8-800-618-73-37', N'\agents\agent_107.png', N'606703, Амурская область, город Чехов, пл. Будапештсткая, 91', N'464', N'Екатерина Сергеевна Бобылёва', 7803888520, 885703265)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'CибБашкирТекстиль', N'vzimina@zdanova.com', N'(495) 285-78-38', N'\agents\agent_69.png', N'429540, Мурманская область, город Воскресенск, пл. Славы, 36', N'218', N'Григорий Владимирович Елисеева', 7392007090, 576103661)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'МКК', N'МеталТекстильЛифтТрест', N'email: muravev.trofim@sazonov.net', N'(812) 753-96-76', N'\agents\agent_86.png', N'786287, Свердловская область, город Волоколамск, пер. Будапештсткая, 72', N'425', N'Одинцов Назар Борисович', 2971553297, 821859486)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'ОрионТомскТех', N'faina.tikonova@veselov.com', N'+7 (922) 542-89-15', N'\agents\agent_119.png', N'738763, Курская область, город Егорьевск, спуск Чехова, 66', N'73', N'Георгий Александрович Лукин', 9351493429, 583041591)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ПАО', N'ЖелДорДизайнМетизТраст', N'lnikitina@kulikova.com', N'(812) 123-63-47', N'не указано', N'170549, Сахалинская область, город Видное, проезд Космонавтов, 89', N'290', N'Игорь Львович Агафонова', 7669116841, 906390137)
INSERT [dbo].[agents_k_import] ([Тип_агента], [Наименование_агента], [Электронная_почта_агента], [Телефон_агента], [Логотип_агента], [Юридический_адрес], [Приоритет], [Директор], [ИНН], [КПП]) VALUES (N'ОАО', N'БухМясМоторПром', N'varvara49@savin.ru', N'(35222) 83-23-59', N'\agents\agent_95.png', N'677498, Костромская область, город Зарайск, спуск Славы, 59', N'158', N'Нина Дмитриевна Черноваа', 7377410338, 592041317)
GO
SET IDENTITY_INSERT [dbo].[AgentType] ON 

INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (1, N'ЗАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (2, N'МКК', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (3, N'МФО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (4, N'ОАО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (5, N'ООО', NULL)
INSERT [dbo].[AgentType] ([ID], [Title], [Image]) VALUES (6, N'ПАО', NULL)
SET IDENTITY_INSERT [dbo].[AgentType] OFF
GO
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (1, N'Резина 1', 0, N'0', 0, 0, N'0', CAST(200.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (2, N'Резина 2', 0, N'0', 0, 0, N'0', CAST(180.00 AS Decimal(10, 2)), NULL, 1)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (3, N'Пластик 1', 0, N'0', 0, 0, N'0', CAST(300.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (4, N'Пластик 2', 0, N'0', 0, 0, N'0', CAST(250.00 AS Decimal(10, 2)), NULL, 2)
INSERT [dbo].[Material] ([ID], [Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES (5, N'Шнурок', 0, N'0', 0, 0, N'0', CAST(100.00 AS Decimal(10, 2)), NULL, 3)
GO
SET IDENTITY_INSERT [dbo].[MaterialType] ON 

INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Резина', 3)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Пластик', 4)
INSERT [dbo].[MaterialType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Шнур', 0)
SET IDENTITY_INSERT [dbo].[MaterialType] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (1, N'Попрыгунчик для собачек 5096', 1, N'67975083', NULL, NULL, 4, 9, CAST(1465.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (2, N'Попрыгунчик для мальчиков 5389', 1, N'70873532', NULL, NULL, 3, 2, CAST(1739.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (3, N'Шар 6366', 1, N'25514523', NULL, NULL, 4, 4, CAST(1932.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (4, N'Попрыгунчик для девочек 2311', 1, N'25262035', NULL, NULL, 4, 1, CAST(1308.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (5, N'Попрыгунчик детский красный 6591', 1, N'79704172', NULL, NULL, 5, 7, CAST(592.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (6, N'Попрыгунчик для кошечек 3741', 1, N'43987093', NULL, NULL, 5, 4, CAST(1668.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (7, N'Попрыгунчик для собачек 4485', 1, N'33440129', NULL, NULL, 2, 12, CAST(1995.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (8, N'Попрыгунчик для девочек 6849', 1, N'10084400', NULL, NULL, 1, 11, CAST(933.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (9, N'Попрыгунчик для девочек 3389', 1, N'26434211', NULL, NULL, 3, 10, CAST(597.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (10, N'Шар 2243', 1, N'42536654', NULL, NULL, 3, 12, CAST(1247.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (11, N'Попрыгунчик детский красный 1740', 1, N'43330133', NULL, NULL, 5, 3, CAST(1749.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (12, N'Попрыгунчик детский красный 5400', 1, N'68237918', NULL, NULL, 4, 5, CAST(1570.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (13, N'Попрыгунчик детский желтый 2582', 1, N'32125209', NULL, NULL, 3, 11, CAST(1730.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (14, N'Попрыгун 2299', 1, N'34750945', NULL, NULL, 2, 2, CAST(1688.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (15, N'Попрыгунчик детский розовый 5501', 1, N'25409940', NULL, NULL, 2, 7, CAST(652.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (16, N'Попрыгунчик детский 1916', 1, N'73345857', NULL, NULL, 5, 8, CAST(832.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (17, N'Попрыгунчик детский желтый 6678', 2, N'80007300', NULL, NULL, 2, 1, CAST(1768.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (18, N'Попрыгунчик детский красный 3240', 2, N'88098604', NULL, NULL, 3, 8, CAST(882.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (19, N'Попрыгунчик детский красный 3839', 2, N'26655484', NULL, NULL, 5, 2, CAST(1921.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (20, N'Попрыгунчик для мальчиков 4791', 2, N'45540528', NULL, NULL, 3, 11, CAST(1260.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (21, N'Попрыгунчик для собачек 3500', 2, N'79994924', NULL, NULL, 2, 9, CAST(1142.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (22, N'Попрыгунчик детский 6029', 2, N'69184347', NULL, NULL, 3, 7, CAST(419.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (23, N'Попрыгунчик детский красный 1972', 2, N'59509797', NULL, NULL, 1, 7, CAST(794.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (24, N'Попрыгунчик детский 5117', 2, N'80875656', NULL, NULL, 3, 12, CAST(338.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (25, N'Попрыгун 6412', 2, N'28152672', NULL, NULL, 2, 9, CAST(523.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (26, N'Попрыгунчик для собачек 4529', 2, N'81713527', NULL, NULL, 3, 6, CAST(1923.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (27, N'Попрыгунчик детский розовый 2694', 2, N'13340356', NULL, NULL, 4, 6, CAST(1691.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (28, N'Попрыгунчик детский красный 1289', 3, N'82925345', NULL, NULL, 4, 10, CAST(1919.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (29, N'Попрыгунчик детский 6888', 3, N'13875235', NULL, NULL, 4, 12, CAST(1972.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (30, N'Попрыгунчик для мальчиков 3929', 3, N'2158097', NULL, NULL, 1, 9, CAST(255.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (31, N'Попрыгунчик детский 2071', 3, N'3157982', NULL, NULL, 3, 6, CAST(275.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (32, N'Попрыгунчик детский розовый 5376', 3, N'74291677', NULL, NULL, 4, 6, CAST(1889.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (33, N'Попрыгунчик для кошечек 2604', 3, N'11890154', NULL, NULL, 2, 7, CAST(842.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (34, N'Попрыгунчик детский розовый 1657', 3, N'86558177', NULL, NULL, 4, 3, CAST(662.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (35, N'Попрыгунчик детский красный 4969', 3, N'10614909', NULL, NULL, 5, 12, CAST(913.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (36, N'Попрыгунчик для девочек 1560', 3, N'47378395', NULL, NULL, 5, 6, CAST(235.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (37, N'Попрыгунчик для собачек 4387', 4, N'89607276', NULL, NULL, 3, 8, CAST(912.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (38, N'Попрыгун 6882', 4, N'12732041', NULL, NULL, 1, 6, CAST(809.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (39, N'Попрыгунчик для кошечек 4740', 4, N'80698285', NULL, NULL, 1, 6, CAST(1973.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (40, N'Попрыгунчик для мальчиков 3307', 5, N'30269726', NULL, NULL, 4, 10, CAST(1533.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (41, N'Попрыгунчик детский желтый 6051', 5, N'88211092', NULL, NULL, 4, 12, CAST(727.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (42, N'Попрыгун 3016', 5, N'74919447', NULL, NULL, 1, 12, CAST(615.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (43, N'Попрыгунчик для девочек 1895', 5, N'54983244', NULL, NULL, 4, 4, CAST(1586.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (44, N'Попрыгунчик для собачек 5754', 5, N'79018408', NULL, NULL, 2, 8, CAST(633.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (45, N'Попрыгунчик для девочек 1656', 5, N'22217580', NULL, NULL, 5, 6, CAST(1494.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (46, N'Попрыгунчик детский желтый 1371', 5, N'85514178', NULL, NULL, 3, 7, CAST(252.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (47, N'Попрыгунчик детский розовый 5197', 5, N'89612317', NULL, NULL, 1, 3, CAST(1948.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (48, N'Шар 4124', 5, N'39025230', NULL, NULL, 5, 8, CAST(1160.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (49, N'Попрыгунчик детский розовый 6346', 5, N'30282346', NULL, NULL, 1, 10, CAST(1024.00 AS Decimal(10, 2)))
INSERT [dbo].[Product] ([ID], [Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES (50, N'Попрыгунчик для собачек 4381', 5, N'27301447', NULL, NULL, 2, 5, CAST(1234.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 1, 20)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 2, 22)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 3, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (1, 5, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 1, 25)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 2, 30)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 4, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (2, 5, 10)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 1, 25)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 3, 28)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (3, 5, 12)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (5, 2, 50)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (6, 5, 50)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (7, 4, 25)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (8, 4, 70)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (9, 4, 93)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (10, 5, 90)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (11, 1, 94)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (12, 1, 89)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (13, 5, 41)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (14, 5, 69)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (15, 2, 91)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (16, 2, 40)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (17, 3, 45)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (18, 2, 62)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (19, 2, 34)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (20, 3, 15)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (21, 4, 34)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (22, 3, 91)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (23, 1, 35)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (24, 4, 59)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (25, 3, 70)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (26, 2, 79)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (27, 1, 92)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (28, 1, 73)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (29, 5, 97)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (30, 3, 18)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (31, 4, 83)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (32, 3, 42)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (33, 4, 49)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (34, 2, 83)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (35, 4, 82)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (36, 2, 98)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (37, 3, 55)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (38, 2, 51)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (39, 3, 57)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (40, 3, 80)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (41, 1, 60)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (42, 2, 61)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (43, 5, 95)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (44, 2, 46)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (45, 2, 77)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (46, 3, 100)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (47, 4, 38)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (48, 4, 35)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (49, 1, 62)
INSERT [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES (50, 4, 33)
GO
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 1289', N'Для маленьких деток', 82925345, 4, 10, N'1919.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский желтый 6678', N'Для больших деток', 80007300, 2, 1, N'1768')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский 6888', N'Для маленьких деток', 13875235, 4, 12, N'1972')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для мальчиков 3929', N'Для маленьких деток', 2158097, 1, 9, N'255')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский 2071', N'Для маленьких деток', 3157982, 3, 6, N'275')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 5096', N'Взрослый', 67975083, 4, 9, N'1465')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для мальчиков 5389', N'Взрослый', 70873532, 3, 2, N'1739')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский розовый 5376', N'Для маленьких деток', 74291677, 4, 6, N'1889.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для мальчиков 3307', N'Цифровой', 30269726, 4, 10, N'1533')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для кошечек 2604', N'Для маленьких деток', 11890154, 2, 7, N'842')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Шар 6366', N'Взрослый', 25514523, 4, 4, N'1932')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский желтый 6051', N'Цифровой', 88211092, 4, 12, N'727')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для девочек 2311', N'Взрослый', 25262035, 4, 1, N'1308')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 4387', N'Упругий', 89607276, 3, 8, N'912.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгун 3016', N'Цифровой', 74919447, 1, 12, N'615')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 3240', N'Для больших деток', 88098604, 3, 8, N'882.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский розовый 1657', N'Для маленьких деток', 86558177, 4, 3, N'662.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 6591', N'Взрослый', 79704172, 5, 7, N'592.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для девочек 1895', N'Цифровой', 54983244, 4, 4, N'1586')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для кошечек 3741', N'Взрослый', 43987093, 5, 4, N'1668.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 3839', N'Для больших деток', 26655484, 5, 2, N'1921')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 4969', N'Для маленьких деток', 10614909, 5, 12, N'913')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 5754', N'Цифровой', 79018408, 2, 8, N'633.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 4485', N'Взрослый', 33440129, 2, 12, N'1995')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для девочек 1656', N'Цифровой', 22217580, 5, 6, N'1494')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для мальчиков 4791', N'Для больших деток', 45540528, 3, 11, N'1260')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для девочек 6849', N'Взрослый', 10084400, 1, 11, N'933')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский желтый 1371', N'Цифровой', 85514178, 3, 7, N'252')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для девочек 3389', N'Взрослый', 26434211, 3, 10, N'597.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский розовый 5197', N'Цифровой', 89612317, 1, 3, N'1948')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 3500', N'Для больших деток', 79994924, 2, 9, N'1142.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгун 6882', N'Упругий', 12732041, 1, 6, N'809')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для кошечек 4740', N'Упругий', 80698285, 1, 6, N'1973.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Шар 2243', N'Взрослый', 42536654, 3, 12, N'1247.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 1740', N'Взрослый', 43330133, 5, 3, N'1749.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 5400', N'Взрослый', 68237918, 4, 5, N'1570.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для девочек 1560', N'Для маленьких деток', 47378395, 5, 6, N'235')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Шар 4124', N'Цифровой', 39025230, 5, 8, N'1160')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский желтый 2582', N'Взрослый', 32125209, 3, 11, N'1730')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский 6029', N'Для больших деток', 69184347, 3, 7, N'419')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгун 2299', N'Взрослый', 34750945, 2, 2, N'1688')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский красный 1972', N'Для больших деток', 59509797, 1, 7, N'794.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский 5117', N'Для больших деток', 80875656, 3, 12, N'338')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский розовый 5501', N'Взрослый', 25409940, 2, 7, N'652.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский розовый 6346', N'Цифровой', 30282346, 1, 10, N'1024.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгун 6412', N'Для больших деток', 28152672, 2, 9, N'523')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский 1916', N'Взрослый', 73345857, 5, 8, N'832.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 4529', N'Для больших деток', 81713527, 3, 6, N'1923.00')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик для собачек 4381', N'Цифровой', 27301447, 2, 5, N'1234')
INSERT [dbo].[products_short_k_import] ([Наименование_продукции], [Тип_продукции], [Артикул], [Количество_человек_для_производства], [Номер_цеха_производства], [Минимальная_цена_для_агента]) VALUES (N'Попрыгунчик детский розовый 2694', N'Для больших деток', 13340356, 4, 6, N'1691.00')
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (1, 60, 33, CAST(N'2010-06-21' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (2, 82, 44, CAST(N'2016-02-17' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (3, 47, 7, CAST(N'2012-11-07' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (4, 98, 25, CAST(N'2019-06-01' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (5, 93, 19, CAST(N'2014-06-11' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (6, 45, 28, CAST(N'2012-08-12' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (7, 30, 11, CAST(N'2012-09-26' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (8, 47, 34, CAST(N'2018-02-28' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (9, 27, 17, CAST(N'2018-09-15' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (10, 72, 41, CAST(N'2011-08-27' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (11, 70, 23, CAST(N'2011-08-19' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (12, 47, 49, CAST(N'2015-02-02' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (13, 17, 26, CAST(N'2011-07-01' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (14, 23, 16, CAST(N'2013-12-23' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (15, 40, 33, CAST(N'2017-11-11' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (16, 74, 7, CAST(N'2014-04-15' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (17, 22, 7, CAST(N'2018-06-22' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (18, 12, 13, CAST(N'2013-07-11' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (19, 42, 34, CAST(N'2016-08-13' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (20, 30, 16, CAST(N'2014-07-28' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (21, 51, 37, CAST(N'2010-04-15' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (22, 48, 37, CAST(N'2017-10-12' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (23, 16, 48, CAST(N'2012-09-02' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (24, 61, 34, CAST(N'2015-08-08' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (25, 65, 50, CAST(N'2012-05-25' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (26, 46, 12, CAST(N'2014-03-06' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (27, 45, 18, CAST(N'2016-05-18' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (28, 88, 27, CAST(N'2014-07-11' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (29, 80, 49, CAST(N'2016-08-18' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (30, 65, 30, CAST(N'2019-07-25' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (31, 50, 22, CAST(N'2019-03-17' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (32, 35, 6, CAST(N'2014-08-06' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (33, 65, 8, CAST(N'2011-09-12' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (34, 29, 37, CAST(N'2011-08-28' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (35, 80, 14, CAST(N'2015-12-25' AS Date), 4)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (36, 42, 28, CAST(N'2016-02-25' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (37, 4, 32, CAST(N'2017-06-07' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (38, 27, 48, CAST(N'2016-11-27' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (39, 40, 5, CAST(N'2012-03-12' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (40, 79, 2, CAST(N'2018-06-13' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (41, 46, 21, CAST(N'2017-11-05' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (42, 67, 48, CAST(N'2016-02-26' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (43, 60, 9, CAST(N'2010-06-20' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (44, 40, 46, CAST(N'2015-06-23' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (45, 72, 37, CAST(N'2013-01-24' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (46, 2, 4, CAST(N'2015-02-28' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (47, 42, 23, CAST(N'2019-07-05' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (48, 38, 22, CAST(N'2014-03-06' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (49, 17, 21, CAST(N'2017-05-01' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (50, 77, 20, CAST(N'2015-01-17' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (51, 97, 42, CAST(N'2018-04-14' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (52, 17, 5, CAST(N'2014-12-12' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (53, 23, 34, CAST(N'2015-03-28' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (54, 6, 14, CAST(N'2017-11-24' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (55, 4, 25, CAST(N'2019-06-27' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (56, 87, 9, CAST(N'2014-06-04' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (57, 12, 24, CAST(N'2019-03-18' AS Date), 11)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (58, 6, 23, CAST(N'2015-09-12' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (59, 79, 16, CAST(N'2012-01-02' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (60, 2, 7, CAST(N'2011-02-01' AS Date), 12)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (61, 20, 39, CAST(N'2016-10-07' AS Date), 17)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (62, 61, 30, CAST(N'2017-06-07' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (63, 35, 31, CAST(N'2016-02-26' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (64, 35, 17, CAST(N'2013-11-09' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (65, 2, 22, CAST(N'2015-07-01' AS Date), 14)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (66, 78, 38, CAST(N'2015-08-27' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (67, 79, 44, CAST(N'2013-08-27' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (68, 93, 43, CAST(N'2013-05-10' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (69, 50, 7, CAST(N'2013-12-01' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (70, 82, 42, CAST(N'2011-06-11' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (71, 70, 17, CAST(N'2019-05-24' AS Date), 16)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (72, 35, 25, CAST(N'2017-04-02' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (73, 45, 29, CAST(N'2013-04-08' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (74, 77, 27, CAST(N'2019-08-16' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (75, 85, 25, CAST(N'2011-12-26' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (76, 70, 19, CAST(N'2016-07-19' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (77, 29, 15, CAST(N'2014-03-17' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (78, 5, 18, CAST(N'2011-06-14' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (79, 54, 9, CAST(N'2017-05-20' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (80, 50, 28, CAST(N'2010-04-13' AS Date), 6)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (81, 5, 28, CAST(N'2019-10-15' AS Date), 9)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (82, 10, 24, CAST(N'2019-10-08' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (83, 72, 19, CAST(N'2018-04-08' AS Date), 8)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (84, 46, 10, CAST(N'2012-06-14' AS Date), 2)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (85, 51, 46, CAST(N'2012-04-23' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (87, 77, 9, CAST(N'2016-09-14' AS Date), 7)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (88, 1, 30, CAST(N'2012-03-23' AS Date), 15)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (89, 25, 48, CAST(N'2010-11-17' AS Date), 5)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (90, 22, 22, CAST(N'2016-11-17' AS Date), 13)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (91, 20, 15, CAST(N'2010-05-03' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (92, 7, 41, CAST(N'2019-03-06' AS Date), 1)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (93, 67, 7, CAST(N'2017-10-14' AS Date), 20)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (94, 85, 27, CAST(N'2017-02-08' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (95, 70, 4, CAST(N'2017-08-02' AS Date), 3)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (96, 97, 32, CAST(N'2017-03-09' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (97, 72, 13, CAST(N'2017-11-13' AS Date), 18)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (98, 46, 13, CAST(N'2015-12-02' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (99, 31, 40, CAST(N'2011-06-14' AS Date), 19)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (100, 80, 28, CAST(N'2014-08-14' AS Date), 16)
GO
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (133, 2, 16, CAST(N'2023-07-02' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (141, 79, 21, CAST(N'2024-09-14' AS Date), 10)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (143, 80, 10, CAST(N'2024-09-03' AS Date), 35)
INSERT [dbo].[ProductSale] ([ID], [AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES (144, 6, 8, CAST(N'2024-09-06' AS Date), 5)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductType] ON 

INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (1, N'Взрослый', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (2, N'Для больших деток', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (3, N'Для маленьких деток', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (4, N'Упругий', 0)
INSERT [dbo].[ProductType] ([ID], [Title], [DefectedPercent]) VALUES (5, N'Цифровой', 0)
SET IDENTITY_INSERT [dbo].[ProductType] OFF
GO
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для кошечек 2604', N'КазаньТекстиль', CAST(N'2010-06-21T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 5754', N'Компания ФинансСервис', CAST(N'2016-02-17T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4485', N'РемГаражЛифт', CAST(N'2012-11-07T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 6412', N'Радио', CAST(N'2019-06-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 3839', N'Орион', CAST(N'2014-06-11T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1289', N'РемСантехОмскБанк', CAST(N'2012-08-12T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1740', N'Газ', CAST(N'2012-09-26T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 1657', N'РемГаражЛифт', CAST(N'2018-02-28T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 6678', N'CибБашкирТекстиль', CAST(N'2018-09-15T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 6051', N'Компания МясДизайнДизайн', CAST(N'2011-08-27T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1972', N'Компания Гараж', CAST(N'2011-08-19T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 6346', N'РемГаражЛифт', CAST(N'2015-02-02T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4529', N'Креп', CAST(N'2011-07-01T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 1916', N'ЮпитерЛенГараж-М', CAST(N'2013-12-23T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для кошечек 2604', N'Тех', CAST(N'2017-11-11T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4485', N'МетизТехАвтоПроф', CAST(N'2014-04-15T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4485', N'ГазДизайнЖелДор', CAST(N'2018-06-22T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 2582', N'Рем', CAST(N'2013-07-11T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 1657', N'МясТрансМоторЛизинг', CAST(N'2016-08-13T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 1916', N'Газ', CAST(N'2014-07-28T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4387', N'СтройГорНефть', CAST(N'2010-04-15T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4387', N'КазХоз', CAST(N'2017-10-12T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Шар 4124', N'ТекстильУралАвтоОпт', CAST(N'2012-09-02T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 1657', N'КазЮпитерТомск', CAST(N'2015-08-08T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4381', N'Компания СервисРадиоГор', CAST(N'2012-05-25T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 5400', N'ЭлектроМоторТрансСнос', CAST(N'2014-03-06T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 3240', N'РемСантехОмскБанк', CAST(N'2016-05-18T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 2694', N'Компания КрепЦемент', CAST(N'2014-07-11T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 6346', N'Компания Хмель', CAST(N'2016-08-18T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для мальчиков 3929', N'Компания СервисРадиоГор', CAST(N'2019-07-25T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 6029', N'ВодГараж', CAST(N'2019-03-17T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для кошечек 3741', N'Строй', CAST(N'2014-08-06T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 6849', N'Компания СервисРадиоГор', CAST(N'2011-09-12T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4387', N'Монтаж', CAST(N'2011-08-28T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 2299', N'Компания Хмель', CAST(N'2015-12-25T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1289', N'МясТрансМоторЛизинг', CAST(N'2016-02-25T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 5376', N'CибПивОмскСнаб', CAST(N'2017-06-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Шар 4124', N'CибБашкирТекстиль', CAST(N'2016-11-27T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 6591', N'Тех', CAST(N'2012-03-12T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для мальчиков 5389', N'Цемент', CAST(N'2018-06-13T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 3500', N'ЭлектроМоторТрансСнос', CAST(N'2017-11-05T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Шар 4124', N'Компания ТелекомХмельГаражПром', CAST(N'2016-02-26T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 3389', N'КазаньТекстиль', CAST(N'2010-06-20T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 1371', N'Тех', CAST(N'2015-06-23T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4387', N'Компания МясДизайнДизайн', CAST(N'2013-01-24T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 2311', N'МясРеч', CAST(N'2015-02-28T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1972', N'МясТрансМоторЛизинг', CAST(N'2019-07-05T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 6029', N'Бух', CAST(N'2014-03-06T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 3500', N'Креп', CAST(N'2017-05-01T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для мальчиков 4791', N'Компания Монтаж', CAST(N'2015-01-17T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 3016', N'ФинансТелеТверь', CAST(N'2018-04-14T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 6591', N'Креп', CAST(N'2014-12-12T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 1657', N'ЮпитерЛенГараж-М', CAST(N'2015-03-28T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 2299', N'ТелеГлавВекторСбыт', CAST(N'2017-11-24T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 6412', N'CибПивОмскСнаб', CAST(N'2019-06-27T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 3389', N'Асбоцемент', CAST(N'2014-06-04T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 5117', N'Рем', CAST(N'2019-03-18T00:00:00.000' AS DateTime), 11)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1972', N'ТелеГлавВекторСбыт', CAST(N'2015-09-12T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 1916', N'Цемент', CAST(N'2012-01-02T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4485', N'МясРеч', CAST(N'2011-02-01T00:00:00.000' AS DateTime), 12)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для кошечек 4740', N'Гор', CAST(N'2016-10-07T00:00:00.000' AS DateTime), 17)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для мальчиков 3929', N'КазЮпитерТомск', CAST(N'2017-06-07T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 2071', N'Строй', CAST(N'2016-02-26T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 6678', N'Строй', CAST(N'2013-11-09T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 6029', N'МясРеч', CAST(N'2015-07-01T00:00:00.000' AS DateTime), 14)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 6882', N'СантехСеверЛенМашина', CAST(N'2015-08-27T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 5754', N'Цемент', CAST(N'2013-08-27T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 1895', N'Орион', CAST(N'2013-05-10T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4485', N'ВодГараж', CAST(N'2013-12-01T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 3016', N'Компания ФинансСервис', CAST(N'2011-06-11T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 6678', N'Компания Гараж', CAST(N'2019-05-24T00:00:00.000' AS DateTime), 16)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 6412', N'Строй', CAST(N'2017-04-02T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 6888', N'РемСантехОмскБанк', CAST(N'2013-04-08T00:00:00.000' AS DateTime), 10)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 2694', N'Компания Монтаж', CAST(N'2019-08-16T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгун 6412', N'РосАвтоМонтаж', CAST(N'2011-12-26T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 3839', N'Компания Гараж', CAST(N'2016-07-19T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 5501', N'Монтаж', CAST(N'2014-03-17T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 3240', N'ЦементАсбоцемент', CAST(N'2011-06-14T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 3389', N'ЮпитерТяжОрионЭкспедиция', CAST(N'2017-05-20T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1289', N'ВодГараж', CAST(N'2010-04-13T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1289', N'ЦементАсбоцемент', CAST(N'2019-10-15T00:00:00.000' AS DateTime), 9)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 5117', N'БашкирЮпитерТомск', CAST(N'2019-10-08T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 3839', N'Компания МясДизайнДизайн', CAST(N'2018-04-08T00:00:00.000' AS DateTime), 8)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Шар 2243', N'ЭлектроМоторТрансСнос', CAST(N'2012-06-14T00:00:00.000' AS DateTime), 2)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 1371', N'СтройГорНефть', CAST(N'2012-04-23T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 6849', N'Орион', CAST(N'2015-08-17T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 3389', N'Компания Монтаж', CAST(N'2016-09-14T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для мальчиков 3929', N'ВодТверьХозМашина', CAST(N'2012-03-23T00:00:00.000' AS DateTime), 15)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Шар 4124', N'БашкирФлотМотор-H', CAST(N'2010-11-17T00:00:00.000' AS DateTime), 5)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский 6029', N'ГазДизайнЖелДор', CAST(N'2016-11-17T00:00:00.000' AS DateTime), 13)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 5501', N'Гор', CAST(N'2010-05-03T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 6051', N'ЭлектроРемОрионЛизинг', CAST(N'2019-03-06T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для собачек 4485', N'Компания ТелекомХмельГаражПром', CAST(N'2017-10-14T00:00:00.000' AS DateTime), 20)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 2694', N'РосАвтоМонтаж', CAST(N'2017-02-08T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для девочек 2311', N'Компания Гараж', CAST(N'2017-08-02T00:00:00.000' AS DateTime), 3)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский розовый 5376', N'ФинансТелеТверь', CAST(N'2017-03-09T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 2582', N'Компания МясДизайнДизайн', CAST(N'2017-11-13T00:00:00.000' AS DateTime), 18)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский желтый 2582', N'ЭлектроМоторТрансСнос', CAST(N'2015-12-02T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик для мальчиков 3307', N'ГлавITФлотПроф', CAST(N'2011-06-14T00:00:00.000' AS DateTime), 19)
INSERT [dbo].[Лист1$] ([Продукция], [Наименование агента], [Дата реализации], [Количество продукции]) VALUES (N'Попрыгунчик детский красный 1289', N'Компания Хмель', CAST(N'2014-08-14T00:00:00.000' AS DateTime), 16)
GO
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO
ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO
ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO
ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO
USE [master]
GO
ALTER DATABASE [Poprizhonok] SET  READ_WRITE 
GO
