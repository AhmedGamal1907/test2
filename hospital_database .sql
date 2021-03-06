USE [master]
GO
/****** Object:  Database [Hospital_database]    Script Date: 6/16/2020 7:49:11 PM ******/
CREATE DATABASE [Hospital_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hospital_database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hospital_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hospital_database] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital_database] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Hospital_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital_database] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital_database] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital_database] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital_database', N'ON'
GO
ALTER DATABASE [Hospital_database] SET QUERY_STORE = OFF
GO
USE [Hospital_database]
GO
/****** Object:  Table [dbo].[doctors]    Script Date: 6/16/2020 7:49:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctors](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_firse_name] [varchar](100) NULL,
	[doctor_last_name] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicines]    Script Date: 6/16/2020 7:49:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicines](
	[Medicine_id] [int] IDENTITY(1,1) NOT NULL,
	[Sicker_id] [int] NULL,
	[Medicine_nmae] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Medicine_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rooms]    Script Date: 6/16/2020 7:49:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rooms](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[Sicker_id] [int] NULL,
	[room_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[salary]    Script Date: 6/16/2020 7:49:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salary](
	[salary_id] [int] IDENTITY(1,1) NOT NULL,
	[salary_value] [int] NOT NULL,
	[doctor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[salary_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sickers]    Script Date: 6/16/2020 7:49:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sickers](
	[Sicker_id] [int] IDENTITY(1,1) NOT NULL,
	[Sicker_first_name] [varchar](100) NULL,
	[Sicker_last_name] [varchar](100) NOT NULL,
	[Sicker_age] [int] NULL,
	[room_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Sicker_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Medicines]  WITH CHECK ADD  CONSTRAINT [FK_Medicines_Sickers] FOREIGN KEY([Sicker_id])
REFERENCES [dbo].[Sickers] ([Sicker_id])
GO
ALTER TABLE [dbo].[Medicines] CHECK CONSTRAINT [FK_Medicines_Sickers]
GO
ALTER TABLE [dbo].[salary]  WITH CHECK ADD  CONSTRAINT [FK_salary_doctors] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[doctors] ([doctor_id])
GO
ALTER TABLE [dbo].[salary] CHECK CONSTRAINT [FK_salary_doctors]
GO
ALTER TABLE [dbo].[Sickers]  WITH CHECK ADD  CONSTRAINT [FK_Sickers_rooms] FOREIGN KEY([room_id])
REFERENCES [dbo].[rooms] ([room_id])
GO
ALTER TABLE [dbo].[Sickers] CHECK CONSTRAINT [FK_Sickers_rooms]
GO
USE [master]
GO
ALTER DATABASE [Hospital_database] SET  READ_WRITE 
GO
