USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[CancellationRate]    Script Date: 20.11.2022 19:02:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[CancellationRate](
	[CancellationRateSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[CancellationRateCode] [varchar](20) NOT NULL,
	[CancellationRateName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CancellationRate] PRIMARY KEY CLUSTERED 
(
	[CancellationRateSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[CancellationRate]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_CancellationRate] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[CancellationRate] CHECK CONSTRAINT [FK_SourceSystemSK_CancellationRate]
GO
