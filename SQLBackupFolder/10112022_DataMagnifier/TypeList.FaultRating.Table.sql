USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[FaultRating]    Script Date: 10.11.2022 12:35:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[FaultRating](
	[FaultRatingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[FaultRatingCode] [varchar](20) NOT NULL,
	[FaultRatingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_FaultRating] PRIMARY KEY CLUSTERED 
(
	[FaultRatingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[FaultRating]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_FaultRating] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[FaultRating] CHECK CONSTRAINT [FK_SourceSystemSK_FaultRating]
GO
