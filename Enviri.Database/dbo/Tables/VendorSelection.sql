CREATE TABLE [dbo].[VendorSelection] (
    [Id]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    [IsDeleted]   BIT          NOT NULL,
    [CreatedBy]   VARCHAR (50) NOT NULL,
    [CreatedOn]   DATETIME     NOT NULL,
    [ModifiedBy]  VARCHAR (50) NOT NULL,
    [ModifiedOn]  DATETIME     NOT NULL,
    CONSTRAINT [PK_VendorSelection] PRIMARY KEY CLUSTERED ([Id] ASC)
);

