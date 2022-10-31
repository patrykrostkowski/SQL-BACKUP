USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ClaimReserve]    Script Date: 31.10.2022 12:01:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Finance].[ClaimReserve](
	[ClaimReserveSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ClaimSK] [int] NOT NULL,
	[LossOccurrenceSK] [int] NULL,
	[ReserveCategorySK] [int] NULL,
	[ReserveCostSK] [int] NULL,
	[BaseCurrencySK] [int] NULL,
	[OriginalCurrencySK] [int] NULL,
	[ReportingCurrencySK] [int] NULL,
	[ReserveBaseAmt] [decimal](19, 4) NULL,
	[ReserveOriginalAmt] [decimal](19, 4) NULL,
	[ReserveReportingAmt] [decimal](19, 4) NULL,
 CONSTRAINT [PK_ClaimReserve] PRIMARY KEY CLUSTERED 
(
	[ClaimReserveSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimReserve] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_BaseCurrencySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimReserve] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ClaimSK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimReserve] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimReserve] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimReserve] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ReserveCategorySK_ClaimReserve] FOREIGN KEY([ReserveCategorySK])
REFERENCES [TypeList].[ReserveCategory] ([ReserveCategorySK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ReserveCategorySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ReserveCostSK_ClaimReserve] FOREIGN KEY([ReserveCostSK])
REFERENCES [TypeList].[CostType] ([CostTypeSK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ReserveCostSK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimReserve] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimReserve]
GO
