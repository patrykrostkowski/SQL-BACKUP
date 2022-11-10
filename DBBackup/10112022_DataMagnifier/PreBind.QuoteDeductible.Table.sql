USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteDeductible]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteDeductible](
	[QuoteDeductibleSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[QuoteTransSK] [int] NULL,
	[QuoteCoverageSK] [int] NULL,
	[DeductibleLevelSK] [int] NOT NULL,
	[DeductibleValue] [varchar](50) NOT NULL,
	[DeductibleTypeSK] [int] NOT NULL,
	[DeductibleDesc] [varchar](256) NULL,
 CONSTRAINT [PK_QuoteDeductible] PRIMARY KEY CLUSTERED 
(
	[QuoteDeductibleSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteDeductible]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]'))
ALTER TABLE [PreBind].[QuoteDeductible]  WITH CHECK ADD  CONSTRAINT [FK_QuoteCoverageSK_QuoteDeductible] FOREIGN KEY([QuoteCoverageSK])
REFERENCES [PreBind].[QuoteCoverage] ([QuoteCoverageSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteCoverageSK_QuoteDeductible]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]'))
ALTER TABLE [PreBind].[QuoteDeductible] CHECK CONSTRAINT [FK_QuoteCoverageSK_QuoteDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteDeductible]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]'))
ALTER TABLE [PreBind].[QuoteDeductible]  WITH CHECK ADD  CONSTRAINT [FK_QuoteTransSK_QuoteDeductible] FOREIGN KEY([QuoteTransSK])
REFERENCES [PreBind].[QuoteTrans] ([QuoteTransSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteTransSK_QuoteDeductible]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]'))
ALTER TABLE [PreBind].[QuoteDeductible] CHECK CONSTRAINT [FK_QuoteTransSK_QuoteDeductible]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteDeductible]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]'))
ALTER TABLE [PreBind].[QuoteDeductible]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_QuoteDeductible] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_SourceSystemSK_QuoteDeductible]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteDeductible]'))
ALTER TABLE [PreBind].[QuoteDeductible] CHECK CONSTRAINT [FK_SourceSystemSK_QuoteDeductible]
GO
