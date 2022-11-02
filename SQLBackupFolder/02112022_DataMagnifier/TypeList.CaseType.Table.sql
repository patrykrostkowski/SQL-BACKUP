USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CaseType]    Script Date: 02.11.2022 13:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CaseType](
	[CaseTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CaseTypeCode] [varchar](20) NOT NULL,
	[CaseTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CaseType] PRIMARY KEY CLUSTERED 
(
	[CaseTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[CaseType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CaseType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CaseType] CHECK CONSTRAINT [FK_SourceSystemSK_CaseType]
GO
