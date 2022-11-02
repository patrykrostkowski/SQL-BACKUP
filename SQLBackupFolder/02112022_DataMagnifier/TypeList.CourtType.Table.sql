USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CourtType]    Script Date: 02.11.2022 12:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CourtType](
	[CourtTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CourtTypeCode] [varchar](20) NOT NULL,
	[CourtTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CourtType] PRIMARY KEY CLUSTERED 
(
	[CourtTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[CourtType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CourtType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CourtType] CHECK CONSTRAINT [FK_SourceSystemSK_CourtType]
GO
