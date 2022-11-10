USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DirectAssumed]    Script Date: 10.11.2022 14:35:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[DirectAssumed]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[DirectAssumed](
	[DirectAssumedSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[DirectAssumedCode] [varchar](20) NOT NULL,
	[DirectAssumedName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_DirectAssumed] PRIMARY KEY CLUSTERED 
(
	[DirectAssumedSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
