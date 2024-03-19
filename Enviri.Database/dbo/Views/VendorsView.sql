CREATE VIEW [dbo].[VendorsView]

AS
	
	SELECT V.Id, V.[Name], V.Number, V.Address1, V.Address2, V.Address3, V.Address4, 
	V.City, V.[State], V.Zip, V.PaymentTermsId, V.IsDeleted,
	P.[Description] as PaymentType	
	FROM [dbo].[tbl_Vendors] V	
		LEFT OUTER JOIN [dbo].[tbl_PaymentTerms]  P
		ON P.Id = V.PaymentTermsId