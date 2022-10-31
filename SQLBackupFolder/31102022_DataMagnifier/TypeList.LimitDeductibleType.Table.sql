USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LimitDeductibleType]    Script Date: 31.10.2022 12:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LimitDeductibleType](
	[LimitDeductibleTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LimitDeductibleTypeCode] [varchar](20) NOT NULL,
	[LimitDeductibleTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_LimitDeductibleType] PRIMARY KEY CLUSTERED 
(
	[LimitDeductibleTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LimitDeductibleType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LimitDeductibleType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LimitDeductibleType] CHECK CONSTRAINT [FK_SourceSystemSK_LimitDeductibleType]
GO
