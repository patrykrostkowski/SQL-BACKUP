USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[ClaimProgress]    Script Date: 10.11.2022 14:36:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[ClaimProgress]') AND type in (N'U'))
BEGIN
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
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClaimProgress]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClaimProgress]'))
ALTER TABLE [TypeList].[ClaimProgress]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_ClaimProgress] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_ClaimProgress]') AND parent_object_id = OBJECT_ID(N'[TypeList].[ClaimProgress]'))
ALTER TABLE [TypeList].[ClaimProgress] CHECK CONSTRAINT [FK_SourceSystemSK_ClaimProgress]
GO
