USE [DataMagnifier]
GO
/****** Object:  Table [Party].[ContactPointPhone]    Script Date: 02.11.2022 09:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [Party].[ContactPointPhone]  WITH CHECK ADD  CONSTRAINT [FK_ContactPointSK_ContactPointPhone] FOREIGN KEY([ContactPointSK])
REFERENCES [Party].[ContactPoint] ([ContactPointSK])
GO
ALTER TABLE [Party].[ContactPointPhone] CHECK CONSTRAINT [FK_ContactPointSK_ContactPointPhone]
GO
ALTER TABLE [Party].[ContactPointPhone]  WITH CHECK ADD  CONSTRAINT [FK_PhoneTypeSK_ContactPointPhone] FOREIGN KEY([PhoneTypeSK])
REFERENCES [TypeList].[PhoneType] ([PhoneTypeSK])
GO
ALTER TABLE [Party].[ContactPointPhone] CHECK CONSTRAINT [FK_PhoneTypeSK_ContactPointPhone]
GO
ALTER TABLE [Party].[ContactPointPhone]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ContactPointPhone] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Party].[ContactPointPhone] CHECK CONSTRAINT [FK_SourceSystemSK_ContactPointPhone]
GO
