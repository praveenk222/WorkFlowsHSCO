

-- ==========================================================================================
-- Author:		Ed Blair
-- Create date: 01/22/2014
-- Description: Get last sequence number 
-- 
-- Modifications:
--  [dbo].[WorkFlowMembersLastSequenceByPurchaseOrder] 15
-- ==========================================================================================
CREATE PROCEDURE [dbo].[WorkFlowMembersLastSequenceByPurchaseOrder] 

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