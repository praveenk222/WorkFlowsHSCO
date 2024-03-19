CREATE TABLE [dbo].[tbl_UserGroupAccess] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [LoginID]        NVARCHAR (100) NULL,
    [CorporateUsers] BIT            DEFAULT ((0)) NULL,
    [ApproverUsers]  BIT            DEFAULT ((0)) NULL,
    [InitiatorUsers] BIT            DEFAULT ((0)) NULL,
    [UpdatedOn]      DATETIME       DEFAULT (getdate()) NULL,
    [UpdatedBy]      NVARCHAR (150) NULL,
    [IsActive]       BIT            DEFAULT ((1)) NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

