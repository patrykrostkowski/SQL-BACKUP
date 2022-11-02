USE [DataMagnifier]
GO
/****** Object:  Table [Claim].[Catastrophe]    Script Date: 02.11.2022 14:05:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Claim].[Catastrophe](
	[CatastropheSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[CatastropheName] [varchar](60) NULL,
	[CatastropheNum] [varchar](60) NULL,
	[CatastropheValidFromDate] [date] NULL,
	[CatastropheValidToDate] [date] NULL,
	[CatastropheTypeSK] [int] NULL,
	[CatastropheDesc] [varchar](255) NULL,
	[IsActiveInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_Catastrophe] PRIMARY KEY CLUSTERED 
(
	[CatastropheSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Claim].[Catastrophe]  WITH CHECK ADD  CONSTRAINT [FK_CatastropheTypeSK_Catastrophe] FOREIGN KEY([CatastropheTypeSK])
REFERENCES [TypeList].[CatastropheType] ([CatastropheTypeSK])
GO
ALTER TABLE [Claim].[Catastrophe] CHECK CONSTRAINT [FK_CatastropheTypeSK_Catastrophe]
GO
ALTER TABLE [Claim].[Catastrophe]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Catastrophe] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Claim].[Catastrophe] CHECK CONSTRAINT [FK_SourceSystemSK_Catastrophe]
GO
