CREATE TABLE [dbo].[Approvals] (
    [Id]               INT            IDENTITY (1, 1) NOT NULL,
    [WorkflowId]       INT            NOT NULL,
    [PurchaseOrderId]  INT            NOT NULL,
    [ApprovalId]       VARCHAR (50)   NOT NULL,
    [ApprovalName]     NVARCHAR (255) NOT NULL,
    [Sequence]         DECIMAL (5, 3) NOT NULL,
    [ApprovalStatusId] INT            NOT NULL,
    [CommentId]        INT            NULL,
    [CreatedBy]        VARCHAR (50)   NOT NULL,
    [CreatedOn]        DATETIME       NOT NULL,
    [ModifiedBy]       VARCHAR (50)   NOT NULL,
    [ModifiedOn]       DATETIME       NOT NULL,
    CONSTRAINT [PK_Approvals] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_Approvals_ApprovalStatus] FOREIGN KEY ([ApprovalStatusId]) REFERENCES [dbo].[ApprovalStatus] ([Id]),
    CONSTRAINT [FK_Approvals_Comments] FOREIGN KEY ([CommentId]) REFERENCES [dbo].[Comments] ([Id]),
    CONSTRAINT [FK_Approvals_PurchaseOrder] FOREIGN KEY ([PurchaseOrderId]) REFERENCES [dbo].[PurchaseOrder] ([Id])
);

