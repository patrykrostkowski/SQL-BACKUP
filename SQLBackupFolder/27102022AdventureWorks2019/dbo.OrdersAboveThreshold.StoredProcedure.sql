USE [AdventureWorks2019]
GO
/****** Object:  StoredProcedure [dbo].[OrdersAboveThreshold]    Script Date: 27.10.2022 12:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[OrdersAboveThreshold] 
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
