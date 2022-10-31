USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PolicyTransType]    Script Date: 31.10.2022 12:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PolicyTransType](
	[PolicyTransTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PolicyTransTypeCode] [varchar](20) NOT NULL,
	[PolicyTransTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PolicyTransType] PRIMARY KEY CLUSTERED 
(
	[PolicyTransTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PolicyTransType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PolicyTransType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PolicyTransType] CHECK CONSTRAINT [FK_SourceSystemSK_PolicyTransType]
GO
