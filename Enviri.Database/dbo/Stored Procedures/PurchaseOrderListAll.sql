
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all PurchaseOrder
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[PurchaseOrderListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Title, WorkFlowId, RequestedBy, DepartmentId, RequestingDepartmentId, AFINumber, VendorId, VendorNumber, VendorEmail, VendorPhone, VendorFax
		, DeliveryDate, VendorSelectionId, VendorReasonId, RemarksId, StatusId, VendorRemarksId, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.PurchaseOrder
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;