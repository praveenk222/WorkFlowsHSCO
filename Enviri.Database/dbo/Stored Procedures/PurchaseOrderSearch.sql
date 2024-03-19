
-- ================================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Search PurchaseOrder by criteria
-- 
-- Modifications:
-- 076/29/2015 - Added RequestBy as filter
-- [dbo].[PurchaseOrderSearch] 0,'',-1,0, '1/1/2013', ''
-- ================================================================
CREATE PROCEDURE [dbo].[PurchaseOrderSearch]

@Id int,
@Title varchar(255),
@VendorId int,
@StatusId int, 
@StartDate datetime,
@EndDate datetime,
@RequestedBy varchar(100)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	if (@StartDate = '')
		set @StartDate = null
	if (@EndDate = '')
		set @EndDate = null
				
	SELECT PurchaseOrder.Id, Title, RequestedBy, Status.Description as StatusDesc, RequestingDepartments.Description as RequestingDepartment, 
		VendorsView.Name as VendorName, VendorNumber, VendorPhone, VendorFax, DeliveryDate,
		(SELECT SUM(Quantity*UnitPrice) FROM Items WHERE Items.PurchaseOrderId = PurchaseOrder.Id) as TotalAmount
	FROM PurchaseOrder
		INNER JOIN dbo.Status ON Status.Id = StatusId
		LEFT OUTER JOIN dbo.VendorsView ON VendorsView.Id = VendorId
		LEFT OUTER JOIN dbo.RequestingDepartments ON RequestingDepartments.Id = RequestingDepartmentId
	WHERE Title like '%' + @Title + '%'
	AND DeliveryDate between ISNULL(@StartDate,'1/1/1900') AND ISNULL(@EndDate,'1/1/3000')
	AND (@Id = 0 OR PurchaseOrder.Id = @Id)
	AND (@StatusId = 0 OR PurchaseOrder.StatusId = @StatusId)
	AND (@VendorId = -1 OR PurchaseOrder.VendorId = @VendorId)
	AND RequestedBy like '%' + @RequestedBy + '%'
	ORDER BY PurchaseOrder.CreatedOn DESC, Title
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;