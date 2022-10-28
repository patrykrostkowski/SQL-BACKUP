USE [sqldb-ods-dev]
GO
/****** Object:  Table [Config].[ReportSettings]    Script Date: 28.10.2022 12:26:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Config].[ReportSettings](
	[ReportSettingsId] [int] IDENTITY(1,1) NOT NULL,
	[ReportSettingsName] [varchar](20) NOT NULL,
	[DefaultSettings] [bit] NULL,
	[MainImage] [image] NULL,
	[SecondaryImage] [image] NULL,
	[Color1] [varchar](10) NULL,
	[Color2] [varchar](10) NULL,
	[Color3] [varchar](10) NULL,
	[Color4] [varchar](10) NULL,
	[Color5] [varchar](10) NULL,
	[Color6] [varchar](10) NULL,
	[Color7] [varchar](10) NULL,
	[Color8] [varchar](10) NULL,
	[TableHeaderHighlight] [varchar](10) NULL,
	[TableHeaderBG] [varchar](10) NULL,
	[TableRowBG] [varchar](10) NULL,
	[TableEveryOtherRowBG] [varchar](10) NULL,
	[TableFooterHighlight] [varchar](10) NULL,
	[TableFooterBG] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportSettingsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
