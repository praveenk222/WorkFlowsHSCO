
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert/Update Status
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[StatusModify]

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

	IF (EXISTS(SELECT 1 FROM [dbo].[Status] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[Status] SET
				[Description] = @Description,
				IsDeleted = @IsDeleted,
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[Status]
			([Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@Description, @IsDeleted, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;