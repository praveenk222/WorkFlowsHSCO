CREATE TABLE [dbo].[tbl_Departments] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (50) NOT NULL,
    [Code]         NVARCHAR (50) NOT NULL,
    [ADAccessName] VARCHAR (50)  NULL,
    [IsDeleted]    BIT           NOT NULL,
    [CreatedBy]    VARCHAR (50)  NOT NULL,
    [CreatedOn]    DATETIME      NOT NULL,
    [ModifiedBy]   VARCHAR (50)  NOT NULL,
    [ModifiedOn]   DATETIME      NOT NULL,
    CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED ([Id] ASC)
);

