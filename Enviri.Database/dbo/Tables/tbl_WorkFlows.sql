CREATE TABLE [dbo].[tbl_WorkFlows] (
    [Id]           INT          IDENTITY (1, 1) NOT NULL,
    [WorkFlowName] VARCHAR (50) NOT NULL,
    [DepartmentId] INT          NOT NULL,
    [GoesTo]       CHAR (2)     CONSTRAINT [DF_WorkFlows_GoesTo] DEFAULT ('AP') NOT NULL,
    [IsDeleted]    BIT          NOT NULL,
    [CreatedBy]    VARCHAR (50) NOT NULL,
    [CreatedOn]    DATETIME     NOT NULL,
    [ModifiedBy]   VARCHAR (50) NOT NULL,
    [ModifiedOn]   DATETIME     NOT NULL,
    CONSTRAINT [PK_WorkFlows] PRIMARY KEY CLUSTERED ([Id] ASC)
);

