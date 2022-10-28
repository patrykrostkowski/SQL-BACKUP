USE [sqldb-ods-dev]
GO
/****** Object:  Table [gentd].[input_data_icw]    Script Date: 28.10.2022 11:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [gentd].[input_data_icw](
	[RqUID] [nvarchar](255) NULL,
	[PriorRqUID] [nvarchar](255) NULL,
	[Category] [float] NULL,
	[TransXML] [nvarchar](max) NULL,
	[StatusCd] [nvarchar](max) NULL,
	[LoadCd] [nvarchar](max) NULL,
	[TransactionType] [nvarchar](max) NULL,
	[ClaimNumber] [nvarchar](max) NULL,
	[ClaimantNumber] [nvarchar](max) NULL,
	[PolicyNumber] [nvarchar](max) NULL,
	[PolicyEffectiveDate] [datetime] NULL,
	[EndorsementNumber] [nvarchar](max) NULL,
	[TransactionEffDate] [datetime] NULL,
	[AccountingDate] [nvarchar](max) NULL,
	[ClientID] [nvarchar](max) NULL,
	[InsertDateTime] [datetime] NULL,
	[InAccountingPeriod] [nvarchar](max) NULL,
	[RefAccountingPeriod] [nvarchar](max) NULL,
	[InsSvcRquid] [nvarchar](255) NULL,
	[ExpirationIndicator] [nvarchar](max) NULL,
	[ExpirationDate] [nvarchar](max) NULL,
	[ExpirationReasonCd] [nvarchar](max) NULL,
	[ExpirationReason] [nvarchar](max) NULL,
	[SourceSystemID] [nvarchar](max) NULL,
	[rn] [float] NULL,
	[rn2] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
