USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PropertyVehicleDetail]    Script Date: 02.11.2022 12:54:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_PropertySK_PropertyVehicleDetail] FOREIGN KEY([PropertySK])
REFERENCES [Policy].[Property] ([PropertySK])
GO
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_PropertySK_PropertyVehicleDetail]
GO
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_PropertyStateSK_PropertyVehicleDetail] FOREIGN KEY([PropertyStateSK])
REFERENCES [TypeList].[State] ([StateSK])
GO
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_PropertyStateSK_PropertyVehicleDetail]
GO
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PropertyVehicleDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_SourceSystemSK_PropertyVehicleDetail]
GO
ALTER TABLE [Policy].[PropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_VehicleSK_PropertyVehicleDetail] FOREIGN KEY([VehicleSK])
REFERENCES [Policy].[Vehicle] ([VehicleSK])
GO
ALTER TABLE [Policy].[PropertyVehicleDetail] CHECK CONSTRAINT [FK_VehicleSK_PropertyVehicleDetail]
GO
