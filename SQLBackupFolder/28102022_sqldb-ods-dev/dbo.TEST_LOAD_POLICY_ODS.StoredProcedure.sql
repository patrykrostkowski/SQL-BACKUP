USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [dbo].[TEST_LOAD_POLICY_ODS]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[TEST_LOAD_POLICY_ODS]
as

declare @BatchId int = 1

delete from Policy.Policy --where @BatchId = 1
delete from Policy.PolicyTrans --where @BatchId = 1

-------------------------------------------
exec StgPolicy.LoadSrcTables @BatchId

-------------------------------------------
exec StgPolicy.LoadSourceSystem @BatchId

-------------------------------------------
exec StgPolicy.LoadPolicy @BatchId

-------------------------------------------
exec StgPolicy.LoadPolicyTrans @BatchId

-------------------------------------------
GO
