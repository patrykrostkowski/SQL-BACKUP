USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [dbo].[SrcFinancialReportingPeriod]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE  PROCEDURE [dbo].[SrcFinancialReportingPeriod]

@StartDate Date,
@EndDate Date
AS
--DECLARE @DateFrom DATETIME = cast(@StartDate AS DATETIME)

--set @StartDate='1970-01-01'
--set @EndDate= '1970-12-31'

;
WITH theDates AS
     (SELECT @StartDate as BeginDate
      UNION ALL
      SELECT DATEADD(day, 1, BeginDate)
        FROM theDates
       WHERE DATEADD(day, 1, BeginDate) <= @EndDate
)
INSERT INTO Typelist.FinancialReportingPeriod

SELECT  
       
	    GETDATE() AS ETLCreateDateTime
	   ,GETDATE() AS ETLUpdateDateTime
	   ,1  AS SourceSystemSk
       ,FinancialReportingPeriodNum = cast(BeginDate  as varchar(10))
       ,FinancialReportingYearNum   = Year(BeginDate)
	   ,FinancialReportingQuarterNum = CAST(CEILING(CAST(month(BeginDate) AS decimal(4,2)) / 3) AS char(1))
	   ,FinancialReportingPeriodBeginDate = CAST(DATEADD(month, DATEDIFF(month, 0, BeginDate), 0) AS date)
	   ,FinancialReportingPeriodEndDate =  cast(EOMONTH(BeginDate)  as Date)
	   ,FinancialReportingPeriodLabelMMDDYYYYAbrv = Format(cast(BeginDate as Date),'MM/dd/yyyy')
	   ,FinancialReportingPeriodrYearQuarterLabelYYYYQAbrv = Concat(Year(BeginDate),
	               CAST(CEILING(CAST(month(BeginDate) AS decimal(4,2)) / 3) AS char(1)))
       ,FinancialReportingPeriodYearQuarterName = CAST(year(BeginDate) AS char(4)) + ' Qtr' + 
	                  CAST(CEILING(CAST(month(BeginDate) AS decimal(4,2)) / 3) AS char(1))
       ,FinancialReportingPeriodYearMonthLabelYYYYMMAbrv = right('0000' + cast(datepart(year,BeginDate ) as varchar(4)), 4)
                                + right('00' + cast(datepart(month,BeginDate ) as varchar(2)), 2)
	   ,FinancialReportingPeriodYearMonthName = Concat(Year(BeginDate),' ',Left(DATENAME(month,BeginDate),3))
	   ,CASE WHEN BeginDate = EOMONTH(BeginDate)
        THEN 1
        ELSE 0
        END AS IsMonthEndInd
	   ,FinancialReportingPeriodDate  = cast(BeginDate as Date)

FROM theDates
WHERE NOT EXISTS(SELECT * 
                 FROM Typelist.FinancialReportingPeriod
                 WHERE (theDates.BeginDate=Typelist.FinancialReportingPeriod.FinancialReportingPeriodDate)
                 )
				 OPTION (MAXRECURSION 0)
GO
