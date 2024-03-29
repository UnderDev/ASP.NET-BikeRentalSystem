/****** Object:  StoredProcedure [dbo].[spGetBikeRental]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetBikeRental]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetBikeRental]
GO
/****** Object:  StoredProcedure [dbo].[spGetCurrAvail]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetCurrAvail]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetCurrAvail]
GO
/****** Object:  StoredProcedure [dbo].[spGetCurrRented]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetCurrRented]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetCurrRented]
GO
/****** Object:  StoredProcedure [dbo].[spGetIncome]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetIncome]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetIncome]
GO
/****** Object:  StoredProcedure [dbo].[spGetMostPopular]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetMostPopular]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[spGetMostPopular]
GO
/****** Object:  Table [dbo].[BikeCostTbl]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BikeCostTbl]') AND type in (N'U'))
DROP TABLE [dbo].[BikeCostTbl]
GO
/****** Object:  Table [dbo].[BikeRentalTbl]    Script Date: 03/10/2016 00:11:36 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BikeRentalTbl]') AND type in (N'U'))
DROP TABLE [dbo].[BikeRentalTbl]
GO
/****** Object:  Table [dbo].[BikeRentalTbl]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BikeRentalTbl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BikeRentalTbl](
	[BarCode] [varchar](25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[TimesRented] [smallint] NOT NULL,
	[TimeInOut] [datetime] NULL,
	[Total] [smallmoney] NOT NULL,
	[Date] [date] NULL,
	[BcInUse] [char](1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_BikeRentalTbl] PRIMARY KEY CLUSTERED 
(
	[BarCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9011403010108', 6, NULL, 210.0000, CAST(0x183B0B00 AS Date), N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9021403010107', 6, NULL, 260.0000, CAST(0x173B0B00 AS Date), N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9031403010106', 4, NULL, 620.0000, CAST(0x173B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9041403010105', 1, CAST(0x0000A5BE015CC2D0 AS DateTime), 35.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9051403010104', 1, NULL, 35.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9061403010103', 2, CAST(0x0000A5BE015CB844 AS DateTime), 70.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9071403020101', 1, NULL, 35.0000, CAST(0x0A3B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9081403020100', 2, CAST(0x0000A5BE015CC1A4 AS DateTime), 70.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9091403020109', 1, NULL, 35.0000, CAST(0x173B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9101403020105', 1, CAST(0x0000A5BE015CBF4C AS DateTime), 35.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9111403020104', 2, NULL, 70.0000, CAST(0x0A3B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9121403020103', 1, NULL, 35.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9141403020101', 2, NULL, 70.0000, CAST(0x103B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9151403020100', 1, NULL, 35.0000, CAST(0x0A3B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9161403020109', 2, NULL, 70.0000, CAST(0x193B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9172403020105', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9182403020104', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9192403020103', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9202403020109', 1, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9212403020108', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9222403020107', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9232403020106', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9242403020106', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9252403020104', 2, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9262403020103', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9272403020102', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9282403020101', 6, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9292403020100', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9302403020106', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9312403020105', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9323403020101', 5, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9333403020100', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9343403020109', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9353403020108', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9363403020107', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9373403020106', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9383403020105', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9393403020104', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9403403020100', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9413403020109', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9424403020105', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9434403020104', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9444403020103', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9454403020102', 5, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9465403020108', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9475403020107', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9485403020106', 8, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9495403020105', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9506403020108', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9516403020107', 6, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9526403020106', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9536403020105', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9547403020101', 0, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9557403020100', 1, NULL, 0.0000, NULL, N'N')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9567403020109', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9577403020108', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9587403020107', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9597403020106', 10, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9607403020102', 0, NULL, 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9617403020101', 5, CAST(0x0000A5BE015CD590 AS DateTime), 0.0000, NULL, N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9627403020100', 1, NULL, 45.0000, CAST(0x193B0B00 AS Date), N'Y')
INSERT [dbo].[BikeRentalTbl] ([BarCode], [TimesRented], [TimeInOut], [Total], [Date], [BcInUse]) VALUES (N'9637403020109', 0, NULL, 0.0000, NULL, N'Y')
/****** Object:  Table [dbo].[BikeCostTbl]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BikeCostTbl]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BikeCostTbl](
	[Id] [tinyint] NOT NULL,
	[Model] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[HalfDay] [smallmoney] NOT NULL,
	[FullDay] [smallmoney] NOT NULL,
 CONSTRAINT [PK_BikeCostTbl] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (1, N'Satori    ', 35.0000, 50.0000)
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (2, N'Satori    ', 35.0000, 50.0000)
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (3, N'Satori    ', 35.0000, 50.0000)
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (4, N'Precept200', 45.0000, 65.0000)
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (5, N'Precept200', 45.0000, 65.0000)
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (6, N'Precept200', 45.0000, 65.0000)
INSERT [dbo].[BikeCostTbl] ([Id], [Model], [HalfDay], [FullDay]) VALUES (7, N'Kids      ', 20.0000, 30.0000)
/****** Object:  StoredProcedure [dbo].[spGetMostPopular]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetMostPopular]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetMostPopular]
AS
BEGIN

		SELECT (SELECT SUM(TimesRented) AS Satori
		                  FROM      BikeRentalTbl
		                  WHERE   (TimesRented > 0) AND (SUBSTRING(BarCode, 4, 1) = 1) OR
		                                    (SUBSTRING(BarCode, 4, 1) = 2) OR
		                                    (SUBSTRING(BarCode, 4, 1) = 3)) AS Satori,
		                      (SELECT SUM(TimesRented) AS DH
		                       FROM      BikeRentalTbl AS BRT
		                       WHERE   (TimesRented > 0) AND (SUBSTRING(BarCode, 4, 1) = 4) OR
		                                         (SUBSTRING(BarCode, 4, 1) = 5) OR
		                                         (SUBSTRING(BarCode, 4, 1) = 6)) AS [Precept 200],
		                      (SELECT SUM(TimesRented) AS DH
		                       FROM      BikeRentalTbl AS BRT
		                       WHERE   (TimesRented > 0) AND (SUBSTRING(BarCode, 4, 1) = 7)) AS Kids
				
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetIncome]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetIncome]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetIncome]
as
begin

SELECT (SELECT ''€'' + CONVERT(varchar(12), SUM(Total), 1) AS Total
                  FROM      BikeRentalTbl
                  WHERE   (SUBSTRING(BarCode, 4, 1) = 3 OR
                                    SUBSTRING(BarCode, 4, 1) = 6) AND (BcInUse = ''Y'')) AS Small,
                      (SELECT ''€'' + CONVERT(varchar(12), SUM(Total), 1) AS Total
                       FROM      BikeRentalTbl AS BRT
                       WHERE   (SUBSTRING(BarCode, 4, 1) = 1 OR
                                         SUBSTRING(BarCode, 4, 1) = 4) AND (BcInUse = ''Y'')) AS Medium,
                      (SELECT ''€'' + CONVERT(varchar(12), SUM(Total), 1) AS Total
                       FROM      BikeRentalTbl AS BRT
                       WHERE   (SUBSTRING(BarCode, 4, 1) = 2 OR
                                         SUBSTRING(BarCode, 4, 1) = 5) AND (BcInUse = ''Y'')) AS Large,
                      (SELECT ''€'' + CONVERT(varchar(12), SUM(Total), 1) AS Total
                       FROM      BikeRentalTbl AS BRT
                       WHERE   (SUBSTRING(BarCode, 4, 1) = 7) AND (BcInUse = ''Y'')) AS Kids,
                      (SELECT ''€'' + CONVERT(varchar(12), SUM(Total), 1) AS Total
                       FROM      BikeRentalTbl AS BRT
                       WHERE   (SUBSTRING(BarCode, 4, 1) = 1 OR
                                         SUBSTRING(BarCode, 4, 1) = 2 OR
                                         SUBSTRING(BarCode, 4, 1) = 3 OR
                                         SUBSTRING(BarCode, 4, 1) = 4 OR
                                         SUBSTRING(BarCode, 4, 1) = 5 OR
                                         SUBSTRING(BarCode, 4, 1) = 6 OR
                                         SUBSTRING(BarCode, 4, 1) = 7) AND (BcInUse = ''Y'')) AS Total


end' 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCurrRented]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetCurrRented]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetCurrRented]
AS
BEGIN
                    		SELECT (SELECT COUNT(BarCode) AS TOTAL
                    		                  FROM      BikeRentalTbl
                    		                  WHERE   (SUBSTRING(BarCode, 4, 1) = 3 OR
                    		                                    SUBSTRING(BarCode, 4, 1) = 6) AND (BcInUse = ''N'')) AS Small,
                    		                      (SELECT COUNT(BarCode) AS TOTAL
                    		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
                    		                       WHERE   (SUBSTRING(BarCode, 4, 1) = 1 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 4) AND (BcInUse = ''N'')) AS Medium,
                    		                      (SELECT COUNT(BarCode) AS TOTAL
                    		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
                    		                       WHERE   (SUBSTRING(BarCode, 4, 1) = 2 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 5) AND (BcInUse = ''N'')) AS Large,
                    		                      (SELECT COUNT(BarCode) AS TOTAL
                    		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
                    		                       WHERE   (SUBSTRING(BarCode, 4, 1) = 7) AND (BcInUse = ''N'')) AS Kids,
                    		                      (SELECT COUNT(BarCode) AS TOTAL
                    		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
                    		                       WHERE   (SUBSTRING(BarCode, 4, 1) = 1 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 2 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 3 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 4 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 5 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 6 OR
                    		                                         SUBSTRING(BarCode, 4, 1) = 7) AND (BcInUse = ''N'')) AS Total
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCurrAvail]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetCurrAvail]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetCurrAvail]
AS
BEGIN
          		SELECT (SELECT COUNT(BarCode) AS TOTAL
          		                  FROM      BikeRentalTbl
          		                  WHERE   (SUBSTRING(BarCode, 4, 1) = 3 OR
          		                                    SUBSTRING(BarCode, 4, 1) = 6) AND (BcInUse = ''Y'')) AS Small,
          		                      (SELECT COUNT(BarCode) AS TOTAL
          		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
          		                       WHERE   (SUBSTRING(BarCode, 4, 1) = 1 OR
          		                                         SUBSTRING(BarCode, 4, 1) = 4) AND (BcInUse = ''Y'')) AS Medium,
          		                      (SELECT COUNT(BarCode) AS TOTAL
          		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
          		                       WHERE   (SUBSTRING(BarCode, 4, 1) = 2 OR
          		                                         SUBSTRING(BarCode, 4, 1) = 5) AND (BcInUse = ''Y'')) AS Large,
									  (SELECT COUNT(BarCode) AS TOTAL
          		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
          		                       WHERE     (SUBSTRING(BarCode, 4, 1) = 7) AND (BcInUse = ''Y'')) AS Kids,
									  (SELECT COUNT(BarCode) AS TOTAL
          		                       FROM      BikeRentalTbl AS BikeRentalTbl_1
          		                       WHERE       ((SUBSTRING(BarCode, 4, 1) = 1) 
												OR (SUBSTRING(BarCode, 4, 1) = 2)
												OR (SUBSTRING(BarCode, 4, 1) = 3)
												OR (SUBSTRING(BarCode, 4, 1) = 4)
												OR (SUBSTRING(BarCode, 4, 1) = 5)
												OR (SUBSTRING(BarCode, 4, 1) = 6)
												OR (SUBSTRING(BarCode, 4, 1) = 7)) 
									   AND (BcInUse = ''Y'')) AS Total

END' 
END
GO
/****** Object:  StoredProcedure [dbo].[spGetBikeRental]    Script Date: 03/10/2016 00:11:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[spGetBikeRental]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[spGetBikeRental]
AS
BEGIN
          SELECT BarCode, TimesRented, CAST(TimeInOut AS time) AS Time, ''€'' + CONVERT(varchar(12), Total, 1) AS Total, CAST(Date AS DATE) AS Date
          FROM     BikeRentalTbl
          WHERE  (TimesRented > 1)
          ORDER BY TimesRented DESC
END' 
END
GO
