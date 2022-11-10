USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[OrdersAboveThreshold]    Script Date: 10.11.2022 13:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OrdersAboveThreshold]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[OrdersAboveThreshold] AS' 
END
GO

ALTER PROCEDURE [dbo].[OrdersAboveThreshold] 
	(@Threshold INT, @StartYear INT, @EndYear INT)
AS
BEGIN
	SELECT
		SalesOrderID
		, SUM(LineTotal) AS sum_linetotal
	FROM Sales.SalesOrderDetail
	WHERE YEAR(ModifiedDate) BETWEEN @StartYear AND @EndYear
	GROUP BY SalesOrderID
	HAVING SUM(LineTotal) > @Threshold
END
GO
