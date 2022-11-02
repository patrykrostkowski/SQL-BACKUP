USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[InjurySeverity]    Script Date: 02.11.2022 09:21:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[InjurySeverity](
	[InjurySeveritySK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[InjurySeverityCode] [varchar](20) NOT NULL,
	[InjurySeverityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_InjurySeverity] PRIMARY KEY CLUSTERED 
(
	[InjurySeveritySK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[InjurySeverity]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_InjurySeverity] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[InjurySeverity] CHECK CONSTRAINT [FK_SourceSystemSK_InjurySeverity]
GO
