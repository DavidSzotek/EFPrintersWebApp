/* Scaffold-DbContext "Data Source=S-KAA-DB\\ENTERPRISE,1433;Initial Catalog=EFPrinters;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False" Microsoft.EntityFrameworkCore.SqlServer - OutputDir Models */
/*CREATE DATABASE EFPrinters COLLATE Czech_100_CI_AS*/


USE [EFPrinters]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****************************    ****************    ***************************/
/****************************    CREATING TABLES     ***************************/
/****************************                        ***************************/

/* --- Status ---*/
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


/* --- Functiontype ---*/
CREATE TABLE [dbo].[Functiontype](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Functiontype] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Manufacturer ---*/
CREATE TABLE [dbo].[Manufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](100) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Material ---*/
CREATE TABLE [dbo].[Material](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartNumber] [varchar](100) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Color] [varchar](40) NULL,
	[MaterialtypeId] [int] NOT NULL,
	[IsAlternative] [bit] NOT NULL,
	[Capacity] [int] NULL,
	[IsAvailable] [bit] NOT NULL,
	[Price] [money] NULL,
	[PriceDph] [money] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- MaterialCompatibility ---*/
CREATE TABLE [dbo].[MaterialCompatibility](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrintertypeId] [int] NOT NULL,
	[MaterialId] [int] NOT NULL,
 CONSTRAINT [PK_MaterialCompatibility] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Materialtype ---*/
CREATE TABLE [dbo].[Materialtype](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Materialtype] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Office ---*/
CREATE TABLE [dbo].[Office](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Street] [nvarchar](100) NOT NULL,
	[ZipCode] [char](6) NOT NULL,
	[Municipality] [nvarchar](50) NOT NULL,
	[Code] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Printer ---*/
CREATE TABLE [dbo].[Printer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrintertypeId] [int] NOT NULL,
	[InventaryNumber] [char](9) NOT NULL,
	[SerialNumber] [nvarchar](50) NOT NULL,
	[OfficeId] [int] NOT NULL,
	[Room] [nvarchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
	[ActivationDate] [date] NULL,
	[Price] [money] NULL,
	[PropertyType] [nvarchar](10) NULL,
 CONSTRAINT [PK_Printer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- PrinterFile ---*/
CREATE TABLE [dbo].[PrinterFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PrinterId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Comment] [nvarchar](150) NOT NULL,
	[FileName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_PrinterFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Printertype ---*/
CREATE TABLE [dbo].[Printertype](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [varchar](100) NOT NULL,
	[IsColor] [bit] NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[FunctiontypeId] [int] NOT NULL,
	[IsA3Capable] [bit] NOT NULL,
 CONSTRAINT [PK_Printertype] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/* --- Stock ---*/
CREATE TABLE [dbo].[Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MaterialId] [int] NOT NULL,
	[OfficeId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




/****************************    **********************     ***************************/
/****************************    CREATING RELATIONSHIPS     ***************************/
/****************************                               ***************************/

/* --- Material --- */
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialtypeId] FOREIGN KEY([MaterialtypeId])
REFERENCES [dbo].[Materialtype] ([Id])
GO

ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialtypeId]
GO

/* --- MaterialCompatibility ---*/
ALTER TABLE [dbo].[MaterialCompatibility]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCompatibility_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([Id])
GO

ALTER TABLE [dbo].[MaterialCompatibility] CHECK CONSTRAINT [FK_MaterialCompatibility_MaterialId]
GO

ALTER TABLE [dbo].[MaterialCompatibility]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCompatibility_PrintertypeId] FOREIGN KEY([PrintertypeId])
REFERENCES [dbo].[Printertype] ([Id])
GO

ALTER TABLE [dbo].[MaterialCompatibility] CHECK CONSTRAINT [FK_MaterialCompatibility_PrintertypeId]
GO

/* --- Printer ---*/
ALTER TABLE [dbo].[Printer]  WITH CHECK ADD  CONSTRAINT [FK_Printer_OfficeId] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO

ALTER TABLE [dbo].[Printer] CHECK CONSTRAINT [FK_Printer_OfficeId]
GO

ALTER TABLE [dbo].[Printer]  WITH CHECK ADD  CONSTRAINT [FK_Printer_PrintertypeId] FOREIGN KEY([PrintertypeId])
REFERENCES [dbo].[Printertype] ([Id])
GO

ALTER TABLE [dbo].[Printer] CHECK CONSTRAINT [FK_Printer_PrintertypeId]
GO

/*new*/
ALTER TABLE [dbo].[Printer]  WITH CHECK ADD  CONSTRAINT [FK_Printer_StatusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO

ALTER TABLE [dbo].[Printer] CHECK CONSTRAINT [FK_Printer_StatusId]
GO

/* --- PrinterFile ---*/
ALTER TABLE [dbo].[PrinterFile]  WITH CHECK ADD  CONSTRAINT [FK_PrinterFile_PrinterId] FOREIGN KEY([PrinterId])
REFERENCES [dbo].[Printer] ([Id])
GO

ALTER TABLE [dbo].[PrinterFile] CHECK CONSTRAINT [FK_PrinterFile_PrinterId]
GO

/* --- Printertype ---*/
ALTER TABLE [dbo].[Printertype]  WITH CHECK ADD  CONSTRAINT [FK_Printertype_FunctiontypeId] FOREIGN KEY([FunctiontypeId])
REFERENCES [dbo].[Functiontype] ([Id])
GO

ALTER TABLE [dbo].[Printertype] CHECK CONSTRAINT [FK_Printertype_FunctiontypeId]
GO

ALTER TABLE [dbo].[Printertype]  WITH CHECK ADD  CONSTRAINT [FK_Printertype_ManufacturerId] FOREIGN KEY([ManufacturerId])
REFERENCES [dbo].[Manufacturer] ([Id])
GO

ALTER TABLE [dbo].[Printertype] CHECK CONSTRAINT [FK_Printertype_ManufacturerId]

/* --- Stock ---*/
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_MaterialId] FOREIGN KEY([MaterialId])
REFERENCES [dbo].[Material] ([Id])
GO

ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_MaterialId]
GO

ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_OfficeId] FOREIGN KEY([OfficeId])
REFERENCES [dbo].[Office] ([Id])
GO

ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_OfficeId]
GO

/****************************    ****************    ***************************/
/****************************    INSERTING VALUES    ***************************/
/****************************                        ***************************/

USE [EFPrinters]
GO

/*** Functiontype ***/

