USE [DataMagnifier]
GO
/****** Object:  Table [PreBind].[QuoteHouseholdContent]    Script Date: 10.11.2022 14:47:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[PreBind].[QuoteHouseholdContent]') AND type in (N'U'))
BEGIN
CREATE TABLE [PreBind].[QuoteHouseholdContent](
	[QuoteHouseholdContentSK] [int] IDENTITY(2,1) NOT NULL,
	[QuoteIMTransportationClassSK] [int] NOT NULL,
 CONSTRAINT [PK_QuoteHouseholdContent] PRIMARY KEY NONCLUSTERED 
(
	[QuoteHouseholdContentSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteIMTransportationClassSK_QuoteHouseholdContent]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteHouseholdContent]'))
ALTER TABLE [PreBind].[QuoteHouseholdContent]  WITH CHECK ADD  CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteHouseholdContent] FOREIGN KEY([QuoteIMTransportationClassSK])
REFERENCES [PreBind].[QuoteIMTransportationClass] ([QuoteIMTransportationClassSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[PreBind].[FK_QuoteIMTransportationClassSK_QuoteHouseholdContent]') AND parent_object_id = OBJECT_ID(N'[PreBind].[QuoteHouseholdContent]'))
ALTER TABLE [PreBind].[QuoteHouseholdContent] CHECK CONSTRAINT [FK_QuoteIMTransportationClassSK_QuoteHouseholdContent]
GO
