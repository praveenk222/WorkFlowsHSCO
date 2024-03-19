
-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Get active VendorsView
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[VendorsViewListActive]

AS

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	SELECT Id, 
	CASE WHEN ISNULL(Address1,'') = '' THEN
		LTRIM(RTRIM(Name)) 
	else
		LTRIM(RTRIM(Name))  + ' (' + ISNULL(Address1,'') + ', ' + ISNULL(City,'') + ', ' + ISNULL(State,'') + ', '+ ISNULL(Zip,'') + ')' END as Name
		
	, Number, Address1, Address2, Address3, Address4, City, [State], Zip, PaymentTermsId, IsDeleted, PaymentType
    FROM [dbo].[VendorsView]
	WHERE IsDeleted = 0
	ORDER BY LTRIM(RTRIM(Name))
	
END
SET NOCOUNT OFF
COMMIT TRANSACTION;