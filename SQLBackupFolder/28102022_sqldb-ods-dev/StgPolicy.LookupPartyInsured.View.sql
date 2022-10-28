﻿USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[LookupPartyInsured]    Script Date: 28.10.2022 12:26:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [StgPolicy].[LookupPartyInsured]
AS
SELECT InsuredSK
	,SourceCode AS PartyInsuredSourceCode
	,SourceSystemSK
	,ProcessDateTime
FROM Party.Insured
GO
