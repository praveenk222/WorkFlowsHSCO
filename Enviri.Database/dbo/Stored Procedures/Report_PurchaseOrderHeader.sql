
-- ================================================================
-- Author:		Ed Blair
-- Create date: 10/02/2013
-- Description: Report actual purchase order 
-- 
-- Modifications:
-- ================================================================
CREATE PROCEDURE [dbo].[Report_PurchaseOrderHeader]

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT 
		PO.Id, Title, VendorId, VendorNumber, VendorEmail, VendorPhone, VendorFax, 
		DeliveryDate, Name, Number, Address1, ISNULL(Address2,'') as Address2,
		City, [State], Zip, PaymentType
	FROM 
		[dbo].[PurchaseOrder] PO
		LEFT OUTER JOIN VendorsView ON VendorsView.Id = PO.VendorId
	WHERE PO.Id = @PurchaseOrderId
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;