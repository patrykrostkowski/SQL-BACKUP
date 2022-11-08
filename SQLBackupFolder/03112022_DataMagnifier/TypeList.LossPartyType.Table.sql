USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossPartyType]    Script Date: 08.11.2022 08:47:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LossPartyType](
	[LossPartyTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossPartyTypeCode] [varchar](20) NOT NULL,
	[LossPartyTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossPartyType] PRIMARY KEY CLUSTERED 
(
	[LossPartyTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LossPartyType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossPartyType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LossPartyType] CHECK CONSTRAINT [FK_SourceSystemSK_LossPartyType]
GO