INSERT INTO [dbo].[Functiontype]
           ([Name])
     VALUES
           ('Tiskárna'),
		   ('Multifunkce'),
		   ('Kopírka'),
		   ('Skener'),
		   ('Vyvolávací zaøízení')
GO

/*** Status ***/

INSERT INTO [dbo].[Status]
           ([Name])
     VALUES
           ('V provozu'),
		   ('Mimo provoz'),
		   ('K vyøazení'),
		   ('Vyøazeno')
GO

/*** Manufacturer ***/

INSERT INTO [dbo].[Manufacturer]
           ([Name]
           ,[Contact])
     VALUES
           ('OKI', 'velfl@edaruma.cz'),
		   ('Kyocera', 'helpdesk@csystem.cz'),
		   ('HP', NULL),
		   ('Xerox', NULL),
		   ('Dell', NULL),
		   ('Canon', NULL),
		   ('Panasonic', NULL),
		   ('Birch', NULL),
		   ('Kadlec', NULL),
		   ('QM-Pad', NULL)
GO

/*** Materialtype ***/

INSERT INTO [dbo].[Materialtype]
           ([Name])
     VALUES
           ('Toner'),
		   ('Válec'),
		   ('Pøenosový pás'),
		   ('Zapékací jednotka'),
		   ('Toner Kit'),
		   ('Lepící štítky'),
		   ('TTR páska'),
		   ('kotouè do vyv.zaøízení')
GO

/*** Office ***/

INSERT INTO [dbo].[Office]
           ([City]
           ,[Street]
           ,[ZipCode]
           ,[Municipality]
           ,[Code])
     VALUES
           ('Bohumín', 'Èáslavská 731', '735 81', 'Nový Bohumín', 'KA01'),
		   ('Bohumín', 'Vrchlického 608', '735 81', 'Nový Bohumín', 'KA02'),
		   ('Havíøov', 'Junácká 1632/3', '736 01', 'Mìsto', 'KA06'),
		   ('Karviná', 'tø. Osvobození 1388/60a', '735 06', 'Nové Mìsto', 'KA07'),
		   ('Orlová', 'Rydultowská 1370', '735 14', 'Lutynì', 'KA08'),
		   ('Orlová', 'Osvobození 1289', '735 14', 'Lutynì', 'KA09'),
		   ('Èeský Tìšín', 'Masarykovy sady 84/8', '737 01', 'Èeský Tìšín', 'KA11')
GO

/*** Printertype ***/

INSERT INTO [dbo].[Printertype]
           ([Model]
           ,[IsColor]
           ,[ManufacturerId]
           ,[FunctiontypeId]
		   ,[IsA3Capable])
     VALUES
		   ('B432', 0, 1, 1, 0),
		   ('MB492', 0, 1, 2, 0),
		   ('B410', 0, 1, 1, 0),
		   ('MB470', 0, 1, 2, 0),
           ('B411', 0, 1, 1, 0),
		   ('B431', 0, 1, 1, 0),
		   ('ES4131', 0, 1, 1, 0),
		   ('MB471', 0, 1, 2, 0),
		   ('MB491', 0, 1, 2, 0),
		   ('MB441', 0, 1, 2, 0),
		   ('MB451', 0, 1, 2, 0),
		   ('MC560', 1, 1, 2, 0),
		   ('MC563', 1, 1, 2, 0),
		   ('MC861', 1, 1, 2, 0),
		   ('TASKalfa 3212i', 0, 2, 2, 1),
		   ('TASKalfa 2553ci', 1, 2, 2, 1),
		   ('TASKalfa 4053ci', 1, 2, 2, 1),
		   ('M406fdn', 0, 3, 1, 0),
		   ('M426fdn', 0, 3, 2, 0),
		   ('Phaser 3610', 0, 4, 1, 0),
		   ('WorkCentre 3615', 0, 4, 2, 0),
		   ('WorkCentre 7228', 1, 4, 2, 1),
		   ('WorkCentre 7328', 1, 4, 2, 1),
		   ('WorkCentre M15i', 0, 4, 2, 0),
		   ('WorkCentre M20i', 0, 4, 2, 0),
		   ('VersaLink B405', 0, 4, 2, 0),
		   ('VersaLink B7030', 0, 4, 2, 1),
		   ('1710', 0, 5, 1, 0),
		   ('1720', 0, 5, 1, 0),
		   ('5110', 1, 5, 1, 0),
		   ('DR-9080C', 1, 6, 3, 1),	   
		   ('KV-S5058', 1, 7, 3, 1),
		   ('KV-S8147', 1, 7, 3, 1),   
		   ('BP-745', 0, 8, 1, 0),
		   ('QMPad - Karviná', 0, 9, 5, 0),
		   ('Kadlec - Havíøov', 0, 10, 5, 0),
		   ('Kadlec - Bohumín', 0, 10, 5, 0)
GO

/*** Material ***/

