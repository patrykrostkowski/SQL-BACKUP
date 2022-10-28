USE [sqldb-ods-dev]
GO
/****** Object:  View [StgClaim].[SrcLossEventSalvage]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE        VIEW [StgClaim].[SrcLossEventSalvage]
AS

SELECT *
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, SourceCode ORDER BY ProcessDateTime DESC) AS rn
	FROM (
SELECT  
	 hdr.SourceSystemCode
	,les.LossEventSalvageSourceCode AS SourceCode
	,try_convert(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime
	,les.SalvageDetailTypeCode as SalvageDetailTypeSKCode
	,les.SoldDate
	,les.AssignedToSalvageDate
	,les.RecoveredDate
	,les.IsOwnerRetainedInd
	,les.IsTotalLossInd
	,les.IsSalvageWaivedInd
	,les.SaleAmt
	,les.TitleFeeAmt
	,les.TowingFeeAmt
	,les.CommissionAmt
	,les.StorageFeeAmt
	,les.PrepFeeAmt
	,line.IsValidInd
FROM StgClaim.ClaimData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(max)
	,ProcessDateTime NVARCHAR(max)
	,Claim NVARCHAR(max) AS JSON
	) hdr
	CROSS APPLY OPENJSON(hdr.Claim) WITH (
	LossEvent NVARCHAR(max)  AS JSON
	) clm
	CROSS APPLY OPENJSON(clm.LossEvent) WITH (
	LossEventSalvage NVARCHAR(max)  AS JSON
	)let
	CROSS APPLY OPENJSON(let.LossEventSalvage) WITH (
	IsOwnerRetainedInd NVARCHAR(MAX)
	,IsTotalLossInd NVARCHAR(MAX)
	,PrepFeeAmt DECIMAL(19,4)
	,StorageFeeAmt DECIMAL(19,4)
	,LossEventSalvageSourceCode NVARCHAR(MAX)
	,SoldDate DATETIME
	,IsSalvageWaivedInd NVARCHAR(MAX)
	,SalvageDetailTypeDesc NVARCHAR(MAX)
	,SaleAmt DECIMAL(19,4)
	,CommissionAmt DECIMAL(19,4)
	,RecoveredDate DATETIME
	,TowingFeeAmt DECIMAL(19,4)
	,TitleFeeAmt DECIMAL(19,4)
	,SalvageDetailTypeCode NVARCHAR(MAX)
	,AssignedToSalvageDate DATETIME
	)les
	) AS tmp
		) AS tpl
	where tpl.rn = 1

GO
