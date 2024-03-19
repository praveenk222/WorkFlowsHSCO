

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get active DepartmentsView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[DepartmentsViewListActive]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Name, Code, IsDeleted
	FROM [dbo].[DepartmentsView]
	WHERE IsDeleted = 0
	ORDER BY Name
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;