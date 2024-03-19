
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 10/01/2013
-- Description: Get a current Approval information
-- 
-- Modifications:
-- [dbo].[ApprovalsByCurrentApprover] 2, 'eblair'
-- ===========================================================
CREATE PROCEDURE [dbo].[ApprovalsByCurrentApprover]

@PurchaseOrderId int,
@CurrentUser varchar(255)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, WorkFlowId, ApprovalId, ApprovalName, Sequence, ApprovalStatusId, CommentId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Approvals
	WHERE PurchaseOrderId = @PurchaseOrderId
	AND ApprovalId = @CurrentUser
	AND ApprovalStatusId = 1

END
SET NOCOUNT OFF
COMMIT TRANSACTION;