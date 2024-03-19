
-- ========================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get single Item by Id
--
-- Modifications:
-- ========================================================
CREATE PROCEDURE [dbo].[ItemsSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, Quantity, UnitPrice, [Description], GLDescriptionId, GLCode, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM [dbo].[Items]
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;