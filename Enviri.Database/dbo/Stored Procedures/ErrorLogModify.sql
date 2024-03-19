



-- =============================================
-- Author:		Ed Blair
-- Create date: 08/30/2013
-- Description: Insert/Update ErrorLog
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[ErrorLogModify]

@Id int,
@Message varchar(255),
@StackTrace varchar(255),
@InnerException varchar(255),
@TargetSite varchar(255),
@ErrorSource varchar(255),
@CreatedBy varchar(50),
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	IF (EXISTS(SELECT 1 FROM [dbo].[ErrorLog] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[ErrorLog] SET
				[Message] = @Message,
				StackTrace = @StackTrace,
				InnerException = @InnerException,
				TargetSite = @TargetSite,
				ErrorSource = @ErrorSource,
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[ErrorLog]
			([Message], StackTrace, InnerException, TargetSite, ErrorSource, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@Message, @StackTrace, @InnerException, @TargetSite, @ErrorSource, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;