USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[InjuryCauseType]    Script Date: 27.10.2022 12:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[InjuryCauseType](
	[InjuryCauseTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[InjuryCauseTypeCode] [varchar](20) NOT NULL,
	[InjuryCauseTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InjuryCauseType] PRIMARY KEY CLUSTERED 
(
	[InjuryCauseTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_InjuryCauseType]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_InjuryCauseType] ON [Typelist].[InjuryCauseType]
(
	[InjuryCauseTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[InjuryCauseType]  WITH NOCHECK ADD  CONSTRAINT [FK_SourceSystemSK_InjuryCauseType] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[InjuryCauseType] NOCHECK CONSTRAINT [FK_SourceSystemSK_InjuryCauseType]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'For bodily injury the nature of industry associated with Workers comp.  Examples Terrorism, Animal or Insect, Struck By or Injured By, Pandemic, Struck By Machine' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'InjuryCauseType'
GO
