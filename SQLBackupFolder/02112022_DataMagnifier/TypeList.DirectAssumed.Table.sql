USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[DirectAssumed]    Script Date: 02.11.2022 09:21:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
