USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[BatchError]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE   PROCEDURE [Log].[BatchError] (@Id BIGINT)
	AS
	BEGIN
		UPDATE [Log].[BatchLoad]
		SET BatchStatus = 'Error'
		WHERE Batchid = @Id
	END
GO
