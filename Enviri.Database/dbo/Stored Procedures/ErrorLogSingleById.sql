


-- =============================================
-- Author:		Ed Blair
-- Create date: 08/30/2013
-- Description: Get single ErrorLog
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE  [dbo].[ErrorLogSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Message], StackTrace, InnerException, TargetSite, ErrorSource, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM dbo.ErrorLog
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;