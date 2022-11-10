USE [DataMagnifier]
GO
/****** Object:  Table [Finance].[ClaimReserve]    Script Date: 10.11.2022 14:20:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Finance].[ClaimReserve]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_BaseCurrencySK_ClaimReserve] FOREIGN KEY([BaseCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_BaseCurrencySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_BaseCurrencySK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ClaimSK_ClaimReserve] FOREIGN KEY([ClaimSK])
REFERENCES [Claim].[Claim] ([ClaimSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ClaimSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ClaimSK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_LossOccurrenceSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_LossOccurrenceSK_ClaimReserve] FOREIGN KEY([LossOccurrenceSK])
REFERENCES [Claim].[LossOccurrence] ([LossOccurrenceSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_LossOccurrenceSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_LossOccurrenceSK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_OriginalCurrencySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_OriginalCurrencySK_ClaimReserve] FOREIGN KEY([OriginalCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_OriginalCurrencySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_OriginalCurrencySK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReportingCurrencySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ReportingCurrencySK_ClaimReserve] FOREIGN KEY([ReportingCurrencySK])
REFERENCES [TypeList].[Currency] ([CurrencySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReportingCurrencySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ReportingCurrencySK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReserveCategorySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ReserveCategorySK_ClaimReserve] FOREIGN KEY([ReserveCategorySK])
REFERENCES [TypeList].[ReserveCategory] ([ReserveCategorySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReserveCategorySK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ReserveCategorySK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReserveCostSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_ReserveCostSK_ClaimReserve] FOREIGN KEY([ReserveCostSK])
REFERENCES [TypeList].[CostType] ([CostTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_ReserveCostSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_ReserveCostSK_ClaimReserve]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimReserve] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Finance].[FK_SourceSystemSK_ClaimReserve]') AND parent_object_id = OBJECT_ID(N'[Finance].[ClaimReserve]'))
ALTER TABLE [Finance].[ClaimReserve] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimReserve]
GO
