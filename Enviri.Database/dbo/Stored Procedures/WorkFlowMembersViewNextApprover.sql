
-- =========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get the next WorkFlowsMember 
-- 
-- Modifications:
-- [dbo].[WorkFlowMembersViewNextApprover] 2, 'eblair', '51'
-- =========================================================
CREATE PROCEDURE [dbo].[WorkFlowMembersViewNextApprover]

@PurchaseOrderId int,
@CurrentUser varchar(50),
@Amount decimal(18,2)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	DECLARE @WorkFlowId int
	DECLARE @Sequence decimal(8,2)

	--this is needed if they can redirect
	SELECT  @WorkFlowId = WorkFlowId 
	FROM dbo.Approvals 
	WHERE PurchaseOrderId = @PurchaseOrderId
	GROUP BY Sequence, WorkFlowId
	HAVING Sequence = MAX(Sequence)


	SELECT  @Sequence = Sequence
	FROM dbo.Approvals 
		INNER JOIN dbo.WorkFlowMembersView ON WorkFlowMembersView.WorkFlowId  = Approvals.WorkFlowId 
	WHERE  PurchaseOrderId = @PurchaseOrderId
	AND ApprovalId = @CurrentUser
	AND ApprovalAmount < @Amount	--don't want equal here in case it is the same
	AND ISDeleted = 0

	if (@Sequence = cast(@Sequence as int))
	BEGIN	
		SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount, IsDeleted
		FROM dbo.WorkFlowMembersView
		WHERE ApproverSequence = --ISNULL(
		(SELECT MAX(WorkFlowMembersView.ApproverSequence)+1
							FROM dbo.WorkFlowMembersView
							WHERE WorkFlowId = @WorkFlowId
							AND ADName = @CurrentUser 	AND ApprovalAmount < @Amount AND ISDeleted = 0)
		AND WorkFlowID = @WorkFlowId
		AND IsDeleted = 0
	END
	ELSE
	BEGIN

		SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount,IsDeleted
		FROM dbo.WorkFlowMembersView
		WHERE ApproverSequence = cast(@Sequence as int)
		AND WorkFlowID = @WorkFlowId
		AND IsDeleted = 0


	END
END
SET NOCOUNT OFF
COMMIT TRANSACTION;