
-- ==========================================================================================
-- Author:		Ed Blair
-- Create date: 09/26/2013
-- Description: Get last sequence number 
-- 
-- Modifications:
--  [dbo].[WorkFlowMembersLastSequenceByInvoice] 15
-- ==========================================================================================
CREATE PROCEDURE [dbo].[WorkFlowMembersLastSequenceByPurchaseOrderId] 

@PurchaseOrderId int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT MAX(Approvals.Sequence) as MaxSequenceNumber
	from Approvals
	where Approvals.PurchaseOrderId = @PurchaseOrderId
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;