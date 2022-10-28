USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAntiTheftDevice]    Script Date: 28.10.2022 11:09:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE    VIEW [StgPolicy].[SrcAntiTheftDevice]
AS

SELECT 
	hdr.SourceSystemCode	
	,atd.AntiTheftDeviceSourceCode	AS SourceCode
	,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127)	AS ProcessDateTime
	,atd.SequenceNum
	,atd.AntiTheftDeviceCode
	,atd.AntiTheftProductCode
	,atd.AntiTheftEngravingDevMfrCode
	,vhc.VehicleSourceCode
	,atd.AntiTheftDeviceDesc
	,atd.AntiTheftEngravingDevMfrDesc
	,atd.AntiTheftProductDesc
	,line.IsValidInd
FROM StgPolicy.PolicyData line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
	SourceSystemCode NVARCHAR(MAX)
	,ProcessDateTime NVARCHAR(MAX)
	,Policy NVARCHAR(MAX) AS JSON
	) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
	PolicyTrans NVARCHAR(MAX) AS JSON
	) pol
CROSS APPLY OPENJSON(pol.PolicyTrans) WITH (
	LineOfBusiness NVARCHAR(MAX) AS JSON
	) plt
CROSS APPLY OPENJSON(plt.LineOfBusiness) WITH (
	Geography NVARCHAR(MAX) AS JSON
	) lob
CROSS APPLY OPENJSON(lob.Geography) WITH (
	InsurableObject NVARCHAR(MAX) AS JSON
	) grg
CROSS APPLY OPENJSON(grg.InsurableObject) WITH (
	Vehicle NVARCHAR(MAX) AS JSON
	) ino
CROSS APPLY OPENJSON(ino.Vehicle) WITH (
	AntiTheftDevice NVARCHAR(MAX) AS JSON
	,VehicleSourceCode NVARCHAR(MAX)
	) vhc
CROSS APPLY OPENJSON(vhc.AntiTheftDevice) WITH (
	AntiTheftDeviceCode NVARCHAR(MAX)
	,AntiTheftDeviceDesc NVARCHAR(MAX)
	,AntiTheftDeviceSourceCode NVARCHAR(MAX)
	,AntiTheftEngravingDevMfrCode NVARCHAR(MAX)
	,AntiTheftEngravingDevMfrDesc NVARCHAR(MAX)
	,AntiTheftProductCode NVARCHAR(MAX)
	,AntiTheftProductDesc NVARCHAR(MAX)
	,SequenceNum NVARCHAR(MAX)
	) atd
GO