INSERT INTO [dbo].[Material]
           ([PartNumber],[Name],[Color],[MaterialtypeId],[IsAlternative],[Capacity],[IsAvailable],[Price],[PriceDph])
     VALUES
	       ('43979102', 'OKI B410/B430/B440/MB460/MB470/MB480', 'K', 1, 0, 3500, 0, NULL, NULL),
		   ('43979102', 'OKI B410/B430/B440/MB460/MB470/MB480', 'K', 1, 1, 3500, 1, 1454.00, 1759.34),
		   ('43979002', 'OKI B410/B430/B440/MB460/MB470/MB480', 'K', 2, 0, 20000, 1, 3120.00, 3775.20),
		   ('44917202', 'OKI B430/B440/MB460/MB470/MB480', 'K', 1, 0, 7000, 1, 2273.00, 2750.33),
           ('44917602', 'OKI B431/MB491', 'K', 1, 0, 12000, 1, 3276.00, 3963.96),
		   ('44574702', 'OKI B411/B431/MB461/MB471/MB491', 'K', 1, 0, 3000, 1, 1561.00, 1888.81),
		   ('44574802', 'OKI B431/MB461/MB471/MB491', 'K', 1, 0, 7000, 1, 2355.00, 2849.55),
		   ('44574302', 'OKI B411/B412/B431/B432/B512/MB461/MB471/MB472/MB491/MB492/MB562', 'K', 2, 0, 25000, 1, 2073.00, 2508.33),
		   ('45807102', 'OKI B412/B432/B512/MB472/MB492/MB562', 'K', 1, 0, 3000, 1, 1510.00, 1827.10),
		   ('45807106', 'OKI B412/B432/B512/MB472/MB492/MB562', 'K', 1, 0, 7000, 1, 2246.00, 2717.66),
		   ('45807111', 'OKI B432/B512/MB492/MB562', 'K', 1, 0, 12000, 1, 3046.00, 3685.66),
		   ('44917607', 'OKI ES4131/ES4161MFP/ES4191MFP', 'K', 1, 0, 12000, 1, 2288.00, 2768.48),
		   ('01283601', 'OKI ES4131/4161/5112', 'K', 2, 1, NULL, 1, 432.00, 522.72),
		   ('44574307', 'OKI B401/MB441/MB451', 'K', 2, 0, 25000, 1, 2168.00, 2623.28),
		   ('44992401', 'OKI B401/MB441/MB451', 'K', 1, 0, 1500, 1, 1170.00, 1415.70),
		   ('44992402', 'OKI B401/MB441/MB451', 'K', 1, 0, 2500, 1, 1208.00, 1461.68),
		   ('46490401', 'OKI C532/C542/MC563/MC573', 'Y', 1, 0, 1500, 1, 1175.00, 1421.75),
		   ('46490402', 'OKI C532/C542/MC563/MC573', 'M', 1, 0, 1500, 1, 1175.00, 1421.75),
		   ('46490403', 'OKI C532/C542/MC563/MC573', 'C', 1, 0, 1500, 1, 1175.00, 1421.75),
		   ('46490404', 'OKI C532/C542/MC563/MC573', 'K', 1, 0, 1500, 1, 515.00, 623.15),
		   ('46490605', 'OKI C532/C542/MC563/MC573', 'Y', 1, 0, 6000, 1, 3689.00, 4463.69),
		   ('46490606', 'OKI C532/C542/MC563/MC573', 'M', 1, 0, 6000, 1, 3689.00, 4463.69),
		   ('46490607', 'OKI C532/C542/MC563/MC573', 'C', 1, 0, 6000, 1, 3689.00, 4463.69),
		   ('46490608', 'OKI C532/C542/MC563/MC573', 'K', 1, 0, 7000, 1, 1929.00, 2334.09),
		   ('46484105', 'OKI C532/C542/MC563/MC573', 'Y', 2, 0, 30000, 1, 791.00, 957.11),
		   ('46484106', 'OKI C532/C542/MC563/MC573', 'M', 2, 0, 30000, 1, 791.00, 957.11),
		   ('46484107', 'OKI C532/C542/MC563/MC573', 'C', 2, 0, 30000, 1, 791.00, 957.11),
		   ('46484108', 'OKI C532/C542/MC563/MC573', 'K', 2, 0, 30000, 1, 791.00, 957.11),
		   ('43449705', 'OKI C8600/C8800', NULL, 3, 0, 80000, 1, 2173.00, 2629.33),
		   ('43529405', 'OKI C8600/C8800', NULL, 4, 0, 100000, 1, 3519.00, 4257.99),
		   ('44059253', 'OKI MC861/MC861+', 'Y', 1, 0, 10000, 1, 3247.00, 3928.87),
		   ('44059254', 'OKI MC861/MC861+', 'M', 1, 0, 10000, 1, 3247.00, 3928.87),
		   ('44059255', 'OKI MC861/MC861+', 'C', 1, 0, 10000, 1, 3247.00, 3928.87),
		   ('44059256', 'OKI MC861/MC861+', 'K', 1, 0, 9500, 1, 1351.00, 1634.71),
		   ('44064009', 'OKI C801/C810/C821/C830/MC851/MC860/MC861', 'Y', 2, 0, 20000, 1, 2093.00, 2532.53),
		   ('44064010', 'OKI C801/C810/C821/C830/MC851/MC860/MC861', 'M', 2, 0, 20000, 1, 2093.00, 2532.53),
		   ('44064011', 'OKI C801/C810/C821/C830/MC851/MC860/MC861', 'C', 2, 0, 20000, 1, 2093.00, 2532.53),
		   ('44064012', 'OKI C801/C810/C821/C830/MC851/MC860/MC861', 'K', 2, 0, 20000, 1, 2093.00, 2532.53),
		   ('113R00773', 'Xerox Phaser 3610/WorkCentre 3615/3655 Smart Kit Drum Cartridge', 'K', 2, 0, 80000, 0, NULL, NULL),
		   ('106R02732', 'Xerox Phaser 3610/WorkCentre 3615 Extra High-Capacity Toner Cartridge', 'K', 1, 0, 25300, 0, NULL, NULL),
		   ('106R02724', 'Xerox Phaser 3610/WorkCentre 3615 Metered Toner Cartridge', 'K', 1, 0, 25300, 0, NULL, NULL),
		   ('115R00085', 'Xerox Phaser 3610/WorkCentre 3615/3655 Maintenance Kit', NULL, 4, 0, NULL, 0, NULL, NULL),
		   ('013R00624', 'Xerox WorkCentre 7228,7235,7245,7328,7335,7345', NULL, 2, 0, 50000, 0, NULL, NULL),
		   ('006R01175', 'Xerox WorkCentre 7228,7235,7245,7328,7335,7345', 'K', 1, 0, 25000, 0, NULL, NULL),
		   ('006R01176', 'Xerox WorkCentre 7228,7235,7245,7328,7335,7345', 'C', 1, 0, 16000, 0, NULL, NULL),
		   ('006R01177', 'Xerox WorkCentre 7228,7235,7245,7328,7335,7345', 'M', 1, 0, 16000, 0, NULL, NULL),
		   ('006R01178', 'Xerox WorkCentre 7228,7235,7245,7328,7335,7345', 'Y', 1, 0, 16000, 0, NULL, NULL),
		   ('113R00779', 'Xerox VersaLink B7030', 'K', 2, 0, 100000, 0, NULL, NULL),
		   ('106R03396', 'Xerox VersaLink B7030', 'K', 1, 0, 31000, 0, NULL, NULL),
		   ('101R00554', 'Xerox VersaLink B400/B405 Drum Cartridge', 'K', 2, 0, 65000, 0, NULL, NULL),
		   ('106R03585', 'Xerox VersaLink B400/B405 Extra High-Capacity Toner Cartridge', 'K', 1, 0, 24600, 1, NULL, NULL),
		   ('1T02V70NL0', 'Kyocera TK-7125', 'K', 5, 0, 20000, 1, 1461.00, 1767.81),
		   ('1T02L7ANL1001', 'Kyocera TK-8345Y', 'Y', 1, 0, 12000, 1, 1781.00, 2155.01),
		   ('1T02L7BNL1001', 'Kyocera TK-8345M', 'M', 1, 0, 12000, 1, 1781.00, 2155.01),
		   ('1T02L7CNL1001', 'Kyocera TK-8345C', 'C', 1, 0, 12000, 1, 1781.00, 2155.01),
		   ('1T02L70NL0001', 'Kyocera TK-8345K', 'K', 1, 0, 20000, 1, 1104.00, 1335.84),
		   ('1T02RMANL1001', 'Kyocera TK-8525Y', 'Y', 1, 0, 20000, 1, 2746.00, 3322.66),
		   ('1T02RMBNL1001', 'Kyocera TK-8525M', 'M', 1, 0, 20000, 1, 2746.00, 3322.66),
		   ('1T02RMCNL1001', 'Kyocera TK-8525C', 'C', 1, 0, 20000, 1, 2746.00, 3322.66),
		   ('1T02RM0NL0001', 'Kyocera TK-8525K', 'K', 1, 0, 30000, 1, 1280.00, 1548.80),
		   ('CF226X', 'HP LJ Pro M402,MFP M426', 'K', 5, 1, 9000, 1, 157.00, 189.97),
		   ('CF226A', 'HP LJ Pro M402,MFP M426', 'K', 5, 1, 3100, 1, 188.00, 227.48),
		   ('1', 'Lepící štítky 50 mm x 30 mm', NULL, 6, 0, 1500, 0, NULL, NULL),
		   ('2', 'inkanto vnìjší TTR páska AWR8, 55mm x 300 m ', 'K', 7, 0, NULL, 0, NULL, NULL),
		   ('3', 'TTR vnìjší páska 55mm x 360 m', 'K', 7, 0, NULL, 0, NULL, NULL),
		   ('4', 'QM-Pad kotouè', NULL, 7, 0, NULL, 0, NULL, NULL),
		   ('5', 'Kadlec - Vnìjší návin', NULL, 7, 0, NULL, 0, NULL, NULL),
		   ('6', 'Kadlec - Vnitøní návin', NULL, 7, 0, NULL, 0, NULL, NULL)
		   
