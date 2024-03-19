
-- ================================================
-- Author:		Ed Blair
-- Create date: 09/20/2013
-- Description: Get single RequestingDepartments by Id
-- 
-- Modifications:
-- ================================================
CREATE PROCEDURE [dbo].[RequestingDepartmentsSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.RequestingDepartments
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;