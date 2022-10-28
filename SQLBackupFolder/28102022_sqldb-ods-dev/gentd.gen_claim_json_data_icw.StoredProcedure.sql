USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [gentd].[gen_claim_json_data_icw]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [gentd].[gen_claim_json_data_icw]
as

/*
truncate table gentd.input_data_icw
insert into gentd.input_data_icw(TransXML)
select TransXML from [gentd].[test_1_40]
*/

/* --fix the files after load
update gentd.input_data_icw
set TransXML = replace(TransXML, ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://LexisNexis.RD.Schema.Message.ClaimsDownload.1.0" xmlns:acord="http://www.ACORD.org/standards/PC_Surety/ACORD1/xml/ClaimsSvc/ClaimsDownload"', '')
update gentd.input_data_icw
set TransXML = replace(TransXML, ' xmlns="http://www.ACORD.org/standards/PC_Surety/ACORD1/xml/ClaimsSvc/ClaimsDownload"', '')
update gentd.input_data_icw
set TransXML = replace(TransXML, 'xsd:', 'xsd')
update gentd.input_data_icw
set TransXML = replace(TransXML, 'acord:', 'acord')

--select cast(TransXML as xml) as TransXML from gentd.input_data_icw
--select * from ##input_data_icw where ClaimSourceCode = 'CDI0000284334'
*/

DROP TABLE IF EXISTS ##input_data_icw_pre
select cast(TransXML as xml) as TransXML into ##input_data_icw_pre from gentd.input_data_icw

DROP TABLE IF EXISTS ##input_data_icw
SELECT
	TransXML,
	ClaimSourceCode,
	ProcessDateTime
 into ##input_data_icw
 FROM (
	SELECT
		cast(TransXML as xml) as TransXML,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode
	FROM ##input_data_icw_pre--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	) a


print 'Loading ##C_Root'
insert into ##C_Root(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode
		--ClaimsDownloadInfo.value('@id[1]', 'varchar(200)') ClaimSourceCode
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	--CROSS APPLY TransXML.nodes('//ClaimsDownloadInfo') ClaimsDownloadInfo(ClaimsDownloadInfo)
	) a

--#######################################
print 'Loading ##C_Claim'
insert into ##C_Claim(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimNum,
	EventDate,
	ClaimDesc,
	ClaimStatusCode,
	OpenedDate,
	ReportedtoInsuredDate,
	--DirectAssumedCode,
	IsBondClaimInd,
	ClaimCurrencyCode
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimNum,
	EventDate,
	ClaimDesc,
	ClaimStatusCode,
	case when ClaimStatusCode = 'O' then StatusDate else isnull(ReportedtoInsuredDate, EventDate) end OpenedDate,
	isnull(ReportedtoInsuredDate, EventDate) as ReportedtoInsuredDate,
	--DirectAssumedCode,
	IsBondClaimInd,
	ClaimCurrencyCode
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') as ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') as ClaimSourceCode,
		ClaimsOccurrence.value('(@id)[1]', 'varchar(200)') as ClaimNum,
		ClaimsOccurrence.value('(LossDt)[1]', 'date') as EventDate,
		ClaimsOccurrence.value('(IncidentDesc)[1]', 'varchar(200)') as ClaimDesc,
		ClaimsOccurrence.value('(ClaimStatusCd)[1]', 'varchar(200)') as ClaimStatusCode,
		ClaimsOccurrence.value('(ClaimStatusDt)[1]', 'date') as StatusDate,
		ClaimsOccurrence.value('(ClaimsReported/ReportedDt)[1]', 'date') as ReportedtoInsuredDate,
		--'D' as DirectAssumedCode,
		0 as IsBondClaimInd,
		ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as ClaimCurrencyCode
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsDownloadInfo') ClaimsDownloadInfo(ClaimsDownloadInfo)
	CROSS APPLY TransXML.nodes('//ClaimsOccurrence') ClaimsOccurrence(ClaimsOccurrence)
	) a

