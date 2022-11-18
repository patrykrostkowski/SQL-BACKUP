USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[HouseholdContent]    Script Date: 18.11.2022 16:40:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[HouseholdContent](
	[HouseholdContentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_HouseholdContent] PRIMARY KEY NONCLUSTERED 
(
	[HouseholdContentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[HouseholdContent]  WITH CHECK ADD  CONSTRAINT [FK_IMTransportationClassSK_HouseholdContent] FOREIGN KEY([IMTransportationClassSK])
REFERENCES [Policy].[IMTransportationClass] ([IMTransportationClassSK])
GO
ALTER TABLE [Policy].[HouseholdContent] CHECK CONSTRAINT [FK_IMTransportationClassSK_HouseholdContent]
GO
ALTER TABLE [Policy].[HouseholdContent]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_HouseholdContent] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[HouseholdContent] CHECK CONSTRAINT [FK_SourceSystemSK_HouseholdContent]
GO
