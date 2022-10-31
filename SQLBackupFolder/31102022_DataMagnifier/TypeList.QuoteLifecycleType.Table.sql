USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[QuoteLifecycleType]    Script Date: 31.10.2022 12:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[QuoteLifecycleType](
	[QuoteLifecycleTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[QuoteLifecycleTypeCode] [varchar](20) NOT NULL,
	[QuoteLifecycleTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_QuoteLifecycleType] PRIMARY KEY CLUSTERED 
(
	[QuoteLifecycleTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
