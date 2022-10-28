USE [sqldb-ods-dev]
GO
/****** Object:  Table [StgClaim].[ClaimDataInput]    Script Date: 28.10.2022 12:27:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [StgClaim].[ClaimDataInput](
	[JsonLine] [varchar](max) NULL,
	[FileName] [varchar](500) NULL,
	[FilePath] [varchar](500) NULL,
	[BatchId] [varchar](500) NULL,
	[LoadDate] [datetime] NULL,
	[IsValidInd] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [StgClaim].[ClaimDataInput] ADD  DEFAULT ((1)) FOR [IsValidInd]
GO
