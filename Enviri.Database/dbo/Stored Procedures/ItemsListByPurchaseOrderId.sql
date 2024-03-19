
-- ========================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all Items per PurchaseOrderId
-- 
-- Modifications:
-- ========================================================
CREATE PROCEDURE [dbo].[ItemsListByPurchaseOrderId]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, Quantity, UnitPrice, [Description], GLDescriptionId, GLCode, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM [dbo].[Items]
	WHERE PurchaseOrderId = @PurchaseOrderId
	ORDER BY [Description]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;