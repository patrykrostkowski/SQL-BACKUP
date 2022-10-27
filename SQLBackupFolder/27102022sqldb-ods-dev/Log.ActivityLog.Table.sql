USE [sqldb-ods-dev]
GO
/****** Object:  Table [Log].[ActivityLog]    Script Date: 27.10.2022 12:26:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Log].[ActivityLog](
	[ActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[BatchId] [bigint] NOT NULL,
	[ParentActivityId] [bigint] NULL,
	[ActivityType] [nvarchar](15) NOT NULL,
	[ActivityName] [nvarchar](50) NOT NULL,
	[SourceSystem] [nvarchar](15) NOT NULL,
	[ActivityStartDtm] [datetime] NOT NULL,
	[ActivityEndDtm] [datetime] NULL,
	[EventLogMessage] [nvarchar](max) NULL,
	[ErrorLogMessage] [nvarchar](max) NULL,
	[ActivityStatus] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
