USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[InsurableObjectType]    Script Date: 31.10.2022 11:58:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[InsurableObjectType](
	[InsurableObjectTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[InsurableObjectTypeCode] [varchar](20) NOT NULL,
	[InsurableObjectTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InsurableObjectType] PRIMARY KEY CLUSTERED 
(
	[InsurableObjectTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[InsurableObjectType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_InsurableObjectType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[InsurableObjectType] CHECK CONSTRAINT [FK_SourceSystemSK_InsurableObjectType]
GO
