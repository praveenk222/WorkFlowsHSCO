
-- ===========================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get single WorkFlow
-- 
-- Modifications:
-- ===========================================================
CREATE PROCEDURE [dbo].[WorkFlowsViewSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, WorkFlowName, DepartmentId, IsDeleted
	FROM dbo.WorkFlowsView
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;