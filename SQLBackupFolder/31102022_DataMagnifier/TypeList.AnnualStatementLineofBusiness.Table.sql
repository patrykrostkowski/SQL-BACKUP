USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AnnualStatementLineofBusiness]    Script Date: 31.10.2022 12:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[AnnualStatementLineofBusiness](
	[AnnualStatementLineofBusinessSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AnnualStatementLineofBusinessCode] [varchar](20) NOT NULL,
	[AnnualStatementLineofBusinessName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AnnualStatementLineofBusiness] PRIMARY KEY CLUSTERED 
(
	[AnnualStatementLineofBusinessSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[AnnualStatementLineofBusiness]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AnnualStatementLineofBusiness] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[AnnualStatementLineofBusiness] CHECK CONSTRAINT [FK_SourceSystemSK_AnnualStatementLineofBusiness]
GO
