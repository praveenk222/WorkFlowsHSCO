
-- ================================================================
-- Author:		Ed Blair
-- Create date: 10/02/2013
-- Description: Report actual purchase order 
-- 
-- Modifications:
-- [dbo].[Report_PurchaseOrderDetail] 12
-- ================================================================
CREATE PROCEDURE [dbo].[Report_PurchaseOrderDetail]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT PurchaseOrder.Id, Title, VendorId, VendorNumber, VendorEmail, VendorPhone, VendorFax, DeliveryDate, 
		Name, Number, Address1, ISNULL(Address2,'') as Address2, City, [State], Zip, PaymentType, AFINumber,
		VendorReason.Description as VendorReasonDesc, VendorSelection.Description as VendorSelectionDesc,
		Status.Description as StatusDesc, RequestedBy, RequestingDepartments.Description as RequestingDepartmentsDesc,
		Comments.Comment as Remarks, VendorComments.Comment as VendorComment
	FROM [dbo].[PurchaseOrder]
		LEFT OUTER JOIN VendorsView on VendorsView.Id = PurchaseOrder.VendorId
		LEFT OUTER JOIN VendorReason on VendorReason.Id = PurchaseOrder.VendorSelectionId
		LEFT OUTER JOIN VendorSelection on VendorSelection.Id = PurchaseOrder.VendorReasonId
		LEFT OUTER JOIN Status on Status.Id = PurchaseOrder.StatusId
		LEFT OUTER JOIN RequestingDepartments ON RequestingDepartments.Id = PurchaseOrder.RequestingDepartmentId
		LEFT OUTER JOIN dbo.Comments ON Comments.Id = PurchaseOrder.RemarksId
		LEFT OUTER JOIN dbo.Comments VendorComments ON VendorComments.Id = PurchaseOrder.VendorRemarksId
	WHERE PurchaseOrder.Id = @PurchaseOrderId
      
END
SET NOCOUNT OFF
COMMIT TRANSACTION;