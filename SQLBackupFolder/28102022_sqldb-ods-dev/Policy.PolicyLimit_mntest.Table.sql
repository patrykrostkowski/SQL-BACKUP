USE [sqldb-ods-dev]
GO
/****** Object:  Table [Policy].[PolicyLimit_mntest]    Script Date: 28.10.2022 15:04:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PolicyLimit_mntest](
	[LimitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyTransSK] [int] NOT NULL,
	[PolicyLineofBusinessSK] [int] NULL,
	[PolicyGeographySK] [int] NULL,
	[PolicyInsurableObjectSK] [int] NULL,
	[PolicyCoverageSK] [int] NULL,
	[LimitLevelSK] [int] NULL,
	[BaseCurrencySK] [int] NOT NULL,
	[LimitTypeSK] [int] NULL,
	[LimitValue] [varchar](100) NULL,
	[LimitDesc] [varchar](255) NULL,
	[LimitOptionName] [varchar](50) NULL,
 CONSTRAINT [PK_PolicyLimit_mntest] PRIMARY KEY CLUSTERED 
(
	[LimitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
