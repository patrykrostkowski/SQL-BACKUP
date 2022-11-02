USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Severity]    Script Date: 02.11.2022 09:25:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[Severity]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Severity] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[Severity] CHECK CONSTRAINT [FK_SourceSystemSK_Severity]
GO
