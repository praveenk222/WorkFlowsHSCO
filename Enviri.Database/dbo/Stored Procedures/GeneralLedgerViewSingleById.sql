

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get single GeneralLedgerView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[GeneralLedgerViewSingleById]

@Id int

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, [Description], Number, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn
	FROM [dbo].[GeneralLedgerView]
	WHERE Id = @Id
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;