USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PayeeType]    Script Date: 18.11.2022 16:51:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PayeeType](
	[PayeeTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PayeeTypeCode] [varchar](20) NOT NULL,
	[PayeeTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_PayeeType] PRIMARY KEY CLUSTERED 
(
	[PayeeTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PayeeType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PayeeType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PayeeType] CHECK CONSTRAINT [FK_SourceSystemSK_PayeeType]
GO
