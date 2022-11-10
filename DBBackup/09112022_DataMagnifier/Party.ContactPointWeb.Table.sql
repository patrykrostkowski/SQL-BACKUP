USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointWeb]    Script Date: 10.11.2022 14:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[ContactPointWeb]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointWeb]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointWeb]'))
ALTER TABLE [Party].[ContactPointWeb]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointWeb] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointWeb]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointWeb]'))
ALTER TABLE [Party].[ContactPointWeb] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointWeb]
GO
