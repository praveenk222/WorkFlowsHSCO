

-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get WorkFlowMembers per workflow
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE [dbo].[WorkFlowMembersViewListByWorkFlowId]

@WorkFlowId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount, IsDeleted
	FROM dbo.WorkFlowMembersView
	WHERE WorkFlowId = @WorkFlowId
	AND IsDeleted = 0
	ORDER BY ApproverSequence
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;