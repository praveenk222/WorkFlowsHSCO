
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert/Update VendorReason
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[VendorReasonModify]

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

	IF (EXISTS(SELECT 1 FROM [dbo].[VendorReason] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[VendorReason] SET
				[Description] = @Description,
				IsDeleted = @IsDeleted,
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[VendorReason]
			([Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@Description, @IsDeleted, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;