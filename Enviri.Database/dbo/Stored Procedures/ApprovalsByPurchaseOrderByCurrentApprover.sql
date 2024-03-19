
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 01/22/2014
-- Description: Get a Approval information per PO and Approver
-- 
-- Modifications:
-- [dbo].[ApprovalsByCurrentApprover] 1, 'eblair'
-- ===========================================================
CREATE PROCEDURE [dbo].[ApprovalsByPurchaseOrderByCurrentApprover]

@PurchaseOrderId int,
@CurrentUser varchar(255)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, WorkFlowId, ApprovalId, ApprovalName
	FROM dbo.Approvals
	WHERE PurchaseOrderId = @PurchaseOrderId
	AND ApprovalId = @CurrentUser

END
SET NOCOUNT OFF
COMMIT TRANSACTION;