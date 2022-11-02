USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[MedicalTreatment]    Script Date: 02.11.2022 13:09:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[MedicalTreatment](
	[MedicalTreatmentSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[MedicalTreatmentCode] [varchar](20) NOT NULL,
	[MedicalTreatmentName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_MedicalTreatment] PRIMARY KEY CLUSTERED 
(
	[MedicalTreatmentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[MedicalTreatment]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_MedicalTreatment] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[MedicalTreatment] CHECK CONSTRAINT [FK_SourceSystemSK_MedicalTreatment]
GO
