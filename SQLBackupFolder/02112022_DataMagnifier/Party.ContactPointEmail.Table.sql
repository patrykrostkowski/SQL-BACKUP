USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointEmail]    Script Date: 02.11.2022 14:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[ContactPointEmail](
	[ContactPointEmailSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ContactPointSK] [int] NOT NULL,
	[EmailAddress] [varchar](50) NOT NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointEmail] PRIMARY KEY CLUSTERED 
(
	[ContactPointEmailSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[ContactPointEmail]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointEmail] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointEmail] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointEmail]
GO
ALTER TABLE [Party].[ContactPointEmail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointEmail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPointEmail] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointEmail]
GO
