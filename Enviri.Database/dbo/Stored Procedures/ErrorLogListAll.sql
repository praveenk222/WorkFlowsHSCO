


-- =============================================
-- Author:		Ed Blair
-- Create date: 08/30/2013
-- Description: Get all ErrorLogs
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[ErrorLogListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Message], StackTrace, InnerException, TargetSite, ErrorSource, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.ErrorLog
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;