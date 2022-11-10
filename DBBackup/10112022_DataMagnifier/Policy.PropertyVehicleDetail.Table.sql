USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PropertyVehicleDetail]    Script Date: 10.11.2022 14:36:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[PropertyVehicleDetail](
	[PropertyVehicleDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PropertySK] [int] NULL,
	[VehicleSK] [int] NULL,
	[PropertyStateSK] [int] NULL,
	[NatureInterestCode] [varchar](255) NULL,
	[NatureInterestDesc] [varchar](255) NULL,
	[InterestRank] [varchar](255) NULL,
	[InterestNum] [varchar](255) NULL,
	[InterestEndDate] [date] NULL,
	[IsPayorInd] [tinyint] NULL,
	[BillFrequencyCode] [varchar](255) NULL,
	[BillFrequencyDesc] [varchar](255) NULL,
	[CertificateFrequencyCode] [varchar](255) NULL,
	[CertificateFrequencyDesc] [varchar](255) NULL,
	[CertificateRequiredDate] [date] NULL,
	[CertificateIssuedDate] [date] NULL,
	[PolicyRequiredDate] [date] NULL,
	[PolicyIssuedDate] [date] NULL,
	[IsInformationalBillingInd] [tinyint] NULL,
	[PolicyFrequencyCode] [varchar](255) NULL,
	[PolicyFrequencyDesc] [varchar](255) NULL,
	[FinancedAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_PropertyVehicleDetail] PRIMARY KEY CLUSTERED 
(
	[PropertyVehicleDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PropertySK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_PropertySK_PropertyVehicleDetail] FOREIGN KEY([PropertySK])
REFERENCES [Policy].[Property] ([PropertySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PropertySK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_PropertySK_PropertyVehicleDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PropertyStateSK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStateSK_PropertyVehicleDetail] FOREIGN KEY([PropertyStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_PropertyStateSK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_PropertyStateSK_PropertyVehicleDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PropertyVehicleDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_SourceSystemSK_PropertyVehicleDetail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_PropertyVehicleDetail] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_VehicleSK_PropertyVehicleDetail]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyVehicleDetail]'))
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_VehicleSK_PropertyVehicleDetail]
GO
