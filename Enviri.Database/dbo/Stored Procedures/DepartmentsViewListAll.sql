

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get all DepartmentsView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[DepartmentsViewListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Name, Code, IsDeleted
	FROM [dbo].[DepartmentsView]
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;