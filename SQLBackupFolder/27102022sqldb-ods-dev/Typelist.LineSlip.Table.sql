USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[LineSlip]    Script Date: 27.10.2022 12:27:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[LineSlip](
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_AK1_LineSlip]    Script Date: 27.10.2022 12:28:12 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_AK1_LineSlip] ON [Typelist].[LineSlip]
(
	[LineSlipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[LineSlip]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1077] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[LineSlip] NOCHECK CONSTRAINT [RefSourceSystem1077]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'An agreement by which a managing agent delegates its authority to enter into. contracts of insurance to be underwritten by the members of a syndicate. managed by it to another managing agent or authorised insurance company in.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'LineSlip'
GO
