CREATE TABLE [dbo].[Attachments] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderId] INT            NOT NULL,
    [FileName]        NVARCHAR (255) NOT NULL,
    [FileSize]        INT            NOT NULL,
    [FileType]        VARCHAR (100)  NOT NULL,
    [AttachDocument]  IMAGE          NOT NULL,
    [SendtoVendor]    BIT            CONSTRAINT [DF_Attachments_SendtoVendor] DEFAULT ((0)) NOT NULL,
    [IsDeleted]       BIT            NOT NULL,
    [CreatedBy]       NVARCHAR (50)  NOT NULL,
    [CreatedOn]       DATETIME       NOT NULL,
    [ModifiedBy]      NVARCHAR (50)  NOT NULL,
    [ModifiedOn]      DATETIME       NOT NULL,
    CONSTRAINT [PK_Attachments] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Attachments_PurchaseOrder] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrder] ([Id])
);