--#######################################
print 'Loading ##C_Claimant'
insert into ##C_Claimant(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimantSourceCode,
	ClaimantNum
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimantSourceCode,
	ClaimantNum
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
		ClaimsParty.value('(@id)[1]', 'varchar(200)') ClaimantSourceCode,
		'01' as ClaimantNum,
		ClaimsParty.value('(ClaimsPartyInfo/ClaimsPartyRoleCd)[1]', 'varchar(200)') ClaimsPartyRoleCd
	FROM ##input_data_icw -- (select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsParty') ClaimsParty(ClaimsParty)
	--CROSS APPLY TransXML.nodes('//ClaimsParty/GeneralPartyInfo') GeneralPartyInfo(GeneralPartyInfo)
	--OUTER APPLY TransXML.nodes('//ClaimsParty/ClaimsPartyInfo') ClaimsPartyInfo(ClaimsPartyInfo)
	WHERE ClaimsParty.value('(ClaimsPartyInfo/ClaimsPartyRoleCd)[1]', 'varchar(200)') = 'CLM'
	and ClaimsParty.value('(ClaimsPartyInfo/InvolvementDesc)[1]', 'varchar(200)') = 'CM'
	) a

print 'Loading ##C_PartyInfo for Claimant'
INSERT INTO ##C_PartyInfo(
	SourceSystemCode,
	ProcessDateTime,
	ClaimSourceCode,
	master,
	ClaimantSourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	MaritalStatusCode,
	GenderCode,
	FullName
)
SELECT
	SourceSystemCode,
	ProcessDateTime,
	ClaimSourceCode,
	'Claimant' as master,
	ClaimantSourceCode,
	PartyInfoSourceCode,
	PartyTypeCode,
	MaritalStatusCode,
	GenderCode,
	TRIM(CONCAT(GivenName, ' ', Surname)) as FullName
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
		ClaimsParty.value('(@id)[1]', 'varchar(200)') ClaimantSourceCode,
		ClaimsParty.value('(@id)[1]', 'varchar(200)') PartyInfoSourceCode,
		ClaimsParty.value('(ClaimsPartyInfo/ClaimsPartyRoleCd)[1]', 'varchar(200)') ClaimsPartyRoleCd,
		'Person' AS PartyTypeCode,
		'Undefined' AS MaritalStatusCode,
		'Undefined' AS GenderCode,
		ClaimsParty.value('(GeneralPartyInfo/NameInfo/PersonName/Surname)[1]', 'varchar(200)') Surname,
		ClaimsParty.value('(GeneralPartyInfo/NameInfo/PersonName/GivenName)[1]', 'varchar(200)') GivenName
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsParty') ClaimsParty(ClaimsParty)
	--CROSS APPLY TransXML.nodes('//ClaimsParty/GeneralPartyInfo') GeneralPartyInfo(GeneralPartyInfo)
	--OUTER APPLY TransXML.nodes('//ClaimsParty/ClaimsPartyInfo') ClaimsPartyInfo(ClaimsPartyInfo)
	WHERE ClaimsParty.value('(ClaimsPartyInfo/ClaimsPartyRoleCd)[1]', 'varchar(200)') = 'CLM'
	and ClaimsParty.value('(ClaimsPartyInfo/InvolvementDesc)[1]', 'varchar(200)') = 'CM'
	) a

--#######################################
print 'Loading ##C_ClaimLocation'
insert into ##C_ClaimLocation(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimLocationSourceCode,
	StateCode
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimLocationSourceCode,
	StateCode
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') as ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') as ClaimSourceCode,
		CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_loc1') as ClaimLocationSourceCode,
		ClaimsOccurrence.value('(Addr/StateProvCd)[1]', 'varchar(200)') as StateCode
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsDownloadInfo') ClaimsDownloadInfo(ClaimsDownloadInfo)
	CROSS APPLY TransXML.nodes('//ClaimsOccurrence') ClaimsOccurrence(ClaimsOccurrence)
	) a

