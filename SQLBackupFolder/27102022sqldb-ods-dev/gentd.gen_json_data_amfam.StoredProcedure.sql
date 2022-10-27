USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_json_data_amfam]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   procedure [gentd].[gen_json_data_amfam]
as

--select * from gentd.input_data_amfam
truncate table ##Root
truncate table ##Policy
truncate table ##PolicyTrans

insert into ##Root(
	SourceSystemCode,
	PolicySourceCode,
	ProcessDateTime
)
SELECT
	SourceSystemCode,
	PolicySourceCode,
	ProcessDateTime
 FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
    p.PublishedTimestamp as ProcessDateTime,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON) s
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
	) a

--#######################################

insert into ##Policy(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	EffectiveJobNum,
	PolicyNum,
	TermNum,
	EffectiveDate,
	ExpirationDate,
	UnderwritingYear,
	IssuanceDateTime,
	PolicyTypeCode,
	PolicyStatusCode,
	DomicileStateCode,
	DomicileCountryCode,
	IsMultiStateInd,
	CancellationDate,
	DirectAssumedCode,
	BusinessUnitCode,
	AnnualStatementLineofBusinessCode,
	PayPlanCode,
	PayPlanDesc,
	GoverningStateCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	EffectiveJobNum,
	PolicyNum,
	TermNum,
	EffectiveDate,
	ExpirationDate,
	UnderwritingYear,
	IssuanceDateTime,
	PolicyTypeCode,
	PolicyStatusCode,
	DomicileStateCode,
	DomicileCountryCode,
	IsMultiStateInd,
	CancellationDate,
	DirectAssumedCode,
	BusinessUnitCode,
	AnnualStatementLineofBusinessCode,
	PayPlanCode,
	PayPlanDesc,
	GoverningStateCode
 FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
    p.JobNumber AS EffectiveJobNum,
    p.policyNumber AS PolicyNum,
    p.TermNumber AS TermNum,
	p.TermStartDate AS EffectiveDate,
	p.TermEndDate AS ExpirationDate,
	CAST(YEAR(p.TermStartDate) AS NVARCHAR(100)) AS UnderwritingYear,
	s.EditEffectiveDate AS IssuanceDateTime,
    di.policyType AS PolicyTypeCode,
    CASE
        WHEN p.JobType = 'Cancellation' THEN 'Canceled'
      ELSE
      'InForce'
    END AS PolicyStatusCode,
    pl.ContractState AS DomicileStateCode,
    'US' AS DomicileCountryCode,
    cast(0 AS int) AS IsMultiStateInd,
    CAST(CASE
      WHEN p.JobType IN ('Cancellation') THEN s.EditEffectiveDate
    ELSE
    NULL
  END AS DATE)
    AS CancellationDate,
	'D' as DirectAssumedCode,
	'Personal' as BusinessUnitCode,
	Case when di.policyType = 'EAFamilyCar' Then '19'
		when di.policyType like 'HO%' Then  '4'
		When di.policyType = 'Umbrella'    Then '0'
		else '0'
	End AS AnnualStatementLineofBusinessCode,
	'AN' as PayPlanCode,
	'Annual' as PayPlanDesc,
	pl.ContractState AS GoverningStateCode,
  p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
	) a

--#######################################

insert into ##PolicyTrans(
	SourceSystemCode,
	ProcessDateTime,
	PolicyTransSourceCode,
	PolicySourceCode,
	PolicyNum,
	TermNum,
	PolicyTransNum,
	PolicyTransTypeCode,
	TransStartDatetime,
	TransEndDatetime,
	PolicyEffectiveDate,
	PolicyExpirationDate,
	DomicileStateCode,
	DomicileCountryCode,
	PolicyTransStatusCode,
	BusinessUnitCode,
	BusinessTypeCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicyTransSourceCode,
	PolicySourceCode,
	PolicyNum,
	TermNum,
	PolicyTransNum,
	PolicyTransTypeCode,
	TransStartDatetime,
	TransEndDatetime,
	PolicyEffectiveDate,
	PolicyExpirationDate,
	DomicileStateCode,
	DomicileCountryCode,
	PolicyTransStatusCode,
	BusinessUnitCode,
	BusinessTypeCode
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', s.CDC_PolicyPeriod_BranchID) AS PolicyTransSourceCode,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	p.policyNumber AS PolicyNum,
	isnull(p.TermNumber, 1) AS TermNum,
    --p.JobNumber AS PolicyTransNum,
	row_number() over (partition by p.policyNumber order by p.PublishedTimestamp asc) as PolicyTransNum,
    case when p.JobType = 'Submission' then 'NewBusiness' else p.JobType end AS PolicyTransTypeCode,
    s.EditEffectiveDate AS TransStartDatetime,
    s.SliceEndDate AS TransEndDatetime,
    CAST(p.TermStartDate AS DATE) AS PolicyEffectiveDate,
    CAST(p.TermEndDate AS DATE) AS PolicyExpirationDate,
 --   CONCAT ( di.sourceSystem, '-', di.underwritingCompany ) AS WritingCompanySK,
    pl.ContractState AS DomicileStateCode,
    'US' AS DomicileCountryCode,
    CASE
        WHEN p.JobType = 'Cancellation' THEN 'Canceled'
      ELSE
      'InForce'
    END AS PolicyTransStatusCode,
	'Personal' as BusinessUnitCode,
	'direct' as BusinessTypeCode,
    p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, PolicyEventLogs nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################

insert into ##LineOfBusiness(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	PolicyTransSourceCode,
	LineofBusinessSourceCode,
	LineofBusinessCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	PolicyTransSourceCode,
	LineofBusinessSourceCode,
	LineofBusinessCode
FROM (
  SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
    CONCAT (p.CDC_Policy_PublicID, '-', s.CDC_PolicyPeriod_BranchID) AS PolicyTransSourceCode,
    pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
	Case when di.policyType = 'EAFamilyCar' Then 'PersonalAuto_EA'
		when di.policyType like 'HO%' Then  'Homeowners_EH'
		When di.policyType = 'Umbrella'    Then 'PersonalUmbrella_EU'
		else 'OutOfScope'
	End AS LineofBusinessCode,
    p.ProductSubLine as SublineCode,
    p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON) pl
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################

INSERT INTO ##Geography(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	GeographySourceCode,
	LineofBusinessSourceCode,
	CountryCode,
	StateCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	GeographySourceCode,
	LineofBusinessSourceCode,
	CountryCode,
	StateCode
