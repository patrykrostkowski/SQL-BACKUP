USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Coverage]    Script Date: 02.11.2022 13:21:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[Coverage](
	[CoverageSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CoverageCode] [varchar](20) NOT NULL,
	[CoverageName] [varchar](50) NOT NULL,
	[ConformedCoverageCode] [varchar](20) NULL,
	[ConformedCoverageName] [varchar](50) NULL,
 CONSTRAINT [PK_Coverage] PRIMARY KEY CLUSTERED 
(
	[CoverageSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[Coverage]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Coverage] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[Coverage] CHECK CONSTRAINT [FK_SourceSystemSK_Coverage]
GO
