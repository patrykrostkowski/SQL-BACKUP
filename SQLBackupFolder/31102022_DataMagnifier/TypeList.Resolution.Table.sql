USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Resolution]    Script Date: 31.10.2022 09:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[Resolution](
	[ResolutionSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ResolutionCode] [varchar](20) NOT NULL,
	[ResolutionName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Resolution] PRIMARY KEY CLUSTERED 
(
	[ResolutionSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[Resolution]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Resolution] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[Resolution] CHECK CONSTRAINT [FK_SourceSystemSK_Resolution]
GO
