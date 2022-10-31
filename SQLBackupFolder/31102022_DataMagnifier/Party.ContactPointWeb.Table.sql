USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointWeb]    Script Date: 31.10.2022 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointWeb](
	[ContactPointWebSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ContactPointSK] [int] NOT NULL,
	[WebURLName] [varchar](50) NOT NULL,
	[WebURLDesc] [varchar](100) NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointWeb] PRIMARY KEY CLUSTERED 
(
	[ContactPointWebSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointWeb]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointWeb] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointWeb] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointWeb]
GO
