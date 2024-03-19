
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all Attachments 
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[AttachmentsListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, [FileName], FileSize, FileType, AttachDocument, SendtoVendor, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Attachments
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;