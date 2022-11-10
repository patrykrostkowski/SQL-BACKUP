USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Reason]    Script Date: 10.11.2022 14:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[Reason]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[Reason](
	[ReasonSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ReasonCode] [varchar](20) NOT NULL,
	[ReasonName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Reason] PRIMARY KEY CLUSTERED 
(
	[ReasonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Reason]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Reason]'))
ALTER TABLE [TypeList].[Reason]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Reason] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_Reason]') AND parent_object_id = OBJECT_ID(N'[TypeList].[Reason]'))
ALTER TABLE [TypeList].[Reason] CHECK CONSTRAINT [FK_SourceSystemSK_Reason]
GO
