USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[PaymentMethod]    Script Date: 18.11.2022 16:40:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[PaymentMethod](
	[PaymentMethodSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[PaymentMethodCode] [varchar](20) NOT NULL,
	[PaymentMethodName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[PaymentMethod]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_PaymentMethod] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[PaymentMethod] CHECK CONSTRAINT [FK_SourceSystemSK_PaymentMethod]
GO
