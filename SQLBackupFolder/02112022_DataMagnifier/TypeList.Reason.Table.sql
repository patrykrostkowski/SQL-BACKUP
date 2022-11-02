USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[Reason]    Script Date: 02.11.2022 12:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
ALTER TABLE [TypeList].[Reason]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_Reason] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[Reason] CHECK CONSTRAINT [FK_SourceSystemSK_Reason]
GO
