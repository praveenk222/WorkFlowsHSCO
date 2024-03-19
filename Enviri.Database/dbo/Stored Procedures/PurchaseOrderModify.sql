
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Modify PurchaseOrder
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[PurchaseOrderModify]

@Id int,
@Title varchar(50),
@WorkFlowId int,
@RequestedBy varchar(50),
@DepartmentId int,
@RequestingDepartmentId int,
@AFINumber varchar(15),
@VendorId int,
@VendorNumber varchar(50), 
@VendorEmail varchar(100),
@VendorPhone varchar(25),
@VendorFax varchar(25),
@DeliveryDate datetime,
@VendorSelectionId int,
@VendorReasonId int,
@RemarksId int,
@StatusId int,
@VendorRemarksId int,
@CreatedBy varchar(50),
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS


BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	DECLARE @NewId int
	
    UPDATE PurchaseOrder SET
		Title = @Title,
		WorkFlowId = @WorkFlowId,
		RequestedBy = @RequestedBy, 
		DepartmentId = @DepartmentId,
		RequestingDepartmentId = @RequestingDepartmentId,
		AFINumber = @AFINumber,
		VendorId = @VendorId,
		VendorNumber = @VendorNumber,
		VendorEmail = @VendorEmail,
		VendorPhone = @VendorPhone,
		VendorFax = @VendorFax,
		DeliveryDate = @DeliveryDate,
		VendorSelectionId = @VendorSelectionId,
		VendorReasonId = @VendorReasonId,
		RemarksId = @RemarksId,
		StatusId = @StatusId,
		VendorRemarksId = @VendorRemarksId,
		ModifiedBy = @ModifiedBy,
		ModifiedOn = @ModifiedOn
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;