GO

/*** MaterialCompatibility ***/

INSERT INTO [dbo].[MaterialCompatibility]
           ([PrintertypeId]
           ,[MaterialId])
     VALUES
           (1,8),
		   (1,9),
		   (1,10),
		   (1,11),
		   (2,8),
		   (2,9),
		   (2,10),
		   (2,11),
		   (3,1),
		   (3,2),
		   (3,3),
		   (4,1),
		   (4,2),
		   (4,3),
		   (4,4),
		   (5,6),
		   (5,8),
		   (6,5),
		   (6,6),
		   (6,7),
		   (6,8),
		   (7,12),
		   (7,13),
		   (8,6),
		   (8,7),
		   (8,8),
		   (9,5),
		   (9,6),
		   (9,7),
		   (9,8),
		   (10,14),
		   (10,15),
		   (10,16),
		   (11,14),
		   (11,15),
		   (11,16),
		   (13,17),
		   (13,18),
		   (13,19),
		   (13,20),
		   (13,21),
		   (13,22),
		   (13,23),
		   (13,24),
		   (13,25),
		   (13,26),
		   (13,27),
		   (13,28),
		   (14,29),
		   (14,30),
		   (14,31),
		   (14,32),
		   (14,33),
		   (14,34),
		   (14,35),
		   (14,36),
		   (14,37),
		   (14,38),
		   (15,52),
		   (16,53),
		   (16,54),
		   (16,55),
		   (16,56),
		   (17,57),
		   (17,58),
		   (17,59),
		   (17,60),
		   (18,61),
		   (18,62),
		   (19,61),
		   (19,62),
		   (20,39),
		   (20,40),
		   (20,41),
		   (20,42),
		   (21,39),
		   (21,40),
		   (21,41),
		   (21,42),
		   (22,43),
		   (22,44),
		   (22,45),
		   (22,46),
		   (22,47),
		   (23,43),
		   (23,44),
		   (23,45),
		   (23,46),
		   (23,47),
		   (26,50),
		   (26,51),
		   (27,48),
		   (27,49),
		   (34,63),
		   (34,64),
		   (34,65),
		   (35,66),
		   (36,67),
		   (37,68)
GO

/*** Stock ***/

