USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuotePropertyVehicleDetail]    Script Date: 10.11.2022 13:56:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PreBind].[QuotePropertyVehicleDetail](
	[QuotePropertyVehicleDetailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuotePropertySK] [int] NOT NULL,
	[QuoteVehicleSK] [int] NOT NULL,
	[PropertyStateCode] [varchar](25) NULL,
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
 CONSTRAINT [PK_QuotePropertyVehicleDetail] PRIMARY KEY CLUSTERED 
(
	[QuotePropertyVehicleDetailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [PreBind].[QuotePropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuotePropertySK_QuotePropertyVehicleDetail] FOREIGN KEY([QuotePropertySK])
REFERENCES [PreBind].[QuoteProperty] ([QuotePropertySK])
GO
ALTER TABLE [PreBind].[QuotePropertyVehicleDetail] CHECK CONSTRAINT [FK_QuotePropertySK_QuotePropertyVehicleDetail]
GO
ALTER TABLE [PreBind].[QuotePropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_QuoteVehicleSK_QuotePropertyVehicleDetail] FOREIGN KEY([QuoteVehicleSK])
REFERENCES [PreBind].[QuoteVehicle] ([QuoteVehicleSK])
GO
ALTER TABLE [PreBind].[QuotePropertyVehicleDetail] CHECK CONSTRAINT [FK_QuoteVehicleSK_QuotePropertyVehicleDetail]
GO
ALTER TABLE [PreBind].[QuotePropertyVehicleDetail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuotePropertyVehicleDetail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [PreBind].[QuotePropertyVehicleDetail] CHECK CONSTRAINT [FK_SourceSystemSK_QuotePropertyVehicleDetail]
GO
