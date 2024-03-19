
-- ==================================================
-- Author:		Ed Blair
-- Create date: 09/25/2013
-- Description: Get all PurchaseOrder created by 
-- 
-- Modifications:
-- ==================================================
CREATE PROCEDURE [dbo].[PurchaseOrderCreatedBy]

@CreatedBy varchar(50)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT PurchaseOrder.Id, Title, RequestedBy, Status.Description as StatusDesc, RequestingDepartments.Description as RequestingDepartment, 
		VendorsView.Name as VendorName, VendorNumber, VendorPhone, VendorFax, DeliveryDate,
		(SELECT SUM(Quantity*UnitPrice) FROM Items WHERE Items.PurchaseOrderId = PurchaseOrder.Id) as TotalAmount
	FROM PurchaseOrder
		INNER JOIN dbo.Status ON Status.Id = StatusId
		LEFT OUTER JOIN dbo.VendorsView ON VendorsView.Id = VendorId
		LEFT OUTER JOIN dbo.RequestingDepartments ON RequestingDepartments.Id = RequestingDepartmentId
	WHERE PurchaseOrder.CreatedBy = @CreatedBy	
	ORDER BY PurchaseOrder.CreatedOn DESC
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;