
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get active VendorSelection
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[VendorSelectionListActive]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.VendorSelection
	WHERE IsDeleted = 0
	ORDER BY [Description]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;