USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[ClaimCategoryType]    Script Date: 28.10.2022 15:05:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[ClaimCategoryType](
	[ClaimCategoryTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimCategoryTypeCode] [varchar](20) NOT NULL,
	[ClaimCategoryTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimCategoryType] PRIMARY KEY CLUSTERED 
(
	[ClaimCategoryTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[SourceSystemSK] ASC,
	[ClaimCategoryTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[ClaimCategoryType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1068] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[ClaimCategoryType] NOCHECK CONSTRAINT [RefSourceSystem1068]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table contains current information about Claim Categories, which are classifications of claims determined by the Insurance Company.  Examples include : First Aid, Express Claim, Medical Only - Minor, Medical Only-Moderate, Medical Only - High, Triage - Initial Investigation, Triage - Claims Assessment, Indemnity, Liens Only, Void, Pending, and Notice Only.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'ClaimCategoryType'
GO
