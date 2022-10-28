USE [sqldb-ods-dev]
GO
/****** Object:  Table [Party].[Agreement]    Script Date: 28.10.2022 11:09:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Party].[Agreement](
	[AgreementSK] [decimal](19, 4) NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'This table defines the management of business agreements established between parties, via a business relationship.)  
Business agreements are defined in terms of service delivery rules and reporting specifications. Business processes will solicit these agreements for the planning and the control of business progress.   A Policy is an agreement between an Insured and Insurer.   A service agreement is a relationship between a broker and Insured or other 3rd parties.' , @level0type=N'SCHEMA',@level0name=N'Party', @level1type=N'TABLE',@level1name=N'Agreement'
GO
