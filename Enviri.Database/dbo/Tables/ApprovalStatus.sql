CREATE TABLE [dbo].[ApprovalStatus] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (25) NOT NULL,
    [IsDeleted]   BIT          NOT NULL,
    [CreatedBy]   VARCHAR (50) NOT NULL,
    [CreatedOn]   DATETIME     NOT NULL,
    [ModifiedBy]  VARCHAR (50) NOT NULL,
    [ModifiedOn]  DATETIME     NOT NULL,
    CONSTRAINT [PK_ApprovalStatus] PRIMARY KEY CLUSTERED ([Id] ASC)
);