FROM (
  SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
    pl.CDC_PolicyLine_PublicID AS GeographySourceCode,
	pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    'US' AS CountryCode,
    pl.ContractState AS StateCode,
    p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################

INSERT INTO ##Insured(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	InsuredSourceCode,
	AccountNum,
	DomicileCountryCode,
	DomicileStateCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	InsuredSourceCode,
	AccountNum,
	DomicileCountryCode,
	DomicileStateCode
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	pcr.CDC_ContactRole_PublicID as InsuredSourceCode,
	a.AccountNumber AS AccountNum,
    'US' AS DomicileCountryCode,
    pl.ContractState AS DomicileStateCode,
	--pcr.ContactRoleType,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, Account nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.Account)
	WITH (AccountNumber nvarchar(100)) a
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON, PolicyContacts nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.PolicyContacts)
	WITH (PolicyContactRoles nvarchar(max) AS JSON) as pc
	CROSS APPLY OPENJSON(pc.PolicyContactRoles) 
	WITH (ContactRoleType nvarchar(100), CDC_ContactRole_PublicID nvarchar(100)) as pcr
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl	
  WHERE 1=1
	AND pcr.ContactRoleType = 'PolicyPriNamedInsured'

	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##PartyInfo(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	InsuredSourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	FirstName,
	MiddleName,
	LastName,
	FullName,
	MaritalStatusCode,
	BirthDate,
	GenderCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Insured' as master,
	InsuredSourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	FirstName,
	MiddleName,
	LastName,
	left(FullName, 50) as FullName,
	left(MaritalStatusCode, 20) as MaritalStatusCode,
	BirthDate,
	GenderCode
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	pcr.CDC_ContactRole_PublicID as InsuredSourceCode,
    --pc.CDC_Contact_PublicID AS SourceCode,
	pcr.CDC_ContactRole_PublicID as PartyInfoSourceCode,
    pc.ContactType AS PartyTypeCode,
    pcr.FirstName AS FirstName,
    pcr.MiddleName AS MiddleName,
    pcr.LastName AS LastName,
    CONCAT ( isnull(pcr.FirstName + ' ', ''), isnull(pcr.MiddleName + ' ', ''), isnull(pcr.LastName, '')) AS FullName,
    case when pcr.MaritialStatus = 'M' then 'Married_ext'
		else isnull(pcr.MaritialStatus, 'Undefined') end AS MaritalStatusCode,
    pcr.DOB AS BirthDate,
    isnull(pcr.Gender, 'Undefined') AS GenderCode,
    --conr.PolicyDriver.LicenseNumber AS DriverLicenseNum,
    --conr.PolicyDriver.LicenseState AS DriverLicenseStateCode,
	--pcr.ContactRoleType,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, Account nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.Account)
	WITH (AccountNumber nvarchar(100)) a
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON, PolicyContacts nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.PolicyContacts)
	WITH (CDC_Contact_PublicID nvarchar(100), ContactType nvarchar(100), PolicyContactRoles nvarchar(max) AS JSON) as pc
	CROSS APPLY OPENJSON(pc.PolicyContactRoles) 
	WITH (ContactRoleType nvarchar(100), CDC_ContactRole_PublicID nvarchar(100), FirstName nvarchar(100), MiddleName nvarchar(100), LastName nvarchar(100), MaritialStatus nvarchar(100), DOB nvarchar(100), Gender nvarchar(100)) as pcr
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl	
  WHERE 1=1
	AND pcr.ContactRoleType = 'PolicyPriNamedInsured'
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##PartyRole(
SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	InsuredSourceCode,
	PartyRoleSourceCode,
	PartyRoleCode,
	PartyRoleDesc
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Insured' as master,
	InsuredSourceCode,
	PartyRoleSourceCode,
	PartyRoleCode,
	PartyRoleDesc
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	CDC_ContactRole_PublicID as InsuredSourceCode,
	CDC_ContactRole_PublicID as PartyRoleSourceCode,
    'insured' AS PartyRoleCode,
	'Insured' as PartyRoleDesc,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
		CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, Account nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.Account)
	WITH (AccountNumber nvarchar(100)) a
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON, PolicyContacts nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.PolicyContacts)
	WITH (CDC_Contact_PublicID nvarchar(100), ContactType nvarchar(100), PolicyContactRoles nvarchar(max) AS JSON) as pc
	CROSS APPLY OPENJSON(pc.PolicyContactRoles) 
	WITH (ContactRoleType nvarchar(100), CDC_ContactRole_PublicID nvarchar(100), FirstName nvarchar(100), MiddleName nvarchar(100), LastName nvarchar(100), MaritialStatus nvarchar(100), DOB nvarchar(100), Gender nvarchar(100)) as pcr
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl
  WHERE 1=1
) a

INSERT INTO ##PartyAddress(--address for insured
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	InsuredSourceCode,
	PartyRoleSourceCode,
	PartyAddressSourceCode,
	AddressTypeCode,
	AddressLine1,
	CityName,
	CountryCode,
	StateCode,
	PostalCode,
	IsPrimaryInd
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Insured' as master,
	InsuredSourceCode,
	PartyRoleSourceCode,
	PartyAddressSourceCode,
	AddressTypeCode,
	AddressLine1,
	CityName,
	CountryCode,
	StateCode,
	PostalCode,
	IsPrimaryInd
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	CDC_ContactRole_PublicID as InsuredSourceCode,
	CDC_ContactRole_PublicID as PartyRoleSourceCode,
	CDC_ContactRole_PublicID as PartyAddressSourceCode,
	'business' as AddressTypeCode,
	'5327 W Keefe Ave' as AddressLine1,
	'Milwaukee' as CityName,
	'US' as CountryCode,
	'WI' as StateCode,
	'53216' as PostalCode,
	1 as IsPrimaryInd,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, Account nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.Account)
	WITH (AccountNumber nvarchar(100)) a
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON, PolicyContacts nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.PolicyContacts)
	WITH (CDC_Contact_PublicID nvarchar(100), ContactType nvarchar(100), PolicyContactRoles nvarchar(max) AS JSON) as pc
	CROSS APPLY OPENJSON(pc.PolicyContactRoles) 
	WITH (ContactRoleType nvarchar(100), CDC_ContactRole_PublicID nvarchar(100), FirstName nvarchar(100), MiddleName nvarchar(100), LastName nvarchar(100), MaritialStatus nvarchar(100), DOB nvarchar(100), Gender nvarchar(100)) as pcr
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl
  WHERE 1=1
) a

--#######################################

INSERT INTO ##Account(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	AccountSourceCode,
	AccountNum,
	AccountName,
	EffectiveDate,
	IsAccountBillInd
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	AccountSourceCode,
	AccountNum,
	AccountName,
	EffectiveDate,
	IsAccountBillInd
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	a.CDC_Account_PublicID as AccountSourceCode,
	a.AccountNumber AS AccountNum,
	a.AccountNumber AS AccountName,
	cast('1900-01-01' as date) as EffectiveDate,
	0 as IsAccountBillInd,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, Account nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.Account)
	WITH (AccountNumber nvarchar(100), CDC_Account_PublicID nvarchar(100)) a
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON, PolicyContacts nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.PolicyContacts)
	WITH (PolicyContactRoles nvarchar(max) AS JSON) as pc
	CROSS APPLY OPENJSON(pc.PolicyContactRoles) 
	WITH (ContactRoleType nvarchar(100), CDC_ContactRole_PublicID nvarchar(100)) as pcr
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl	
  WHERE 1=1
	AND pcr.ContactRoleType = 'PolicyPriNamedInsured'

	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##PartyInfo(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	AccountSourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	FirstName,
	MiddleName,
	LastName,
	FullName,
	MaritalStatusCode,
	BirthDate,
	GenderCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Account' as master,
	AccountSourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	FirstName,
	MiddleName,
	LastName,
	left(FullName, 50) as FullName,
	left(MaritalStatusCode, 20) as MaritalStatusCode,
	BirthDate,
	GenderCode
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	--pcr.CDC_ContactRole_PublicID as InsuredSourceCode,
	a.CDC_Account_PublicID as AccountSourceCode,
    --pc.CDC_Contact_PublicID AS SourceCode,
	a.CDC_Account_PublicID as PartyInfoSourceCode,
    pc.ContactType AS PartyTypeCode,
    pcr.FirstName AS FirstName,
    pcr.MiddleName AS MiddleName,
    pcr.LastName AS LastName,
    CONCAT ( isnull(pcr.FirstName + ' ', ''), isnull(pcr.MiddleName + ' ', ''), isnull(pcr.LastName, '')) AS FullName,
    case when pcr.MaritialStatus = 'M' then 'Married_ext'
		else isnull(pcr.MaritialStatus, 'Undefined') end AS MaritalStatusCode,
    pcr.DOB AS BirthDate,
    isnull(pcr.Gender, 'Undefined') AS GenderCode,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON, Account nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.Account)
	WITH (AccountNumber nvarchar(100), CDC_Account_PublicID nvarchar(100)) a
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON, PolicyContacts nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.PolicyContacts)
	WITH (CDC_Contact_PublicID nvarchar(100), ContactType nvarchar(100), PolicyContactRoles nvarchar(max) AS JSON) as pc
	CROSS APPLY OPENJSON(pc.PolicyContactRoles) 
	WITH (ContactRoleType nvarchar(100), CDC_ContactRole_PublicID nvarchar(100), FirstName nvarchar(100), MiddleName nvarchar(100), LastName nvarchar(100), MaritialStatus nvarchar(100), DOB nvarchar(100), Gender nvarchar(100)) as pcr
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), ContractState nvarchar(100)) pl	
  WHERE 1=1
	AND pcr.ContactRoleType = 'PolicyPriNamedInsured'
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################

INSERT INTO ##InsurableObject(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	GeographySourceCode,
	InsurableObjectSourceCode,
	InsurableObjectTypeCode,
	InsuredSourceCode
)
 SELECT a.SourceSystemCode,
	a.ProcessDateTime,
	a.PolicySourceCode,
	a.GeographySourceCode,
	a.InsurableObjectSourceCode,
	a.InsurableObjectTypeCode,
	ins.InsuredSourceCode
 FROM (
 SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
    pl.CDC_PolicyLine_PublicID AS GeographySourceCode,
    c.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
   CASE
        WHEN di.productLine LIKE N'%EHLine%' THEN N'Dwelling'
        WHEN di.productLine LIKE N'%Auto%' THEN N'Vehicle'
      ELSE
      N'UnKnown'
    END AS InsurableObjectTypeCode,
    --pl.CDC_PolicyLine_PublicID AS PolicySubLineSK,
   p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverables nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Coverables)
	WITH (CDC_Coverable_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON) c
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a
	LEFT JOIN ##Insured ins on ins.PolicySourceCode = a.PolicySourceCode and ins.SourceSystemCode = a.SourceSystemCode and ins.ProcessDateTime = a.ProcessDateTime

