

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get single DepartmentsView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[DepartmentsViewSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Name, Code, IsDeleted
	FROM [dbo].[DepartmentsView]
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;