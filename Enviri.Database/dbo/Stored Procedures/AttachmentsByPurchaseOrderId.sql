
-- ========================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all Attachments per PurchaseOrderId
-- 
-- Modifications:
-- ========================================================
CREATE PROCEDURE [dbo].[AttachmentsByPurchaseOrderId]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, [FileName], FileSize, FileType, AttachDocument, SendtoVendor, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Attachments
	WHERE PurchaseOrderId = @PurchaseOrderId
	AND IsDeleted = 0
	ORDER BY [FileName]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;