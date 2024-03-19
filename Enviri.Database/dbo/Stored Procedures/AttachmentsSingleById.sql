
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get single Attachments by Id
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[AttachmentsSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, [FileName], FileSize, FileType, AttachDocument, SendtoVendor, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Attachments
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;