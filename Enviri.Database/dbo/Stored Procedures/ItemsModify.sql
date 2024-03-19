
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert/Update Items
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[ItemsModify]

@Id int,
@PurchaseOrderId int, 
@Quantity decimal(18,2),
@UnitPrice decimal(18,2),
@Description varchar(255),
@GLDescriptionId int,
@GLCode varchar(15),
@CreatedBy varchar(50),
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	IF (EXISTS(SELECT 1 FROM [dbo].[Items] WHERE @Id = Id))
		BEGIN
			UPDATE [dbo].[Items] SET
				PurchaseOrderId = @PurchaseOrderId,
				Quantity = @Quantity, 
				UnitPrice = @UnitPrice, 
				[Description] = @Description,
				GLDescriptionId = @GLDescriptionId,
				GLCode = @GLCode, 
				ModifiedBy = @ModifiedBy,
				ModifiedOn = @ModifiedOn
			WHERE Id = @Id
		END
	ELSE -- INSERT
	BEGIN
		INSERT INTO [dbo].[Items]
			(PurchaseOrderId, Quantity, UnitPrice, [Description], GLDescriptionId, GLCode, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
		VALUES
			(@PurchaseOrderId, @Quantity, @UnitPrice, @Description, @GLDescriptionId, @GLCode, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)
	END

END
SET NOCOUNT OFF
COMMIT TRANSACTION;