USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimStrategy]    Script Date: 31.10.2022 12:40:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClaimStrategy](
	[ClaimStrategySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimStrategyCode] [varchar](20) NOT NULL,
	[ClaimStrategyName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimStrategy] PRIMARY KEY CLUSTERED 
(
	[ClaimStrategySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClaimStrategy]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimStrategy] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClaimStrategy] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimStrategy]
GO
