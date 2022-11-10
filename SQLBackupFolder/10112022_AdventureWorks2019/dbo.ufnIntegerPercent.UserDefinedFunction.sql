USE [AdventureWorks2019]
GO
/****** Object:  UserDefinedFunction [dbo].[ufnIntegerPercent]    Script Date: 10.11.2022 12:34:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ufnIntegerPercent](@Numerator INT, @Denominator INT)
RETURNS VARCHAR(8)
AS   
BEGIN

	DECLARE @Decimal FLOAT  = (@Numerator * 1.0) / @Denominator

	RETURN FORMAT(@Decimal, 'P')

END
GO
