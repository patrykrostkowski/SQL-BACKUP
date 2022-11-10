USE [DataMagnifier]
GO
/****** Object:  Table [Party].[Organization]    Script Date: 10.11.2022 14:43:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Party].[Organization]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_OwnershipTypeSK_Organization]') AND parent_object_id = OBJECT_ID(N'[Party].[Organization]'))
ALTER TABLE [Party].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_OwnershipTypeSK_Organization] FOREIGN KEY([OwnershipTypeSK])
REFERENCES [TypeList].[OwnershipType] ([OwnershipTypeSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_OwnershipTypeSK_Organization]') AND parent_object_id = OBJECT_ID(N'[Party].[Organization]'))
ALTER TABLE [Party].[Organization] CHECK CONSTRAINT [FK_OwnershipTypeSK_Organization]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Organization]') AND parent_object_id = OBJECT_ID(N'[Party].[Organization]'))
ALTER TABLE [Party].[Organization]  WITH CHECK ADD  CONSTRAINT [FK_PartySK_Organization] FOREIGN KEY([PartySK])
REFERENCES [Party].[PartyMaster] ([PartySK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Party].[FK_PartySK_Organization]') AND parent_object_id = OBJECT_ID(N'[Party].[Organization]'))
ALTER TABLE [Party].[Organization] CHECK CONSTRAINT [FK_PartySK_Organization]
GO
