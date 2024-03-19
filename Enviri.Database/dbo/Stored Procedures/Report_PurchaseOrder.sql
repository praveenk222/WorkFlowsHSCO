
-- ================================================================
-- Author:		Ed Blair
-- Create date: 10/02/2013
-- Description: Report actual purchase order 
-- 
-- Modifications:
-- ================================================================
CREATE PROCEDURE [dbo].[Report_PurchaseOrder]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT PurchaseOrder.Id, Title, VendorId, VendorNumber, VendorEmail, VendorPhone, VendorFax, DeliveryDate, 
		Name, VendorsView.Number, Address1, Address2, City, [State], Zip, PaymentType, 
		Items.[Description], Quantity, UnitPrice, (Quantity*UnitPrice) as TotalPrice,GLDescriptionId 
		, GeneralLedgerView.Description as GLDescription, GLCode, VendorComments.Comment as VendorComment
		, (Select SUM((Quantity*UnitPrice)) FROM Items Items2 WHERE Items2.PurchaseOrderId = PurchaseOrder.Id) as SubTotal
	FROM [dbo].[PurchaseOrder]
		LEFT OUTER JOIN VendorsView on VendorsView.Id = PurchaseOrder.VendorId
		LEFT OUTER JOIN Items on Items.PurchaseOrderId = PurchaseOrder.Id
		LEFT OUTER JOIN GeneralLedgerView on GeneralLedgerView.Id = GLDescriptionId
		LEFT OUTER JOIN dbo.Comments VendorComments ON VendorComments.Id = PurchaseOrder.VendorRemarksId
	WHERE PurchaseOrder.Id = @PurchaseOrderId
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;