USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[BatchEnded]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE  PROCEDURE [Log].[BatchEnded] (
		@BatchId BIGINT
		)
	AS
	BEGIN
		UPDATE [Log].[BatchLoad]
		SET BatchEndDate = GETDATE()
			,BatchStatus = 'Completed'
		WHERE Batchid = @BatchId
	END
GO
