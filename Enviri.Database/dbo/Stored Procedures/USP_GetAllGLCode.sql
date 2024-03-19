-- =============================================  
-- Author : Praveen 
-- Create Date : 2024-03-09 
-- Description : [USP_GetAllCountry]  
-- =============================================  
-- Exec [USP_GetAllGLCode]  
CREATE PROCEDURE [dbo].[USP_GetAllGLCode]  
  
AS  
BEGIN  
SET NOCOUNT ON;  
  
	SELECT [Id], [Description], [Number], [IsDeleted], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]
	FROM [dbo].[tbl_GeneralLedger] GL
	--WHERE GL.IsDeleted = 0  
	ORDER BY GL.CreatedOn DESC  
END 