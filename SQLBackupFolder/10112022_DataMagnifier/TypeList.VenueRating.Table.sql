USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[VenueRating]    Script Date: 10.11.2022 13:21:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[VenueRating](
	[VenueRatingSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[VenueRatingCode] [varchar](20) NOT NULL,
	[VenueRatingName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_VenueRating] PRIMARY KEY CLUSTERED 
(
	[VenueRatingSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[VenueRating]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_VenueRating] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[VenueRating] CHECK CONSTRAINT [FK_SourceSystemSK_VenueRating]
GO
