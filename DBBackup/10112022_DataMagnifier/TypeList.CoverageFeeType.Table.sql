USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CoverageFeeType]    Script Date: 10.11.2022 14:35:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[CoverageFeeType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[CoverageFeeType](
	[CoverageFeeTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageFeeTypeCode] [varchar](20) NOT NULL,
	[CoverageFeeTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_CoverageFeeType] PRIMARY KEY CLUSTERED 
(
	[CoverageFeeTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CoverageFeeType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CoverageFeeType]'))
ALTER TABLE [TypeList].[CoverageFeeType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CoverageFeeType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CoverageFeeType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CoverageFeeType]'))
ALTER TABLE [TypeList].[CoverageFeeType] CHECK CONSTRAINT [FK_SourceSystemSK_CoverageFeeType]
GO
