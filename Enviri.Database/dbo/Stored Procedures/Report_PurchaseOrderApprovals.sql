
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get Approvals by PurchaseOrderId
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[Report_PurchaseOrderApprovals]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Approvals.Id, ApprovalName, Sequence, ApprovalStatusId, CommentId, Comments.Comment, ApprovalStatus.Description as ApprovalStatusDesc
	FROM dbo.Approvals
		LEFT OUTER JOIN ApprovalStatus ON ApprovalStatus.Id = Approvals.ApprovalStatusId
		LEFT OUTER JOIN Comments ON Comments.Id = Approvals.CommentId
	WHERE PurchaseOrderId = @PurchaseOrderId
	ORDER BY Sequence
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;