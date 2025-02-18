USE [master]
GO
/****** Object:  Database [diskusiPr]    Script Date: 03/11/2024 19:58:10 ******/
CREATE DATABASE [diskusiPr]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'diskusiPr', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\diskusiPr.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'diskusiPr_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\diskusiPr_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [diskusiPr] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [diskusiPr].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [diskusiPr] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [diskusiPr] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [diskusiPr] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [diskusiPr] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [diskusiPr] SET ARITHABORT OFF 
GO
ALTER DATABASE [diskusiPr] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [diskusiPr] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [diskusiPr] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [diskusiPr] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [diskusiPr] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [diskusiPr] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [diskusiPr] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [diskusiPr] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [diskusiPr] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [diskusiPr] SET  DISABLE_BROKER 
GO
ALTER DATABASE [diskusiPr] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [diskusiPr] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [diskusiPr] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [diskusiPr] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [diskusiPr] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [diskusiPr] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [diskusiPr] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [diskusiPr] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [diskusiPr] SET  MULTI_USER 
GO
ALTER DATABASE [diskusiPr] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [diskusiPr] SET DB_CHAINING OFF 
GO
ALTER DATABASE [diskusiPr] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [diskusiPr] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [diskusiPr] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [diskusiPr] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [diskusiPr] SET QUERY_STORE = ON
GO
ALTER DATABASE [diskusiPr] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [diskusiPr]
GO
/****** Object:  Table [dbo].[jawaban]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jawaban](
	[id_jawaban] [int] IDENTITY(1,1) NOT NULL,
	[author] [int] NOT NULL,
	[jawaban] [varchar](50) NOT NULL,
 CONSTRAINT [PK_jawaban] PRIMARY KEY CLUSTERED 
(
	[id_jawaban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jenjang_pendidikan]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jenjang_pendidikan](
	[id_jenjang_pendidikan] [int] IDENTITY(1,1) NOT NULL,
	[nama_jenjang] [varchar](50) NOT NULL,
 CONSTRAINT [PK_jenjang_pendidikan] PRIMARY KEY CLUSTERED 
(
	[id_jenjang_pendidikan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mata_pelajaran]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mata_pelajaran](
	[id_mata_pelajaran] [int] IDENTITY(1,1) NOT NULL,
	[nama_mapel] [varchar](50) NOT NULL,
	[id_sub_mapel] [int] NULL,
 CONSTRAINT [PK_mata_pelajaran] PRIMARY KEY CLUSTERED 
(
	[id_mata_pelajaran] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[soal]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[soal](
	[id_soal] [int] IDENTITY(1,1) NOT NULL,
	[foto] [text] NULL,
	[soal] [varchar](255) NOT NULL,
	[author] [int] NOT NULL,
	[id_mata_pelajaran] [int] NOT NULL,
	[id_jenjang_pendidikan] [int] NOT NULL,
 CONSTRAINT [PK_soal] PRIMARY KEY CLUSTERED 
(
	[id_soal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[soal_jawaban]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[soal_jawaban](
	[id_soal_jawaban] [int] IDENTITY(1,1) NOT NULL,
	[id_soal] [int] NOT NULL,
	[id_jawaban] [int] NOT NULL,
 CONSTRAINT [PK_soal_jawaban] PRIMARY KEY CLUSTERED 
(
	[id_soal_jawaban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_mata_pelajaran]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_mata_pelajaran](
	[id_sub_mapel] [int] IDENTITY(1,1) NOT NULL,
	[nama_sub_mapel] [varchar](50) NOT NULL,
 CONSTRAINT [PK_sub_mata_pelajaran] PRIMARY KEY CLUSTERED 
(
	[id_sub_mapel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 03/11/2024 19:58:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nama] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[jawaban]  WITH CHECK ADD  CONSTRAINT [FK_jawaban_user] FOREIGN KEY([author])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[jawaban] CHECK CONSTRAINT [FK_jawaban_user]
GO
ALTER TABLE [dbo].[mata_pelajaran]  WITH CHECK ADD  CONSTRAINT [FK_mata_pelajaran_sub_mata_pelajaran] FOREIGN KEY([id_sub_mapel])
REFERENCES [dbo].[sub_mata_pelajaran] ([id_sub_mapel])
GO
ALTER TABLE [dbo].[mata_pelajaran] CHECK CONSTRAINT [FK_mata_pelajaran_sub_mata_pelajaran]
GO
ALTER TABLE [dbo].[soal]  WITH CHECK ADD  CONSTRAINT [FK_soal_jenjang_pendidikan] FOREIGN KEY([id_jenjang_pendidikan])
REFERENCES [dbo].[jenjang_pendidikan] ([id_jenjang_pendidikan])
GO
ALTER TABLE [dbo].[soal] CHECK CONSTRAINT [FK_soal_jenjang_pendidikan]
GO
ALTER TABLE [dbo].[soal]  WITH CHECK ADD  CONSTRAINT [FK_soal_mata_pelajaran] FOREIGN KEY([id_mata_pelajaran])
REFERENCES [dbo].[mata_pelajaran] ([id_mata_pelajaran])
GO
ALTER TABLE [dbo].[soal] CHECK CONSTRAINT [FK_soal_mata_pelajaran]
GO
ALTER TABLE [dbo].[soal]  WITH CHECK ADD  CONSTRAINT [FK_soal_user] FOREIGN KEY([author])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[soal] CHECK CONSTRAINT [FK_soal_user]
GO
ALTER TABLE [dbo].[soal_jawaban]  WITH CHECK ADD  CONSTRAINT [FK_soal_jawaban_jawaban] FOREIGN KEY([id_jawaban])
REFERENCES [dbo].[jawaban] ([id_jawaban])
GO
ALTER TABLE [dbo].[soal_jawaban] CHECK CONSTRAINT [FK_soal_jawaban_jawaban]
GO
ALTER TABLE [dbo].[soal_jawaban]  WITH CHECK ADD  CONSTRAINT [FK_soal_jawaban_soal] FOREIGN KEY([id_soal])
REFERENCES [dbo].[soal] ([id_soal])
GO
ALTER TABLE [dbo].[soal_jawaban] CHECK CONSTRAINT [FK_soal_jawaban_soal]
GO
USE [master]
GO
ALTER DATABASE [diskusiPr] SET  READ_WRITE 
GO
