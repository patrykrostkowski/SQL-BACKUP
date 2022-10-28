USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcBillType]    Script Date: 28.10.2022 15:04:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create   VIEW [StgPolicy].[SrcBillType]
AS
SELECT distinct SourceSystemCode
	,BillTypeCode
	,BillTypeName
FROM (
	SELECT *
		,ROW_NUMBER() OVER (PARTITION BY SourceSystemCode, BillTypeCode ORDER BY BillTypeName DESC) AS rn
	FROM (
		SELECT distinct pol.SourceSystemCode
			,pol.BillTypeCode
			,ISNULL(pol.BillTypeDesc, '') AS BillTypeName
		FROM StgPolicy.SrcPolicy pol
		WHERE ISNULL(pol.BillTypeCode, '') <> ''
		) AS tmp
	) AS tpl
	where tpl.rn = 1
GO
