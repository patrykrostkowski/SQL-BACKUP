USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[UnderwritingStatus]    Script Date: 31.10.2022 11:55:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[UnderwritingStatus](
	[UnderwritingStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[UnderwritingStatusCode] [varchar](20) NOT NULL,
	[UnderwritingStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_UnderwritingStatus] PRIMARY KEY CLUSTERED 
(
	[UnderwritingStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[UnderwritingStatus]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_UnderwritingStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[UnderwritingStatus] CHECK CONSTRAINT [FK_SourceSystemSK_UnderwritingStatus]
GO
