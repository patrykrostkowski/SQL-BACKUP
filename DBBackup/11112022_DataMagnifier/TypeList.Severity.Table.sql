USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Severity]    Script Date: 12.11.2022 09:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[Severity]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[Severity](
	[SeveritySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SeverityCode] [varchar](20) NOT NULL,
	[SeverityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Severity] PRIMARY KEY CLUSTERED 
(
	[SeveritySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Severity]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Severity]'))
ALTER TABLE [TypeList].[Severity]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Severity] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Severity]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Severity]'))
ALTER TABLE [TypeList].[Severity] CHECK CONSTRAINT [FK_SourceSystemSK_Severity]
GO
