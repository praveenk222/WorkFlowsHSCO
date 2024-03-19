CREATE TABLE [dbo].[tbl_PaymentTerms] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] NVARCHAR (50) NOT NULL,
    [IsDeleted]   BIT           NOT NULL,
    [CreatedBy]   VARCHAR (50)  NOT NULL,
    [CreatedOn]   DATETIME      NOT NULL,
    [ModifiedBy]  VARCHAR (50)  NOT NULL,
    [ModifiedOn]  DATETIME      NOT NULL,
    CONSTRAINT [PK_PaymentTerms] PRIMARY KEY CLUSTERED ([Id] ASC)
);

