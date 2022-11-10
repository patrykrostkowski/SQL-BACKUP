USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PolicyTransType]    Script Date: 10.11.2022 14:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[PolicyTransType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[PolicyTransType](
	[PolicyTransTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PolicyTransTypeCode] [varchar](20) NOT NULL,
	[PolicyTransTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PolicyTransType] PRIMARY KEY CLUSTERED 
(
	[PolicyTransTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PolicyTransType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PolicyTransType]'))
ALTER TABLE [TypeList].[PolicyTransType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PolicyTransType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PolicyTransType]'))
ALTER TABLE [TypeList].[PolicyTransType] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransType]
GO
