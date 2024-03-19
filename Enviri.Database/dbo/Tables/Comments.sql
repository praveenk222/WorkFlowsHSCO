CREATE TABLE [dbo].[Comments] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [Comment]    NTEXT        NOT NULL,
    [IsDeleted]  BIT          NOT NULL,
    [CreatedBy]  VARCHAR (50) NOT NULL,
    [CreatedOn]  DATETIME     NOT NULL,
    [ModifiedBy] VARCHAR (50) NOT NULL,
    [ModifiedOn] DATETIME     NULL,
    CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED ([Id] ASC)
);

