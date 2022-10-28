USE [sqldb-ods-dev]
GO
/****** Object:  View [StgPolicy].[SrcAccidentViolation]    Script Date: 28.10.2022 13:36:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE    VIEW [StgPolicy].[SrcAccidentViolation]
AS
SELECT   hdr.SourceSystemCode
        ,TRY_CONVERT(DATETIME, hdr.ProcessDateTime, 127) AS ProcessDateTime  
		,acv.AccidentViolationSourceCode AS SourceCode
        ,acv.AccidentViolationCode       
	    ,TRY_CONVERT(DATETIME, acv.AccidentViolationDate,127) AS    AccidentViolationDate   
	    ,acv.DamageAmt                   
	    ,acv.SurchargePointsNum          
	    ,acv.AccidentViolationDesc       
	    ,acv.PlaceIncident              
	    ,TRY_CONVERT(DATETIME, acv.PaidLossDate  , 127)  AS      PaidLossDate         
	    ,TRY_CONVERT(DATETIME, acv.ConvictionDate , 127) AS      ConvictionDate         
	    ,acv.isBodilyInjuryInd           
	    ,acv.IsChargeableInd             
	    ,acv.DriverResponsiblePct 
	    ,dvr.DriverSourceCode 
		,line.IsValidInd

FROM [StgPolicy].[PolicyData] line
CROSS APPLY OPENJSON(line.JsonLine) WITH (
		SourceSystemCode NVARCHAR(max)
		,ProcessDateTime NVARCHAR(max)
		,Policy NVARCHAR(max) AS JSON
		) hdr
CROSS APPLY OPENJSON(hdr.Policy) WITH (
		MiscParty NVARCHAR(max) AS JSON
		) pol
CROSS APPLY OPENJSON(pol.MiscParty) WITH (
      PartyInfo  NVARCHAR(max) AS JSON
	  )pti
CROSS APPLY OPENJSON(pti.PartyInfo) WITH (
      PartyRole NVARCHAR(max) AS JSON
	  )mis
CROSS APPLY OPENJSON(mis.PartyRole) WITH (
       Driver  NVARCHAR(max) AS JSON      
	  )ptr
CROSS APPLY OPENJSON(ptr.Driver) WITH (
       AccidentViolation NVARCHAR(max) AS JSON
	   ,DriverSourceCode  NVARCHAR(max)
	   )dvr
CROSS APPLY OPENJSON(dvr.AccidentViolation) WITH (
       AccidentViolationSourceCode NVARCHAR(max)
      ,AccidentViolationCode       NVARCHAR(max)
	  ,AccidentViolationDate       NVARCHAR(max)
	  ,DamageAmt                   DECIMAL(18,3)
	  ,SurchargePointsNum          INT
	  ,AccidentViolationDesc       NVARCHAR(max)
	  ,PlaceIncident               NVARCHAR(max)
	  ,PaidLossDate                NVARCHAR(max)
	  ,ConvictionDate              NVARCHAR(max)
	  ,isBodilyInjuryInd           INT
	  ,IsChargeableInd             INT
	  ,DriverResponsiblePct        DECIMAL(8,2)
)acv
GO