--#######################################
print 'Loading ##C_LossEvent'
insert into ##C_LossEvent(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	LossEventSourceCode,
	LossEventTypeCode,
	ClaimCurrencyCode
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	LossEventSourceCode,
	LossEventTypeCode,
	ClaimCurrencyCode
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') as ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') as ClaimSourceCode,
		CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_loss1') as LossEventSourceCode,
		'LE_vehicle' as LossEventTypeCode,
		ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as ClaimCurrencyCode
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsDownloadInfo') ClaimsDownloadInfo(ClaimsDownloadInfo)
	CROSS APPLY TransXML.nodes('//ClaimsOccurrence') ClaimsOccurrence(ClaimsOccurrence)
	) a

--#######################################
print 'Loading ##C_LossOccurrence'
insert into ##C_LossOccurrence(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	LossEventSourceCode,
	LossOccurrenceSourceCode,
	SequenceNum,
	ClaimantSourceCode,
	ClaimantNum
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	LossEventSourceCode,
	LossOccurrenceSourceCode,
	SequenceNum,
	ClaimantSourceCode,
	ClaimantNum
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') as ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') as ClaimSourceCode,
		CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_loss1') as LossEventSourceCode,
		CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_occ1') as LossOccurrenceSourceCode,
		1 as SequenceNum,
		ClaimsParty.value('(@id)[1]', 'varchar(200)') ClaimantSourceCode,
		'01' as ClaimantNum
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsDownloadInfo') ClaimsDownloadInfo(ClaimsDownloadInfo)
	CROSS APPLY TransXML.nodes('//ClaimsOccurrence') ClaimsOccurrence(ClaimsOccurrence)
	CROSS APPLY TransXML.nodes('//ClaimsParty') ClaimsParty(ClaimsParty)
	WHERE ClaimsParty.value('(ClaimsPartyInfo/ClaimsPartyRoleCd)[1]', 'varchar(200)') = 'CLM'
	and ClaimsParty.value('(ClaimsPartyInfo/InvolvementDesc)[1]', 'varchar(200)') = 'CM'
	) a

--#######################################
print 'Loading ##ClaimPolicyMapping connections between amfam policies and icw claims table'
DROP TABLE IF EXISTS ##ClaimPolicyMapping

SELECT clm.ClaimSourceCode, clm.ClaimNum, pol.* INTO ##ClaimPolicyMapping FROM 
	(SELECT row_number() over (order by ClaimSourceCode) as rn
		,* FROM (SELECT row_number() over (partition by ClaimSourceCode order by ProcessDateTime desc) as rn2
			,* FROM ##C_Claim c
	) b where rn2 = 1) clm
