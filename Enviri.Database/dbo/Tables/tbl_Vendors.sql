CREATE TABLE [dbo].[tbl_Vendors] (
    [Id]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]           NVARCHAR (255) NOT NULL,
    [Number]         NVARCHAR (50)  NOT NULL,
    [Address1]       NVARCHAR (50)  NULL,
    [Address2]       NVARCHAR (50)  NULL,
    [Address3]       NVARCHAR (50)  NULL,
    [Address4]       NVARCHAR (50)  NULL,
    [city]           NVARCHAR (50)  NULL,
    [State]          NVARCHAR (50)  NULL,
    [Zip]            NVARCHAR (50)  NULL,
    [PaymentTermsId] INT            NULL,
    [IsDeleted]      BIT            NOT NULL,
    [CreatedBy]      VARCHAR (50)   NOT NULL,
    [CreatedOn]      DATETIME       NOT NULL,
    [ModifiedBy]     VARCHAR (50)   NOT NULL,
    [ModifiedOn]     DATETIME       NULL,
    CONSTRAINT [PK_Vendors] PRIMARY KEY CLUSTERED ([Id] ASC)
);

