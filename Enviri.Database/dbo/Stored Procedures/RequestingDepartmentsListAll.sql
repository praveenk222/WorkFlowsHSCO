
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get all RequestingDepartments
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[RequestingDepartmentsListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.RequestingDepartments
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;