--#######################################

INSERT INTO ##Coverage(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	LineofBusinessSourceCode,
	CoverageSourceCode,
	CoverageCode,
	CoverageDesc,
	EffectiveDate,
	ExpirationDate,
	CancellationDate,
	IsIncludedInPremiumInd,
	IsMineSubsidenceInd,
	AnnualStatementLineofBusinessCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'LineOfBusinessCoverage' as master,
	LineofBusinessSourceCode,
	CoverageSourceCode,
	left(CoverageCode, 20) as CoverageCode,
	CoverageDesc,
	EffectiveDate,
	ExpirationDate,
	CancellationDate,
	IsIncludedInPremiumInd,
	IsMineSubsidenceInd,
	AnnualStatementLineofBusinessCode
FROM (
 SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    --covs.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
    cov.CDC_Coverage_PublicID AS CoverageSourceCode,
    cov.PatternCode AS CoverageCode,
	cov.coveragename AS CoverageDesc,
    s.EditEffectiveDate AS EffectiveDate,
    s.SliceEndDate AS ExpirationDate,
    CASE
      WHEN p.JobType = 'Cancellation' THEN s.EditEffectiveDate
    ELSE
    NULL
  END
    AS CancellationDate,
    1 AS IsIncludedInPremiumInd,
    CAST(CASE
        WHEN cov.PatternCode = 'EH_MineSubCov' THEN 1
      ELSE
      0
    END
      AS BIT) AS IsMineSubsidenceInd,
	Case when di.policyType = 'EAFamilyCar' Then '19'
		when di.policyType like 'HO%' Then  '4'
		When di.policyType = 'Umbrella'    Then '0'
		else '0'
	End AS AnnualStatementLineofBusinessCode,
  p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Coverages)
	WITH (patterncode nvarchar(100), coveragename  nvarchar(100), CDC_Coverage_PublicID nvarchar(100)) cov
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##Coverage(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	InsurableObjectSourceCode,
	CoverageSourceCode,
	CoverageCode,
	CoverageDesc,
	EffectiveDate,
	ExpirationDate,
	CancellationDate,
	IsIncludedInPremiumInd,
	IsMineSubsidenceInd,
	AnnualStatementLineofBusinessCode
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'InsurableObjectCoverage' as master,
	InsurableObjectSourceCode,
	CoverageSourceCode,
	left(CoverageCode, 20) as CoverageCode,
	CoverageDesc,
	EffectiveDate,
	ExpirationDate,
	CancellationDate,
	IsIncludedInPremiumInd,
	IsMineSubsidenceInd,
	AnnualStatementLineofBusinessCode
FROM (
SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	--pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    covs.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
    CONCAT(cov.CDC_Coverage_PublicID, '_io') AS CoverageSourceCode,
    cov.PatternCode AS CoverageCode,
	cov.coveragename AS CoverageDesc,
    s.EditEffectiveDate AS EffectiveDate,
    s.SliceEndDate AS ExpirationDate,
    CASE
      WHEN p.JobType = 'Cancellation' THEN s.EditEffectiveDate
    ELSE
    NULL
  END
    AS CancellationDate,
    1 AS IsIncludedInPremiumInd,
    CAST(CASE
        WHEN cov.PatternCode = 'EH_MineSubCov' THEN 1
      ELSE
      0
    END
      AS BIT) AS IsMineSubsidenceInd,
	Case when di.policyType = 'EAFamilyCar' Then '19'
		when di.policyType like 'HO%' Then  '4'
		When di.policyType = 'Umbrella'    Then '0'
		else '0'
	End AS AnnualStatementLineofBusinessCode,
  p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverables nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Coverables)
	WITH (CDC_Coverable_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON) covs
	CROSS APPLY OPENJSON(covs.Coverages)
	WITH (patterncode nvarchar(100), coveragename  nvarchar(100), CDC_Coverage_PublicID nvarchar(100)) cov
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################

 INSERT INTO ##TransactionCost_Coverage(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	LineofBusinessSourceCode,
	CoverageSourceCode,
	CurrentTermBaseAmt,
	WrittenPremiumBaseAmt
)
 SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'LineOfBusinessCoverage' as master,
	LineofBusinessSourceCode,
	CoverageSourceCode,
	SUM(CurrentTermBaseAmt) as CurrentTermBaseAmt,
	SUM(WrittenPremiumBaseAmt) as WrittenPremiumBaseAmt
 FROM (SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    --covs.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
    cov.CDC_Coverage_PublicID AS CoverageSourceCode,
	ftc.ActualTermAmount AS CurrentTermBaseAmt,
	ftc.StandardTermAmount AS WrittenPremiumBaseAmt,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Coverages)
	WITH (patterncode nvarchar(100), coveragename  nvarchar(100), CDC_Coverage_PublicID nvarchar(100), FullTermCosts nvarchar(max) AS JSON) cov
	CROSS APPLY OPENJSON(cov.FullTermCosts)
	WITH (ActualTermAmount decimal(20, 6), StandardTermAmount decimal(20, 6)) ftc
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) b
  GROUP BY SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	LineofBusinessSourceCode,
	CoverageSourceCode

 INSERT INTO ##TransactionCost_Coverage(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	InsurableObjectSourceCode,
	CoverageSourceCode,
	CurrentTermBaseAmt,
	WrittenPremiumBaseAmt
)
 SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'InsurableObjectCoverage' as master,
	InsurableObjectSourceCode,
	CoverageSourceCode,
	SUM(CurrentTermBaseAmt) as CurrentTermBaseAmt,
	SUM(WrittenPremiumBaseAmt) as WrittenPremiumBaseAmt
 FROM (SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	--pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    covs.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
    CONCAT(cov.CDC_Coverage_PublicID, '_io') AS CoverageSourceCode,--cov.CDC_Coverage_PublicID AS CoverageSourceCode,
	ftc.ActualTermAmount AS CurrentTermBaseAmt,
	ftc.StandardTermAmount AS WrittenPremiumBaseAmt,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverables nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Coverables)
	WITH (CDC_Coverable_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON) covs
	CROSS APPLY OPENJSON(covs.Coverages)
	WITH (patterncode nvarchar(100), coveragename  nvarchar(100), CDC_Coverage_PublicID nvarchar(100), FullTermCosts nvarchar(max) AS JSON) cov
	CROSS APPLY OPENJSON(cov.FullTermCosts)
	WITH (ActualTermAmount decimal(20, 6), StandardTermAmount decimal(20, 6)) ftc
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) b
  GROUP BY SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	InsurableObjectSourceCode,
	CoverageSourceCode

--#######################################

insert into ##WritingCompany(
	SourceSystemCode,
	ProcessDateTime,
	master,
	PolicySourceCode,
	WritingCompanySourceCode,
	WritingCompanyCode,
	WritingCompanyName,
	IsFrontingCompanyInd,
	IsActiveInd,
	IsAdmittedInd
)
SELECT SourceSystemCode,
	ProcessDateTime,
	'Policy' as master,
	PolicySourceCode,
	WritingCompanySourceCode,
	WritingCompanyCode,
	WritingCompanyName,
	IsFrontingCompanyInd,
	IsActiveInd,
	IsAdmittedInd
 FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	di.underwritingCompany as WritingCompanySourceCode,
	di.underwritingCompany as WritingCompanyCode,
	di.underwritingCompany as WritingCompanyName,
	0 as IsFrontingCompanyInd,
	0 as IsActiveInd,
	0 as IsAdmittedInd,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, TermStartDate datetime, TermEndDate datetime, JobType nvarchar(100), ContractState nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), policyType nvarchar(100), productLine nvarchar(100), underwritingCompany nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON, Producer nvarchar(max) AS JSON) s
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################

INSERT INTO ##PolicyDiscount(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	LineofBusinessSourceCode,
	PolicyDiscountSourceCode,
	DiscountTypeCode,
	DiscountTypeDesc,
	DiscountLevelCode,
	PolicyDiscountBaseAmt)
SELECT 
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'LineOfBusiness' as master,
	LineofBusinessSourceCode,
	PolicyDiscountSourceCode,
	left(DiscountTypeCode, 20) as DiscountTypeCode,
	DiscountTypeDesc,
	DiscountLevelCode,
	SUM(PolicyDiscountBaseAmt) AS PolicyDiscountBaseAmt
