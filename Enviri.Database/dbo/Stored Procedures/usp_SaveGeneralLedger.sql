 
-- =============================================  
-- Author:  Praveen  
-- Create date: 2024-03-08  
-- Description: usp_SaveGeneralLedge
--   
-- Modifications:  
-- =============================================  
CREATE PROCEDURE [dbo].[usp_SaveGeneralLedger]  
	@Id int,@Description  varchar(255),
	@Number  varchar(50),@Department varchar(3),
	@StartWith varchar(15),	 @IsDeleted BIT,
	@CreatedBy VARCHAR(50), @createdOn DATETIME, 
	@ModifiedBy VARCHAR(50), 
	@ModifiedOn DATETIME
AS
BEGIN
 IF EXISTS (SELECT 1 FROM tbl_GeneralLedger WHERE Id = @Id)
	 BEGIN
		UPDATE [dbo].[tbl_GeneralLedger]
				SET   Description=@Description,IsDeleted=@IsDeleted,		
						 ModifiedBy=@ModifiedBy,ModifiedOn=GETDATE()
						 WHERE Id=@Id	
				SELECT 1 as Id,CAST(1 as bit) as Status, 'Updated successfully' as Message	 
	 END
 ELSE
	 BEGIN		
				INSERT INTO [dbo].[tbl_GeneralLedger]
						 ([Description],[Number],[Department],
							[StartWith],[IsDeleted] ,[CreatedBy],
							 [CreatedOn],[ModifiedBy] ,[ModifiedOn])
						VALUES
							 (@Description,@Number,@Department,@StartWith,@IsDeleted, @CreatedBy,
							 @CreatedOn,  @ModifiedBy, @ModifiedOn)
						
				SELECT 1 as Id,CAST(1 as bit) as Status, 'Saved successfully' as Message	 
	 END
 END

