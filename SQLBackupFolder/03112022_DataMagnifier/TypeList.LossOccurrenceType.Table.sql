USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossOccurrenceType]    Script Date: 08.11.2022 08:11:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LossOccurrenceType](
	[LossOccurrenceTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LossOccurrenceTypeCode] [varchar](20) NOT NULL,
	[LossOccurrenceTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LossOccurrenceType] PRIMARY KEY CLUSTERED 
(
	[LossOccurrenceTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LossOccurrenceType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossOccurrenceType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LossOccurrenceType] CHECK CONSTRAINT [FK_SourceSystemSK_LossOccurrenceType]
GO
