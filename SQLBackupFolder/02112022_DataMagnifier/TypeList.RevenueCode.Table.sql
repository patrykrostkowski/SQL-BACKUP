USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[RevenueCode]    Script Date: 02.11.2022 09:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[RevenueCode]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_RevenueCode] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[RevenueCode] CHECK CONSTRAINT [FK_SourceSystemSK_RevenueCode]
GO
