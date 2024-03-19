

-- =============================================
-- Author:		Ed Blair
-- Create date: 09/19/2013
-- Description: Insert Comments
-- 
-- Modifications:
-- =============================================
CREATE PROCEDURE [dbo].[CommentsInsert]

@Comment varchar(max),
@IsDeleted bit,
@CreatedBy varchar(50), 
@CreatedOn datetime,
@ModifiedBy varchar(50),
@ModifiedOn datetime

AS

BEGIN
	DECLARE @NewId int
	
    INSERT INTO Comments (Comment, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn)
    VALUES (@Comment, @IsDeleted, @CreatedBy, getdate(), @ModifiedBy, getdate())

	set @NewId = @@Identity

	select @NewId as Id

END