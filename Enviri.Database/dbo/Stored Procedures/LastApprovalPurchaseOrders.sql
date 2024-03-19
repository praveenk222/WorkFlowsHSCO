
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get Approvals by PurchaseOrderId
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[LastApprovalPurchaseOrders]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkflowId, PurchaseOrderId, ApprovalId, ApprovalName, Sequence, ApprovalStatusId, CommentId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Approvals
	WHERE PurchaseOrderId = @PurchaseOrderId
	AND ModifiedOn = (Select MAX(modifiedOn) FROM Approvals app2 WHERE app2.PurchaseOrderId = Approvals.PurchaseOrderId)
	AND ApprovalStatusId != 3
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;