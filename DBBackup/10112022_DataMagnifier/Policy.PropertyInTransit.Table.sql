USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[PropertyInTransit]    Script Date: 10.11.2022 14:35:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[PropertyInTransit]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_IMTransportationClassSK_PropertyInTransit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyInTransit]'))
ALTER TABLE [Policy].[PropertyInTransit]  WITH CHECK ADD  CONSTRAINT [FK_IMTransportationClassSK_PropertyInTransit] FOREIGN KEY([IMTransportationClassSK])
REFERENCES [Policy].[IMTransportationClass] ([IMTransportationClassSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_IMTransportationClassSK_PropertyInTransit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyInTransit]'))
ALTER TABLE [Policy].[PropertyInTransit] CHECK CONSTRAINT [FK_IMTransportationClassSK_PropertyInTransit]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PropertyInTransit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyInTransit]'))
ALTER TABLE [Policy].[PropertyInTransit]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PropertyInTransit] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_PropertyInTransit]') AND parent_object_id = OBJECT_ID(N'[Policy].[PropertyInTransit]'))
ALTER TABLE [Policy].[PropertyInTransit] CHECK CONSTRAINT [FK_SourceSystemSK_PropertyInTransit]
GO
