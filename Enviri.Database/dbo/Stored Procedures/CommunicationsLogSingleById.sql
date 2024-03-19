

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get CommunicationsLog by id
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommunicationsLogSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, PurchaseOrderId, Recipients, Subject, Body, DateSent, CreatedBy, CreatedOn
	FROM dbo.CommunicationsLog
	WHERE Id = @Id

END
SET NOCOUNT OFF
COMMIT TRANSACTION;