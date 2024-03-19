
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert/Update ApprovalStatus
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[ApprovalStatusModify]

@Id int,
@Description varchar(50),
@IsDeleted bit,
@CreatedBy varchar(50),
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	IF (EXISTS(SELECT 1 FROM [dbo].[ApprovalStatus] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[ApprovalStatus] SET
				[Description] = @Description,
				IsDeleted = @IsDeleted,
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[ApprovalStatus]
			([Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@Description, @IsDeleted, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;