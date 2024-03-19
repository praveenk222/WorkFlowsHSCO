CREATE VIEW [dbo].[WorkFlowMembersView]

AS
	
	SELECT Id, WorkFlowId, ADName, DisplayName, Email, ApproverSequence, ApprovalAmount, IsDeleted
	FROM [dbo].[tbl_WorkFlowMembers]
