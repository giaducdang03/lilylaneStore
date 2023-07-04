USE [master]
GO
/****** Object:  Database [Assignment_PRJ301]    Script Date: 04/07/2023 10:11:08 CH ******/
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
ALTER DATABASE [Assignment_PRJ301] SET QUERY_STORE = ON
GO
ALTER DATABASE [Assignment_PRJ301] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Assignment_PRJ301]
GO
/****** Object:  Table [dbo].[tblOrderDetails]    Script Date: 04/07/2023 10:11:08 CH ******/
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
/****** Object:  Table [dbo].[tblOrders]    Script Date: 04/07/2023 10:11:08 CH ******/
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
/****** Object:  Table [dbo].[tblProducts]    Script Date: 04/07/2023 10:11:08 CH ******/
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
/****** Object:  Table [dbo].[tblUsers]    Script Date: 04/07/2023 10:11:08 CH ******/
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
	[avatar] [nvarchar](255) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'admin', N'Toi la admin', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'admin2', N'Duong Bao', N'1234', N'US', NULL, NULL, N'giaduc0123@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'baoduong', N'Duong Ton Bao', N'1', N'AD', N'Vung Tau', NULL, N'duongbao2k3@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'ducdang', N'Dang Gia Duc', N'1', N'US', N'Long An', NULL, N'chienthangnguyen@gmail.com', NULL, NULL)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'giaduc0123', N'Gia Đức Đặng Phan', N'778219', N'US', NULL, N'115495047193819919329', N'giaduc0123@gmail.com', N'https://lh3.googleusercontent.com/a/AAcHTtcMumBcs879wZT8VT7YH4aY8na_xvWMLymAEb5tk9qHph-T=s96-c', 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'Hoadnt', N'Hoa Doan', N'1', N'US', N'HCM', NULL, N'chienthangnguyen@gmail.com', NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE130363', N'Ngo Ha Tri Bao', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140103', N'Phuoc Ha', N'1', N'US', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140119', N'Trai Nguyen', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140130', N'Tam Tran', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140201', N'PHAM HOANG TU', N'1', N'AD', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[tblUsers] ([userID], [fullName], [password], [roleID], [address], [googleID], [email], [avatar], [status]) VALUES (N'SE140969', N'Nguyen Gia Tin', N'123', N'US', NULL, NULL, NULL, NULL, 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tblOrder__23699D68CD6D6C67]    Script Date: 04/07/2023 10:11:08 CH ******/
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
