USE [master]
GO
/****** Object:  Database [Assignment_PRJ301]    Script Date: 02/07/2023 3:08:25 CH ******/
CREATE DATABASE [Assignment_PRJ301]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment_PRJ301', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.GIADUC\MSSQL\DATA\Assignment_PRJ301.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment_PRJ301_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.GIADUC\MSSQL\DATA\Assignment_PRJ301_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Assignment_PRJ301] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment_PRJ301].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment_PRJ301] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment_PRJ301] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Assignment_PRJ301] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment_PRJ301] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET RECOVERY FULL 
GO
ALTER DATABASE [Assignment_PRJ301] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment_PRJ301] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment_PRJ301] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment_PRJ301] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment_PRJ301] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment_PRJ301] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment_PRJ301] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Assignment_PRJ301', N'ON'
GO
ALTER DATABASE [Assignment_PRJ301] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment_PRJ301] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment_PRJ301]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 02/07/2023 3:08:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderDetails](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [int] NOT NULL,
	[productID] [varchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK__tblOrder__E4FEDE2A6B87AABC] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblOrders]    Script Date: 02/07/2023 3:08:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderCode] [varchar](50) NOT NULL,
	[userID] [nvarchar](50) NOT NULL,
	[order_date] [date] NULL,
	[total] [int] NOT NULL,
	[status] [bit] NULL,
	[payment_method] [varchar](10) NULL,
	[payment_date] [datetime] NULL,
 CONSTRAINT [PK__tblOrder__0809337DADFFD651] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProducts]    Script Date: 02/07/2023 3:08:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProducts](
	[productID] [varchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[img] [varchar](50) NOT NULL,
 CONSTRAINT [PK__tblProdu__2D10D14AECADC89F] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUsers]    Script Date: 02/07/2023 3:08:25 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUsers](
	[userID] [nvarchar](50) NOT NULL,
	[fullName] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[roleID] [nvarchar](50) NULL,
	[address] [nvarchar](50) NULL,
	[googleID] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblOrderDetails] ON 

INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1, 1, N'pro02', 290000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (2, 1, N'pro01', 300000, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (3, 1, N'pro03', 350000, 10)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (4, 2, N'pro02', 290000, 10)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (5, 2, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (6, 2, N'pro04', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (7, 2, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (8, 3, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (9, 3, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (10, 4, N'pro01', 300000, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (11, 5, N'pro01', 300000, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (12, 6, N'pro02', 290000, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (13, 6, N'pro01', 300000, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (14, 7, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (15, 7, N'pro03', 350000, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (16, 8, N'pro02', 290000, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (17, 9, N'pro02', 290000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (18, 9, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (19, 9, N'pro04', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (20, 9, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (21, 10, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (22, 11, N'pro02', 290000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (23, 11, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (24, 12, N'pro02', 290000, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (25, 12, N'pro04', 499000, 5)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (26, 13, N'pro02', 290000, 2)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (27, 13, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (28, 14, N'pro02', 290000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (29, 14, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1002, 1002, N'pro02', 290000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1003, 1002, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1004, 1002, N'pro04', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1005, 1002, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1006, 1003, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1007, 1004, N'pro02', 290000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1008, 1004, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1009, 1004, N'pro04', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1010, 1004, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1011, 1005, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1012, 1006, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1013, 1007, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1014, 1008, N'pro02', 290000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1015, 1009, N'pro03', 350000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1016, 1010, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1017, 1011, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1018, 1012, N'pro01', 300000, 3)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1019, 1013, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1020, 1014, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1021, 1015, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1022, 1015, N'pro04', 499000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1023, 1016, N'pro02', 390000, 19)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1024, 1016, N'pro01', 300000, 1)
INSERT [dbo].[tblOrderDetails] ([orderDetailID], [orderID], [productID], [price], [quantity]) VALUES (1025, 1017, N'pro01', 300000, 19)
SET IDENTITY_INSERT [dbo].[tblOrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[tblOrders] ON 

INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1, N'825429', N'Hoadnt', NULL, 4980000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (2, N'792821', N'giaduc0123', NULL, 4049000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (3, N'865279', N'Hoadnt', NULL, 650000, 1, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (4, N'361109', N'giaduc0123', NULL, 1500000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (5, N'991271', N'giaduc0123', NULL, 1500000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (6, N'812074', N'Hoadnt', NULL, 2370000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (7, N'979159', N'giaduc0123', NULL, 1350000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (8, N'299112', N'Hoadnt', NULL, 1450000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (9, N'069901', N'Hoadnt', NULL, 1439000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (10, N'410871', N'Hoadnt', NULL, 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (11, N'071494', N'Hoadnt', NULL, 590000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (12, N'661343', N'Hoadnt', NULL, 3945000, 1, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (13, N'315995', N'giaduc0123', NULL, 930000, 1, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (14, N'271986', N'giaduc0123', NULL, 590000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1002, N'010150', N'giaduc0123', NULL, 1439000, 1, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1003, N'663774', N'Hoadnt', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1004, N'550328', N'Hoadnt', CAST(N'2023-06-28' AS Date), 1439000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1005, N'050171', N'Hoadnt', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1006, N'214536', N'giaduc0123', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1007, N'744182', N'Hoadnt', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1008, N'573198', N'giaduc0123', CAST(N'2023-06-28' AS Date), 290000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1009, N'876435', N'Hoadnt', CAST(N'2023-06-28' AS Date), 350000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1010, N'824301', N'Hoadnt', CAST(N'2023-06-28' AS Date), 300000, 1, N'VNPAY', CAST(N'2023-06-28T20:14:06.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1011, N'417274', N'ducdang', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1012, N'930291', N'ducdang', CAST(N'2023-06-28' AS Date), 900000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1013, N'490613', N'ducdang', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1014, N'413438', N'giaduc0123', CAST(N'2023-06-28' AS Date), 300000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1015, N'057368', N'Hoadnt', CAST(N'2023-06-28' AS Date), 799000, 1, N'VNPAY', CAST(N'2023-06-28T22:42:35.000' AS DateTime))
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1016, N'529227', N'Hoadnt', CAST(N'2023-07-01' AS Date), 7710000, 0, N'VNPAY', NULL)
INSERT [dbo].[tblOrders] ([orderID], [orderCode], [userID], [order_date], [total], [status], [payment_method], [payment_date]) VALUES (1017, N'021562', N'Hoadnt', CAST(N'2023-07-01' AS Date), 5700000, 0, N'VNPAY', NULL)
SET IDENTITY_INSERT [dbo].[tblOrders] OFF
GO
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro01', N'Mixed Basket Pink and Lilac', 300000, 20, N'Mixed-Basket-Pink-and-Lilac.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro02', N'Heavenly Red Rose Hand Tied', 390000, 20, N'Heavenly-Red-Rose-Hand-Tied.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro03', N'Autumn Basket', 499000, 28, N'Autumn-basket.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro04', N'Vera Wang Purest Grace', 520000, 18, N'Vera-Wang-Purest-Grace.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro05', N'Luxury Red Wine Gift Basket', 790000, 10, N'Luxury-Red-Wine-Gift-Basket.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro06', N'Pink Perfect Gift', 299000, 40, N'Pink-Perfect-Gift.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro07', N'Watering Can with Bailey Bear', 590000, 60, N'Watering-Can-with-Bailey-Bear.webp')
INSERT [dbo].[tblProducts] ([productID], [name], [price], [quantity], [img]) VALUES (N'pro08', N'White Radiance Hand Tied', 900000, 25, N'White-Radiance-Hand-tied.webp')
GO
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'baoduong', N'Duong Ton Bao', N'1', N'AD', N'Vung Tau', NULL, N'duongbao2k3@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'ducdang', N'Dang Gia Duc', N'1', N'US', N'Long An', NULL, N'chienthangnguyen@gmail.com', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'giaduc0123', N'Gia Đức Đặng Phan', N'123uir3yw947748fesnjksldv', N'US', N'Long An', N'115495047193819919329', N'giaduc0123@gmail.com', NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', N'HCM', NULL, N'chienthangnguyen@gmail.com', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', NULL, NULL, NULL, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblOrder__23699D68CD6D6C67]    Script Date: 02/07/2023 3:08:25 CH ******/
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [UQ__tblOrder__23699D68CD6D6C67] UNIQUE NONCLUSTERED 
(
	[orderCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblOrders] ADD  CONSTRAINT [DF__tblOrders__payme__6477ECF3]  DEFAULT ('VNPAY') FOR [payment_method]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__order__6754599E] FOREIGN KEY([orderID])
REFERENCES [dbo].[tblOrders] ([orderID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK__tblOrderD__order__6754599E]
GO
ALTER TABLE [dbo].[tblOrderDetails]  WITH CHECK ADD  CONSTRAINT [FK__tblOrderD__produ__68487DD7] FOREIGN KEY([productID])
REFERENCES [dbo].[tblProducts] ([productID])
GO
ALTER TABLE [dbo].[tblOrderDetails] CHECK CONSTRAINT [FK__tblOrderD__produ__68487DD7]
GO
ALTER TABLE [dbo].[tblOrders]  WITH CHECK ADD  CONSTRAINT [FK__tblOrders__userI__6383C8BA] FOREIGN KEY([userID])
REFERENCES [dbo].[tblUsers] ([userID])
GO
ALTER TABLE [dbo].[tblOrders] CHECK CONSTRAINT [FK__tblOrders__userI__6383C8BA]
GO
USE [master]
GO
ALTER DATABASE [Assignment_PRJ301] SET  READ_WRITE 
GO
