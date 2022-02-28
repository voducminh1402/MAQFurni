USE [master]
GO
/****** Object:  Database [FurnitureShop]    Script Date: 2/28/2022 7:35:33 PM ******/
CREATE DATABASE [FurnitureShop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VegetableShop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019EXP\MSSQL\DATA\FurnitureShop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'VegetableShop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL2019EXP\MSSQL\DATA\FurnitureShop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FurnitureShop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FurnitureShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FurnitureShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FurnitureShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FurnitureShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FurnitureShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FurnitureShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [FurnitureShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [FurnitureShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FurnitureShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FurnitureShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FurnitureShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FurnitureShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FurnitureShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FurnitureShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FurnitureShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FurnitureShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [FurnitureShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FurnitureShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FurnitureShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FurnitureShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FurnitureShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FurnitureShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FurnitureShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FurnitureShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FurnitureShop] SET  MULTI_USER 
GO
ALTER DATABASE [FurnitureShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FurnitureShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FurnitureShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FurnitureShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FurnitureShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FurnitureShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FurnitureShop] SET QUERY_STORE = OFF
GO
USE [FurnitureShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](100) NOT NULL,
	[CategoryImage] [ntext] NULL,
 CONSTRAINT [PK_tblCategories] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [varchar](50) NOT NULL,
	[UserID] [varchar](50) NOT NULL,
	[TotalPrice] [decimal](16, 2) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblOrders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[DetailID] [varchar](50) NOT NULL,
	[OrderID] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[DetailPrice] [decimal](16, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_tblOrderDetails] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [varchar](50) NOT NULL,
	[ProductName] [nvarchar](120) NOT NULL,
	[ProductImage] [ntext] NOT NULL,
	[ProductPrice] [decimal](16, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Description] [ntext] NOT NULL,
	[AvailableID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_tblProducts] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductAvailable]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductAvailable](
	[AvailableID] [int] IDENTITY(1,1) NOT NULL,
	[AvailableName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblProductAvailable] PRIMARY KEY CLUSTERED 
(
	[AvailableID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblRoles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingInfo]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingInfo](
	[FullName] [nvarchar](120) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[State] [nvarchar](100) NOT NULL,
	[Phone] [varchar](22) NOT NULL,
	[Note] [ntext] NULL,
	[OrderID] [varchar](50) NOT NULL,
	[StatusID] [int] NOT NULL,
 CONSTRAINT [PK_tblShippingInfo_1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingStatus]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_tblShippingStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [varchar](50) NOT NULL,
	[UserName] [nvarchar](120) NOT NULL,
	[UserAddress] [nvarchar](200) NOT NULL,
	[UserPhone] [varchar](22) NOT NULL,
	[Password] [varchar](22) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Email] [varchar](50) NULL,
	[UserStatusID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_tblUsers] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserStatus]    Script Date: 2/28/2022 7:35:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblUserStatuses] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Category] ([CategoryID], [CategoryName], [CategoryImage]) VALUES (1, N'Bàn Gỗ', N'1')
GO
INSERT [dbo].[Product] ([ProductID], [ProductName], [ProductImage], [ProductPrice], [Quantity], [Description], [AvailableID], [CategoryID], [CreateDate]) VALUES (N'1', N'Bàn Gỗ Đẹp', N'1', CAST(15000.00 AS Decimal(16, 2)), 14, N'ok', 1, 1, CAST(N'2022-02-27T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductAvailable] ON 

INSERT [dbo].[ProductAvailable] ([AvailableID], [AvailableName]) VALUES (1, N'Còn hàng')
SET IDENTITY_INSERT [dbo].[ProductAvailable] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_tblOrders_tblUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_tblOrders_tblUsers]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblOrders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_tblOrderDetails_tblOrders]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblOrderDetails_tblProducts] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_tblOrderDetails_tblProducts]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblCategories] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Category] ([CategoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_tblProducts_tblCategories]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_tblProducts_tblProductAvailable] FOREIGN KEY([AvailableID])
REFERENCES [dbo].[ProductAvailable] ([AvailableID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_tblProducts_tblProductAvailable]
GO
ALTER TABLE [dbo].[ShippingInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblShippingInfo_tblOrders1] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[ShippingInfo] CHECK CONSTRAINT [FK_tblShippingInfo_tblOrders1]
GO
ALTER TABLE [dbo].[ShippingInfo]  WITH CHECK ADD  CONSTRAINT [FK_tblShippingInfo_tblShippingStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[ShippingStatus] ([StatusID])
GO
ALTER TABLE [dbo].[ShippingInfo] CHECK CONSTRAINT [FK_tblShippingInfo_tblShippingStatus]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblRoles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_tblUsers_tblRoles]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_tblUsers_tblUserStatuses] FOREIGN KEY([UserStatusID])
REFERENCES [dbo].[UserStatus] ([StatusID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_tblUsers_tblUserStatuses]
GO
USE [master]
GO
ALTER DATABASE [FurnitureShop] SET  READ_WRITE 
GO
