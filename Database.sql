USE [master]
GO
/****** Object:  Database [E_Commerce]    Script Date: 30-04-2023 17:23:11 ******/
CREATE DATABASE [E_Commerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E_Commerce', FILENAME = N'D:\Softwares\SQL server\MSSQL16.MSSQLSERVER\MSSQL\DATA\E_Commerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E_Commerce_log', FILENAME = N'D:\Softwares\SQL server\MSSQL16.MSSQLSERVER\MSSQL\DATA\E_Commerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E_Commerce] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E_Commerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E_Commerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E_Commerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [E_Commerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E_Commerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E_Commerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [E_Commerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E_Commerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E_Commerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E_Commerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E_Commerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E_Commerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E_Commerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E_Commerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E_Commerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E_Commerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E_Commerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E_Commerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E_Commerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E_Commerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E_Commerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E_Commerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E_Commerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E_Commerce] SET RECOVERY FULL 
GO
ALTER DATABASE [E_Commerce] SET  MULTI_USER 
GO
ALTER DATABASE [E_Commerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E_Commerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E_Commerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E_Commerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E_Commerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E_Commerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'E_Commerce', N'ON'
GO
ALTER DATABASE [E_Commerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [E_Commerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E_Commerce]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 30-04-2023 17:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Order_ID] [nvarchar](50) NOT NULL,
	[Amount] [smallint] NOT NULL,
	[Profit] [smallint] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Sub_Category] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderList]    Script Date: 30-04-2023 17:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderList](
	[Order_ID] [nvarchar](50) NOT NULL,
	[Order_Date] [date] NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_List of Orders] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesTarget]    Script Date: 30-04-2023 17:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTarget](
	[Month_of_Order_Date] [nvarchar](50) NOT NULL,
	[Category] [nvarchar](50) NOT NULL,
	[Target] [smallint] NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [E_Commerce] SET  READ_WRITE 
GO
