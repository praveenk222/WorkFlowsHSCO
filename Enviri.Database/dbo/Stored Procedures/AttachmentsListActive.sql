
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all active Attachments 
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[AttachmentsListActive]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, [FileName], FileSize, FileType, AttachDocument, SendtoVendor, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Attachments
	WHERE IsDeleted = 0
	ORDER BY [FileName]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;