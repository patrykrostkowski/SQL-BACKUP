USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LineSlip]    Script Date: 02.11.2022 12:58:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LineSlip](
	[LineSlipSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LineSlipCode] [varchar](25) NOT NULL,
	[LineSlipName] [varchar](50) NULL,
	[LineSlipDesc] [varchar](255) NULL,
 CONSTRAINT [PK_LineSlip] PRIMARY KEY CLUSTERED 
(
	[LineSlipSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
