  
-- =============================================  
-- Author:  Praveen  
-- Create date: 2024-03-08  
-- Description: Get all Departments
--   
-- Modifications:  
-- =============================================  
CREATE PROCEDURE [dbo].[DepartmentsListAll]  
  
AS  
  
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  
SET NOCOUNT ON  
BEGIN  
  
	 SELECT *  FROM [dbo].[tbl_Departments] order by CreatedOn desc
   
END  
 