USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointPhone]    Script Date: 10.11.2022 14:36:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[ContactPointPhone]') AND type in (N'U'))
BEGIN
CREATE TABLE [Party].[ContactPointPhone](
	[ContactPointPhoneSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ContactPointSK] [int] NOT NULL,
	[PhoneNum] [varchar](20) NOT NULL,
	[PhoneExtension] [varchar](20) NULL,
	[PhoneTypeSK] [int] NULL,
	[IsPrimaryInd] [tinyint] NOT NULL,
 CONSTRAINT [PK_ContactPointPhone] PRIMARY KEY CLUSTERED 
(
	[ContactPointPhoneSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointPhone]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointPhone]'))
ALTER TABLE [Party].[ContactPointPhone]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointPhone] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_ContactPointSK_ContactPointPhone]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointPhone]'))
ALTER TABLE [Party].[ContactPointPhone] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointPhone]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PhoneTypeSK_ContactPointPhone]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointPhone]'))
ALTER TABLE [Party].[ContactPointPhone]  WITH CHECK ADD  CONSTRAINT [FK_PhoneTypeSK_ContactPointPhone] FOREIGN KEY([PhoneTypeSK])
REFERENCES [TypeList].[PhoneType] ([PhoneTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PhoneTypeSK_ContactPointPhone]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointPhone]'))
ALTER TABLE [Party].[ContactPointPhone] CHECK CONSTRAINT [FK_PhoneTypeSK_ContactPointPhone]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPointPhone]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointPhone]'))
ALTER TABLE [Party].[ContactPointPhone]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointPhone] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_SourceSystemSK_ContactPointPhone]') AND parent_object_id = OBJECT_ID(N'[Party].[ContactPointPhone]'))
ALTER TABLE [Party].[ContactPointPhone] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointPhone]
GO