JOIN 
	(SELECT row_number() over (order by PolicySourceCode) as rn
		,* FROM (SELECT row_number() over (partition by PolicySourceCode order by ProcessDateTime desc) as rn2
			,*,
			case when p.PolicyTypeCode = 'EAFamilyCar' then 'EA_Collision'
				when p.PolicyTypeCode = 'HO3' then 'EH_DwellingCovA'
				when p.PolicyTypeCode = 'HO4' then 'EH_PersonalPropertyC'
				when p.PolicyTypeCode = 'HO6' then 'EH_DwellingCovA'
				when p.PolicyTypeCode = 'HF9' then 'EH_DwellingCovA'
				else 'TestCoverage' end as CoverageCode,
			(select max(l.LineofBusinessCode) as LineofBusinessCode from ##LineOfBusiness l where l.PolicySourceCode = p.PolicySourceCode) as LineofBusinessCode
			FROM ##Policy p
	) b where rn2 = 1) pol 
	ON pol.rn = clm.rn

print 'Loading ##C_ClaimPolicy'
insert into ##C_ClaimPolicy(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimPolicySourceCode,
	PolicyStatusCode,
	PolicyCurrencyCode,
	PolicyNum,
	PolicyTypeCode,
	EffectiveDate,
	ExpirationDate,
	CancellationDate,
	LineofBusinessCode
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimPolicySourceCode,
	PolicyStatusCode,
	PolicyCurrencyCode,
	PolicyNum,
	PolicyTypeCode,
	EffectiveDate,
	ExpirationDate,
	CancellationDate,
	LineofBusinessCode
 FROM (
	SELECT clm.SourceSystemCode,
		clm.ClaimSourceCode,
		clm.ProcessDateTime,
		clm.ClaimPolicySourceCode,
		map.PolicyStatusCode,
		clm.PolicyCurrencyCode,
		map.PolicyNum,
		map.PolicyTypeCode,
		map.EffectiveDate,
		map.ExpirationDate,
		map.CancellationDate,
		map.LineofBusinessCode
	FROM 
		(SELECT
			'ICW' AS SourceSystemCode,
			ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
			ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_pol1') as ClaimPolicySourceCode,
			ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as PolicyCurrencyCode
		FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
		CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
		) clm
		JOIN ##ClaimPolicyMapping map on clm.ClaimSourceCode = map.ClaimSourceCode
	) a

print 'Loading ##C_ClaimCoverage'
insert into ##C_ClaimCoverage(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimPolicySourceCode,
	ClaimCoverageSourceCode,
	CoverageCode,
	ClaimCurrencyCode,
	AnnualStatementLineofBusinessCode
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimPolicySourceCode,
	ClaimCoverageSourceCode,
	CoverageCode,
	ClaimCurrencyCode,
	AnnualStatementLineofBusinessCode
 FROM (
	SELECT clm.SourceSystemCode,
		clm.ClaimSourceCode,
		clm.ProcessDateTime,
		clm.ClaimPolicySourceCode,
		clm.ClaimCoverageSourceCode,
		map.CoverageCode,
		clm.ClaimCurrencyCode,
		map.AnnualStatementLineofBusinessCode
	FROM 
		(SELECT
			'ICW' AS SourceSystemCode,
			ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
			ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_pol1') as ClaimPolicySourceCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_cov1') as ClaimCoverageSourceCode,
			ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as ClaimCurrencyCode
		FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
		CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
		) clm
		JOIN ##ClaimPolicyMapping map on clm.ClaimSourceCode = map.ClaimSourceCode
	) a

