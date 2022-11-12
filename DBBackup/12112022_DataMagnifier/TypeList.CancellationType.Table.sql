USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CancellationType]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[CancellationType]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[CancellationType](
	[CancellationTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CancellationTypeCode] [varchar](20) NOT NULL,
	[CancellationTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CancellationType] PRIMARY KEY CLUSTERED 
(
	[CancellationTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CancellationType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CancellationType]'))
ALTER TABLE [TypeList].[CancellationType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CancellationType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_CancellationType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[CancellationType]'))
ALTER TABLE [TypeList].[CancellationType] CHECK CONSTRAINT [FK_SourceSystemSK_CancellationType]
GO
