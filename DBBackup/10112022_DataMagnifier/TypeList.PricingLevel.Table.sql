USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PricingLevel]    Script Date: 10.11.2022 14:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[PricingLevel]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[PricingLevel](
	[PricingLevelSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PricingLevelCode] [varchar](20) NOT NULL,
	[PricingLevelName] [varchar](50) NULL,
	[PricingLevelDesc] [varchar](255) NOT NULL,
 CONSTRAINT [PK_PricingLevel] PRIMARY KEY CLUSTERED 
(
	[PricingLevelSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
