
-- ==========================================================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get active WorkFlow list
-- 
-- Modifications:
--  [dbo].[WorkFlowMembersViewListByPurchaseOrderByAmount] 2, '15.20', 'eblair'
-- ==========================================================================================
CREATE PROCEDURE   [dbo].[WorkFlowMembersViewListByPurchaseOrderByAmount] 

@PurchaseOrderId int,
@Amount decimal (18,2),
@CurrentUser varchar(50)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	DECLARE @WorkFlowId int
	DECLARE @MaxSequenceNumber int
	DECLARE @TextMaxSequenceNumber int
	DECLARE @ApprovedWorkFlowsMembers TABLE (ApprovalSequence decimal(18,2), ApprovalID varchar(20))
	
	SELECT @WorkFlowId = WorkFlowId 
	FROM dbo.Approvals 
	WHERE PurchaseOrderId = @PurchaseOrderId
	GROUP BY Sequence, WorkFlowId
	HAVING Sequence = MAX(Sequence)

	SELECT @MaxSequenceNumber = MAX(ISNULL(ApproverSequence,0))
	FROM dbo.WorkFlowMembersView
	WHERE WorkFlowId = @WorkFlowId
	AND ApprovalAmount < @Amount
	AND ISDeleted = 0

	SET @MaxSequenceNumber = ISNULL(@MaxSequenceNumber,0) + 1
	
	--get workflow members that have approved but are no longer active but have approved
	INSERT INTO @ApprovedWorkFlowsMembers
	SELECT Sequence, ApprovalID
	from Approvals
		LEFT OUTER JOIN dbo.WorkFlowMembersView On Approvals.WorkFlowId = WorkFlowMembersView.WorkFlowId
			AND Approvals.ApprovalId = WorkFlowMembersView.ADName
			LEFT OUTER JOIN dbo.ApprovalStatus on dbo.ApprovalStatus.Id = Approvals.ApprovalStatusId
	WHERE Approvals.WorkFlowId = @WorkFlowId
	AND Approvals.Sequence <= @MaxSequenceNumber
	AND Approvals.PurchaseOrderId = @PurchaseOrderId
	AND ISNULL(Approvals.ApprovalStatusId,0) in (2)
	
	SELECT ISNULL(Approvals.Id,99) as Id, WorkFlowMembersView.WorkFlowId, ADName, WorkFlowMembersView.DisplayName, Approvals.ModifiedOn,
		WorkFlowMembersView.Email, ApproverSequence, WorkFlowMembersView.ApprovalAmount, ISNULL(ApprovalStatus.Description, 'Waiting') as StatusDescription,
		Comments.Comment, ISNULL(Approvals.ModifiedOn,'1/1/3000')
	FROM dbo.WorkFlowMembersView
		LEFT OUTER JOIN dbo.Approvals on Approvals.ApprovalId = WorkFlowMembersView.ADName
			AND  WorkFlowMembersView.WorkFlowId = Approvals.WorkFlowId
			AND Approvals.Sequence = WorkFlowMembersView.ApproverSequence
			AND Approvals.PurchaseOrderId = @PurchaseOrderId
			AND Approvals.ApprovalStatusId not in (3,5)
			--why is this line needed?  It doesn't show history when it is rejected back to first approver
			--AND ISNULL(Approvals.ID,99999) >= (Select MAX(App2.ID) from Approvals App2 WHERE App2.InvoiceId = @InvoiceId and App2.Sequence = 1)
		LEFT OUTER JOIN dbo.ApprovalStatus on dbo.ApprovalStatus.Id = Approvals.ApprovalStatusId
		LEFT OUTER JOIN dbo.Comments on Comments.Id = Approvals.CommentId
	WHERE WorkFlowMembersView.IsDeleted = 0
	AND ApproverSequence <= @MaxSequenceNumber
	AND WorkFlowMembersView.WorkFlowId = @WorkFlowId	
	AND ApproverSequence NOT IN (Select ApprovalSequence from @ApprovedWorkFlowsMembers WHERE ApprovalID != WorkFlowMembersView.ADName)
UNION all
	SELECT Approvals.Id, Approvals.WorkFlowId, Approvals.ApprovalId, Approvals.ApprovalName, Approvals.ModifiedOn,
		'', Approvals.Sequence, 0, ISNULL(ApprovalStatus.Description, 'Waiting') as StatusDescription,
		Comments.Comment, ISNULL(Approvals.ModifiedOn,'1/1/3000')
	from Approvals
		LEFT OUTER JOIN dbo.WorkFlowMembersView On Approvals.WorkFlowId = WorkFlowMembersView.WorkFlowId
			AND Approvals.ApprovalId = WorkFlowMembersView.ADName
		LEFT OUTER JOIN dbo.ApprovalStatus on dbo.ApprovalStatus.Id = Approvals.ApprovalStatusId
		LEFT OUTER JOIN dbo.Comments on Comments.Id = Approvals.CommentId	
	where Approvals.WorkFlowId =  @WorkFlowId
	AND Approvals.Sequence <= @MaxSequenceNumber
	AND Approvals.PurchaseOrderId = @PurchaseOrderId
	AND Approvals.ApprovalStatusId not in (3,5)
	AND Approvals.Id NOT IN (SELECT ISNULL(Approvals.Id,0) 
			FROM dbo.WorkFlowMembersView
		LEFT OUTER JOIN dbo.Approvals on Approvals.ApprovalId = WorkFlowMembersView.ADName
			AND  WorkFlowMembersView.WorkFlowId = Approvals.WorkFlowId
			AND Approvals.Sequence = WorkFlowMembersView.ApproverSequence
			AND Approvals.PurchaseOrderId = @PurchaseOrderId
		LEFT OUTER JOIN dbo.ApprovalStatus on dbo.ApprovalStatus.Id = Approvals.ApprovalStatusId	
	WHERE WorkFlowMembersView.IsDeleted = 0
	AND ApproverSequence <= @MaxSequenceNumber
	AND WorkFlowMembersView.WorkFlowId = @WorkFlowId)
	AND ISNULL(Approvals.ID,99999) >= (Select MAX(App2.ID) from Approvals App2 WHERE App2.PurchaseOrderId = @PurchaseOrderId and App2.Sequence = 1)
UNION ALL
	--get all prevoius rejected
	SELECT Approvals.Id, Approvals.WorkFlowId, Approvals.ApprovalId, Approvals.ApprovalName, Approvals.ModifiedOn,
		ApprovalId + '@harsco.com', Approvals.Sequence, 0, ISNULL(ApprovalStatus.Description, 'Waiting') as StatusDescription,
		Comments.Comment, ISNULL(Approvals.ModifiedOn,'1/1/3000')
	from Approvals
		LEFT OUTER JOIN dbo.WorkFlowMembersView On Approvals.WorkFlowId = WorkFlowMembersView.WorkFlowId
			AND Approvals.ApprovalId = WorkFlowMembersView.ADName
		LEFT OUTER JOIN dbo.ApprovalStatus on dbo.ApprovalStatus.Id = Approvals.ApprovalStatusId
		LEFT OUTER JOIN dbo.Comments on Comments.Id = Approvals.CommentId	
	where Approvals.WorkFlowId =  @WorkFlowId
	AND Approvals.PurchaseOrderId = @PurchaseOrderId
	AND Approvals.ApprovalStatusId in (3,5)
ORDER BY ISNULL(Approvals.ModifiedOn,'1/1/3000'), ApproverSequence

	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;