
-- ================================================================
-- Author:		Ed Blair
-- Create date: 10/02/2013
-- Description: Report actual purchase order 
-- 
-- Modifications:
-- ================================================================
CREATE PROCEDURE [dbo].[Report_PurchaseOrderAttachments]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT [FileName]
	FROM Attachments
	WHERE PurchaseOrderId = @PurchaseOrderId
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;