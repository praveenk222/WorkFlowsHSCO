
-- ========================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all Items 
--
-- Modifications:
-- ========================================================
CREATE PROCEDURE [dbo].[ItemsListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, Quantity, UnitPrice, [Description], GLDescriptionId, GLCode, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM [dbo].[Items]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;