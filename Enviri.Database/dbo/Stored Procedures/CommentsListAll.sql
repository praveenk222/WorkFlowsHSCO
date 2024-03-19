

-- =============================================
-- Author:		Ed Blair
-- Create date: 08/30/2013
-- Description: Get all Comments
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommentsListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Comment, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Comments
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;