USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[CoverageClass]    Script Date: 27.10.2022 12:27:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[CoverageClass](
	[CoverageClassSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageClassCode] [varchar](20) NOT NULL,
	[CoverageClassName] [varchar](50) NOT NULL,
	[IsStatCodeInd] [tinyint] NULL,
	[IsJobClassInd] [tinyint] NULL,
 CONSTRAINT [PK_CoverageClass] PRIMARY KEY CLUSTERED 
(
	[CoverageClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_CoverageClass]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_CoverageClass] ON [Typelist].[CoverageClass]
(
	[SourceSystemSK] ASC,
	[CoverageClassCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[CoverageClass]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageClass] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[CoverageClass] NOCHECK CONSTRAINT [FK_SourceSystemSK_CoverageClass]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'examples chemical, casualty primary, ceded reinsurance, Not a Long Term Claim, Permanent Total Disability - Settled, Life Pension - Settled, Life Pension in Review Permanent Total Disability, Death Due to Injury, Death Not Due to Injury, and  Other Long Term Claim.  Many are classified as long term claim coverages  that go beyond the care needed to immediately remedy a covered medical loss, including death.  Valid ' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'CoverageClass'
GO
