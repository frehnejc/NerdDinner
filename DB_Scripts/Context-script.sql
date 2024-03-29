USE [master]
GO
/****** Object:  Database [NerdDinnerContext]    Script Date: 06/28/2019 15:20:54 ******/
CREATE DATABASE [NerdDinnerContext] ON  PRIMARY 
( NAME = N'NerdDinnerContext.mdf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NerdDinnerContext.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'NerdDinnerContext_log.ldf', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\NerdDinnerContext_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [NerdDinnerContext] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NerdDinnerContext].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NerdDinnerContext] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [NerdDinnerContext] SET ANSI_NULLS OFF
GO
ALTER DATABASE [NerdDinnerContext] SET ANSI_PADDING OFF
GO
ALTER DATABASE [NerdDinnerContext] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [NerdDinnerContext] SET ARITHABORT OFF
GO
ALTER DATABASE [NerdDinnerContext] SET AUTO_CLOSE ON
GO
ALTER DATABASE [NerdDinnerContext] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [NerdDinnerContext] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [NerdDinnerContext] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [NerdDinnerContext] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [NerdDinnerContext] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [NerdDinnerContext] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [NerdDinnerContext] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [NerdDinnerContext] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [NerdDinnerContext] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [NerdDinnerContext] SET  ENABLE_BROKER
GO
ALTER DATABASE [NerdDinnerContext] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [NerdDinnerContext] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [NerdDinnerContext] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [NerdDinnerContext] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [NerdDinnerContext] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [NerdDinnerContext] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [NerdDinnerContext] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [NerdDinnerContext] SET  READ_WRITE
GO
ALTER DATABASE [NerdDinnerContext] SET RECOVERY SIMPLE
GO
ALTER DATABASE [NerdDinnerContext] SET  MULTI_USER
GO
ALTER DATABASE [NerdDinnerContext] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [NerdDinnerContext] SET DB_CHAINING OFF
GO
USE [NerdDinnerContext]
GO
/****** Object:  Table [dbo].[Dinners]    Script Date: 06/28/2019 15:20:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dinners](
	[DinnerID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Description] [nvarchar](256) NOT NULL,
	[HostedBy] [nvarchar](20) NULL,
	[ContactPhone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](max) NULL,
	[Location] [geography] NULL,
 CONSTRAINT [PK_dbo.Dinners] PRIMARY KEY CLUSTERED 
(
	[DinnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Dinners] ON
INSERT [dbo].[Dinners] ([DinnerID], [Title], [EventDate], [Description], [HostedBy], [ContactPhone], [Address], [Country], [Location]) VALUES (1, N'test', CAST(0x0000A12C008C2E54 AS DateTime), N'test', N'pete@mourfield.com', N'test', N'753 Broad Street Augusta, GA 30901', N'USA', 0xE6100000010C00006029E5BC404000002046DA7D54C0)
INSERT [dbo].[Dinners] ([DinnerID], [Title], [EventDate], [Description], [HostedBy], [ContactPhone], [Address], [Country], [Location]) VALUES (2, N'Azure features', CAST(0x0000AB8900E1A9EC AS DateTime), N'Meetup on Azure', N'jcitizen', N'0400000000', N'191 St Georges Terrace, Perth, WA', N'Australia', 0xE6100000010C87E123624AF43FC09817601F9DF65C40)
INSERT [dbo].[Dinners] ([DinnerID], [Title], [EventDate], [Description], [HostedBy], [ContactPhone], [Address], [Country], [Location]) VALUES (3, N'AWS Features', CAST(0x0000AB8900E52A68 AS DateTime), N'new features with AWS', N'jcitizen', N'0400000000', N'191 St Georges Terrace, Perth, WA', N'Australia', 0xE6100000010C87E123624AF43FC09817601F9DF65C40)
INSERT [dbo].[Dinners] ([DinnerID], [Title], [EventDate], [Description], [HostedBy], [ContactPhone], [Address], [Country], [Location]) VALUES (4, N'GCP Features', CAST(0x0000AB8900F02F1C AS DateTime), N'New Google Cloud features', N'jcitizen', N'0400000000', N'191 St Georges Terrace, Perth, WA', N'Australia', 0xE6100000010C87E123624AF43FC09817601F9DF65C40)
SET IDENTITY_INSERT [dbo].[Dinners] OFF
/****** Object:  Table [dbo].[RSVPs]    Script Date: 06/28/2019 15:20:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RSVPs](
	[RsvpID] [int] IDENTITY(1,1) NOT NULL,
	[DinnerID] [int] NOT NULL,
	[AttendeeName] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.RSVPs] PRIMARY KEY CLUSTERED 
(
	[RsvpID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_DinnerID] ON [dbo].[RSVPs] 
(
	[DinnerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RSVPs] ON
INSERT [dbo].[RSVPs] ([RsvpID], [DinnerID], [AttendeeName]) VALUES (1, 1, N'pete@mourfield.com')
INSERT [dbo].[RSVPs] ([RsvpID], [DinnerID], [AttendeeName]) VALUES (2, 2, N'jcitizen')
INSERT [dbo].[RSVPs] ([RsvpID], [DinnerID], [AttendeeName]) VALUES (3, 3, N'jcitizen')
INSERT [dbo].[RSVPs] ([RsvpID], [DinnerID], [AttendeeName]) VALUES (4, 4, N'jcitizen')
SET IDENTITY_INSERT [dbo].[RSVPs] OFF
/****** Object:  ForeignKey [FK_dbo.RSVPs_dbo.Dinners_DinnerID]    Script Date: 06/28/2019 15:20:54 ******/
ALTER TABLE [dbo].[RSVPs]  WITH CHECK ADD  CONSTRAINT [FK_dbo.RSVPs_dbo.Dinners_DinnerID] FOREIGN KEY([DinnerID])
REFERENCES [dbo].[Dinners] ([DinnerID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RSVPs] CHECK CONSTRAINT [FK_dbo.RSVPs_dbo.Dinners_DinnerID]
GO
