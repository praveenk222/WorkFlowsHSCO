CREATE TABLE [dbo].[tbl_GeneralLedger] (
    [Id]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (255) NOT NULL,
    [Number]      VARCHAR (50)  NOT NULL,
    [Department]  VARCHAR (3)   CONSTRAINT [DF_GeneralLedger_Department] DEFAULT ('All') NOT NULL,
    [StartWith]   VARCHAR (15)  CONSTRAINT [DF_GeneralLedger_StartWith] DEFAULT ('US600-1001-') NOT NULL,
    [IsDeleted]   BIT           NOT NULL,
    [CreatedBy]   VARCHAR (50)  NOT NULL,
    [CreatedOn]   DATETIME      NOT NULL,
    [ModifiedBy]  VARCHAR (50)  NOT NULL,
    [ModifiedOn]  DATETIME      NOT NULL,
    CONSTRAINT [PK_GeneralLedger] PRIMARY KEY CLUSTERED ([Id] ASC)
);

