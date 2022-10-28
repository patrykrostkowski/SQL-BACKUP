USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[BatchStarted]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO



	CREATE     PROCEDURE [Log].[BatchStarted] (
		@ProcessName [nvarchar](200)
		)
	AS
	BEGIN
		DECLARE @BatchID as integer
		BEGIN TRAN T1

		INSERT INTO [Log].[BatchLoad] (
			ProcessName
			,BatchStartDate
			,BatchEndDate
			,BatchStatus
			)
		VALUES (
			@ProcessName
			,GETDATE()
			,NULL
			,'Started'
			)

		SET @BatchId = (
				SELECT IDENT_CURRENT('Log.BatchLoad')
				)

		COMMIT TRAN T1
		select cast(@BatchId as nvarchar) as BatchID
	END

	/****** Object:  StoredProcedure [Log].[BatchStarted]    Script Date: 21.07.2021 11:48:24 ******/
	SET ANSI_NULLS OFF
GO
