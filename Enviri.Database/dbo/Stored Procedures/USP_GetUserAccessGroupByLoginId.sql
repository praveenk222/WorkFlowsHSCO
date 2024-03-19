-- Exec USP_GetUserAccessGroupByLoginId 'asuk'
CREATE PROCEDURE [dbo].[USP_GetUserAccessGroupByLoginId]
@LoginID nvarchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT
		U.ID, U.LoginID, U.CorporateUsers, U.ApproverUsers, U.InitiatorUsers, U.UpdatedOn, U.UpdatedBy, U.IsActive
	FROM tbl_UserGroupAccess U
	WHERE  U.IsActive = 1 AND 
	U.LoginID = @LoginID
END

