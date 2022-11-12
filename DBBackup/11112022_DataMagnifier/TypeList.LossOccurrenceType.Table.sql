USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LossOccurrenceType]    Script Date: 12.11.2022 09:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[LossOccurrenceType]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_LossOccurrenceType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[LossOccurrenceType]'))
ALTER TABLE [TypeList].[LossOccurrenceType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LossOccurrenceType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_LossOccurrenceType]') AND parent_object_id = OBJECT_ID(N'[TypeList].[LossOccurrenceType]'))
ALTER TABLE [TypeList].[LossOccurrenceType] CHECK CONSTRAINT [FK_SourceSystemSK_LossOccurrenceType]
GO
