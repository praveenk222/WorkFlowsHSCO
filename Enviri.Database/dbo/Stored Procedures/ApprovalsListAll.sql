

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get all Approvals
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[ApprovalsListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkflowId, PurchaseOrderId, ApprovalId, ApprovalName, Sequence, ApprovalStatusId, CommentId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Approvals
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;