USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[OpenReason]    Script Date: 10.11.2022 14:20:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[OpenReason]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[OpenReason](
	[OpenReasonSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[OpenReasonCode] [varchar](20) NOT NULL,
	[OpenReasonName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OpenReason] PRIMARY KEY CLUSTERED 
(
	[OpenReasonSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_OpenReason]') AND parent_object_id = OBJECT_ID(N'[TypeList].[OpenReason]'))
ALTER TABLE [TypeList].[OpenReason]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_OpenReason] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_OpenReason]') AND parent_object_id = OBJECT_ID(N'[TypeList].[OpenReason]'))
ALTER TABLE [TypeList].[OpenReason] CHECK CONSTRAINT [FK_SourceSystemSK_OpenReason]
GO
