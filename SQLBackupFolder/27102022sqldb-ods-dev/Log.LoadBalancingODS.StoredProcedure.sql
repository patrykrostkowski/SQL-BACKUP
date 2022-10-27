USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[LoadBalancingODS]    Script Date: 27.10.2022 12:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Log].[LoadBalancingODS] (
	@pBatchId BIGINT
	,@pProcessName VARCHAR(200)
	,@SourceSystem VARCHAR(15)
	,@pCutOffDate DATETIME = NULL
	,@pParentActivityId BIGINT = NULL
	)
AS
--truncate table config.BalancingConfig
/*
insert into config.BalancingConfig values('JSON_TO_ODS_ETL', 'JSON', 'Count', 'Policy.PolicyTrans', 'select count(*) as bt_count from StgPolicy.SrcPolicyTrans bt', 0, 1)
insert into config.BalancingConfig values('JSON_TO_ODS_ETL', 'ODS', 'Count', 'Policy.PolicyTrans', 'select count(*) as bt_count from Policy.PolicyTrans bt', 1, 1)
insert into config.BalancingConfig values('ODS_TO_RDM_ETL', 'ODS', 'Count', 'Policy.PolicyTrans', 'select count(*) as bt_count from Policy.PolicyTrans bt', 1, 1)
*/

DECLARE 
	@LoadDate DATETIME
	,@ExecuteSQL NVARCHAR(max)
	,@MetricValue DECIMAL(20, 6)
DECLARE 
	@cSource VARCHAR(200)
	,@cMetricCategory VARCHAR(200)
	,@cMetric VARCHAR(200)
	,@cBalanceSQL VARCHAR(max)
	,@cIsCurrentBatchInd TINYINT
	,@cIsActiveInd TINYINT

