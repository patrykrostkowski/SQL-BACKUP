USE [sqldb-ods-dev]
GO
/****** Object:  StoredProcedure [StgPolicy].[LoadPolicy]    Script Date: 28.10.2022 15:06:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   procedure [StgPolicy].[LoadPolicy] @pBatchId int
as

MERGE Policy.Policy AS tgt
USING StgPolicy.StgPolicy AS src
    ON tgt.SourceCode = src.SourceCode
        AND tgt.SourceSystemSK = src.SourceSystemSK
WHEN MATCHED
    THEN
        UPDATE
        SET
            tgt.ETLUpdateDateTime = getdate()
            ,tgt.ETLUpdateProcessNum = @pBatchId
            ,tgt.SourceSystemSK = src.SourceSystemSK
            ,tgt.SourceCode = src.SourceCode
            ,tgt.ProcessDateTime = src.ProcessDateTime
            ,tgt.EffectiveJobNum = src.EffectiveJobNum
            ,tgt.AccountSK = src.AccountSK
            ,tgt.InsuredSK = src.InsuredSK
            ,tgt.PolicyNum = src.PolicyNum
            ,tgt.LegacyPolicyNum = src.LegacyPolicyNum
            ,tgt.TermNum = src.TermNum
            ,tgt.DirectAssumedSK = src.DirectAssumedSK
            ,tgt.QuoteNum = src.QuoteNum
            ,tgt.QuoteVersionNum = src.QuoteVersionNum
            ,tgt.EffectiveDate = src.EffectiveDate
            ,tgt.OriginalEffectiveDate = src.OriginalEffectiveDate
            ,tgt.ExpirationDate = src.ExpirationDate
            ,tgt.TailDate = src.TailDate
            ,tgt.UnderwritingYear = src.UnderwritingYear
            ,tgt.IssuanceDateTime = src.IssuanceDateTime
            ,tgt.AuditFrequencyCode = src.AuditFrequencyCode
            ,tgt.AuditFrequencyDesc = src.AuditFrequencyDesc
            ,tgt.GovernClassCodeSK = src.GovernClassCodeSK
            ,tgt.GovernClassCode = src.GovernClassCode
            ,tgt.CancellationDate = src.CancellationDate
            ,tgt.CancellationTypeSK = src.CancellationTypeSK
            ,tgt.CancellationRateSK = src.CancellationRateSK
            ,tgt.AgencySK = src.AgencySK
            ,tgt.ProducingBranchNum = src.ProducingBranchNum
            ,tgt.BaseCurrencySK = src.BaseCurrencySK
            ,tgt.OriginalCurrencySK = src.OriginalCurrencySK
            ,tgt.ReportingCurrencySK = src.ReportingCurrencySK
            ,tgt.WrittenPremiumBaseAmt = src.WrittenPremiumBaseAmt
            ,tgt.WrittenPremiumOriginalAmt = src.WrittenPremiumOriginalAmt
            ,tgt.WrittenPremiumReportingAmt = src.WrittenPremiumReportingAmt
            ,tgt.AnnualPremiumBaseAmt = src.AnnualPremiumBaseAmt
            ,tgt.AnnualPremiumOriginalAmt = src.AnnualPremiumOriginalAmt
            ,tgt.AnnualPremiumReportingAmt = src.AnnualPremiumReportingAmt
            ,tgt.TermPremiumBaseAmt = src.TermPremiumBaseAmt
            ,tgt.TermPremiumOriginalAmt = src.TermPremiumOriginalAmt
            ,tgt.TermPremiumReportingAmt = src.TermPremiumReportingAmt
            ,tgt.ManualPremBaseAmt = src.ManualPremBaseAmt
            ,tgt.ManualPremOriginalAmt = src.ManualPremOriginalAmt
            ,tgt.ManualPremReportingAmt = src.ManualPremReportingAmt
            ,tgt.IsPremiumWaivedInd = src.IsPremiumWaivedInd
            ,tgt.CommissionPct = src.CommissionPct
            ,tgt.CommissionBaseAmt = src.CommissionBaseAmt
            ,tgt.CommissionOriginalAmt = src.CommissionOriginalAmt
            ,tgt.CommissionReportingAmt = src.CommissionReportingAmt
            ,tgt.PolicyTypeSK = src.PolicyTypeSK
            ,tgt.LeadExcessQuotaSK = src.LeadExcessQuotaSK
            ,tgt.ProductSK = src.ProductSK
            ,tgt.ProgramSK = src.ProgramSK
            ,tgt.WritingCompanySK = src.WritingCompanySK
            ,tgt.BusinessUnitSK = src.BusinessUnitSK
            ,tgt.BusinessTypeSK = src.BusinessTypeSK
            ,tgt.UnderwritingStatusSK = src.UnderwritingStatusSK
            ,tgt.AttachmentTypeSK = src.AttachmentTypeSK
            ,tgt.ProjectTypeSK = src.ProjectTypeSK
            ,tgt.PolicyStatusSK = src.PolicyStatusSK
            ,tgt.GoverningStateSK = src.GoverningStateSK
            ,tgt.DomicileStateSK = src.DomicileStateSK
            ,tgt.DomicileCountrySK = src.DomicileCountrySK
            ,tgt.StandardIndustryCodeSK = src.StandardIndustryCodeSK
            ,tgt.NorthAmericanIndustryClassificationSK = src.NorthAmericanIndustryClassificationSK
            ,tgt.AnnualStatementLineofBusinessSK = src.AnnualStatementLineofBusinessSK
            ,tgt.ProfessionSK = src.ProfessionSK
            ,tgt.DepartmentSK = src.DepartmentSK
            ,tgt.CoverageTriggerSK = src.CoverageTriggerSK
            ,tgt.AuditTransactionSK = src.AuditTransactionSK
            ,tgt.PayPlanSK = src.PayPlanSK
            ,tgt.PlanGroupCode = src.PlanGroupCode
            ,tgt.BillTypeSK = src.BillTypeSK
            ,tgt.UniqueMarketReferenceNum = src.UniqueMarketReferenceNum
            ,tgt.SharePct = src.SharePct
            ,tgt.IsNewYorkFreeTradeZoneInd = src.IsNewYorkFreeTradeZoneInd
            ,tgt.NewYorkFreeTradeZoneDesc = src.NewYorkFreeTradeZoneDesc
            ,tgt.IsFacultativeReinsurancePurchasedInd = src.IsFacultativeReinsurancePurchasedInd
            ,tgt.IsMultiStateInd = src.IsMultiStateInd
            ,tgt.IsRetroPolicyInd = src.IsRetroPolicyInd
            ,tgt.ProjectName = src.ProjectName
            ,tgt.IsRunoffERPInd = src.IsRunoffERPInd
            ,tgt.RunoffERPDate = src.RunoffERPDate
            ,tgt.IsPremiumAuditableInd = src.IsPremiumAuditableInd
            ,tgt.DaysNoticeOfCancellationNum = src.DaysNoticeOfCancellationNum
WHEN NOT MATCHED
    THEN
        INSERT (
            ETLCreateDateTime
            ,ETLUpdateDateTime
            ,ETLCreateProcessNum
            ,ETLUpdateProcessNum
            ,SourceSystemSK
            ,SourceCode
            ,ProcessDateTime
            ,EffectiveJobNum
            ,AccountSK
            ,InsuredSK
            ,PolicyNum
            ,LegacyPolicyNum
            ,TermNum
            ,DirectAssumedSK
            ,QuoteNum
            ,QuoteVersionNum
            ,EffectiveDate
            ,OriginalEffectiveDate
            ,ExpirationDate
            ,TailDate
            ,UnderwritingYear
            ,IssuanceDateTime
            ,AuditFrequencyCode
            ,AuditFrequencyDesc
            ,GovernClassCodeSK
            ,GovernClassCode
            ,CancellationDate
            ,CancellationTypeSK
            ,CancellationRateSK
            ,AgencySK
            ,ProducingBranchNum
            ,BaseCurrencySK
            ,OriginalCurrencySK
            ,ReportingCurrencySK
            ,WrittenPremiumBaseAmt
            ,WrittenPremiumOriginalAmt
            ,WrittenPremiumReportingAmt
            ,AnnualPremiumBaseAmt
            ,AnnualPremiumOriginalAmt
            ,AnnualPremiumReportingAmt
            ,TermPremiumBaseAmt
            ,TermPremiumOriginalAmt
            ,TermPremiumReportingAmt
            ,ManualPremBaseAmt
            ,ManualPremOriginalAmt
            ,ManualPremReportingAmt
            ,IsPremiumWaivedInd
            ,CommissionPct
            ,CommissionBaseAmt
            ,CommissionOriginalAmt
            ,CommissionReportingAmt
            ,PolicyTypeSK
            ,LeadExcessQuotaSK
            ,ProductSK
            ,ProgramSK
            ,WritingCompanySK
            ,BusinessUnitSK
            ,BusinessTypeSK
            ,UnderwritingStatusSK
            ,AttachmentTypeSK
            ,ProjectTypeSK
            ,PolicyStatusSK
            ,GoverningStateSK
            ,DomicileStateSK
            ,DomicileCountrySK
            ,StandardIndustryCodeSK
            ,NorthAmericanIndustryClassificationSK
            ,AnnualStatementLineofBusinessSK
            ,ProfessionSK
            ,DepartmentSK
            ,CoverageTriggerSK
            ,AuditTransactionSK
            ,PayPlanSK
            ,PlanGroupCode
            ,BillTypeSK
            ,UniqueMarketReferenceNum
            ,SharePct
            ,IsNewYorkFreeTradeZoneInd
            ,NewYorkFreeTradeZoneDesc
            ,IsFacultativeReinsurancePurchasedInd
            ,IsMultiStateInd
            ,IsRetroPolicyInd
            ,ProjectName
            ,IsRunoffERPInd
            ,RunoffERPDate
            ,IsPremiumAuditableInd
            ,DaysNoticeOfCancellationNum
            )
        VALUES (
            getdate()
            ,getdate()
            ,@pBatchId
            ,@pBatchId
            ,src.SourceSystemSK
            ,src.SourceCode
            ,src.ProcessDateTime
            ,src.EffectiveJobNum
            ,src.AccountSK
            ,src.InsuredSK
            ,src.PolicyNum
            ,src.LegacyPolicyNum
            ,src.TermNum
            ,src.DirectAssumedSK
            ,src.QuoteNum
            ,src.QuoteVersionNum
            ,src.EffectiveDate
            ,src.OriginalEffectiveDate
            ,src.ExpirationDate
            ,src.TailDate
            ,src.UnderwritingYear
            ,src.IssuanceDateTime
            ,src.AuditFrequencyCode
            ,src.AuditFrequencyDesc
            ,src.GovernClassCodeSK
            ,src.GovernClassCode
            ,src.CancellationDate
            ,src.CancellationTypeSK
            ,src.CancellationRateSK
            ,src.AgencySK
            ,src.ProducingBranchNum
            ,src.BaseCurrencySK
            ,src.OriginalCurrencySK
            ,src.ReportingCurrencySK
            ,src.WrittenPremiumBaseAmt
            ,src.WrittenPremiumOriginalAmt
            ,src.WrittenPremiumReportingAmt
            ,src.AnnualPremiumBaseAmt
            ,src.AnnualPremiumOriginalAmt
            ,src.AnnualPremiumReportingAmt
            ,src.TermPremiumBaseAmt
            ,src.TermPremiumOriginalAmt
            ,src.TermPremiumReportingAmt
            ,src.ManualPremBaseAmt
            ,src.ManualPremOriginalAmt
            ,src.ManualPremReportingAmt
            ,src.IsPremiumWaivedInd
            ,src.CommissionPct
            ,src.CommissionBaseAmt
            ,src.CommissionOriginalAmt
            ,src.CommissionReportingAmt
            ,src.PolicyTypeSK
            ,src.LeadExcessQuotaSK
            ,src.ProductSK
            ,src.ProgramSK
            ,src.WritingCompanySK
            ,src.BusinessUnitSK
            ,src.BusinessTypeSK
            ,src.UnderwritingStatusSK
            ,src.AttachmentTypeSK
            ,src.ProjectTypeSK
            ,src.PolicyStatusSK
            ,src.GoverningStateSK
            ,src.DomicileStateSK
            ,src.DomicileCountrySK
            ,src.StandardIndustryCodeSK
            ,src.NorthAmericanIndustryClassificationSK
            ,src.AnnualStatementLineofBusinessSK
            ,src.ProfessionSK
            ,src.DepartmentSK
            ,src.CoverageTriggerSK
            ,src.AuditTransactionSK
            ,src.PayPlanSK
            ,src.PlanGroupCode
            ,src.BillTypeSK
            ,src.UniqueMarketReferenceNum
            ,src.SharePct
            ,src.IsNewYorkFreeTradeZoneInd
            ,src.NewYorkFreeTradeZoneDesc
            ,src.IsFacultativeReinsurancePurchasedInd
            ,src.IsMultiStateInd
            ,src.IsRetroPolicyInd
            ,src.ProjectName
            ,src.IsRunoffERPInd
            ,src.RunoffERPDate
            ,src.IsPremiumAuditableInd
            ,src.DaysNoticeOfCancellationNum
            );
GO
