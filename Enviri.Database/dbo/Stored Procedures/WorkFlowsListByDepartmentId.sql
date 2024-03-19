
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get WorkFlows by department
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE  [dbo].[WorkFlowsListByDepartmentId]

@DepartmentId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowName, DepartmentId, IsDeleted
	FROM dbo.WorkFlowsView
	WHERE DepartmentId = @DepartmentId
	AND IsDeleted = 0
	ORDER BY WorkFlowName
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;