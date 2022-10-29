USE [AdventureWorks2019]
GO
/****** Object:  Table [HumanResources].[JobCandidate]    Script Date: 29.10.2022 11:35:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HumanResources].[JobCandidate](
	[JobCandidateID] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NULL,
	[Resume] [xml](CONTENT [HumanResources].[HRResumeSchemaCollection]) NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED 
(
	[JobCandidateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_JobCandidate_BusinessEntityID]    Script Date: 29.10.2022 11:35:07 ******/
CREATE NONCLUSTERED INDEX [IX_JobCandidate_BusinessEntityID] ON [HumanResources].[JobCandidate]
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  FullTextIndex     Script Date: 29.10.2022 11:35:07 ******/
CREATE FULLTEXT INDEX ON [HumanResources].[JobCandidate]
KEY INDEX [PK_JobCandidate_JobCandidateID]ON ([AW2016FullTextCatalog], FILEGROUP [PRIMARY])
WITH (CHANGE_TRACKING = AUTO, STOPLIST = SYSTEM)

GO
ALTER TABLE [HumanResources].[JobCandidate] ADD  CONSTRAINT [DF_JobCandidate_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [HumanResources].[JobCandidate]  WITH CHECK ADD  CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY([BusinessEntityID])
REFERENCES [HumanResources].[Employee] ([BusinessEntityID])
GO
ALTER TABLE [HumanResources].[JobCandidate] CHECK CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for JobCandidate records.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'COLUMN',@level2name=N'JobCandidateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Employee identification number if applicant was hired. Foreign key to Employee.BusinessEntityID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'COLUMN',@level2name=N'BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Résumé in XML format.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'COLUMN',@level2name=N'Resume'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Date and time the record was last updated.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'COLUMN',@level2name=N'ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Default constraint value of GETDATE()' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'CONSTRAINT',@level2name=N'DF_JobCandidate_ModifiedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key (clustered) constraint' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'CONSTRAINT',@level2name=N'PK_JobCandidate_JobCandidateID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nonclustered index.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'INDEX',@level2name=N'IX_JobCandidate_BusinessEntityID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Résumés submitted to Human Resources by job applicants.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Foreign key constraint referencing Employee.EmployeeID.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'TABLE',@level1name=N'JobCandidate', @level2type=N'CONSTRAINT',@level2name=N'FK_JobCandidate_Employee_BusinessEntityID'
GO
