CREATE TABLE [dbo].[CommunicationsLog] (
    [Id]              INT            IDENTITY (1, 1) NOT NULL,
    [PurchaseOrderId] INT            NOT NULL,
    [Recipients]      NVARCHAR (500) NOT NULL,
    [Subject]         NVARCHAR (200) NOT NULL,
    [Body]            NTEXT          NOT NULL,
    [DateSent]        DATETIME       NOT NULL,
    [CreatedBy]       NVARCHAR (50)  NOT NULL,
    [CreatedOn]       DATETIME       NOT NULL,
    CONSTRAINT [PK_CommunicationsLog] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_CommunicationsLog_PurchaseOrder] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrder] ([Id])
);

