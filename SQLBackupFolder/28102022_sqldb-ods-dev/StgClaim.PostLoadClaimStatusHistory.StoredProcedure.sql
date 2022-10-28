USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgClaim].[PostLoadClaimStatusHistory]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [StgClaim].[PostLoadClaimStatusHistory]
AS
BEGIN 
-- ----------------------------------------------------------------- updating dates (SCD)
    WITH cteDates
    AS (
        SELECT 
			c.ClaimStatusHistorySK
			,c.ClaimSK
			,ROW_NUMBER () OVER (PARTITION BY ClaimSK ORDER BY StartDate DESC, ClaimStatusHistorySK) AS rn_ClaimSK
            ,c.StartDate
            ,c.EndDate
            ,c.OpenDate
            ,c.CloseDate
            ,c.ReOpenDate
            ,c.SourceSystemSK
            ,lead(c.StartDate) OVER (
                PARTITION BY c.SourceSystemSK,c.ClaimSK ORDER BY StartDate DESC
                ) AS PreviousStartDate
            ,lead(c.EndDate) OVER (
                PARTITION BY c.SourceSystemSK,c.ClaimSK ORDER BY StartDate DESC
                ) AS PreviousEndDate
            ,lag(c.StartDate) OVER (
                PARTITION BY c.SourceSystemSK,c.ClaimSK ORDER BY StartDate DESC
                ) AS NextStartDate
			,lag(c.OpenDate) OVER (
                PARTITION BY c.SourceSystemSK,c.ClaimSK ORDER BY OpenDate ASC
                ) AS NextOpenDate
        FROM Claim.ClaimStatusHistory c
        )

    UPDATE cteDates 
    SET 
		 EndDate = NextStartDate
		,CloseDate = ReOpenDate
    FROM cteDates 
	WHERE rn_ClaimSK = 2
	
;
-- ----------------------------------------------------------------- updating IsRowCurrentInd column - change value to 0 from previous row  
WITH cteRowCurrentInd AS 
(
SELECT 
	c.ClaimStatusHistorySK
	,c.ClaimSK
	,c.IsRowCurrentInd
	,ROW_NUMBER () OVER (PARTITION BY ClaimSK order by ClaimStatusHistorySK DESC) AS rn_ClaimSK
FROM Claim.ClaimStatusHistory c
)

UPDATE cteRowCurrentInd
SET IsRowCurrentInd = 0
FROM cteRowCurrentInd
WHERE rn_ClaimSK = 2

END
GO
