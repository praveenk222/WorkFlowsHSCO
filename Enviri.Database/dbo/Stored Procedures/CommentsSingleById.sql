

-- =============================================
-- Author:		Ed Blair
-- Create date: 08/30/2013
-- Description: Get one comment
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommentsSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Comment, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.Comments
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;