USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[RevenueCode]    Script Date: 10.11.2022 14:36:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[RevenueCode]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[RevenueCode](
	[RevenueCodeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[RevenueCodeName] [varchar](50) NOT NULL,
	[RevenueCodeDesc] [varchar](100) NULL,
 CONSTRAINT [PK_RevenueCode] PRIMARY KEY CLUSTERED 
(
	[RevenueCodeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_RevenueCode]') AND parent_object_id = OBJECT_ID(N'[TypeList].[RevenueCode]'))
ALTER TABLE [TypeList].[RevenueCode]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_RevenueCode] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_RevenueCode]') AND parent_object_id = OBJECT_ID(N'[TypeList].[RevenueCode]'))
ALTER TABLE [TypeList].[RevenueCode] CHECK CONSTRAINT [FK_SourceSystemSK_RevenueCode]
GO
