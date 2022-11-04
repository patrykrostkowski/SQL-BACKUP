USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClassofBusiness]    Script Date: 04.11.2022 15:25:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[ClassofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClassofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClassofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_ClassofBusiness]
GO
