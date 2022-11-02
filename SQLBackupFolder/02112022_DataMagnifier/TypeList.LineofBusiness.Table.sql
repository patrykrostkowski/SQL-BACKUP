USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LineofBusiness]    Script Date: 02.11.2022 14:37:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[LineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LineofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_LineofBusiness]
GO
