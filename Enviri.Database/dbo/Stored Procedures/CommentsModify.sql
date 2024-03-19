


-- =============================================
-- Author:		Ed Blair
-- Create date: 08/30/2013
-- Description: Insert/Update Comments
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommentsModify]

@Id int,
@Comment varchar(max),
@IsDeleted bit,
@CreatedBy varchar(50), 
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	UPDATE [dbo].[Comments] SET
		Comment = @Comment,
		IsDeleted = @IsDeleted,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = getdate()
	WHERE @Id=Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;