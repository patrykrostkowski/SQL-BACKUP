USE [sqldb-ods-dev]
GO
/****** Object:  Table [Survey].[PolicySurvey]    Script Date: 28.10.2022 12:27:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Survey].[PolicySurvey](
	[PolicySurveySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[SurveyName] [varchar](50) NOT NULL,
	[SurveyDesc] [varchar](100) NULL,
	[EffectiveDate] [date] NOT NULL,
	[ExpirationDate] [date] NULL,
	[IsActiveInd] [tinyint] NULL,
 CONSTRAINT [PK_PolicySurvey] PRIMARY KEY CLUSTERED 
(
	[PolicySurveySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_PolicySurvey]    Script Date: 28.10.2022 12:27:46 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_PolicySurvey] ON [Survey].[PolicySurvey]
(
	[SourceSystemSK] ASC,
	[SourceCode] ASC,
	[ProcessDateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Policy Survey' , @level0type=N'SCHEMA',@level0name=N'Survey', @level1type=N'TABLE',@level1name=N'PolicySurvey'
GO