print 'Loading ##C_ClaimTransaction'
insert into ##C_ClaimTransaction(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimTransactionSourceCode,
	LossOccurrenceSourceCode,
	LossOccurrenceSequenceNumber,
	--[FinancialReportingPeriodSK]
	--ClaimPolicySourceCode,
	--[PolicySK]
	ClaimCoverageSourceCode,
	--[WritingCompanySK]
	ClaimTransactionTypeCode,
	CostTypeCode,
	PaymentTypeCode,
	BaseCurrencyCode,
	TransactionBaseAmt,
	ReportingCurrencyCode,
	TransactionReportingAmt,
	TransactionDate,
	RecoveryCategoryTypeCode,
	ClaimTransactionCategoryTypeCode,
	ClaimTransactionCategoryTypeDesc
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimTransactionSourceCode,
	LossOccurrenceSourceCode,
	LossOccurrenceSequenceNumber,
	--[FinancialReportingPeriodSK]
	--ClaimPolicySourceCode,
	--[PolicySK]
	ClaimCoverageSourceCode,
	--[WritingCompanySK]
	ClaimTransactionTypeCode,
	CostTypeCode,
	PaymentTypeCode,
	BaseCurrencyCode,
	TransactionBaseAmt,
	BaseCurrencyCode as ReportingCurrencyCode,
	TransactionBaseAmt as TransactionReportingAmt,
	TransactionDate,
	case when ClaimTransactionTypeCode = 'Recovery' then 'Salvage' else null end RecoveryCategoryTypeCode,
	ClaimTransactionCategoryTypeCode,
	ClaimTransactionCategoryTypeDesc
 FROM (
	SELECT clm.SourceSystemCode,
		clm.ClaimSourceCode,
		clm.ProcessDateTime,
		clm.ClaimTransactionSourceCode,
		clm.LossOccurrenceSourceCode,
		clm.LossOccurrenceSequenceNumber,
		--[FinancialReportingPeriodSK]
		--clm.ClaimPolicySourceCode,
		--[PolicySK]
		clm.ClaimCoverageSourceCode,
		--map.WritingCompanySK
		case when clm.PaymentTypeCode like '%resv%' then 'R'
			when clm.TransactionBaseAmt < 0 then 'V'
			else 'P'		
			end as ClaimTransactionTypeCode,
		case when clm.PaymentTypeCode like '%exp%' then 'A'
			else 'L'
			end as CostTypeCode,
		null as PaymentTypeCode,
		clm.BaseCurrencyCode,
		clm.TransactionBaseAmt,
		clm.TransactionDate,
		NULL as RecoveryCategoryTypeCode,
		case when clm.PaymentTypeCode like '%exp%' then '701'
			else '602'
			end as ClaimTransactionCategoryTypeCode,
		case when clm.PaymentTypeCode like '%exp%' then 'Expense'
			else 'Partial Payment'
			end as ClaimTransactionCategoryTypeDesc
	FROM 
		(SELECT
			'ICW' AS SourceSystemCode,
			ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
			ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
			ClaimsPayment.value('(@id)[1]', 'varchar(200)') as ClaimTransactionSourceCode,
			ClaimsPayment.value('(PaymentTypeCd)[1]', 'varchar(200)') as PaymentTypeCode,
			ClaimsPayment.value('(MethodPaymentCd)[1]', 'varchar(200)') as ClaimTransactionTypeCode,
			ClaimsPayment.value('(PaymentDt)[1]', 'date') as TransactionDate,
			ClaimsPayment.value('(ClaimsPaymentCovInfo/PaymentAmt/Amt)[1]', 'decimal(19, 6)') as TransactionBaseAmt,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_pol1') as ClaimPolicySourceCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_cov1') as ClaimCoverageSourceCode,
			ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as BaseCurrencyCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_occ1') as LossOccurrenceSourceCode,
			1 as LossOccurrenceSequenceNumber
		FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
		CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
		CROSS APPLY TransXML.nodes('//ClaimsPayment') ClaimsPayment(ClaimsPayment)
		) clm
		JOIN ##ClaimPolicyMapping map on clm.ClaimSourceCode = map.ClaimSourceCode
	) a

print 'Loading ##TEMP_ALL_Parties'
DROP TABLE IF EXISTS ##TEMP_ALL_Parties

