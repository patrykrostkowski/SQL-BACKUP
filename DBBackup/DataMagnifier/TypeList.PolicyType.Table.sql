USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PolicyType]    Script Date: 10.11.2022 13:56:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PolicyType](
	[PolicyTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PolicyTypeCode] [varchar](20) NOT NULL,
	[PolicyTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PolicyType] PRIMARY KEY CLUSTERED 
(
	[PolicyTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PolicyType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PolicyType] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyType]
GO
