
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get all VendorsView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[VendorsViewListAll]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, Name, Number, Address1, Address2, Address3, Address4, City, [State], Zip, PaymentTermsId, IsDeleted, PaymentType
    FROM [dbo].[VendorsView]
	ORDER BY Name
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;