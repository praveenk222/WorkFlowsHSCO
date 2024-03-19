
CREATE VIEW [dbo].[GeneralLedgerView]

AS
	
	SELECT Id, [Description], Number, IsDeleted, CreatedBy, CreatedOn, ModifiedBy, ModifiedOn 
	FROM [dbo].[tbl_GeneralLedger]	
