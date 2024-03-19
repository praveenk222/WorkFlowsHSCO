


-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get all CommunicationsLog
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommunicationsLogListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, Recipients, Subject, Body, DateSent, CreatedBy, CreatedOn
	FROM dbo.CommunicationsLog

END
SET NOCOUNT OFF
COMMIT TRANSACTION;