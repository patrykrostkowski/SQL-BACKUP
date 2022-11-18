USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[LeadExcessQuota]    Script Date: 18.11.2022 16:54:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[LeadExcessQuota](
	[LeadExcessQuotaSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[LeadExcessQuotaCode] [varchar](20) NOT NULL,
	[LeadExcessQuotaName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LeadExcessQuota] PRIMARY KEY CLUSTERED 
(
	[LeadExcessQuotaSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[LeadExcessQuota]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_LeadExcessQuota] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[LeadExcessQuota] CHECK CONSTRAINT [FK_SourceSystemSK_LeadExcessQuota]
GO
