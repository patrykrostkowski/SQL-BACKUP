USE [sqldb-ods-dev]
GO
/****** Object:  Table [Finance].[ClaimReserve]    Script Date: 28.10.2022 11:09:40 ******/
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
	[CostTypeSK] [int] NOT NULL,
	[ReserveCategorySK] [int] NULL,
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_ClaimReserve]    Script Date: 28.10.2022 11:11:04 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_ClaimReserve] ON [Finance].[ClaimReserve]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimReserve] FOREIGN KEY([BaseCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_BaseCurrencySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimReserve] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_ClaimSK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_CostTypeSK_ClaimReserve] FOREIGN KEY([CostTypeSK])
REFERENCES [Typelist].[CostType] ([CostTypeSK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_CostTypeSK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimReserve] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimReserve] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimReserve] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [Typelist].[Currency] ([CurrencySK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_ReserveCategorySK_ClaimReserve] FOREIGN KEY([ReserveCategorySK])
REFERENCES [Typelist].[ReserveCategory] ([ReserveCategorySK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_ReserveCategorySK_ClaimReserve]
GO
ALTER TABLE [Finance].[ClaimReserve]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimReserve] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Finance].[ClaimReserve] NOCHECK CONSTRAINT [FK_SourceSystemSK_ClaimReserve]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This concept represents sums placed by the insurer in reserve to meet future commitments to the insured. This includes claims reserves: an estimated amount of money that is reserved in a fund and used to pay benefits for unsettled claims or known future claims. Claims reserves are an indication of the insurer''s known liabilities and appear on the insurer''s balance sheet as liabilities. Reserves can be modified through a claim''s life cycle and are typically kept for history.' , @level0type=N'SCHEMA',@level0name=N'Finance', @level1type=N'TABLE',@level1name=N'ClaimReserve'
GO
