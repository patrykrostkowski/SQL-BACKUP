USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[Rollback]    Script Date: 28.10.2022 12:27:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  
	

 PROCEDURE [Log].[Rollback] (@SourceSystem NVARCHAR(15))
AS
BEGIN
	DECLARE @ActivityType NVARCHAR(15) = 'procedure'
	DECLARE @ActivityName NVARCHAR(50) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID)
	DECLARE @EventLogMessageStarted NVARCHAR(200) = 'Procedure ' + @ActivityName + ' started'
	DECLARE @EventLogMessageEnded NVARCHAR(200) = 'Procedure ' + @ActivityName + ' ended'
	DECLARE @EventLogMessageError NVARCHAR(200) = 'Procedure ' + @ActivityName + ' error'
	DECLARE @pReturnActivityId BIGINT
	DECLARE @pBatchid BIGINT = 0
	DECLARE @pParentActivityId BIGINT = 0

	BEGIN TRY
		WHILE @pBatchid IS NOT NULL
		BEGIN
			SET @pBatchid = (
					SELECT TOP 1 Batchid
					FROM [Log].[BatchLoad]
					WHERE (BatchStatus = 'Started'
						OR BatchStatus = 'Error')
						AND ProcessName = @SourceSystem
					ORDER BY BatchStartDate DESC
					)

			IF @pBatchid IS NOT NULL
			BEGIN
				EXEC [Log].[LogActivity] @pActivityPhase = N'started'
					,@pActivityType = @ActivityType
					,@pActivityName = @ActivityName
					,@pSoruceSystem = @SourceSystem
					,@pBatchId = @pBatchId
					,@pActivityId = NULL
					,@pParentActivityId = @pParentActivityId
					,@pEventLogMessage = @EventLogMessageStarted
					,@pErrorMessage = NULL
					,@pReturnActivityId = @pReturnActivityId OUTPUT



				UPDATE [Log].[BatchLoad]
				SET BatchStatus = N'Rollbacked'
				WHERE Batchid = @pBatchid

				EXEC [Log].[LogActivity] @pActivityPhase = N'completed'
					,@pActivityType = @ActivityType
					,@pActivityName = @ActivityName
					,@pSoruceSystem = @SourceSystem
					,@pBatchId = @pBatchId
					,@pActivityId = @pReturnActivityId
					,@pParentActivityId = @pParentActivityId
					,@pEventLogMessage = @EventLogMessageEnded
					,@pErrorMessage = NULL
					,@pReturnActivityId = @pReturnActivityId OUTPUT
			END
		END
	END TRY

	BEGIN CATCH
		EXEC [Log].[LogActivity] @pActivityPhase = N'error'
			,@pActivityType = @ActivityType
			,@pActivityName = @ActivityName
			,@pSoruceSystem = @SourceSystem
			,@pBatchId = @pBatchId
			,@pActivityId = @pReturnActivityId
			,@pParentActivityId = @pParentActivityId
			,@pEventLogMessage = NULL
			,@pErrorMessage = NULL
			,@pReturnActivityId = @pReturnActivityId OUTPUT
	END CATCH
END
GO
