
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get WorkFlowMember by workflow and sequence
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE  [dbo].[WorkFlowMembersViewByWorkFlowIdBySequence]

@WorkFlowId int,
@ApproverSequence decimal(5,3)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount, IsDeleted
	FROM dbo.WorkFlowMembersView
	WHERE WorkFlowId = @WorkFlowId
	AND ApproverSequence = @ApproverSequence
	AND IsDeleted = 0
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;