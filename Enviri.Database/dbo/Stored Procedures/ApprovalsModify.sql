
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert/Update Approvals
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[ApprovalsModify]

@Id int,
@WorkflowId int,
@PurchaseOrderId int,
@ApprovalId varchar(50),
@ApprovalName varchar(255),
@Sequence decimal(5,3),
@ApprovalStatusId int,
@CommentId int,
@CreatedBy varchar(50),
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	IF (EXISTS(SELECT 1 FROM [dbo].[Approvals] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[Approvals] SET
				WorkflowId = @WorkflowId,
				PurchaseOrderId = @PurchaseOrderId,
				ApprovalId = @ApprovalId,
				ApprovalName = @ApprovalName,
				Sequence = @Sequence,
				ApprovalStatusId = @ApprovalStatusId,
				CommentId = @CommentId,
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[Approvals]
			(WorkflowId, PurchaseOrderId, ApprovalId, ApprovalName, Sequence, ApprovalStatusId, CommentId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@WorkflowId, @PurchaseOrderId, @ApprovalId, @ApprovalName, @Sequence, @ApprovalStatusId, @CommentId, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;