FROM (
 SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    --covs.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
    --NULL AS CoverageSourceCode,
    dis.CDC_Modifier_PublicID AS PolicyDiscountSourceCode,
	dis.ModifierPatternCode as DiscountTypeCode,
	dis.ModifierPatternName as DiscountTypeDesc,
	ftc.StandardTermAmount AS PolicyDiscountBaseAmt,
	'LineOfBusiness' as DiscountLevelCode,
  p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverables nvarchar(max) AS JSON, Modifiers nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Modifiers)
	WITH (CDC_Modifier_PublicID nvarchar(100), ModifierType nvarchar(100), ModifierPatternCode nvarchar(100), ModifierPatternName nvarchar(100), FullTermCosts nvarchar(max) AS JSON) dis
	CROSS APPLY OPENJSON(dis.FullTermCosts)
	WITH (ActualTermAmountInfo decimal(20, 6), StandardTermAmount decimal(20, 6)) ftc
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
	AND dis.ModifierType = 'discount'
) a
GROUP BY SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	LineofBusinessSourceCode,
	PolicyDiscountSourceCode,
	DiscountTypeCode,
	DiscountTypeDesc,
	DiscountLevelCode

INSERT INTO ##PolicyDiscount(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	InsurableObjectSourceCode,
	PolicyDiscountSourceCode,
	DiscountTypeCode,
	DiscountTypeDesc,
	DiscountLevelCode,
	PolicyDiscountBaseAmt)
SELECT 
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'InsurableObject' as master,
	InsurableObjectSourceCode,
	PolicyDiscountSourceCode,
	left(DiscountTypeCode, 20) as DiscountTypeCode,
	DiscountTypeDesc,
	DiscountLevelCode,
	SUM(PolicyDiscountBaseAmt) AS PolicyDiscountBaseAmt
FROM (
 SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	--pl.CDC_PolicyLine_PublicID AS LineofBusinessSourceCode,
    covs.CDC_Coverable_PublicID AS InsurableObjectSourceCode,
    --NULL AS CoverageSourceCode,
    dis.CDC_Modifier_PublicID AS PolicyDiscountSourceCode,
	dis.ModifierPatternCode as DiscountTypeCode,
	dis.ModifierPatternName as DiscountTypeDesc,
	ftc.StandardTermAmount AS PolicyDiscountBaseAmt,
	'InsurableObject' as DiscountLevelCode,
  p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, ProductLine nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.ProductLine)
	WITH (CDC_PolicyLine_PublicID nvarchar(100), Coverables nvarchar(max) AS JSON) pl
	CROSS APPLY OPENJSON(pl.Coverables)
	WITH (CDC_Coverable_PublicID nvarchar(100), Coverages nvarchar(max) AS JSON, Modifiers nvarchar(max) AS JSON) covs
	CROSS APPLY OPENJSON(covs.Modifiers)
	WITH (CDC_Modifier_PublicID nvarchar(100), ModifierType nvarchar(100), ModifierPatternCode nvarchar(100), ModifierPatternName nvarchar(100), FullTermCosts nvarchar(max) AS JSON) dis
	CROSS APPLY OPENJSON(dis.FullTermCosts)
	WITH (ActualTermAmountInfo decimal(20, 6), StandardTermAmount decimal(20, 6)) ftc
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
	AND dis.ModifierType = 'discount'
) a
GROUP BY SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	InsurableObjectSourceCode,
	PolicyDiscountSourceCode,
	DiscountTypeCode,
	DiscountTypeDesc,
	DiscountLevelCode

--#######################################

INSERT INTO ##Agency(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	AgencySourceCode,
	AgencyNum,
	OrganizationName)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	AgencySourceCode,
	AgencyNum,
	OrganizationName
FROM (
  SELECT
	di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
	CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	ag.ProducerOfRecord as AgencySourceCode,
	ag.ProducerOfRecord as AgencyNum,
	ag.ProducerAgency as OrganizationName,
    p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, Producer nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.Producer)
	WITH (ProducerAgency nvarchar(100), ProducerOfRecord nvarchar(100)) ag
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##PartyInfo(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	AgencySourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	FullName,
	MaritalStatusCode,
	GenderCode,
	OrganizationName
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Agency' as master,
	AgencySourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	left(FullName, 50) as FullName,
	left(MaritalStatusCode, 20) as MaritalStatusCode,
	GenderCode,
	OrganizationName
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	ProducerOfRecord as AgencySourceCode,
	ProducerOfRecord as PartyInfoSourceCode,
    'Company' AS PartyTypeCode,
    ag.ProducerAgency AS FullName,
    'Undefined' AS MaritalStatusCode,
    'Undefined' AS GenderCode,
	ag.ProducerAgency as OrganizationName,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, Producer nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.Producer)
	WITH (ProducerAgency nvarchar(100), ProducerOfRecord nvarchar(100)) ag
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##PartyRole(
SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	AgencySourceCode,
	PartyRoleSourceCode,
	PartyRoleCode,
	PartyRoleDesc
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Agency' as master,
	AgencySourceCode,
	PartyRoleSourceCode,
	PartyRoleCode,
	PartyRoleDesc
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	ProducerOfRecord as AgencySourceCode,
	ProducerOfRecord as PartyRoleSourceCode,
    'agency' AS PartyRoleCode,
	'Agency' as PartyRoleDesc,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, Producer nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.Producer)
	WITH (ProducerAgency nvarchar(100), ProducerOfRecord nvarchar(100)) ag
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

INSERT INTO ##PartyAddress(
	SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	master,
	AgencySourceCode,
	PartyRoleSourceCode,
	PartyAddressSourceCode,
	AddressTypeCode,
	AddressLine1,
	CityName,
	CountryCode,
	StateCode,
	PostalCode,
	IsPrimaryInd
)
SELECT SourceSystemCode,
	ProcessDateTime,
	PolicySourceCode,
	'Agency' as master,
	AgencySourceCode,
	PartyRoleSourceCode,
	PartyAddressSourceCode,
	AddressTypeCode,
	AddressLine1,
	CityName,
	CountryCode,
	StateCode,
	PostalCode,
	IsPrimaryInd
FROM (
  SELECT
    di.sourceSystem AS SourceSystemCode,
	p.PublishedTimestamp as ProcessDateTime,
    CONCAT (p.CDC_Policy_PublicID, '-', isnull(p.TermNumber, 0) ) AS PolicySourceCode,
	ProducerOfRecord as AgencySourceCode,
	ProducerOfRecord as PartyRoleSourceCode,
	ProducerOfRecord as PartyAddressSourceCode,
	'business' as AddressTypeCode,
	'5327 W Keefe Ave' as AddressLine1,
	'Milwaukee' as CityName,
	'US' as CountryCode,
	'WI' as StateCode,
	'53216' as PostalCode,
	1 as IsPrimaryInd,
	p.__s3Path
  FROM
    gentd.input_data_amfam line
	CROSS APPLY OPENJSON(line.JsonLine)
	WITH (CDC_Policy_PublicID nvarchar(100), PolicyNumber nvarchar(100), TermNumber nvarchar(100), EventType nvarchar(100), JobNumber nvarchar(100), PublishedTimestamp datetime, JobType nvarchar(100), ProductSubLine nvarchar(100), __s3Path nvarchar(100), DataIdentifier nvarchar(max) AS JSON, Slices nvarchar(max) AS JSON) p
	CROSS APPLY OPENJSON(p.DataIdentifier)
	WITH (sourceSystem nvarchar(100), productLine nvarchar(100), policyType nvarchar(100)) di
	CROSS APPLY OPENJSON(p.Slices)
	WITH (JobNumber nvarchar(100), JobType nvarchar(100), CDC_PolicyPeriod_BranchID nvarchar(100), EditEffectiveDate datetime, SliceEndDate datetime, Producer nvarchar(max) AS JSON) s
	CROSS APPLY OPENJSON(s.Producer)
	WITH (ProducerAgency nvarchar(100), ProducerOfRecord nvarchar(100)) ag
  WHERE 1=1
	AND p.EventType = 'IssuePolicy'
	AND p.PolicyNumber IS NOT NULL
	AND s.JobNumber = p.JobNumber
	AND s.JobType = p.JobType
) a

--#######################################


--select * from ##Root
--select * from ##Policy
--select * from ##PolicyTrans
--select * from ##LineOfBusiness
--select * from ##Geography
--select * from ##InsurableObject
--select * from ##Coverage
--select * from ##Insured
--select * from ##PartyInfo
--select * from ##TransactionCost_Coverage



