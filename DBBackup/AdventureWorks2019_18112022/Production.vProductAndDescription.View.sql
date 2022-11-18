USE [AdventureWorks2019]
GO
/****** Object:  View [Production].[vProductAndDescription]    Script Date: 18.11.2022 16:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Production].[vProductAndDescription] 
WITH SCHEMABINDING 
AS 
-- View (indexed or standard) to display products and product descriptions by language.
SELECT 
    p.[ProductID] 
    ,p.[Name] 
    ,pm.[Name] AS [ProductModel] 
    ,pmx.[CultureID] 
    ,pd.[Description] 
FROM [Production].[Product] p 
    INNER JOIN [Production].[ProductModel] pm 
    ON p.[ProductModelID] = pm.[ProductModelID] 
    INNER JOIN [Production].[ProductModelProductDescriptionCulture] pmx 
    ON pm.[ProductModelID] = pmx.[ProductModelID] 
    INNER JOIN [Production].[ProductDescription] pd 
    ON pmx.[ProductDescriptionID] = pd.[ProductDescriptionID];
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF
GO
/****** Object:  Index [IX_vProductAndDescription]    Script Date: 18.11.2022 16:41:38 ******/
CREATE UNIQUE CLUSTERED INDEX [IX_vProductAndDescription] ON [Production].[vProductAndDescription]
(
	[CultureID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clustered index on the view vProductAndDescription.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'VIEW',@level1name=N'vProductAndDescription', @level2type=N'INDEX',@level2name=N'IX_vProductAndDescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Product names and descriptions. Product descriptions are provided in multiple languages.' , @level0type=N'SCHEMA',@level0name=N'Production', @level1type=N'VIEW',@level1name=N'vProductAndDescription'
GO
