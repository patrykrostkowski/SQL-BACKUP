USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PayPlan]    Script Date: 12.11.2022 09:01:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[TypeList].[PayPlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [TypeList].[PayPlan](
	[PayPlanSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PayPlanCode] [varchar](20) NOT NULL,
	[PayPlanName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PayPlan] PRIMARY KEY CLUSTERED 
(
	[PayPlanSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PayPlan]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PayPlan]'))
ALTER TABLE [TypeList].[PayPlan]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PayPlan] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[TypeList].[FK_SourceSystemSK_PayPlan]') AND parent_object_id = OBJECT_ID(N'[TypeList].[PayPlan]'))
ALTER TABLE [TypeList].[PayPlan] CHECK CONSTRAINT [FK_SourceSystemSK_PayPlan]
GO
