USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LineofBusiness]    Script Date: 10.11.2022 14:47:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[LineofBusiness]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[LineofBusiness](
	[LineofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LineofBusinessCode] [varchar](20) NOT NULL,
	[LineofBusinessName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LineofBusiness] PRIMARY KEY CLUSTERED 
(
	[LineofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_LineofBusiness]') AND parent_object_id = OBJECT_ID(N'[TypeList].[LineofBusiness]'))
ALTER TABLE [TypeList].[LineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_LineofBusiness]') AND parent_object_id = OBJECT_ID(N'[TypeList].[LineofBusiness]'))
ALTER TABLE [TypeList].[LineofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_LineofBusiness]
GO
