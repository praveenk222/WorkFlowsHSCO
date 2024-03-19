
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert/Update Attachments
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[AttachmentsModify]

@Id int,
@PurchaseOrderId int,
@FileName varchar(255),
@FileSize int,
@FileType varchar(100),
@AttachDocument image,
@SendtoVendor bit,
@IsDeleted bit,
@CreatedBy varchar(50),
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	IF (EXISTS(SELECT 1 FROM [dbo].[Attachments] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[Attachments] SET
				PurchaseOrderId = @PurchaseOrderId,
				[FileName] = @FileName,
				FileSize = @FileSize,
				FileType = @FileType,
				AttachDocument = @AttachDocument,
				SendtoVendor = @SendtoVendor,
				IsDeleted = @IsDeleted,
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[Attachments]
			(PurchaseOrderId, [FileName], FileSize, FileType, AttachDocument, SendtoVendor, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@PurchaseOrderId, @FileName, @FileSize, @FileType, @AttachDocument, @SendtoVendor, @IsDeleted, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;