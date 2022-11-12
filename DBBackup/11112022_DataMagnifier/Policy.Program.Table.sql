USE [DataMagnifier]
GO
/****** Object:  Table [Policy].[Program]    Script Date: 12.11.2022 09:01:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Policy].[Program]') AND type in (N'U'))
BEGIN
CREATE TABLE [Policy].[Program](
	[ProgramSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[ETLCreateProcessNum] [int] NOT NULL,
	[ETLUpdateProcessNum] [int] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SourceCode] [varchar](254) NOT NULL,
	[ProcessDateTime] [datetime] NOT NULL,
	[ProgramNum] [varchar](20) NOT NULL,
	[ProgramName] [varchar](50) NULL,
	[ProgramDesc] [varchar](255) NULL,
	[EffectiveDate] [date] NULL,
	[ExpirationDate] [date] NULL,
 CONSTRAINT [PK_Program] PRIMARY KEY CLUSTERED 
(
	[ProgramSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Program]') AND parent_object_id = OBJECT_ID(N'[Policy].[Program]'))
ALTER TABLE [Policy].[Program]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Program] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[Policy].[FK_SourceSystemSK_Program]') AND parent_object_id = OBJECT_ID(N'[Policy].[Program]'))
ALTER TABLE [Policy].[Program] CHECK CONSTRAINT [FK_SourceSystemSK_Program]
GO
