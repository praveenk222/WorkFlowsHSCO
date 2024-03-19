
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get single WorkFlowMembers
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE  [dbo].[WorkFlowMembersViewSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount, IsDeleted
	FROM dbo.WorkFlowMembersView
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;