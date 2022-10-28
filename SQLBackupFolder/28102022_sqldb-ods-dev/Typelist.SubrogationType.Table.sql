USE [sqldb-ods-dev]
GO
/****** Object:  Table [Typelist].[SubrogationType]    Script Date: 28.10.2022 15:05:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Typelist].[SubrogationType](
	[SubrogationTypeSK] [int] IDENTITY(2,1) NOT NULL,
	[ETLCreateDateTime] [datetime] NULL,
	[ETLUpdateDateTime] [datetime] NULL,
	[SourceSystemSK] [int] NOT NULL,
	[SubrogationTypeCode] [varchar](20) NOT NULL,
	[SubrogationTypeName] [varchar](50) NOT NULL,
 CONSTRAINT [PK319] PRIMARY KEY CLUSTERED 
(
	[SubrogationTypeSK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Typelist].[SubrogationType]  WITH NOCHECK ADD  CONSTRAINT [RefSourceSystem1052] FOREIGN KEY([SourceSystemSK])
REFERENCES [Typelist].[SourceSystem] ([SourceSystemSK])
GO
ALTER TABLE [Typelist].[SubrogationType] NOCHECK CONSTRAINT [RefSourceSystem1052]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Industry wide there  are three types of subrogation: (1) Equitable, also known as legal or judicial; (2) Conventional or contractual subrogation, and; (3) Statutory subrogation. Equitable subrogation arises by operation of law. Conventional subrogation arises out of a contract, such as an insurance policy. Statutory subrogation arises from legislative action granting a right of subrogation in a person or entity. Although equitable subrogation is a separate form of subrogation, equitable principles are also entrenched in conventional and statutory subrogation. This is because subrogation of any type, at its core, is an equitable remedy. Therefore, principles of fundamental fairness and public policy must be considered when evaluating what is essentially the insureds assignment of a claim to its insurer, and the insurers right to assert a claim originally belonging to its insured.' , @level0type=N'SCHEMA',@level0name=N'Typelist', @level1type=N'TABLE',@level1name=N'SubrogationType'
GO
