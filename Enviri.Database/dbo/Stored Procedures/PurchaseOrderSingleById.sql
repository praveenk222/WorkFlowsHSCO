
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all PurchaseOrder
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[PurchaseOrderSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Title, WorkFlowId, RequestedBy, DepartmentId, RequestingDepartmentId, AFINumber, VendorId, VendorNumber, VendorEmail, VendorPhone, VendorFax
		, DeliveryDate, VendorSelectionId, VendorReasonId, RemarksId, StatusId, VendorRemarksId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.PurchaseOrder
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;