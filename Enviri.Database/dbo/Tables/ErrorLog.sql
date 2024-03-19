CREATE TABLE [dbo].[ErrorLog] (
    [Id]             INT           IDENTITY (1, 1) NOT NULL,
    [Message]        VARCHAR (255) NOT NULL,
    [StackTrace]     VARCHAR (255) NOT NULL,
    [InnerException] VARCHAR (255) NOT NULL,
    [TargetSite]     VARCHAR (255) NOT NULL,
    [ErrorSource]    VARCHAR (255) NOT NULL,
    [CreatedBy]      VARCHAR (50)  NOT NULL,
    [CreatedOn]      DATETIME      NOT NULL,
    [ModifiedBy]     VARCHAR (50)  NOT NULL,
    [ModifiedOn]     DATETIME      NOT NULL,
    CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED ([Id] ASC)
);

