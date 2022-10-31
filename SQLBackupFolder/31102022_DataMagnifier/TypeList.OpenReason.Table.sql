USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[OpenReason]    Script Date: 31.10.2022 12:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[OpenReason]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_OpenReason] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[OpenReason] CHECK CONSTRAINT [FK_SourceSystemSK_OpenReason]
GO