SELECT
	SourceSystemCode,
	ProcessDateTime,
	ClaimSourceCode,
	ID,
	GivenName,
	Surname,
	CommercialName,
	replace(isnull(CommercialName, TRIM(CONCAT(GivenName, ' ', Surname))), '''', '') as FullName,
	ClaimsPartyRoleCd
 INTO ##TEMP_ALL_Parties
 FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
		ClaimsParty.value('(@id)[1]', 'varchar(200)') ID,
		ClaimsParty.value('(ClaimsPartyInfo/ClaimsPartyRoleCd)[1]', 'varchar(200)') ClaimsPartyRoleCd,
		'Person' AS PartyTypeCode,
		'Undefined' AS MaritalStatusCode,
		'Undefined' AS GenderCode,
		ClaimsParty.value('(GeneralPartyInfo/NameInfo/PersonName/Surname)[1]', 'varchar(200)') Surname,
		ClaimsParty.value('(GeneralPartyInfo/NameInfo/PersonName/GivenName)[1]', 'varchar(200)') GivenName,
		ClaimsParty.value('(GeneralPartyInfo/NameInfo/CommlName/CommercialName)[1]', 'varchar(200)') CommercialName
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsParty') ClaimsParty(ClaimsParty)
	) a

print 'Loading ##C_ClaimPayment'
insert into ##C_ClaimPayment(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimTransactionSourceCode,
	ClaimPayentSourceCode,
	SequenceNum,
	PayeeTypeCode,
	PaymentMethodCode,
	CheckNum,
	CheckDate,
	PaymentDate,
	ReportableAmt,
	BankAccountCode,
	PayeeName)
SELECT clm.SourceSystemCode,
	clm.ClaimSourceCode,
	clm.ProcessDateTime,
	clm.ClaimTransactionSourceCode,
	clm.ClaimTransactionSourceCode as ClaimPayentSourceCode,
	1 as SequenceNum,
	'Payee' as PayeeTypeCode,
	PaymentMethodCode,
	right(replace(replace(CheckNum, '^T&*', ''), '''', ''), 10) as CheckNum,
	CheckDate,
	PaymentDate,
	ReportableAmt,
	'16394-21071' as BankAccountCode,
	(select max(FullName) as FullName from ##TEMP_ALL_Parties p where p.ProcessDateTime = clm.ProcessDateTime and p.ClaimSourceCode = clm.ClaimSourceCode and p.ID = clm.PayeeClaimsPartyRef) as PayeeName
	FROM 
		(SELECT
			'ICW' AS SourceSystemCode,
			ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
			ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
			ClaimsPayment.value('(@id)[1]', 'varchar(200)') as ClaimTransactionSourceCode,
			ClaimsPayment.value('(PaymentTypeCd)[1]', 'varchar(200)') as PaymentTypeCode,
			ClaimsPayment.value('(MethodPaymentCd)[1]', 'varchar(200)') as ClaimTransactionTypeCode,
			ClaimsPayment.value('(PaymentDt)[1]', 'date') as TransactionDate,
			ClaimsPayment.value('(ClaimsPaymentCovInfo/PaymentAmt/Amt)[1]', 'decimal(19, 6)') as TransactionBaseAmt,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_pol1') as ClaimPolicySourceCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_cov1') as ClaimCoverageSourceCode,
			ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as BaseCurrencyCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_occ1') as LossOccurrenceSourceCode,
			1 as LossOccurrenceSequenceNumber,
			ClaimsPayment.value('(MethodPaymentCd)[1]', 'varchar(200)') as PaymentMethodCode,
			isnull(ClaimsPayment.value('(CheckNumber)[1]', 'varchar(200)'), '0') as CheckNum,
			ClaimsPayment.value('(PaymentDt)[1]', 'date') as CheckDate,
			ClaimsPayment.value('(PaymentDt)[1]', 'date') as PaymentDate,
			ClaimsPayment.value('(ClaimsPaymentCovInfo/PaymentAmt/Amt)[1]', 'decimal(19, 6)') as ReportableAmt,
			ClaimsPayment.value('(@PayeeClaimsPartyRef)[1]', 'varchar(200)') as PayeeClaimsPartyRef
			--ClaimsPayment.value('(xsdClaimsPaymentExt/KeyedValue/KeyName)[3]', 'varchar(200)') as KeyName,
			--ClaimsPayment.value('(xsdClaimsPaymentExt/KeyedValue/KeyValue)[3]', 'varchar(200)') as KeyValue
		FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
		CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
		CROSS APPLY TransXML.nodes('//ClaimsPayment') ClaimsPayment(ClaimsPayment)
		) clm
		JOIN ##ClaimPolicyMapping map on clm.ClaimSourceCode = map.ClaimSourceCode
		WHERE case when clm.PaymentTypeCode like '%resv%' then 'Reserve'
			when clm.TransactionBaseAmt < 0 then 'Recovery'
			else 'Payment'		
			end = 'Payment'

INSERT INTO ##C_ClaimStatusHistory(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimStatusHistorySourceCode,
	SequenceNum,
	ClaimStatusCode,
	OpenDate,
	CloseDate,
	ReOpenDate,
	CloseReasonDesc,
	ReOpenReasonDesc)
