
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get all WorkFlowMembers
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE [dbo].[WorkFlowMembersViewListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount, IsDeleted
	FROM dbo.WorkFlowMembersView
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;