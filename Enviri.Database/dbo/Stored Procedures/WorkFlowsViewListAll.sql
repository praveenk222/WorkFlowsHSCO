
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get all WorkFlows
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE  [dbo].[WorkFlowsViewListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowName, DepartmentId, IsDeleted
	FROM dbo.WorkFlowsView
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;