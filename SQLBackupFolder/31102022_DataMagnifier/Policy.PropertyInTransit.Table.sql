USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PropertyInTransit]    Script Date: 31.10.2022 12:31:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Policy].[PropertyInTransit](
	[PropertyInTransitSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[IMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_PropertyInTransit] PRIMARY KEY NONCLUSTERED 
(
	[PropertyInTransitSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Policy].[PropertyInTransit]  WITH CHECK ADD  CONSTRAINT [FK_IMTransportationClassSK_PropertyInTransit] FOREIGN KEY([IMTransportationClassSK])
REFERENCES [Policy].[IMTransportationClass] ([IMTransportationClassSK])
GO
ALTER TABLE [Policy].[PropertyInTransit] CHECK CONSTRAINT [FK_IMTransportationClassSK_PropertyInTransit]
GO
ALTER TABLE [Policy].[PropertyInTransit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PropertyInTransit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Policy].[PropertyInTransit] CHECK CONSTRAINT [FK_SourceSystemSK_PropertyInTransit]
GO
