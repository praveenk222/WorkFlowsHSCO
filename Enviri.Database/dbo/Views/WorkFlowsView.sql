CREATE VIEW [dbo].[WorkFlowsView]

AS
	
	SELECT Id, WorkFlowName, DepartmentId, IsDeleted
	FROM [dbo].[tbl_WorkFlows]
