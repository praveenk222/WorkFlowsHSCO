 
-- =============================================  
-- Author:  Praveen  
-- Create date: 2024-03-08  
-- Description: usp_SaveDepartment
--   
-- Modifications:  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_SaveDepartment]  
	@Id int, @Name NVARCHAR(50), @IsDeleted BIT,
	@CreatedBy VARCHAR(50), @createdOn DATETIME, 
	@ModifiedBy VARCHAR(50), 
	@ModifiedOn DATETIME
AS
BEGIN
 IF EXISTS (SELECT 1 FROM tbl_Departments WHERE Id = @Id)
	 BEGIN
		UPDATE [dbo].[tbl_Departments]
				SET   Name=@Name,IsDeleted=@IsDeleted,		
						 ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE()
						 WHERE Id=@Id	
				SELECT 1 as Id,CAST(1 as bit) as Status, 'Updated successfully' as Message	 
	 END
 ELSE
	 BEGIN
		 INSERT INTO [dbo].[tbl_Departments]
					   ([Name],[IsDeleted],[CreatedBy]
					   ,[CreatedOn],[ModifiedBy],[ModifiedOn])
				 VALUES
					   (@Name,0,@CreatedBy,
					   GETDATE(), @ModifiedBy, GETDATE())
				SELECT 1 as Id,CAST(1 as bit) as Status, 'Saved successfully' as Message	 
	 END
 END
