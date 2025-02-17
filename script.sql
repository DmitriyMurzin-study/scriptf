USE [master]
GO
/****** Object:  Database [upDB]    Script Date: 31.10.2024 12:11:25 ******/
CREATE DATABASE [upDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'upDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\upDB.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'upDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\upDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [upDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [upDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [upDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [upDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [upDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [upDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [upDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [upDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [upDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [upDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [upDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [upDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [upDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [upDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [upDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [upDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [upDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [upDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [upDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [upDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [upDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [upDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [upDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [upDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [upDB] SET RECOVERY FULL 
GO
ALTER DATABASE [upDB] SET  MULTI_USER 
GO
ALTER DATABASE [upDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [upDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [upDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [upDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [upDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [upDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'upDB', N'ON'
GO
ALTER DATABASE [upDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [upDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [upDB]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BanksRecvis]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanksRecvis](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[НазваниеБанка] [int] NULL,
	[БИК] [int] NULL,
	[Счет] [nvarchar](50) NULL,
 CONSTRAINT [PK_BanksRecvis] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeathStatus]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeathStatus](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_HeathStatus] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialTypes]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialTypes](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Тип материала] [nvarchar](105) NULL,
	[Процент брака материала ] [float] NULL,
 CONSTRAINT [PK_MaterialTypes] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PartnerProducts]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PartnerProducts](
	[Код] [int] NULL,
	[Продукция] [nvarchar](150) NULL,
	[Наименование партнера] [int] NULL,
	[Количество продукции] [int] NULL,
	[Дата продажи] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partners]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partners](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Тип партнера] [int] NULL,
	[Наименование партнера] [nvarchar](100) NULL,
	[ФамилияДиректора] [nvarchar](50) NULL,
	[ИмяДиректора] [nvarchar](50) NULL,
	[ОтчествоДиректора] [nvarchar](50) NULL,
	[Электронная почта партнера] [nvarchar](100) NULL,
	[Телефон партнера] [nvarchar](20) NULL,
	[Юридический адрес партнера] [nvarchar](255) NULL,
	[ИНН] [nvarchar](50) NULL,
	[Рейтинг] [int] NULL,
	[Логип] [nvarchar](150) NULL,
 CONSTRAINT [PK_Partners] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Артикул] [int] IDENTITY(1,1) NOT NULL,
	[Тип продукции] [int] NULL,
	[Наименование продукции] [nvarchar](255) NULL,
	[Минимальная стоимость для партнера] [float] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Артикул] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[Код] [float] NULL,
	[Тип продукции] [nvarchar](255) NULL,
	[Коэффициент типа продукции] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypePartners]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypePartners](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](105) NULL,
 CONSTRAINT [PK_TypePartners] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workes]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workes](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Логин] [nvarchar](50) NULL,
	[Пароль] [nvarchar](50) NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[ДатаРождения] [date] NULL,
	[Паспорт] [int] NULL,
	[БанковскиеРеквезиты] [int] NULL,
	[НаличиеСемьи] [bit] NULL,
	[СостояниеЗдоровья] [int] NULL,
	[Роль] [int] NULL,
 CONSTRAINT [PK_Workes] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Паспорт]    Script Date: 31.10.2024 12:11:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Паспорт](
	[Код] [int] IDENTITY(1,1) NOT NULL,
	[Серия] [int] NULL,
	[Номер] [int] NULL,
	[ДатаВыдачи] [date] NULL,
	[Фото] [nvarchar](50) NULL,
 CONSTRAINT [PK_Паспорт] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Banks] ON 

INSERT [dbo].[Banks] ([Код], [Наименование]) VALUES (1, N'Тинькофф')
INSERT [dbo].[Banks] ([Код], [Наименование]) VALUES (2, N'Сбербанк')
INSERT [dbo].[Banks] ([Код], [Наименование]) VALUES (3, N'Райф')
INSERT [dbo].[Banks] ([Код], [Наименование]) VALUES (4, N'Газпромбанк')
INSERT [dbo].[Banks] ([Код], [Наименование]) VALUES (5, N'Крик')
SET IDENTITY_INSERT [dbo].[Banks] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialTypes] ON 

INSERT [dbo].[MaterialTypes] ([Код], [Тип материала], [Процент брака материала ]) VALUES (1, N'Тип материала 1', 0.001)
INSERT [dbo].[MaterialTypes] ([Код], [Тип материала], [Процент брака материала ]) VALUES (2, N'Тип материала 2', 0.0095)
INSERT [dbo].[MaterialTypes] ([Код], [Тип материала], [Процент брака материала ]) VALUES (3, N'Тип материала 3', 0.0028)
INSERT [dbo].[MaterialTypes] ([Код], [Тип материала], [Процент брака материала ]) VALUES (4, N'Тип материала 4', 0.0055)
INSERT [dbo].[MaterialTypes] ([Код], [Тип материала], [Процент брака материала ]) VALUES (5, N'Тип материала 5', 0.0034)
SET IDENTITY_INSERT [dbo].[MaterialTypes] OFF
GO
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (1, N'Паркетная доска Ясень темный однополосная 14 мм', 1, 15500, CAST(N'2023-03-23T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (2, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 1, 12350, CAST(N'2023-12-18T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (3, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 1, 37400, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (4, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 2, 35000, CAST(N'2022-12-02T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (5, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 2, 1250, CAST(N'2023-05-17T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (6, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 2, 1000, CAST(N'2024-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (7, N'Паркетная доска Ясень темный однополосная 14 мм', 2, 7550, CAST(N'2024-07-01T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (8, N'Паркетная доска Ясень темный однополосная 14 мм', 3, 7250, CAST(N'2023-01-22T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (9, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 3, 2500, CAST(N'2024-07-05T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (10, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 4, 59050, CAST(N'2023-03-20T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (11, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 4, 37200, CAST(N'2024-03-12T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (12, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 4, 4500, CAST(N'2024-05-14T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (13, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 5, 50000, CAST(N'2023-09-19T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (14, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 5, 670000, CAST(N'2023-11-10T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (15, N'Паркетная доска Ясень темный однополосная 14 мм', 5, 35000, CAST(N'2024-04-15T00:00:00.000' AS DateTime))
INSERT [dbo].[PartnerProducts] ([Код], [Продукция], [Наименование партнера], [Количество продукции], [Дата продажи]) VALUES (16, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 5, 25000, CAST(N'2024-06-12T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Partners] ON 

INSERT [dbo].[Partners] ([Код], [Тип партнера], [Наименование партнера], [ФамилияДиректора], [ИмяДиректора], [ОтчествоДиректора], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Логип]) VALUES (1, 1, N'База Строитель', N'Иванова', N'Александра', N'Ивановна', N'aleksandraivanova@ml.ru', N'493 123 45 67', N'652050, Кемеровская область, город Юрга, ул. Лесная, 15', N'2.22246e+009', 7, NULL)
INSERT [dbo].[Partners] ([Код], [Тип партнера], [Наименование партнера], [ФамилияДиректора], [ИмяДиректора], [ОтчествоДиректора], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Логип]) VALUES (2, 2, N'Паркет 29', N'Петров', N'Василий', N'Петрович', N'vppetrov@vl.ru', N'987 123 56 78', N'164500, Архангельская область, город Северодвинск, ул. Строителей, 18', N'3.33389e+009', 7, NULL)
INSERT [dbo].[Partners] ([Код], [Тип партнера], [Наименование партнера], [ФамилияДиректора], [ИмяДиректора], [ОтчествоДиректора], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Логип]) VALUES (3, 3, N'Стройсервис', N'Соловьев', N'Андрей', N'Николаевич', N'ansolovev@st.ru', N'812 223 32 00', N'188910, Ленинградская область, город Приморск, ул. Парковая, 21', N'4.44039e+009', 7, NULL)
INSERT [dbo].[Partners] ([Код], [Тип партнера], [Наименование партнера], [ФамилияДиректора], [ИмяДиректора], [ОтчествоДиректора], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Логип]) VALUES (4, 4, N'Ремонт и отделка', N'Воробьева', N'Екатерина', N'Валерьевна', N'ekaterina.vorobeva@ml.ru', N'444 222 33 11', N'143960, Московская область, город Реутов, ул. Свободы, 51', N'1.11152e+009', 5, NULL)
INSERT [dbo].[Partners] ([Код], [Тип партнера], [Наименование партнера], [ФамилияДиректора], [ИмяДиректора], [ОтчествоДиректора], [Электронная почта партнера], [Телефон партнера], [Юридический адрес партнера], [ИНН], [Рейтинг], [Логип]) VALUES (5, 1, N'МонтажПро', N'Степанов', N'Степан', N'Сергеевич', N'stepanov@stepan.ru', N'912 888 33 33', N'309500, Белгородская область, город Старый Оскол, ул. Рабочая, 122', N'5.55243e+009', 10, NULL)
SET IDENTITY_INSERT [dbo].[Partners] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Артикул], [Тип продукции], [Наименование продукции], [Минимальная стоимость для партнера]) VALUES (5012543, 4, N'Пробковое напольное клеевое покрытие 32 класс 4 мм', 5450.59)
INSERT [dbo].[Products] ([Артикул], [Тип продукции], [Наименование продукции], [Минимальная стоимость для партнера]) VALUES (7028748, 1, N'Ламинат Дуб серый 32 класс 8 мм с фаской', 3890.41)
INSERT [dbo].[Products] ([Артикул], [Тип продукции], [Наименование продукции], [Минимальная стоимость для партнера]) VALUES (7750282, 1, N'Ламинат Дуб дымчато-белый 33 класс 12 мм', 1799.33)
INSERT [dbo].[Products] ([Артикул], [Тип продукции], [Наименование продукции], [Минимальная стоимость для партнера]) VALUES (8758385, 3, N'Паркетная доска Ясень темный однополосная 14 мм', 4456.9)
INSERT [dbo].[Products] ([Артикул], [Тип продукции], [Наименование продукции], [Минимальная стоимость для партнера]) VALUES (8858958, 3, N'Инженерная доска Дуб Французская елка однополосная 12 мм', 7330.99)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ProductTypes] ([Код], [Тип продукции], [Коэффициент типа продукции]) VALUES (1, N'Ламинат', 2.35)
INSERT [dbo].[ProductTypes] ([Код], [Тип продукции], [Коэффициент типа продукции]) VALUES (2, N'Массивная доска', 5.15)
INSERT [dbo].[ProductTypes] ([Код], [Тип продукции], [Коэффициент типа продукции]) VALUES (3, N'Паркетная доска', 4.34)
INSERT [dbo].[ProductTypes] ([Код], [Тип продукции], [Коэффициент типа продукции]) VALUES (4, N'Пробковое покрытие', 1.5)
INSERT [dbo].[ProductTypes] ([Код], [Тип продукции], [Коэффициент типа продукции]) VALUES (NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[TypePartners] ON 

INSERT [dbo].[TypePartners] ([Код], [Наименование]) VALUES (1, N'ЗАО')
INSERT [dbo].[TypePartners] ([Код], [Наименование]) VALUES (2, N'ООО')
INSERT [dbo].[TypePartners] ([Код], [Наименование]) VALUES (3, N'ПАО')
INSERT [dbo].[TypePartners] ([Код], [Наименование]) VALUES (4, N'ОАО')
SET IDENTITY_INSERT [dbo].[TypePartners] OFF
GO
USE [master]
GO
ALTER DATABASE [upDB] SET  READ_WRITE 
GO
