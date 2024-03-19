
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all ApprovalStatus
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[ApprovalStatusListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.ApprovalStatus
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;