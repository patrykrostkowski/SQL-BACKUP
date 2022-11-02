USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossOccurrenceTier]    Script Date: 02.11.2022 13:23:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LossOccurrenceTier](
	[LossOccurrenceTierSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossOccurrenceTierCode] [varchar](20) NOT NULL,
	[LossOccurrenceTierName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossOccurrenceTier] PRIMARY KEY CLUSTERED 
(
	[LossOccurrenceTierSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LossOccurrenceTier]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossOccurrenceTier] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LossOccurrenceTier] CHECK CONSTRAINT [FK_SourceSystemSK_LossOccurrenceTier]
GO
