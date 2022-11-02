USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PartyType]    Script Date: 02.11.2022 09:09:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PartyType](
	[PartyTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PartyTypeCode] [varchar](20) NOT NULL,
	[PartyTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PartyType] PRIMARY KEY CLUSTERED 
(
	[PartyTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PartyType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PartyType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PartyType] CHECK CONSTRAINT [FK_SourceSystemSK_PartyType]
GO