INSERT INTO [dbo].[Stock]
           ([OfficeId],[MaterialId],[Quantity])

     VALUES
           (1,1,7),
		   (1,3,4),
		   (1,5,9),
		   (1,6,2),
		   (1,7,5),
		   (1,8,8),
		   (1,9,3),
		   (1,11,8),
		   (1,39,2),
		   (1,40,4),
		   (1,41,3),
		   (1,43,4),
		   (1,44,3),
		   (1,45,2),
		   (1,46,2),
		   (1,47,2),
		   (1,50,2),
		   (1,51,4),
		   (2,1,5),
		   (2,2,2),
		   (2,3,3),
		   (2,5,7),
		   (2,7,4),
		   (2,8,9),
		   (2,11,9),
		   (2,39,3),
		   (2,40,5),
		   (2,41,0),
		   (2,53,3),
		   (2,54,3),
		   (2,55,3),
		   (2,56,6),
		   (2,63,113),
		   (2,64,21),
		   (2,65,0),
		   (3,1,12),
		   (3,2,9),
		   (3,3,8),
		   (3,4,6),
		   (3,5,18),
		   (3,6,5),
		   (3,7,10),
		   (3,8,18),
		   (3,9,6),
		   (3,11,21),
		   (3,12,18),
		   (3,13,11),
		   (3,14,3),
		   (3,16,5),
		   (3,21,4),
		   (3,22,4),
		   (3,23,4),
		   (3,24,6),
		   (3,25,2),
		   (3,26,2),
		   (3,27,2),
		   (3,28,3),
		   (3,39,8),
		   (3,40,12),
		   (3,41,9),
		   (3,52,8),
		   (3,53,5),
		   (3,54,5),
		   (3,55,4),
		   (3,56,4),
		   (3,57,3),
		   (3,58,3),
		   (3,59,2),
		   (3,60,2),
		   (3,63,284),
		   (3,64,73),
		   (3,65,21),
		   (3,67,156),
		   (4,1,8),
		   (4,2,12),
		   (4,3,8),
		   (4,4,12),
		   (4,5,43),
		   (4,6,18),
		   (4,7,24),
		   (4,8,36),
		   (4,9,0),
		   (4,10,0),
		   (4,11,51),
		   (4,12,22),
		   (4,13,19),
		   (4,14,6),
		   (4,15,0),
		   (4,16,11),
		   (4,17,1),
		   (4,18,1),
		   (4,19,1),
		   (4,20,1),
		   (4,21,3),
		   (4,22,4),
		   (4,23,3),
		   (4,24,5),
		   (4,25,3),
		   (4,26,3),
		   (4,27,2),
		   (4,28,3),
		   (4,29,2),
		   (4,30,2),
		   (4,31,4),
		   (4,32,3),
		   (4,33,2),
		   (4,34,4),
		   (4,35,2),
		   (4,36,3),
		   (4,37,2),
		   (4,38,1),
		   (4,39,11),
		   (4,40,35),
		   (4,41,8),
		   (4,42,2),
		   (4,43,1),
		   (4,44,4),
		   (4,45,3),
		   (4,46,3),
		   (4,47,2),
		   (4,48,2),
		   (4,49,2),
		   (4,50,3),
		   (4,51,7),
		   (4,52,11),
		   (4,53,4),
		   (4,54,4),
		   (4,55,4),
		   (4,56,4),
		   (4,57,6),
		   (4,58,6),
		   (4,59,6),
		   (4,60,6),
		   (4,61,0),
		   (4,62,5),
		   (4,63,245),
		   (4,64,63),
		   (4,65,21),
		   (4,66,322),
		   (4,67,23),
		   (4,68,31),
		   (5,5,13),
		   (5,6,0),
		   (5,7,6),
		   (5,8,13),
		   (5,11,19),
		   (5,31,3),
		   (5,32,2),
		   (5,33,1),
		   (5,34,2),
		   (5,35,1),
		   (5,36,1),
		   (5,37,1),
		   (5,38,2),
		   (5,39,6),
		   (5,40,9),
		   (5,41,3),
		   (6,5,10),
		   (6,6,3),
		   (6,7,2),
		   (6,8,9),
		   (6,11,8),
		   (6,21,3),
		   (6,22,3),
		   (6,23,2),
		   (6,24,4),
		   (6,25,1),
		   (6,26,1),
		   (6,27,1),
		   (6,28,3),
		   (6,63,61),
		   (6,64,12),
		   (6,65,3),
		   (7,1,5),
		   (7,2,11),
		   (7,3,6),
		   (7,5,15),
		   (7,6,5),
		   (7,7,11),
		   (7,8,14),
		   (7,9,3),
		   (7,10,5),
		   (7,11,11),
		   (7,48,1),
		   (7,49,2),
		   (7,53,3),
		   (7,54,2),
		   (7,55,1),
		   (7,56,4),
		   (7,61,4),
		   (7,63,59),
		   (7,64,20),
		   (7,65,0)
		   
GO

/*** Printer ***/

GO

