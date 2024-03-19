
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all VendorReason
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[VendorReasonListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.VendorReason
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;