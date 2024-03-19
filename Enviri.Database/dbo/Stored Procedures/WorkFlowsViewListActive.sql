
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 07/25/2013
-- Description: Get active WorkFlows
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE  [dbo].[WorkFlowsViewListActive]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowName, DepartmentId, IsDeleted
	FROM dbo.WorkFlowsView
	WHERE IsDeleted = 0
	ORDER BY WorkFlowName
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;