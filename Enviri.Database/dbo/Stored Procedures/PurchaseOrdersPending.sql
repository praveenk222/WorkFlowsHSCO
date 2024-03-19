
-- ======================================================
-- Author:		Ed Blair
-- Create date: 10/01/2013
-- Description: Get all PurchaseOrder pending for user
-- 
-- Modifications:
-- [PurchaseOrdersPending] 'jwesthafer'
-- ======================================================
CREATE PROCEDURE [dbo].[PurchaseOrdersPending]

@ApprovalBy varchar(50)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT PurchaseOrder.Id, Title, RequestedBy, Status.Description as StatusDesc, RequestingDepartments.Description as RequestingDepartment, 
		VendorsView.Name as VendorName, VendorNumber, VendorPhone, VendorFax, DeliveryDate,
		ISNULL((SELECT SUM(ISNULL(Quantity,0)*ISNULL(UnitPrice,0)) FROM Items WHERE Items.PurchaseOrderId = PurchaseOrder.Id),0) as TotalAmount
	FROM PurchaseOrder
		INNER JOIN dbo.Status ON Status.Id = StatusId
		LEFT OUTER JOIN dbo.VendorsView ON VendorsView.Id = VendorId
		LEFT OUTER JOIN dbo.RequestingDepartments ON RequestingDepartments.Id = RequestingDepartmentId
		INNER JOIN dbo.Approvals on Approvals.PurchaseOrderId = PurchaseOrder.Id
			AND Approvals.ApprovalId = @ApprovalBy
			AND Approvals.ApprovalStatusId = 1
	WHERE Status.Description = 'Pending'
	ORDER BY DeliveryDate, PurchaseOrder.CreatedOn
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;