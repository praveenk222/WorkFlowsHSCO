CREATE TABLE [dbo].[tbl_WorkFlowMembers] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [WorkFlowId]       INT             NOT NULL,
    [ADName]           VARCHAR (50)    NOT NULL,
    [DisplayName]      NVARCHAR (255)  NOT NULL,
    [Email]            NVARCHAR (255)  NOT NULL,
    [ApproverSequence] DECIMAL (5, 3)  NOT NULL,
    [ApprovalAmount]   DECIMAL (18, 2) NOT NULL,
    [IsDeleted]        BIT             NOT NULL,
    [CreatedBy]        VARCHAR (50)    NOT NULL,
    [CreatedOn]        DATETIME        NOT NULL,
    [ModifiedBy]       VARCHAR (50)    NOT NULL,
    [ModifiedOn]       DATETIME        NOT NULL,
    CONSTRAINT [PK_WorkFlowMembers] PRIMARY KEY CLUSTERED ([Id] ASC)
);

