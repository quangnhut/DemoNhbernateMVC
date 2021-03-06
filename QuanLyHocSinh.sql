USE [master]
GO
/****** Object:  Database [QuanLyHocSinh]    Script Date: 2/3/2020 10:12:53 PM ******/
CREATE DATABASE [QuanLyHocSinh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLyHocSinh', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyHocSinh.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuanLyHocSinh_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\QuanLyHocSinh_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuanLyHocSinh] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLyHocSinh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLyHocSinh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLyHocSinh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLyHocSinh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuanLyHocSinh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLyHocSinh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuanLyHocSinh] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLyHocSinh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLyHocSinh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLyHocSinh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLyHocSinh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QuanLyHocSinh]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 2/3/2020 10:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/3/2020 10:12:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ID], [Name]) VALUES (4, N'LOP12')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (5, N'LOP10')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (7, N'LOP9')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (10, N'LOP07')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (11, N'LOP2')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (15, N'LOP5')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (17, N'LOP6')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (18, N'LOP8')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (19, N'LOP4')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (20, N'LOP11')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (21, N'LOP3')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (22, N'LOP30')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (23, N'Ngoai ngu')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (24, N'Tin hoc')
INSERT [dbo].[Class] ([ID], [Name]) VALUES (25, N'LOP0')
SET IDENTITY_INSERT [dbo].[Class] OFF
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (9, N'dao tun', N'lam', N'ab', 7)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (86, N'vo van', N'ben', N'abc', 4)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (88, N'le tan', N'loi', N'sv9', 11)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (90, N'Le ', N'Loi', N'sv13', 5)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (91, N'Quang', N'Trung', N'sv30', 10)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (92, N'do', N'phu', N'sv98', 6)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (93, N'Ly', N'Kiet', N'sv43', 6)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (94, N'Tran Dang', N'Khoa', N'sv21', 6)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (95, N'Ly', N'Trong', N'sv21', 17)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (96, N'Dinh', N'Linh', N'svs', 18)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (97, N'Tan Thuy', N'Hoang', N'svh', 22)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (98, N'Thanh', N'Giong', N'svtg', 21)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (99, N'Chu', N'Cuoi', N'svcc', 20)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (100, N'Nguyen', N'Khuyen', N'svnk', 19)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (101, N'Ho Xuan', N'Huong', N'svhxh', 24)
INSERT [dbo].[Student] ([ID], [FirstName], [LastName], [Code], [ClassID]) VALUES (102, N'Ly', N'Bach', N'ab', 25)
SET IDENTITY_INSERT [dbo].[Student] OFF
USE [master]
GO
ALTER DATABASE [QuanLyHocSinh] SET  READ_WRITE 
GO