SELECT 
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	CONCAT(SequenceNum, '-', EventCd, '-', EventDt) as ClaimStatusHistorySourceCode,
	SequenceNum,
	case when EventCd = 'EnteredClmAdmin' then 'O'
		when EventCd = 'ClosedDt' then 'C'
		when EventCd = 'ReopenedDt' then 'R'
		end as ClaimStatusCode,
	case when EventCd = 'EnteredClmAdmin' then EventDt else NULL end as OpenDate,
	case when EventCd = 'ClosedDt' then EventDt else NULL end as CloseDate,
	case when EventCd = 'ReopenedDt' then EventDt else NULL end as ReOpenDate,
	case when EventCd = 'ClosedDt' then 'close reason' else NULL  end as CloseReasonDesc,
	case when EventCd = 'ReopenedDt' then 'reopen reason' else NULL  end as ReOpenReasonDesc
FROM (
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') as ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') as ClaimSourceCode,
		ClaimsOccurrence.value('(@id)[1]', 'varchar(200)') as ClaimNum,
		ClaimsOccurrence.value('(LossDt)[1]', 'date') as EventDate,
		ClaimsOccurrence.value('(IncidentDesc)[1]', 'varchar(200)') as ClaimDesc,
		ClaimsOccurrence.value('(ClaimStatusCd)[1]', 'varchar(200)') as ClaimStatusCode,
		ClaimsOccurrence.value('(ClaimStatusDt)[1]', 'date') as StatusDate,
		ClaimsOccurrence.value('(ClaimsReported/ReportedDt)[1]', 'date') as ReportedtoInsuredDate,
		EventInfo.value('(EventCd)[1]', 'varchar(200)') as EventCd,
		EventInfo.value('(EventDt)[1]', 'date') as EventDt,
		row_number() over (partition by ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') order by EventInfo.value('(EventCd)[1]', 'varchar(200)') asc, EventInfo.value('(EventDt)[1]', 'date') asc) as SequenceNum
	FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsDownloadInfo') ClaimsDownloadInfo(ClaimsDownloadInfo)
	CROSS APPLY TransXML.nodes('//ClaimsOccurrence') ClaimsOccurrence(ClaimsOccurrence)
	OUTER APPLY TransXML.nodes('//ClaimsOccurrence/EventInfo') EventInfo(EventInfo)
	WHERE EventInfo.value('(EventCd)[1]', 'varchar(200)') in ('EnteredClmAdmin', 'ClosedDt', 'ReopenedDt')
)a

print 'Loading ##C_WritingCompany'
insert into ##C_WritingCompany(
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimPolicySourceCode,
	master,
	WritingCompanySourceCode,
	WritingCompanyCode,
	WritingCompanyName,
	IsFrontingCompanyInd,
	IsActiveInd,
	IsAdmittedInd
)
SELECT
	SourceSystemCode,
	ClaimSourceCode,
	ProcessDateTime,
	ClaimPolicySourceCode,
	'ClaimPolicy' as master,
	WritingCompanySourceCode,
	WritingCompanyCode,
	WritingCompanyName,
	IsFrontingCompanyInd,
	IsActiveInd,
	IsAdmittedInd
 FROM (
	SELECT clm.SourceSystemCode,
		clm.ClaimSourceCode,
		clm.ProcessDateTime,
		clm.ClaimPolicySourceCode,
		wco.WritingCompanySourceCode,
		wco.WritingCompanyCode,
		wco.WritingCompanyName,
		wco.IsFrontingCompanyInd,
		wco.IsActiveInd,
		wco.IsAdmittedInd
	FROM 
		(SELECT
			'ICW' AS SourceSystemCode,
			ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
			ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
			CONCAT(ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)'), '_pol1') as ClaimPolicySourceCode,
			ClaimDownloadRs.value('(CurCd)[1]', 'varchar(200)') as PolicyCurrencyCode
		FROM ##input_data_icw--(select cast(TransXML as xml) as TransXML from gentd.input_data_icw) line
		CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
		) clm
		JOIN ##ClaimPolicyMapping map on clm.ClaimSourceCode = map.ClaimSourceCode
		JOIN ##WritingCompany wco on master = 'Policy' and wco.PolicySourceCode = map.PolicySourceCode
	) a


