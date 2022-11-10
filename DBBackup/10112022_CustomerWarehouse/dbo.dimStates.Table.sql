USE [CustomerWarehouse]
GO
/****** Object:  Table [dbo].[dimStates]    Script Date: 10.11.2022 14:34:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[dimStates]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[dimStates](
	[StatesID] [int] NOT NULL,
	[StatesName] [nvarchar](50) NULL,
 CONSTRAINT [PK_dimStates] PRIMARY KEY CLUSTERED 
(
	[StatesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
