USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Organization]    Script Date: 31.10.2022 12:25:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Organization](
	[OrganizationSK] [int] IDENTITY(2,1) NOT NULL,
	[PartySK] [int] NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[OwnershipTypeSK] [int] NOT NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[OrganizationSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Party].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_OwnershipTypeSK_Organization] FOREIGN KEY([OwnershipTypeSK])
REFERENCES [TypeList].[OwnershipType] ([OwnershipTypeSK])
GO
ALTER TABLE [Party].[Organization] CHECK CONSTRAINT [FK_OwnershipTypeSK_Organization]
GO
ALTER TABLE [Party].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Organization] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
ALTER TABLE [Party].[Organization] CHECK CONSTRAINT [FK_PartySK_Organization]
GO
