
-- =============================================
-- Author:		Ed Blair
-- Create date: 07/18/2014
-- Description: delete Items
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[ItemsDelete]

@Id int

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	DELETE FROM [dbo].[Items]
	WHERE Id = @Id

END
SET NOCOUNT OFF
COMMIT TRANSACTION;