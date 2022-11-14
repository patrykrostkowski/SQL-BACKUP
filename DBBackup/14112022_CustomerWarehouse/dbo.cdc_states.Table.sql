USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[cdc_states]    Script Date: 14.11.2022 12:05:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[cdc_states]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[cdc_states](
	[name] [nvarchar](256) NOT NULL,
	[state] [nvarchar](256) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [cdc_states_name]    Script Date: 14.11.2022 12:05:38 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[cdc_states]') AND name = N'cdc_states_name')
CREATE UNIQUE NONCLUSTERED INDEX [cdc_states_name] ON [dbo].[cdc_states]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
