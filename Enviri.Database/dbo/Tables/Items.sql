CREATE TABLE [dbo].[Items] (
    [Id]              INT             IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderId] INT             NOT NULL,
    [Quantity]        DECIMAL (18, 2) NOT NULL,
    [UnitPrice]       DECIMAL (18, 2) NOT NULL,
    [Description]     VARCHAR (255)   NOT NULL,
    [GLDescriptionId] INT             NULL,
    [GLCode]          VARCHAR (15)    NOT NULL,
    [CreatedBy]       VARCHAR (50)    NOT NULL,
    [CreatedOn]       DATETIME        NOT NULL,
    [ModifiedBy]      VARCHAR (50)    NOT NULL,
    [ModifiedOn]      DATETIME        NOT NULL,
    CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Items_PurchaseOrder] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrder] ([Id])
);


GO
CREATE NONCLUSTERED INDEX [IX_Items_PO]
    ON [dbo].[Items]([PurchaseOrderId] ASC);