/*
truncate table gentd.input_data_amfam

CREATE TABLE gentd.input_data_amfam(
	[JsonLine] [nvarchar](max) NULL,
	[FileName] [nvarchar](500) NULL,
	[FilePath] [nvarchar](500) NULL,
	[BatchId] [uniqueidentifier] NULL,
	[LoadDate] [datetime] NULL
)

insert into gentd.input_data_amfam ([JsonLine]) values (
'{
	"AccessLogs": [
		{
			"AccessSourceName": "PORTAL_INITIATESUBMISSION",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4776",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "API_SUBMISSION_QUOTE",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4776",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "PORTAL_INITIATESUBMISSION",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4776",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "API_SUBMISSION_BIND",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4777",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "PORTAL_INITIATESUBMISSION",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4776",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "API_SUBMISSION_QUOTE",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4777",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "PORTAL_INITIATESUBMISSION",
			"JobID": "e1p-pc:2229",
			"JobNumber": "0054609637",
			"PartnerAccountID": "529",
			"PartnerID": "529",
			"PolicyPeriodID": "e1p-pc:4777",
			"UserID": "QINE1P"
		},
		{
			"AccessSourceName": "PublishDocService",
			"JobNumber": "0054609637",
			"PolicyPeriodID": "e1p-pc:4777"
		}
	],
	"Account": {
		"AccountContactPublicID": "e1p-pc:3707",
		"AccountNumber": "0844077957",
		"CDC_Account_PublicID": "e1p-pc:1765"
	},
	"CDC_Policy_PublicID": "e1p-pc:2107",
	"CreatedBy": "QINE1P",
	"DataIdentifier": {
		"partnerAccountNumber": "52910",
		"partnerID": "529",
		"policyType": "EAFamilyCar",
		"productLine": "EAAutoLine_Ext",
		"sourceSystem": "E1PC",
		"underwritingCompany": "GDMIC"
	},
	"EventType": "IssuePolicy",
	"HistoryLogs": [
		{
			"HistoryCustomType": "sub_issued",
			"HistoryDescription": "Submission Issued",
			"HistoryEventTimestamp": "Wed Nov 18 10:17:13 PST 2020"
		},
		{
			"HistoryCustomType": "sub_bound",
			"HistoryDescription": "Submission Bound",
			"HistoryEventTimestamp": "Wed Nov 18 10:17:13 PST 2020"
		},
		{
			"HistoryCustomType": "purgeenabled",
			"HistoryDescription": "null for Policy Period: e1p-pc:4777",
			"HistoryEventTimestamp": "Wed Nov 18 10:16:48 PST 2020"
		},
		{
			"HistoryCustomType": "sub_created",
			"HistoryDescription": "Submission Created",
			"HistoryEventTimestamp": "Wed Nov 18 10:16:43 PST 2020"
		}
	],
	"JobNumber": "0054609637",
	"JobType": "Submission",
	"PartnerAccountID": "52910",
	"PartnerCode": "529",
	"PolicyEventLogs": [
		{
			"accountNumber": "0844077957",
			"eventId": "e624fdab-9c55-49a6-8868-3c3e7d5b8003",
			"eventSubtype": "Submission",
			"eventTimestamp": "2020-11-18T18:17:10.789Z",
			"eventType": "TransactionQuoted",
			"jobNumber": "0054609637",
			"policyGuid": "9cd9ba1e-f2d1-40ce-8bbb-1da61f5da6a0",
			"policyNumber": "A79185654",
			"producerCode": "35601",
			"productIdentifier": {
				"brandId": "123456789012",
				"experienceId": "TODO",
				"partnerCode": "529",
				"policyLine": "EAAutoLine_Ext",
				"policyType": "EAFamilyCar",
				"product": "PersonalAuto_EA",
				"version": "TODO"
			},
			"rateID": "092c7637-9559-475d-b363-86a8950374cb",
			"sliceStartDate": "2020-11-18",
			"sourceSystem": "E1PC"
		},
		{
			"accountNumber": "0844077957",
			"eventId": "b0111739-1d90-40f2-bf5f-5dda0425e07b",
			"eventSubtype": "Submission",
			"eventTimestamp": "2020-11-18T18:17:13.806Z",
			"eventType": "TransactionBound",
			"jobNumber": "0054609637",
			"policyGuid": "6c71c4a4-f346-4a7a-9862-2685ccd766e1",
			"policyNumber": "A79185654",
			"producerCode": "35601",
			"productIdentifier": {
				"brandId": "123456789012",
				"experienceId": "TODO",
				"partnerCode": "529",
				"policyLine": "EAAutoLine_Ext",
				"policyType": "EAFamilyCar",
				"product": "PersonalAuto_EA",
				"version": "TODO"
			},
			"rateID": "092c7637-9559-475d-b363-86a8950374cb",
			"sliceStartDate": "2020-11-18",
			"sourceSystem": "E1PC"
		},
		{
			"accountNumber": "0844077957",
			"eventId": "83703bd0-52fe-48de-97e0-1506a6b1cdb6",
			"eventSubtype": "Submission",
			"eventTimestamp": "2020-11-18T18:17:14.052Z",
			"eventType": "TransactionIssued",
			"jobNumber": "0054609637",
			"policyGuid": "6cdacd83-1271-492a-bf62-d78ee759ed0c",
			"policyNumber": "A79185654",
			"producerCode": "35601",
			"productIdentifier": {
				"brandId": "123456789012",
				"experienceId": "TODO",
				"partnerCode": "529",
				"policyLine": "EAAutoLine_Ext",
				"policyType": "EAFamilyCar",
				"product": "PersonalAuto_EA",
				"version": "TODO"
			},
			"rateID": "092c7637-9559-475d-b363-86a8950374cb",
			"sliceStartDate": "2020-11-18",
			"sourceSystem": "E1PC"
		},
		{
			"accountNumber": "0844077957",
			"eventId": "bcf01074-3564-4946-92c8-b7a0f1af361b",
			"eventSubtype": "Submission",
			"eventTimestamp": "2020-11-18T18:17:14.061Z",
			"eventType": "DocsSentToCustomer",
			"jobNumber": "0054609637",
			"policyGuid": "987a6414-f571-4c1b-b320-c3a8bef4680b",
			"policyNumber": "A79185654",
			"producerCode": "35601",
			"productIdentifier": {
				"brandId": "123456789012",
				"experienceId": "TODO",
				"partnerCode": "529",
				"policyLine": "EAAutoLine_Ext",
				"policyType": "EAFamilyCar",
				"product": "PersonalAuto_EA",
				"version": "TODO"
			},
			"rateID": "092c7637-9559-475d-b363-86a8950374cb",
			"sliceStartDate": "2020-11-18",
			"sourceSystem": "E1PC"
		},
		{
			"accountNumber": "0844077957",
			"eventId": "4fcb374a-88c5-498b-9499-5bfb252d8a0f",
			"eventSubtype": "Submission",
			"eventTimestamp": "2020-11-18T18:16:59.241Z",
			"eventType": "TransactionQuoted",
			"jobNumber": "0054609637",
			"policyGuid": "0c4b43a0-110b-4f95-a825-12ddfc5eb494",
			"producerCode": "35601",
			"productIdentifier": {
				"brandId": "123456789012",
				"experienceId": "TODO",
				"partnerCode": "529",
				"policyLine": "EAAutoLine_Ext",
				"policyType": "EAFamilyCar",
				"product": "PersonalAuto_EA",
				"version": "TODO"
			},
			"rateID": "dd0ec415-230c-4a8a-bdba-8ae05d10d2f4",
			"sliceStartDate": "2020-11-18",
			"sourceSystem": "E1PC"
		},
		{
			"accountNumber": "0844077957",
			"eventId": "d4428f3b-e726-4293-a422-4ab6a5a22b4a",
			"eventSubtype": "Submission",
			"eventTimestamp": "2020-11-18T18:17:00.422Z",
			"eventType": "ConvertToFullApp",
			"jobNumber": "0054609637",
			"policyGuid": "db961788-c207-430a-a1a7-a7aa97dc52c4",
			"policyNumber": "A79185654",
			"producerCode": "35601",
			"productIdentifier": {
				"brandId": "123456789012",
				"experienceId": "TODO",
				"partnerCode": "529",
				"policyLine": "EAAutoLine_Ext",
				"policyType": "EAFamilyCar",
				"product": "PersonalAuto_EA",
				"version": "TODO"
			},
			"rateID": "dd0ec415-230c-4a8a-bdba-8ae05d10d2f4",
			"sliceStartDate": "2020-11-18",
			"sourceSystem": "E1PC"
		}
	],
	"PolicyInceptionDate": "2020-11-18T08:01:00.000Z",
	"PolicyNumber": "A79185654",
	"ProductSubLine": "EAFamilyCar",
	"PublishedTimestamp": "2020-11-18T18:17:14.093Z",
	"QuoteRatingChannel": "Independent Agent",
	"Slices": [
		{
			"BusinessChangeLog": {},
			"CDC_PolicyPeriod_BranchID": "4777",
			"CreatedBy": "QINE1P",
			"EditEffectiveDate": "2020-11-18T08:01:00.000Z",
			"InferredForms": [
				{
					"EditionDate": "03 13",
					"FixedID": "58486",
					"FormDescription": "Road Trip Accident Accommodations Coverage",
					"FormNumber": "PV 84 12",
					"PublicID": "e1p-pc:58486"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58487",
					"FormDescription": "Indiana Acknowledgment of Coverage Selection or Rejection",
					"FormNumber": "VE SRJ 003 IN",
					"PublicID": "e1p-pc:58487"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58484",
					"FormDescription": "Proof of Insurance Cards",
					"FormNumber": "VE POI 001 IN",
					"PublicID": "e1p-pc:58484"
				},
				{
					"EditionDate": "01 16",
					"FixedID": "58485",
					"FormDescription": "Rental Reimbursement Coverage",
					"FormNumber": "PVM 84 03",
					"PublicID": "e1p-pc:58485"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58482",
					"FormDescription": "New Business Welcome Letter",
					"FormNumber": "ML LTR 005 GE",
					"PublicID": "e1p-pc:58482"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58483",
					"FormDescription": "MSA Privacy Notice",
					"FormNumber": "ML PRN 001 GE",
					"PublicID": "e1p-pc:58483"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58480",
					"FormDescription": "Personal Auto Policy",
					"FormNumber": "VE POL 001 GE",
					"PublicID": "e1p-pc:58480"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58481",
					"FormDescription": "Medical Expense Coverage - Indiana",
					"FormNumber": "VE PIP 002 IN",
					"PublicID": "e1p-pc:58481"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58490",
					"FormDescription": "Uninsured Motorist - Bodily Injury Coverage - Indiana",
					"FormNumber": "VE UIM 010 IN",
					"PublicID": "e1p-pc:58490"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58491",
					"FormDescription": "Uninsured Motorist - Property Damage Coverage - Indiana",
					"FormNumber": "VE UIM 012 IN",
					"PublicID": "e1p-pc:58491"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58488",
					"FormDescription": "Important Policy Information - Indiana",
					"FormNumber": "ML FRM 003 IN",
					"PublicID": "e1p-pc:58488"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58489",
					"FormDescription": "Underinsured Motorist - Bodily Injury Coverage - Indiana",
					"FormNumber": "VE UIM 011 IN",
					"PublicID": "e1p-pc:58489"
				},
				{
					"EditionDate": "01 19",
					"FixedID": "58478",
					"FormDescription": "Emergency Roadside Service Coverage",
					"FormNumber": "PVM 84 05",
					"PublicID": "e1p-pc:58478"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58479",
					"FormDescription": "Personal Auto Policy Application",
					"FormNumber": "VE APP 001 IN",
					"PublicID": "e1p-pc:58479"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58476",
					"FormDescription": "Indiana Changes",
					"FormNumber": "VE STC 003 IN",
					"PublicID": "e1p-pc:58476"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58477",
					"FormDescription": "Declaration Form",
					"FormNumber": "VE DEC 001 IN",
					"PublicID": "e1p-pc:58477"
				},
				{
					"EditionDate": "11 20",
					"FixedID": "58475",
					"FormDescription": "Cancellation and Nonrenewal - Indiana",
					"FormNumber": "VE CNR 002 IN",
					"PublicID": "e1p-pc:58475"
				}
			],
			"JobNumber": "0054609637",
			"JobType": "Submission",
			"PolicyContacts": [
				{
					"CDC_Contact_PublicID": "e1p-pc:3707",
					"ContactType": "Person",
					"PolicyContactRoles": [
						{
							"CDC_ContactRole_FixedID": "16087",
							"CDC_ContactRole_PublicID": "e1p-pc:16089",
							"CellPhone": "7820144011",
							"ContactRoleType": "EAPolicyDriver_Ext",
							"DOB": "2000-02-15",
							"FirstName": "MARK",
							"Gender": "M",
							"HomePhone": "8064216652",
							"LastName": "TRAIN",
							"MaritialStatus": "NeverMarried_ext",
							"PartnerCode": "529",
							"PolicyDriver": {
								"AwayAtSchoolInd": false,
								"DefenseDrvCompleteDueToVioInd": false,
								"DefensiveDriverCourseInd": false,
								"DriverRoleType": "operator",
								"GoodStudentInd": false,
								"IsDrivingPrivilegeRevoked": "no",
								"IsInsurancePolicyRefused": "no",
								"LicenseNumber": "E025860579",
								"LicenseState": "IN"
							},
							"PrimaryMailingAddress": {
								"addressLine1": "2905 Newton St",
								"addressType": "home",
								"city": "Jasper",
								"countryCode": "US",
								"postalCode": "47546",
								"state": "IN",
								"stateCodeAsString": "Indiana"
							},
							"PrimaryResidenceAddress": {
								"addressLine1": "2905 Newton St",
								"addressType": "home",
								"city": "Jasper",
								"countryCode": "US",
								"postalCode": "47546",
								"state": "IN",
								"stateCodeAsString": "Indiana"
							},
							"integrationId": "e1p-pc:16087"
						},
						{
							"CDC_ContactRole_FixedID": "16086",
							"CDC_ContactRole_PublicID": "e1p-pc:16088",
							"CellPhone": "7820144011",
							"ContactRoleType": "PolicyPriNamedInsured",
							"DOB": "2000-02-15",
							"FirstName": "MARK",
							"Gender": "M",
							"HomePhone": "8064216652",
							"LastName": "TRAIN",
							"MaritialStatus": "NeverMarried_ext",
							"PartnerCode": "529",
							"PrimaryMailingAddress": {
								"addressLine1": "2905 Newton St",
								"addressType": "home",
								"city": "Jasper",
								"countryCode": "US",
								"postalCode": "47546",
								"state": "IN",
								"stateCodeAsString": "Indiana"
							},
							"PrimaryResidenceAddress": {
								"addressLine1": "2905 Newton St",
								"addressType": "home",
								"city": "Jasper",
								"countryCode": "US",
								"postalCode": "47546",
								"state": "IN",
								"stateCodeAsString": "Indiana"
							},
							"integrationId": "e1p-pc:16086"
						}
					]
				}
			],
			"Producer": {
				"ProducerAgency": "E1P External Agencies",
				"ProducerOfRecord": "35601"
			},
			"ProductLine": {
				"CDC_PolicyLine_FixedID": "8696",
				"CDC_PolicyLine_PublicID": "e1p-pc:8698",
				"ContractState": "IN",
				"Coverables": [
					{
						"CDC_Coverable_FixedID": "3375",
						"CDC_Coverable_PublicID": "e1p-pc:3377",
						"Coverages": [
							{
								"CDC_Coverage_FixedID": "12279",
								"CDC_Coverage_PublicID": "e1p-pc:12279",
								"FullTermCosts": [
									{
										"ActualTermAmount": "7.10",
										"CDC_Cost_FixedID": "24774",
										"CDC_Cost_PublicID": "e1p-pc:24774",
										"ChargePattern": "Premium",
										"CostCategory": "EAVehicleCovCost_Ext",
										"NumDaysInRatedTerm": 181,
										"Overridable": true,
										"OverrideSource": "manual",
										"RateAmountType": "StdPremium",
										"StandardBaseRate": "1.0000",
										"StandardTermAmount": "7.10"
									}
								],
								"Terms": [
									{
										"SelectedOptionCode": "EA_EmergencyRoadsideService_IncidentLimit",
										"SelectedOptionName": "Incident Limit",
										"SelectedOptionValue": "3",
										"TermName": "Incident Limit",
										"TermPatternCode": "EA_EmergencyRoadsideService_IncidentLimit"
									}
								],
								"coveragename": "Emergency Roadside Service",
								"patterncode": "EA_EmergencyRoadsideService"
							},
							{
								"CDC_Coverage_FixedID": "12284",
								"CDC_Coverage_PublicID": "e1p-pc:12284",
								"FullTermCosts": [
									{
										"ActualTermAmount": "681.90",
										"CDC_Cost_FixedID": "24782",
										"CDC_Cost_PublicID": "e1p-pc:24782",
										"ChargePattern": "Premium",
										"CostCategory": "EAVehicleCovCost_Ext",
										"NumDaysInRatedTerm": 181,
										"Overridable": true,
										"OverrideSource": "manual",
										"RateAmountType": "StdPremium",
										"StandardBaseRate": "1.0000",
										"StandardTermAmount": "681.90"
									}
								],
								"Terms": [
									{
										"SelectedOptionCode": "EA_Comprehensive_Deductible",
										"SelectedOptionName": "Deductible",
										"SelectedOptionValue": "500",
										"TermName": "Deductible",
										"TermPatternCode": "EA_Comprehensive_Deductible"
									}
								],
								"coveragename": "Comprehensive",
								"patterncode": "EA_Comprehensive"
							},
							{
								"CDC_Coverage_FixedID": "12282",
								"CDC_Coverage_PublicID": "e1p-pc:12282",
								"FullTermCosts": [
									{
										"ActualTermAmount": "3751.80",
										"CDC_Cost_FixedID": "24778",
										"CDC_Cost_PublicID": "e1p-pc:24778",
										"ChargePattern": "Premium",
										"CostCategory": "EAVehicleCovCost_Ext",
										"NumDaysInRatedTerm": 181,
										"Overridable": true,
										"OverrideSource": "manual",
										"RateAmountType": "StdPremium",
										"StandardBaseRate": "1.0000",
										"StandardTermAmount": "3751.80"
									}
								],
								"Terms": [
									{
										"SelectedOptionCode": "EA_Collision_Deductible",
										"SelectedOptionName": "Deductible",
										"SelectedOptionValue": "500",
										"TermName": "Deductible",
										"TermPatternCode": "EA_Collision_Deductible"
									}
								],
								"coveragename": "Collision",
								"patterncode": "EA_Collision"
							},
							{
								"CDC_Coverage_FixedID": "12283",
								"CDC_Coverage_PublicID": "e1p-pc:12283",
								"FullTermCosts": [
									{
										"ActualTermAmount": "13.00",
										"CDC_Cost_FixedID": "24777",
										"CDC_Cost_PublicID": "e1p-pc:24777",
										"ChargePattern": "Premium",
										"CostCategory": "EAVehicleCovCost_Ext",
										"NumDaysInRatedTerm": 181,
										"Overridable": true,
										"OverrideSource": "manual",
										"RateAmountType": "StdPremium",
										"StandardBaseRate": "1.0000",
										"StandardTermAmount": "13.00"
									}
								],
								"Terms": [
									{
										"SelectedOptionCode": "EA_UMPD_Vehicle_Limit",
										"SelectedOptionName": "Per Accident",
										"SelectedOptionValue": "25000",
										"TermName": "Per Accident",
										"TermPatternCode": "EA_UMPD_Vehicle_Limit"
									},
									{
										"SelectedOptionCode": "EA_UMPD_Vehicle_Deductible",
										"SelectedOptionName": "Deductible",
										"SelectedOptionValue": "0",
										"TermName": "Deductible",
										"TermPatternCode": "EA_UMPD_Vehicle_Deductible"
									}
								],
								"coveragename": "Uninsured Motorist Property Damage",
								"patterncode": "EA_UMPD_Vehicle"
							},
							{
								"CDC_Coverage_FixedID": "12280",
								"CDC_Coverage_PublicID": "e1p-pc:12280",
								"FullTermCosts": [
									{
										"ActualTermAmount": "13.20",
										"CDC_Cost_FixedID": "24776",
										"CDC_Cost_PublicID": "e1p-pc:24776",
										"ChargePattern": "Premium",
										"CostCategory": "EAVehicleCovCost_Ext",
										"NumDaysInRatedTerm": 181,
										"Overridable": true,
										"OverrideSource": "manual",
										"RateAmountType": "StdPremium",
										"StandardBaseRate": "1.0000",
										"StandardTermAmount": "13.20"
									}
								],
								"Terms": [
									{
										"SelectedOptionCode": "EA_RentalReimbursement_DailyLimitMaximum",
										"SelectedOptionName": "Daily Limit/Maximum",
										"SelectedOptionValue": "25/750",
										"TermName": "Daily Limit/Maximum",
										"TermPatternCode": "EA_RentalReimbursement_DailyLimitMaximum"
									}
								],
								"coveragename": "Rental Reimbursement",
								"patterncode": "EA_RentalReimbursement"
							},
							{
								"CDC_Coverage_FixedID": "12281",
								"CDC_Coverage_PublicID": "e1p-pc:12281",
								"FullTermCosts": [
									{
										"ActualTermAmount": "5.00",
										"CDC_Cost_FixedID": "24775",
										"CDC_Cost_PublicID": "e1p-pc:24775",
										"ChargePattern": "Premium",
										"CostCategory": "EAVehicleCovCost_Ext",
										"NumDaysInRatedTerm": 181,
										"Overridable": true,
										"OverrideSource": "manual",
										"RateAmountType": "StdPremium",
										"StandardBaseRate": "1.0000",
										"StandardTermAmount": "5.00"
									}
								],
								"coveragename": "Road Trip Accident Accommodations",
								"patterncode": "EA_RoadTripAccidentAccommodations"
							}
						],
						"EAVehicle": {
							"BusinessUseInd": false,
							"CDC_Vehicle_FixedID": "3375",
							"CDC_Vehicle_PublicID": "e1p-pc:3377",
							"KitVehicleInd": false,
							"OtherThanNamedInsuredOwnsInd": false,
							"SalvageTitleInd": false,
							"ValidatedVINStatus": "INVALID",
							"VehicleLeasedInd": false,
							"WaiveVehicleInspectionInd": false,
							"displayName": "2020 FORD F-150 VIN: 1HGFA16596L003410",
							"garagingLocation": {
								"addressLine1": "7729 WOHAMA DR",
								"addressType": "home",
								"city": "FORT WAYNE",
								"countryCode": "US",
								"postalCode": "47546",
								"state": "IN",
								"stateCodeAsString": "Indiana"
							},
							"grossVehicleWeight": 2601,
							"integrationId": "e1p-pc:3375",
							"make": "FORD",
							"model": "F-150",
							"msrp": "115313.00",
							"primaryUse": "FarmYearRoundTruck_ext",
							"safetyFeatures": [
								{
									"airBagType": "Front",
									"equipmentAvailability": "Optional",
									"equippedInd": true,
									"userEquipmentAvailabilityInd": true,
									"vehicleEquipmentType": "AirBags"
								}
							],
							"series": "Lx",
							"vehicleType": "auto",
							"vin": "1HGFA16596L003410",
							"year": 2020
						}
					}
				],
				"Coverages": [
					{
						"CDC_Coverage_FixedID": "10933",
						"CDC_Coverage_PublicID": "e1p-pc:10938",
						"FullTermCosts": [
							{
								"ActualTermAmount": "127.30",
								"CDC_Cost_FixedID": "24772",
								"CDC_Cost_PublicID": "e1p-pc:24772",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineCovCost_Ext",
								"CostType": "PAC",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "127.30"
							},
							{
								"ActualTermAmount": "1404.50",
								"CDC_Cost_FixedID": "24773",
								"CDC_Cost_PublicID": "e1p-pc:24773",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineCovCost_Ext",
								"CostType": "PREMIUM_WITHOUT_PAC",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "1404.50"
							}
						],
						"Terms": [
							{
								"SelectedOptionCode": "EA_BodilyInjury_Limit",
								"SelectedOptionName": "Per Person/Per Occurrence",
								"SelectedOptionValue": "250/500",
								"TermName": "Per Person/Per Occurrence",
								"TermPatternCode": "EA_BodilyInjury_Limit"
							}
						],
						"coveragename": "Bodily Injury Liability",
						"patterncode": "EA_BodilyInjury"
					},
					{
						"CDC_Coverage_FixedID": "10934",
						"CDC_Coverage_PublicID": "e1p-pc:10939",
						"FullTermCosts": [
							{
								"ActualTermAmount": "756.40",
								"CDC_Cost_FixedID": "24779",
								"CDC_Cost_PublicID": "e1p-pc:24779",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineCovCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "756.40"
							}
						],
						"Terms": [
							{
								"SelectedOptionCode": "EA_PropertyDamage_Limit",
								"SelectedOptionName": "Per Occurrence",
								"SelectedOptionValue": "500000",
								"TermName": "Per Occurrence",
								"TermPatternCode": "EA_PropertyDamage_Limit"
							}
						],
						"coveragename": "Property Damage Liability",
						"patterncode": "EA_PropertyDamage"
					},
					{
						"CDC_Coverage_FixedID": "10935",
						"CDC_Coverage_PublicID": "e1p-pc:10940",
						"FullTermCosts": [
							{
								"ActualTermAmount": "195.80",
								"CDC_Cost_FixedID": "24781",
								"CDC_Cost_PublicID": "e1p-pc:24781",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineCovCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "195.80"
							}
						],
						"Terms": [
							{
								"SelectedOptionCode": "EA_UMBI_Limit",
								"SelectedOptionName": "Per Person/Per Accident",
								"SelectedOptionValue": "100/300",
								"TermName": "Per Person/Per Accident",
								"TermPatternCode": "EA_UMBI_Limit"
							},
							{
								"EnteredValue": "false",
								"TermName": "Enhanced Underinsured Motorist Bodily Injury",
								"TermPatternCode": "EA_UMBI_EnhancedUIMBI"
							},
							{
								"SelectedOptionCode": "EA_UMBI_UninsuredMotoristBodilyInjuryCSL",
								"SelectedOptionName": "Uninsured Motorist Bodily Injury Combined Single Limit",
								"TermName": "Uninsured Motorist Bodily Injury Combined Single Limit",
								"TermPatternCode": "EA_UMBI_UninsuredMotoristBodilyInjuryCSL"
							}
						],
						"coveragename": "Uninsured Motorist Bodily Injury",
						"patterncode": "EA_UMBI"
					},
					{
						"CDC_Coverage_FixedID": "10936",
						"CDC_Coverage_PublicID": "e1p-pc:10941",
						"FullTermCosts": [
							{
								"ActualTermAmount": "46.90",
								"CDC_Cost_FixedID": "24783",
								"CDC_Cost_PublicID": "e1p-pc:24783",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineCovCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "46.90"
							}
						],
						"Terms": [
							{
								"SelectedOptionCode": "EA_UIMBI_Limit",
								"SelectedOptionName": "Per Person/Per Accident",
								"SelectedOptionValue": "100/300",
								"TermName": "Per Person/Per Accident",
								"TermPatternCode": "EA_UIMBI_Limit"
							},
							{
								"SelectedOptionCode": "EA_UIMBI_UnderinsuredMotoristBodilyInjuryCSL",
								"SelectedOptionName": "Underinsured Motorist Bodily Injury Combined Single Limit",
								"TermName": "Underinsured Motorist Bodily Injury Combined Single Limit",
								"TermPatternCode": "EA_UIMBI_UnderinsuredMotoristBodilyInjuryCSL"
							}
						],
						"coveragename": "Underinsured Motorist Bodily Injury",
						"patterncode": "EA_UIMBI"
					},
					{
						"CDC_Coverage_FixedID": "10937",
						"CDC_Coverage_PublicID": "e1p-pc:10942",
						"FullTermCosts": [
							{
								"ActualTermAmount": "65.70",
								"CDC_Cost_FixedID": "24784",
								"CDC_Cost_PublicID": "e1p-pc:24784",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineCovCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "65.70"
							}
						],
						"Terms": [
							{
								"SelectedOptionCode": "EA_MedicalExpense_Limit",
								"SelectedOptionName": "Each Person",
								"SelectedOptionValue": "1000",
								"TermName": "Each Person",
								"TermPatternCode": "EA_MedicalExpense_Limit"
							}
						],
						"coveragename": "Medical Expense",
						"patterncode": "EA_MedicalExpense"
					}
				],
				"Modifiers": [
					{
						"CDC_Modifier_FixedID": "31233",
						"CDC_Modifier_PublicID": "e1p-pc:31233",
						"FullTermCosts": [
							{
								"ActualTermAmount": "0.00",
								"ActualTermAmountInfo": "-363.40",
								"CDC_Cost_FixedID": "24787",
								"CDC_Cost_PublicID": "e1p-pc:24787",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineModInfoCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "-363.40"
							}
						],
						"ModifierPatternCode": "EA_ViolationFreeDisc",
						"ModifierPatternName": "Violation Free Discount",
						"ModifierType": "discount"
					},
					{
						"CDC_Modifier_FixedID": "31235",
						"CDC_Modifier_PublicID": "e1p-pc:31235",
						"FullTermCosts": [
							{
								"ActualTermAmount": "0.00",
								"ActualTermAmountInfo": "-807.50",
								"CDC_Cost_FixedID": "24780",
								"CDC_Cost_PublicID": "e1p-pc:24780",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineModInfoCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "-807.50"
							}
						],
						"ModifierPatternCode": "EA_AccidentFreeDisc",
						"ModifierPatternName": "Accident Free Discount",
						"ModifierType": "discount"
					},
					{
						"CDC_Modifier_FixedID": "31232",
						"CDC_Modifier_PublicID": "e1p-pc:31232",
						"FullTermCosts": [
							{
								"ActualTermAmount": "0.00",
								"ActualTermAmountInfo": "-410.10",
								"CDC_Cost_FixedID": "24788",
								"CDC_Cost_PublicID": "e1p-pc:24788",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineModInfoCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "-410.10"
							}
						],
						"ModifierPatternCode": "EA_HomeownershipDisc",
						"ModifierPatternName": "Homeownership Discount",
						"ModifierType": "discount"
					},
					{
						"CDC_Modifier_FixedID": "31234",
						"CDC_Modifier_PublicID": "e1p-pc:31234",
						"FullTermCosts": [
							{
								"ActualTermAmount": "0.00",
								"ActualTermAmountInfo": "-253.70",
								"CDC_Cost_FixedID": "24786",
								"CDC_Cost_PublicID": "e1p-pc:24786",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineModInfoCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "-253.70"
							}
						],
						"ModifierPatternCode": "EA_PaperlessDisc",
						"ModifierPatternName": "Paperless Discount",
						"ModifierType": "discount"
					},
					{
						"CDC_Modifier_FixedID": "31240",
						"CDC_Modifier_PublicID": "e1p-pc:31240",
						"FullTermCosts": [
							{
								"ActualTermAmount": "0.00",
								"ActualTermAmountInfo": "-444.90",
								"CDC_Cost_FixedID": "24785",
								"CDC_Cost_PublicID": "e1p-pc:24785",
								"ChargePattern": "Premium",
								"CostCategory": "EAAutoLineModInfoCost_Ext",
								"NumDaysInRatedTerm": 181,
								"Overridable": true,
								"OverrideSource": "manual",
								"RateAmountType": "StdPremium",
								"StandardBaseRate": "1.0000",
								"StandardTermAmount": "-444.90"
							}
						],
						"ModifierPatternCode": "EA_AutoPayDisc",
						"ModifierPatternName": "Auto Pay Discount",
						"ModifierType": "discount"
					}
				],
				"PartnerAccountID": "52910",
				"PartnerCode": "529",
				"ProductCode": "PersonalAuto_EA",
				"ProductVersionID": 5,
				"UWCompanyCode": "GDMIC",
				"domainServiceKeys": [
					{
						"CDC_DomainServiceKey_FixedID": "22510",
						"CDC_DomainServiceKey_PublicID": "e1p-pc:22513",
						"Key": "d02dee17-ce79-477c-a567-07345d8ce98a",
						"Type": "Credit",
						"URI": "/translatedcreditreport/d02dee17-ce79-477c-a567-07345d8ce98a"
					},
					{
						"CDC_DomainServiceKey_FixedID": "22511",
						"CDC_DomainServiceKey_PublicID": "e1p-pc:22514",
						"Key": "6ca7a72e-97fa-4356-b399-52696e8c77d5",
						"Type": "AutoIncident",
						"URI": "/autoincident/6ca7a72e-97fa-4356-b399-52696e8c77d5"
					},
					{
						"CDC_DomainServiceKey_FixedID": "22516",
						"CDC_DomainServiceKey_PublicID": "e1p-pc:22516",
						"Key": "c410d8f0-c43a-45c3-8388-898714cfb870",
						"Type": "GIS",
						"URI": "/geodata/c410d8f0-c43a-45c3-8388-898714cfb870"
					},
					{
						"CDC_DomainServiceKey_FixedID": "22517",
						"CDC_DomainServiceKey_PublicID": "e1p-pc:22517",
						"Key": "707f7601-0cd0-42a1-8d7e-256bcf14dbda",
						"Type": "Vehicle History",
						"URI": "/vehiclehistory/707f7601-0cd0-42a1-8d7e-256bcf14dbda"
					}
				],
				"ownsHomeInd": false,
				"rateData": {
					"creditAdverseAction": true
				},
				"ratePermanentFields": {},
				"uwTier": 0
			},
			"RatingDate": "2020-11-18T08:01:00.000Z",
			"SliceEndDate": "2021-05-18T07:01:00.000Z",
			"TotalFullTermPremium": "4789.00",
			"TransactionProcessedDate": "2020-11-18T18:17:13.816Z",
			"TransactionStartedDate": "2020-11-18T18:16:44.399Z"
		}
	],
	"TermEndDate": "2021-05-18T07:01:00.000Z",
	"TermNumber": 1,
	"TermStartDate": "2020-11-18T08:01:00.000Z",
	"__s3Path": "E1PC/PC_EDDS_ANALYTICS_FEED/v2/2020/11/18/18/out-42.json",
	"__s3LastModified": "Wed Nov 18 18:25:42 GMT 2020",
	"__s3LastModifiedEpoc": 1605723942000
}'
)
*/
GO
