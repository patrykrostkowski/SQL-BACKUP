﻿USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [Log].[BatchError]    Script Date: 28.10.2022 13:37:52 ******/
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
