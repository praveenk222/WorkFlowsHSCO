
-- =========================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get single RequestingDepartments by description
-- 
-- Modifications:
-- =========================================================
CREATE PROCEDURE [dbo].[RequestingDepartmentsSingleByDescription]

@Description varchar(255)

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.RequestingDepartments
	WHERE Description = @Description
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;