USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DriverRoleType]    Script Date: 02.11.2022 12:46:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[DriverRoleType](
	[DriverRoleTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DriverRoleTypeCode] [varchar](20) NOT NULL,
	[DriverRoleTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DriverRoleType] PRIMARY KEY CLUSTERED 
(
	[DriverRoleTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[DriverRoleType]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_DriverRoleType] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[DriverRoleType] CHECK CONSTRAINT [FK_SourceSystemSK_DriverRoleType]
GO
