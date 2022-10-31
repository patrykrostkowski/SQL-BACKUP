USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[FlaggedType]    Script Date: 31.10.2022 13:29:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[FlaggedType](
	[FlaggedTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FlaggedTypeCode] [varchar](20) NOT NULL,
	[FlaggedTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FlaggedType] PRIMARY KEY CLUSTERED 
(
	[FlaggedTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[FlaggedType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FlaggedType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[FlaggedType] CHECK CONSTRAINT [FK_SourceSystemSK_FlaggedType]
GO