--######### log start procedure
BEGIN
	DECLARE @ActivityType NVARCHAR(15) = 'procedure'
	DECLARE @ActivityName NVARCHAR(50) = OBJECT_SCHEMA_NAME(@@PROCID) + '.' + OBJECT_NAME(@@PROCID)
	DECLARE @EventLogMessageStarted NVARCHAR(200) = 'Procedure ' + @ActivityName + ' started'
	DECLARE @EventLogMessageBalance NVARCHAR(200)
	DECLARE @EventLogMessageEnded NVARCHAR(200) = 'Procedure ' + @ActivityName + ' ended'
	DECLARE @EventLogMessageError NVARCHAR(200) = 'Procedure ' + @ActivityName + ' error'
	DECLARE @ReturnActivityId BIGINT

	BEGIN TRY
	EXEC [Log].[BalancingLogActivity] @ActivityPhase = N'started'
		,@ActivityType = @ActivityType
		,@ActivityName = @ActivityName
		,@SourceSystem = @SourceSystem
		,@BatchId = @pBatchId
		,@ActivityId = NULL
		,@ParentActivityId = @pParentActivityId
		,@EventLogMessage = @EventLogMessageStarted
		,@ErrorMessage = NULL
		,@ReturnActivityId = @ReturnActivityId OUTPUT;

		DROP TABLE IF EXISTS #BalancingSummary
		CREATE TABLE #BalancingSummary (
				ProcessName NVARCHAR(200) NULL
				,BatchID BIGINT NULL
				,MetricCategory NVARCHAR(200) NULL
				,Source NVARCHAR(200) NULL
				,Metric NVARCHAR(200) NULL
				,MetricValue DECIMAL(20, 6) NULL
				,CreateTimestamp DATETIME NULL
				)

		IF @pProcessName IS NULL
			SELECT @pProcessName = ProcessName
				,@pCutOffDate = CutOffDate
			FROM Log.BatchLoad
			WHERE Batchid = @pBatchId

		DECLARE c_balancing CURSOR
		FOR
		SELECT Source
			,MetricCategory
			,Metric
			,BalanceSQL
			,IsCurrentBatchInd
			,IsActiveInd
		FROM Config.BalancingConfig
		WHERE IsActiveInd = 1
			AND ProcessName = @pProcessName

		OPEN c_balancing

		FETCH NEXT
		FROM c_balancing
		INTO @cSource
			,@cMetricCategory
			,@cMetric
			,@cBalanceSQL
			,@cIsCurrentBatchInd
			,@cIsActiveInd

		WHILE @@FETCH_STATUS = 0
		BEGIN
			IF @cIsCurrentBatchInd = 1 AND @pCutOffDate IS  NULL
				SET @cBalanceSQL = @cBalanceSQL + ' WHERE ETLUpdateProcessNum = ' + cast(@pBatchId AS VARCHAR)
			ELSE IF @pCutOffDate IS NOT NULL
				SET @cBalanceSQL = @cBalanceSQL + ' WHERE ETLUpdateDateTime > ''' + cast(@pCutOffDate AS VARCHAR) + ''''

			SET @ExecuteSQL = 'SELECT @MetricValue = SUM(bt_count) from (' + @cBalanceSQL + ') b'

			EXEC sp_executesql @ExecuteSQL
				,N'@MetricValue decimal(20, 6) output'
				,@MetricValue OUTPUT

			INSERT INTO #BalancingSummary (
				ProcessName
				,BatchID
				,MetricCategory
				,Source
				,Metric
				,MetricValue
				,CreateTimestamp
				)
			VALUES (
				@pProcessName
				,@pBatchId
				,@cMetricCategory
				,@cSource
				,@cMetric
				,@MetricValue
				,getdate()
				)

	SET @EventLogMessageBalance = 'Balancing for: METRIC ' + @cMetric + ' METRIC CATEGORY ' + @cMetricCategory + ' SOURCE ' + @cSource + ' PROCESS NAME ' + @pProcessName

	EXEC [Log].[BalancingLogActivity] @ActivityPhase = N'started'
		,@ActivityType = @ActivityType
		,@ActivityName = @ActivityName
		,@SourceSystem = @SourceSystem
		,@BatchId = @pBatchId
		,@ActivityId = NULL
		,@ParentActivityId = @pParentActivityId
		,@EventLogMessage = @EventLogMessageBalance
		,@ErrorMessage = NULL
		,@ReturnActivityId = @ReturnActivityId OUTPUT;

			FETCH NEXT
			FROM c_balancing
			INTO @cSource
				,@cMetricCategory
				,@cMetric
				,@cBalanceSQL
				,@cIsCurrentBatchInd
				,@cIsActiveInd
		END
		--CLOSE c_balancing
		--DEALLOCATE c_balancing


--######### log end procedure
	EXEC [Log].[BalancingLogActivity] @ActivityPhase = N'completed'
		,@ActivityType = @ActivityType
		,@ActivityName = @ActivityName
		,@SourceSystem = @SourceSystem
		,@BatchId = @pBatchId
		,@ActivityId = @ReturnActivityId
		,@ParentActivityId = @pParentActivityId
		,@EventLogMessage = @EventLogMessageEnded
		,@ErrorMessage = NULL
		,@ReturnActivityId = @ReturnActivityId OUTPUT
	END TRY

BEGIN CATCH
	EXEC [Log].[BalancingLogActivity] @ActivityPhase = N'error'
		,@ActivityType = @ActivityType
		,@ActivityName = @ActivityName
		,@SourceSystem = @SourceSystem
		,@BatchId = @pBatchId
		,@ActivityId = @ReturnActivityId
		,@ParentActivityId = @pParentActivityId
		,@EventLogMessage = NULL
		,@ErrorMessage = NULL
		,@ReturnActivityId = @ReturnActivityId OUTPUT
END CATCH


		SELECT ProcessName
			,BatchID
			,MetricCategory
			,Source
			,Metric
			,MetricValue
			,CreateTimestamp
		FROM #BalancingSummary

		CLOSE c_balancing
		DEALLOCATE c_balancing

END


--SELECT * FROM [Config].[BalancingConfig] ORDER BY 1,3,4,2
--select * from [Log].[ActivityLog]
--select * from [Log].[BalancingSummary]
--go

--[dbo].[LoadBalancing_with_log] 171,'JSON_TO_ODS_ETL','Samplesystem'
--[dbo].[LoadBalancing] 171,'JSON_TO_ODS_ETL'

GO
