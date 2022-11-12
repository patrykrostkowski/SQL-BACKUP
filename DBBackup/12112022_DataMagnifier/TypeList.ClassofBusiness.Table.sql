USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClassofBusiness]    Script Date: 12.11.2022 09:01:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ClassofBusiness]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[ClassofBusiness](
	[ClassofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClassofBusinessCode] [varchar](20) NOT NULL,
	[ClassofBusinessName] [varchar](50) NULL,
 CONSTRAINT [PK_ClassofBusiness] PRIMARY KEY CLUSTERED 
(
	[ClassofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClassofBusiness]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClassofBusiness]'))
ALTER TABLE [TypeList].[ClassofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClassofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClassofBusiness]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClassofBusiness]'))
ALTER TABLE [TypeList].[ClassofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_ClassofBusiness]
GO
