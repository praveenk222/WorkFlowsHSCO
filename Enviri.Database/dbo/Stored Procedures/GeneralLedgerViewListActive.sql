

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get active GeneralLedgerView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[GeneralLedgerViewListActive]


AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], Number, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM [dbo].[GeneralLedgerView]
	WHERE IsDeleted = 0
	ORDER BY [Description]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;