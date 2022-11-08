USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[BusinessUnit]    Script Date: 08.11.2022 08:11:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[BusinessUnit](
	[BusinessUnitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[BusinessUnitCode] [varchar](20) NOT NULL,
	[BusinessUnitName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_BusinessUnit] PRIMARY KEY CLUSTERED 
(
	[BusinessUnitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[BusinessUnit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_BusinessUnit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[BusinessUnit] CHECK CONSTRAINT [FK_SourceSystemSK_BusinessUnit]
GO
