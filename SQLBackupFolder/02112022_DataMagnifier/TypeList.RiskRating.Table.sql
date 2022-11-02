USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[RiskRating]    Script Date: 02.11.2022 09:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[RiskRating](
	[RiskRatingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[RiskRatingCode] [varchar](20) NOT NULL,
	[RiskRatingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_RiskRating] PRIMARY KEY CLUSTERED 
(
	[RiskRatingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
