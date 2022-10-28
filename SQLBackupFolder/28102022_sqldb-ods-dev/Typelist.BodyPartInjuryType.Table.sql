USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[BodyPartInjuryType]    Script Date: 28.10.2022 12:27:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[BodyPartInjuryType](
	[BodyPartInjuryTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BodyPartInjuryTypeCode] [varchar](20) NOT NULL,
	[BodyPartInjuryTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BodyPartInjury] PRIMARY KEY CLUSTERED 
(
	[BodyPartInjuryTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK_BodyPartInjury]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK_BodyPartInjury] ON [Typelist].[BodyPartInjuryType]
(
	[BodyPartInjuryTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[BodyPartInjuryType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1078] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[BodyPartInjuryType] NOCHECK CONSTRAINT [RefSourceSystem1078]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An industry code that corresponds to the affected body part. 
There are multiple sources for this code list such as the Workers Compensation Insurance Organizations (WCIO) or Occupational Safety and
 Health Administration (OSHA).' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'BodyPartInjuryType'
GO
