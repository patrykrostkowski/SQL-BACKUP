USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[AssignmentStatus]    Script Date: 31.10.2022 12:01:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[AssignmentStatus](
	[AssignmentStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[AssignmentStatusCode] [varchar](20) NOT NULL,
	[AssignmentStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AssignmentStatus] PRIMARY KEY CLUSTERED 
(
	[AssignmentStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[AssignmentStatus]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_AssignmentStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[AssignmentStatus] CHECK CONSTRAINT [FK_SourceSystemSK_AssignmentStatus]
GO