INSERT INTO [dbo].[Printer]
           ([PrintertypeId]
           ,[InventaryNumber]
           ,[SerialNumber]
           ,[OfficeId]
           ,[Room]
           ,[StatusId]
		   ,[ActivationDate]
           ,[Price]
           ,[PropertyType])
		   
     VALUES
           /*(<PrintertypeId, int,>, <InventaryNumber, char(9),>, <SerialNumber, nvarchar(50),>, <OfficeId, int,>, <Room, nvarchar(50),>, <StatusId, int,>, <Price, money,>, <PropertyType, nvarchar(10),>)*/

		   /*********  Canon *********/
		   (31, '026017046', 'SERIALNUMBER', 4, '1109', 2, '2006-07-07', 196945.00, 'HM'),
		   (31, '026019895', 'SERIALNUMBER', 3, '405', 2, '2008-05-23', 196945.00, 'HM'),
		   (31, '026022543', 'SERIALNUMBER', 4, '1109', 2, '2009-06-30', 161245.00, 'HM'),

		   /*********  Panasonic *********/
		   (32, '043045862', 'SERIALNUMBER', 1, '101 - archiv', 1, '2021-12-30', 72370.10, 'CM'),
		   (32, '043046852', 'SERIALNUMBER', 5, '202A', 1, '2023-03-16', 72370.10, 'CM'),
		   (33, '043046856', 'SERIALNUMBER', 3, 'S26 - sklep', 1, '2023-03-16', 155013.10, 'CM'),
		   (33, '043046858', 'SERIALNUMBER', 4, '902', 1, '2023-03-16', 155013.10, 'CM'),

		   /*********  Dell *********/
		   (28, '026018152', 'SERIALNUMBER', 2, '10', 2, '2007-07-02', 4165.00, 'DHM'),
		   (28, '026018158', 'SERIALNUMBER', 3, 'S03 - sklep', 2, '2007-07-02', 4165.00, 'DHM'),
		   (28, '026018720', 'SERIALNUMBER', 4, '01/15 - sklep', 2, '2007-07-04', 4165.00, 'DHM'),
		   (30, '026018723', 'SERIALNUMBER', 4, '606', 1, '2007-06-22', 23562.00, 'DHM'),
		   (29, '026020327', 'SERIALNUMBER', 3, '321', 2, '2008-05-23', 6121.00, 'DHM'),
		   (28, '043016863', 'SERIALNUMBER', 4, '1101', 2, '2014-09-03', 4165.00, 'DHM'),
		   (28, '043016874', 'SERIALNUMBER', 4, '1109', 2, '2014-09-03', 4165.00, 'DHM'),
		   (28, '043017020', 'SERIALNUMBER', 7, '105', 2, '2014-09-03', 4165.00, 'DHM'),

		   /*********  Kyocera *********/
		   (17, '043044465', 'SERIALNUMBER', 3, '312 - sekretariát', 1, '2021-03-18', 61285.29, 'HM'),
		   (15, '043044899', 'SERIALNUMBER', 4, '603', 1, '2020-12-28', 44091.19, 'CM'),
		   (15, '043044900', 'SERIALNUMBER', 4, '403', 1, '2020-12-28', 44091.19, 'CM'),
		   (16, '043044901', 'SERIALNUMBER', 2, '02', 1, '2020-12-28', 46426.49, 'CM'),
		   (16, '043044902', 'SERIALNUMBER', 7, '210', 1, '2020-12-28', 46426.49, 'CM'),
		   (16, '043044903', 'SERIALNUMBER', 3, '124', 1, '2020-12-28', 46426.49, 'CM'),
		   (15, '043044904', 'SERIALNUMBER', 3, '023', 1, '2020-12-28', 44091.19, 'CM'),
		   (15, '043044905', 'SERIALNUMBER', 3, '325', 1, '2020-12-28', 44091.19, 'CM'),
		   (15, '043044906', 'SERIALNUMBER', 6, '107', 1, '2020-12-28', 44091.19, 'CM'),

		   /*********  Xerox 3610 *********/
		   (20, '043031921', 'SERIALNUMBER', 4, '1113', 1, '2017-10-27', 2964.50, 'DDHM'),
		   (20, '043031922', 'SERIALNUMBER', 3, '124', 1, '2017-10-27', 2964.50, 'DDHM'),
		   (20, '043031923', 'SERIALNUMBER', 5, '211B', 1, '2017-10-27', 2964.50, 'DDHM'),
		   (20, '043031924', 'SERIALNUMBER', 7, '106', 1, '2017-10-27', 2964.50, 'DDHM'),
		   (20, '043031925', 'SERIALNUMBER', 4, '1109', 1, '2017-10-27', 2964.50, 'DDHM'),
		   (20, '043032811', 'SERIALNUMBER', 4, '802', 1, '2017-12-27', 2928.18, 'DDHM'),
		   (20, '043032812', 'SERIALNUMBER', 6, '302', 1, '2017-12-27', 2928.18, 'DDHM'),
		   (20, '043032813', 'SERIALNUMBER', 5, '202A', 1, '2017-12-27', 2928.18, 'DDHM'),
		   (20, '043032814', 'SERIALNUMBER', 5, '206', 1, '2017-12-27', 2928.18, 'DDHM'),
		   (20, '043032815', 'SERIALNUMBER', 4, '211', 1, '2017-12-27', 2928.18, 'DDHM'),
		   (20, '043032940', 'SERIALNUMBER', 4, '501', 1, '2018-04-30', 2928.20, 'DDHM'),
		   (20, '043032941', 'SERIALNUMBER', 4, '304', 1, '2018-04-30', 2928.20, 'DDHM'),
		   (20, '043032942', 'SERIALNUMBER', 1, '201', 1, '2018-04-30', 2928.20, 'DDHM'),
		   (20, '043032943', 'SERIALNUMBER', 7, '109', 1, '2018-04-30', 2928.20, 'DDHM'),
		   (20, '043032944', 'SERIALNUMBER', 4, '814', 1, '2018-04-30', 2928.20, 'DDHM'),
		   (20, '043032945', 'SERIALNUMBER', 5, '201', 1, '2018-04-30', 2928.20, 'DDHM'),
		   (20, '043034859', 'SERIALNUMBER', 3, '304', 1, '2018-08-01', 3509.00, 'DDHM'),
		   (20, '043034860', 'SERIALNUMBER', 4, '1002', 1, '2018-08-01', 3509.00, 'DDHM'),
		   (20, '043035880', 'SERIALNUMBER', 4, '407', 1, '2018-12-19', 3351.70, 'DDHM'),
		   (20, '043035881', 'SERIALNUMBER', 4, '912', 1, '2018-12-19', 3351.70, 'DDHM'),
		   (20, '043035882', 'SERIALNUMBER', 4, '1113', 1, '2018-12-19', 3351.70, 'DDHM'),
		   (20, '043035883', 'SERIALNUMBER', 4, '312', 1, '2018-12-19', 3351.70, 'DDHM'),
		   (20, '043035884', 'SERIALNUMBER', 4, '811', 1, '2018-12-19', 3351.70, 'DDHM'),
		   (20, '043035970', 'SERIALNUMBER', 4, '1113', 1, '2018-12-28', 3533.20, 'DDHM'),
		   (20, '043035971', 'SERIALNUMBER', 2, '04', 1, '2018-12-28', 3533.20, 'DDHM'),
		   (20, '043035972', 'SERIALNUMBER', 4, '1113', 1, '2018-12-28', 3533.20, 'DDHM'),
		   (20, '043035973', 'SERIALNUMBER', 4, '808', 1, '2018-12-28', 3533.20, 'DDHM'),
		   (20, '043035974', 'SERIALNUMBER', 2, '02', 1, '2018-12-28', 3533.20, 'DDHM'),

		   /*********  Xerox 3615 *********/
		   (21, '043025087', 'SERIALNUMBER', 4, '111', 1, '2017-01-19', 15125.00, 'DHM'),
		   (21, '043025088', 'SERIALNUMBER', 4, '211', 1, '2017-01-19', 15125.00, 'DHM'),
		   (21, '043026867', 'SERIALNUMBER', 4, '1101', 1, '2015-08-07', 14520.00, 'DHM'),
		   (21, '043029243', 'SERIALNUMBER', 4, '1101', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043029244', 'SERIALNUMBER', 4, '1113', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043029245', 'SERIALNUMBER', 4, '312', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043029246', 'SERIALNUMBER', 3, '118', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043029247', 'SERIALNUMBER', 6, '211A', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043029248', 'SERIALNUMBER', 7, '108', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043029249', 'SERIALNUMBER', 6, '204A', 1, '2015-12-30', 13310.00, 'DHM'),
		   (21, '043030316', 'SERIALNUMBER', 3, '307', 1, '2016-12-23', 6050.00, 'DHM'),
		   (21, '043030317', 'SERIALNUMBER', 4, '009', 1, '2016-12-23', 6050.00, 'DHM'),
		   (21, '043030318', 'SERIALNUMBER', 4, '208', 1, '2016-12-23', 6050.00, 'DHM'),
		   (21, '043030319', 'SERIALNUMBER', 4, '302', 1, '2016-12-23', 6050.00, 'DHM'),

		   /*********  Xerox B405/B7030 *********/
		   (26, '043031926', 'SERIALNUMBER', 1, '414?', 1, '2017-10-27', 6037.75, 'DHM'),
		   (26, '043031927', 'SERIALNUMBER', 6, '211', 1, '2017-10-27', 6037.75, 'DHM'),
		   (26, '043032554', 'SERIALNUMBER', 4, '314', 1, '2017-12-20', 5868.50, 'DHM'),
		   (26, '043032555', 'SERIALNUMBER', 4, '001', 1, '2017-12-20', 5868.50, 'DHM'),
		   (26, '043032557', 'SERIALNUMBER', 4, '1109', 1, '2017-12-20', 5868.50, 'DHM'),
		   (26, '043035870', 'SERIALNUMBER', 4, '1101', 1, '2018-12-19', 10527.00, 'DHM'),
		   (27, '043032651', 'SERIALNUMBER', 7, '214', 1, '2017-12-11', 21677.00, 'DHM'),

		   /*********  Xerox M20i/M15i *********/
		   (24, '026015954', 'SERIALNUMBER', 4, '1101', 1, '2005-11-08', 23229.00, 'DHM'),
		   (25, '026018393', 'SERIALNUMBER', 4, '1109', 1, '2007-07-03', 27250.00, 'DHM'),
		   (25, '026022302', 'SERIALNUMBER', 3, '405', 1, '2005-06-30', 27249.00, 'DHM'),
		   (25, '026022303', 'SERIALNUMBER', 5, '207', 1, '2005-06-30', 27249.00, 'DHM'),
		   (25, '026022304', 'SERIALNUMBER', 4, '1101', 1, '2005-06-30', 27249.00, 'DHM'),

		   /*********  Xerox 7228/7328 *********/
		   (23, '026022287', 'SERIALNUMBER', 4, '816', 1, '2009-06-30', 166166.00, 'HM'),
		   (23, '026022288', 'SERIALNUMBER', 3, '405', 1, '2009-06-30', 166166.00, 'HM'),
		   (23, '026022548', 'SERIALNUMBER', 4, '1004', 1, '2009-06-30', 166167.00, 'HM'),
		   (23, '026022549', 'SERIALNUMBER', 3, '405', 1, '2009-06-30', 166167.00, 'HM'),
		   (22, '026023089', 'SERIALNUMBER', 1, '101 - archiv', 1, '2014-09-03', 166167.00, 'HM'),
		   (22, '026023090', 'SERIALNUMBER', 7, '109', 1, '2014-09-03', 166167.00, 'HM'),

		   /*********  OKI MC861 *********/
		   (14, '043028299', 'SERIALNUMBER', 4, '003', 1, '2015-09-09', 86403.00, 'HM'),
		   (14, '043028300', 'SERIALNUMBER', 5, '109', 1, '2015-09-09', 86403.00, 'HM'),

		   /*********  OKI MB470 *********/
		   (4, '043015666', 'SERIALNUMBER', 1, '204', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015667', 'SERIALNUMBER', 4, '002', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015668', 'SERIALNUMBER', 4, '803', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015671', 'SERIALNUMBER', 4, '1108', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015673', 'SERIALNUMBER', 7, '107', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015687', 'SERIALNUMBER', 4, '1113', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015693', 'SERIALNUMBER', 5, '202B', 1, '2013-09-01', 7002.00, 'DHM'),
		   (4, '043015695', 'SERIALNUMBER', 3, '405', 1, '2013-09-01', 7002.00, 'DHM'),

		   /*********  OKI MC560 *********/
		   (12, '043015698', 'SERIALNUMBER', 4, '1104', 1, '2013-09-01', 22279.00, 'DHM'),
		   (12, '043015699', 'SERIALNUMBER', 1, '201', 1, '2013-09-01', 22279.00, 'DHM'),
		   (12, '043015700', 'SERIALNUMBER', 4, '1113', 1, '2013-09-01', 22279.00, 'DHM'),
		   (12, '043015701', 'SERIALNUMBER', 4, '1109', 1, '2013-09-01', 22279.00, 'DHM'),

		   /*********  OKI ES4131 *********/
		   (7, '043017903', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017904', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017905', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017906', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017907', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017909', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017911', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017912', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017914', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017915', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017917', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017918', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017919', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017920', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017921', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017922', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017926', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017927', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017928', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017929', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017930', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017932', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017933', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017934', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017935', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017937', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017938', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017939', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017940', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017941', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017942', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017943', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017944', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017945', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017948', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017949', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017950', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017951', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017953', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),
		   (7, '043017954', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 4665.60, 'DHM'),

		   /*********  OKI MB441/MB451 *********/
		   (10, '043019245', 'SERIALNUMBER', 4, 'room', 1, '2013-12-03', 3872.00, 'DHM'),
		   (11, '043021110', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 3872.00, 'DHM'),
		   (11, '043021111', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 3872.00, 'DHM'),

		   /*********  OKI MB491 *********/
		   (9, '043025059', 'SERIALNUMBER', 4, 'room', 1, '2014-12-19', 6835.29, 'DHM'),
		   (9, '043025128', 'SERIALNUMBER', 4, 'room', 1, '2015-02-12', 6835.29, 'DHM'),

		   /*********  OKI MC563 *********/
		   (13, '043041790', 'SERIALNUMBER', 4, 'room', 1, '2020-04-23', 8940.69, 'DHM'),
		   (13, '043041800', 'SERIALNUMBER', 4, 'room', 1, '2020-04-23', 8940.69, 'DHM'),
		   (13, '043043202', 'SERIALNUMBER', 4, 'room', 1, '2020-07-03', 8940.69, 'DHM'),
		   (13, '043043205', 'SERIALNUMBER', 4, 'room', 1, '2020-07-03', 8940.69, 'DHM'),

		    /*********  OKI MB471 *********/
			(8, '043017955', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 7002.00, 'DHM'),
			(8, '043017956', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 7002.00, 'DHM'),
			(8, '043017957', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 7002.00, 'DHM'),
			(8, '043017958', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 7002.00, 'DHM'),
			(8, '043017959', 'SERIALNUMBER', 4, 'room', 1, '2015-09-09', 7002.00, 'DHM'),
			(8, '043024985', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024986', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024987', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024988', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024989', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024990', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024991', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024992', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024993', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024994', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024995', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024996', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024997', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024998', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024999', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),
			(8, '043024999', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 3834.49, 'DHM'),

			/*********  OKI MB492 *********/
			(2, '043029986', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029987', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029988', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029989', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029990', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029991', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029992', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043029993', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043030008', 'SERIALNUMBER', 4, 'room', 1, '2016-10-18', 4846.00, 'DHM'),
			(2, '043041778', 'SERIALNUMBER', 4, 'room', 1, '2020-04-23', 9568.68, 'DHM'),
			(2, '043041779', 'SERIALNUMBER', 4, 'room', 1, '2020-04-23', 9568.68, 'DHM'),
			(2, '043042153', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 9568.68, 'DHM'),
			(2, '043042154', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 9568.68, 'DHM'),			
			(2, '043043218', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043226', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043233', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043234', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043235', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043236', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043237', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043238', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043239', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043240', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043241', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043242', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043243', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),
			(2, '043043244', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 9568.68, 'DHM'),			
			(2, '043043631', 'SERIALNUMBER', 4, 'room', 1, '2020-07-21', 9568.68, 'DHM'),
			(2, '043043698', 'SERIALNUMBER', 4, 'room', 1, '2020-10-23', 9568.68, 'DHM'),
			(2, '043043701', 'SERIALNUMBER', 4, 'room', 1, '2020-10-23', 9568.68, 'DHM'),
			(2, '043043702', 'SERIALNUMBER', 4, 'room', 1, '2020-10-23', 9568.68, 'DHM'),
			(2, '043044026', 'SERIALNUMBER', 4, 'room', 1, '2020-11-25', 9568.70, 'DHM'),
			(2, '043044027', 'SERIALNUMBER', 4, 'room', 1, '2020-11-25', 9568.70, 'DHM'),
			(2, '043044028', 'SERIALNUMBER', 4, 'room', 1, '2020-11-25', 9568.70, 'DHM'),
			(2, '043044029', 'SERIALNUMBER', 4, 'room', 1, '2020-11-25', 9568.70, 'DHM'),
			(2, '043044030', 'SERIALNUMBER', 4, 'room', 1, '2020-11-25', 9568.70, 'DHM'),
			(2, '043045310', 'SERIALNUMBER', 4, 'room', 1, '2021-11-16', 9568.68, 'DHM'),

			/*********  OKI B411 *********/
			(5, '043016721', 'SERIALNUMBER', 4, 'room', 1, '2014-09-03', 2388.00, 'DDHM'),
			(5, '043021093', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021094', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021095', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021096', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021097', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021098', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021099', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021100', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021101', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),
			(5, '043021102', 'SERIALNUMBER', 4, 'room', 1, '2014-07-16', 2057.00, 'DDHM'),

			/*********  OKI B431 *********/
			(6, '043024680', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024681', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024682', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024683', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024684', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024685', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024686', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024687', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024688', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024689', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024690', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024691', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024692', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024693', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024694', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024695', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024696', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024697', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024698', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024699', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024700', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024701', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024702', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024703', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024704', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024705', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024706', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024707', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024708', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024709', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024710', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024711', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024712', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024713', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024714', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024715', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024716', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024717', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024718', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024719', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024720', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024721', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024722', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024723', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024724', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024725', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024726', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024727', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024728', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024729', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024730', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024731', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024732', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024733', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024734', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024735', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024736', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024737', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024738', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024739', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024740', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024741', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024742', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024743', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024744', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024745', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024746', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024747', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024748', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024749', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024750', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024751', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024752', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024753', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024754', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024755', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024756', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024757', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024758', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024759', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024760', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),		
			(6, '043024761', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024762', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024763', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024764', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024765', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024766', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024767', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024768', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),
			(6, '043024769', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),		
			(6, '043024770', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024771', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024772', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024773', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024774', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024775', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024776', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024777', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024778', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),			
			(6, '043024779', 'SERIALNUMBER', 4, 'room', 1, '2014-12-18', 1825.89, 'DDHM'),

			/*********  OKI B432 *********/
			(1, '043030440', 'SERIALNUMBER', 4, 'room', 1, '2017-04-21', 3551.35, 'DHM'),
			(1, '043030441', 'SERIALNUMBER', 4, 'room', 1, '2017-04-21', 3551.35, 'DHM'),
			(1, '043030442', 'SERIALNUMBER', 4, 'room', 1, '2017-04-21', 3551.35, 'DHM'),
			(1, '043030443', 'SERIALNUMBER', 4, 'room', 1, '2017-04-21', 3551.35, 'DHM'),
			(1, '043030444', 'SERIALNUMBER', 4, 'room', 1, '2017-04-21', 3551.35, 'DHM'),
			(1, '043030524', 'SERIALNUMBER', 4, 'room', 1, '2017-05-11', 3551.35, 'DHM'),
			(1, '043030525', 'SERIALNUMBER', 4, 'room', 1, '2017-05-11', 3551.35, 'DHM'),
			(1, '043030526', 'SERIALNUMBER', 4, 'room', 1, '2017-05-11', 3551.35, 'DHM'),
			(1, '043042148', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 5149.76, 'DHM'),
			(1, '043042149', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 5149.76, 'DHM'),
			(1, '043042150', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 5149.76, 'DHM'),
			(1, '043042151', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 5149.76, 'DHM'),
			(1, '043042152', 'SERIALNUMBER', 4, 'room', 1, '2020-05-13', 5149.76, 'DHM'),
			(1, '043043163', 'SERIALNUMBER', 4, 'room', 1, '2020-06-22', 5149.76, 'DHM'),
			(1, '043043164', 'SERIALNUMBER', 4, 'room', 1, '2020-06-22', 5149.76, 'DHM'),
			(1, '043043165', 'SERIALNUMBER', 4, 'room', 1, '2020-06-22', 5149.76, 'DHM'),
			(1, '043043166', 'SERIALNUMBER', 4, 'room', 1, '2020-06-22', 5149.76, 'DHM'),
			(1, '043043275', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043276', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043277', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043278', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043279', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043280', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043281', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043282', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043283', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043284', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043285', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043286', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043287', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043288', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043289', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043290', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043291', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043292', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043293', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043294', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043295', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043296', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043297', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043298', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043299', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043300', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043301', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043302', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043303', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043304', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043305', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043306', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043307', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043308', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043309', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043310', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043311', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043312', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043313', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043314', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043315', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043316', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043317', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043318', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043319', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043320', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043321', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043322', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043323', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043324', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043325', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043326', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043327', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043328', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043329', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043330', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043331', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043332', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043333', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043334', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043335', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043336', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043337', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043338', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043339', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043340', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043341', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043342', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043343', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043344', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043345', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043346', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043347', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043348', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043349', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043350', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043351', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043352', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043353', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043354', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043355', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043356', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043357', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043358', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043359', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043360', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043361', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043362', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043363', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043364', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043365', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043366', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043367', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043368', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043369', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043370', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043371', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043372', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043373', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043374', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043375', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043376', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043377', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043378', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043379', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043380', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043381', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043382', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043383', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043384', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043385', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043386', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043387', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043388', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043389', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043390', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043391', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043392', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043393', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),			
			(1, '043043394', 'SERIALNUMBER', 4, 'room', 1, '2020-07-17', 5149.76, 'DHM'),

			/*********  OKI B410 *********/
			(3, '043015704', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015723', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015727', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015728', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015729', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015733', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015740', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015741', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015742', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015743', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015744', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015746', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015752', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015755', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015756', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015757', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015760', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015764', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015765', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015768', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015772', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015774', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015775', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015776', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015777', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015780', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015781', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015782', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015783', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015786', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015787', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015789', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015792', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015795', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015797', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015806', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015807', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015810', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015814', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015816', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015819', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015828', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015829', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015831', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043015839', 'SERIALNUMBER', 4, 'room', 1, '2013-09-01', 2388.00, 'DDHM'),
			(3, '043016911', 'SERIALNUMBER', 4, 'room', 1, '2014-09-03', 2388.00, 'DDHM')

GO