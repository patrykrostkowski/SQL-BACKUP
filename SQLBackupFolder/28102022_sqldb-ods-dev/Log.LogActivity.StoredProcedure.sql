USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[LogActivity]    Script Date: 28.10.2022 11:11:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE      PROCEDURE [Log].[LogActivity] (
	@ActivityPhase NVARCHAR(20)
	,--started, completed, error
	@ActivityType NVARCHAR(15)
	,--package
	@ActivityName NVARCHAR(50)
	,--packageName
	@SourceSystem NVARCHAR(15)
	,--ODS etc
	@BatchId BIGINT
	,--BatchId
	@ActivityId BIGINT NULL
	,@ParentActivityId BIGINT NULL 
	,@EventLogMessage VARCHAR(200)
	,-- Package + packageName + started'
	@ErrorMessage VARCHAR(max)
	,@ReturnActivityId INT OUTPUT
	)
AS
BEGIN
	IF (@ActivityPhase = N'started')
	BEGIN
		BEGIN TRANSACTION t1
		INSERT INTO [Log].[ActivityLog] (
			[BatchId]
			,[ParentActivityId]
			,[ActivityType]
			,[ActivityName]
			,[SourceSystem]
			,[ActivityStartDtm]
			,[ActivityEndDtm]
			,[EventLogMessage]
			,[ActivityStatus]
			)
		VALUES (
			@BatchId
			,@ParentActivityId
			,@ActivityType
			,@ActivityName
			,@SourceSystem
			,GETDATE()
			,NULL
			,@EventLogMessage
			,@ActivityPhase
			)

		SET @ReturnActivityId = (
				SELECT IDENT_CURRENT('Log.ActivityLog')
				)
		SELECT CAST(@ReturnActivityId as varchar) as ActivityID
		COMMIT 
	END

	IF (@ActivityPhase = N'completed')
	BEGIN
		UPDATE [Log].[ActivityLog]
		SET [ActivityEndDtm] = getdate()
			,[EventLogMessage] = @EventLogMessage
			,[ActivityStatus] = @ActivityPhase
		WHERE [ActivityId] = @ActivityId
	END

	IF (@ActivityPhase = N'error' or @ActivityPhase = N'warning')
	BEGIN

		-- If executed from other procedure
		IF @EventLogMessage IS NULL
			AND @ErrorMessage IS NULL
		BEGIN
			SELECT @ErrorMessage = ERROR_MESSAGE()
				,@EventLogMessage = 'Error while executing ' + ERROR_PROCEDURE() + ' (ErrorNumber:' + cast(ERROR_NUMBER() AS VARCHAR(11)) + ') at line ' + cast(ERROR_LINE() AS VARCHAR(11))
		END

		IF @BatchId IS NOT NULL
			AND @ActivityId IS NULL
			SELECT @ActivityId = min(ActivityId)
			FROM [Log].ActivityLog
			WHERE BatchId = @BatchId
			GROUP BY BatchId

		INSERT INTO [Log].[ActivityLog] (
			[BatchId]
			,[ParentActivityId]
			,[ActivityType]
			,[ActivityName]
			,[SourceSystem]
			,[ActivityStartDtm]
			,[ActivityEndDtm]
			,[EventLogMessage]
			,[ErrorLogMessage]
			,[ActivityStatus]
			)
		VALUES (
			@BatchId
			,@ParentActivityId
			,@ActivityType
			,@ActivityName
			,@SourceSystem
			,GETDATE()	   
			,NULL
			,@EventLogMessage
			,@ErrorMessage
			,@ActivityPhase
			)

		IF (@ActivityPhase = N'error')
		EXEC [Log].[BatchError] @BatchId

	END
END
GO
