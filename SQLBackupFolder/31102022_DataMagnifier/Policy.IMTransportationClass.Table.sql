USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[IMTransportationClass]    Script Date: 31.10.2022 12:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[IMTransportationClass](
	[IMTransportationClassSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](255) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[PolicyInsurableObjectSK] [int] NOT NULL,
 CONSTRAINT [PK_IMTransportationClass] PRIMARY KEY NONCLUSTERED 
(
	[IMTransportationClassSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[IMTransportationClass]  WITH CHECK ADD  CONSTRAINT [FK_PolicyInsurableObjectSK_IMTransportationClass] FOREIGN KEY([PolicyInsurableObjectSK])
REFERENCES [Policy].[PolicyInsurableObject] ([PolicyInsurableObjectSK])
GO
ALTER TABLE [Policy].[IMTransportationClass] CHECK CONSTRAINT [FK_PolicyInsurableObjectSK_IMTransportationClass]
GO
ALTER TABLE [Policy].[IMTransportationClass]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_IMTransportationClass] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[IMTransportationClass] CHECK CONSTRAINT [FK_SourceSystemSK_IMTransportationClass]
GO
