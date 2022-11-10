USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointEmail]    Script Date: 10.11.2022 14:47:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[ContactPointEmail]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointEmail]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointEmail]'))
ALTER TABLE [Party].[ContactPointEmail]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointEmail] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointEmail]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointEmail]'))
ALTER TABLE [Party].[ContactPointEmail] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointEmail]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPointEmail]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointEmail]'))
ALTER TABLE [Party].[ContactPointEmail]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointEmail] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPointEmail]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointEmail]'))
ALTER TABLE [Party].[ContactPointEmail] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointEmail]
GO
