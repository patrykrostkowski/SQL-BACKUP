USE [DataMagnifier]
GO
/****** Object:  Table [TypeList].[TransactionStatus]    Script Date: 31.10.2022 09:20:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [TypeList].[TransactionStatus](
	[TransactionStatusSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NOT NULL,
	[ETLUpdateDateTime] [datetime] NOT NULL,
	[SourceSystemSK] [int] NOT NULL,
	[TransactionStatusCode] [varchar](20) NOT NULL,
	[TransactionStatusName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TransactionStatus] PRIMARY KEY CLUSTERED 
(
	[TransactionStatusSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [TypeList].[TransactionStatus]  WITH CHECK ADD  CONSTRAINT [FK_SourceSystemSK_TransactionStatus] FOREIGN KEY([SourceSystemSK])
REFERENCES [TypeList].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [TypeList].[TransactionStatus] CHECK CONSTRAINT [FK_SourceSystemSK_TransactionStatus]
GO