/*
	SELECT
		'ICW' AS SourceSystemCode,
		ClaimDownloadRs.value('(TransactionResponseDt)[1]', 'datetime') ProcessDateTime,
		ClaimDownloadRs.value('(ClaimsDownloadInfo/@id)[1]', 'varchar(200)') ClaimSourceCode,
		ClaimsParty.value('(@id)[1]', 'varchar(200)') ClaimantSourceCode,
		ClaimsPartyInfo.value('(ClaimsPartyRoleCd)[1]', 'varchar(200)') ClaimsPartyRoleCd
	FROM (select cast(TransXML as xml) as TransXML from gentd.input_data_icw where SourceSystemID = 'CLM0000292545') line
	CROSS APPLY TransXML.nodes('//ClaimDownloadRs') ClaimDownloadRs(ClaimDownloadRs)
	CROSS APPLY TransXML.nodes('//ClaimsParty') ClaimsParty(ClaimsParty)
	CROSS APPLY TransXML.nodes('//ClaimsParty/GeneralPartyInfo') GeneralPartyInfo(GeneralPartyInfo)
	OUTER APPLY TransXML.nodes('//ClaimsParty/ClaimsPartyInfo') ClaimsPartyInfo(ClaimsPartyInfo)
	WHERE ClaimsPartyInfo.value('(ClaimsPartyRoleCd)[1]', 'varchar(200)') = 'CLM'
*/

--#######################################
--where SourceSystemID = 'CLM0000292545'

/*
select * into gentd.input_data_icw from [dbo].[Query]


--drop table [dbo].[Query]


select cast(TransXML as xml) from gentd.input_data_icw
select TransXML from gentd.input_data_icw

select * into gentd.input_data_icw_backup1 from gentd.input_data_icw

update gentd.input_data_icw
set TransXML = replace(TransXML, ' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://LexisNexis.RD.Schema.Message.ClaimsDownload.1.0" xmlns:acord="http://www.ACORD.org/standards/PC_Surety/ACORD1/xml/ClaimsSvc/ClaimsDownload"', '')
update gentd.input_data_icw
set TransXML = replace(TransXML, ' xmlns="http://www.ACORD.org/standards/PC_Surety/ACORD1/xml/ClaimsSvc/ClaimsDownload"', '')
update gentd.input_data_icw
set TransXML = replace(TransXML, 'xsd:', 'xsd')
update gentd.input_data_icw
set TransXML = replace(TransXML, 'acord:', 'acord')


select PolicyTypeCode, count(*) from (
select distinct PolicySourceCode, PolicyTypeCode from ##Policy) a
 group by PolicyTypeCode


select count(distinct c.PolicySourceCode) 
from ##Coverage c
join ##Policy p on p.PolicySourceCode = c.PolicySourceCode and p.ProcessDateTime = c.ProcessDateTime
where c.master = 'InsurableObjectCoverage'
--and (PolicyTypeCode = 'EAFamilyCar' and c.coverageCode = 'EA_Collision')
--and (PolicyTypeCode = 'HO3' and c.coverageCode = 'EH_DwellingCovA')
--and (PolicyTypeCode = 'HO4' and c.coverageCode = 'EH_PersonalPropertyC')
--and (PolicyTypeCode = 'HO6' and c.coverageCode = 'EH_DwellingCovA')
--and (PolicyTypeCode = 'HF9' and c.coverageCode = 'EH_DwellingCovA')

select * 
from ##Coverage c
join ##Policy p on p.PolicySourceCode = c.PolicySourceCode and p.ProcessDateTime = c.ProcessDateTime
where c.master = 'InsurableObjectCoverage'
and PolicyTypeCode = 'HF9' 
and c.coverageCode = 'EH_PersonalPropertyC'
*/

GO
