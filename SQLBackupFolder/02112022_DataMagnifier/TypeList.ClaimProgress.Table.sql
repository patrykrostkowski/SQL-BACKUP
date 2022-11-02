USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimProgress]    Script Date: 02.11.2022 14:12:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[ClaimProgress](
	[ClaimProgressSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[ClaimProgressCode] [varchar](20) NOT NULL,
	[ClaimProgressName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ClaimProgress] PRIMARY KEY CLUSTERED 
(
	[ClaimProgressSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[ClaimProgress]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimProgress] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[ClaimProgress] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimProgress]
GO
