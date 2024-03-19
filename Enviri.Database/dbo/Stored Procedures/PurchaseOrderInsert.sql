
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Insert new PurchaseOrder
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[PurchaseOrderInsert]

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
	
    INSERT INTO PurchaseOrder (Title, WorkFlowId, RequestedBy, DepartmentId, RequestingDepartmentId, AFINumber, VendorId, VendorNumber, VendorEmail, VendorPhone, VendorFax
		, DeliveryDate, VendorSelectionId, VendorReasonId, RemarksId, StatusId, VendorRemarksId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
    VALUES (@Title, @WorkFlowId, @RequestedBy, @DepartmentId, @RequestingDepartmentId, @AFINumber, @VendorId, @VendorNumber, @VendorEmail, @VendorPhone, @VendorFax
		, @DeliveryDate, @VendorSelectionId, @VendorReasonId, @RemarksId, @StatusId, @VendorRemarksId, @CreatedBy, @CreatedOn, @ModifiedBy, @ModifiedOn)

	set @NewId = @@Identity

	select @NewId as Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;