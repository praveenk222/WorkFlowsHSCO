



-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Insert CommunicationsLog
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommunicationsLogInsert]

@Id int,
@PurchaseOrderId int,
@Recipients nvarchar(500),
@Subject nvarchar(200),
@Body ntext,
@DateSent datetime,
@CreatedBy nvarchar(50),
@CreatedOn datetime

AS

BEGIN TRANSACTION;
SET NOCOUNT ON
BEGIN

	INSERT INTO CommunicationsLog (PurchaseOrderId, Recipients, Subject, Body, DateSent, CreatedBy, CreatedOn)
	VALUES (@PurchaseOrderId, @Recipients, @Subject, @Body, @DateSent, @CreatedBy, @CreatedOn)

END
SET NOCOUNT OFF
COMMIT TRANSACTION;