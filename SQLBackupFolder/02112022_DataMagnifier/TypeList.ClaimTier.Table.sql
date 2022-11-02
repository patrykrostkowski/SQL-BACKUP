USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimTier]    Script Date: 02.11.2022 14:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClaimTier](
	[ClaimTierSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimTierCode] [varchar](20) NOT NULL,
	[ClaimTierName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimTier] PRIMARY KEY CLUSTERED 
(
	[ClaimTierSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClaimTier]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimTier] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClaimTier] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimTier]
GO
