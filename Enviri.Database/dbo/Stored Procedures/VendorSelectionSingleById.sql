
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get single VendorSelection by Id
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[VendorSelectionSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.VendorSelection
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;