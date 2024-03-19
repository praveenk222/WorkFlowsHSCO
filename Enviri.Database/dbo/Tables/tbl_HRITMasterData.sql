﻿CREATE TABLE [dbo].[tbl_HRITMasterData] (
    [Sno]                 INT            IDENTITY (1, 1) NOT NULL,
    [EMPLOYEE_NUMBER]     NVARCHAR (50)  NOT NULL,
    [LAST_NAME]           NVARCHAR (100) NULL,
    [FIRST_NAME]          NVARCHAR (100) NULL,
    [START_DATE]          DATETIME       NULL,
    [TERMINATIONDATE]     DATETIME       NULL,
    [JOB_TITLE_DAILY]     NVARCHAR (100) NULL,
    [JOB_FAMILY]          NVARCHAR (100) NULL,
    [DIRECT_INDIRECT]     NVARCHAR (100) NULL,
    [SUPERVISOR_NUMBER]   NVARCHAR (100) NULL,
    [SUPERVISOR_NAME]     NVARCHAR (200) NULL,
    [LOCATION_NAME]       NVARCHAR (200) NULL,
    [LOCATION_CODE]       NVARCHAR (100) NULL,
    [COUNTRY_CODE]        NVARCHAR (100) NULL,
    [COUNTRY_NAME]        NVARCHAR (100) NULL,
    [ORGANIZATION_NAME]   NVARCHAR (200) NULL,
    [DIVISION_CODE]       NVARCHAR (100) NULL,
    [DIVISION_NAME]       NVARCHAR (200) NULL,
    [EMAIL_ADDRESS]       NVARCHAR (200) NULL,
    [AD_USERNAME]         NVARCHAR (50)  NULL,
    [ASSIGNMENT_CATEGORY] NVARCHAR (100) NULL,
    [SALARY_BASIS]        NVARCHAR (30)  NULL,
    [ASSIGNMENT_STATUS]   NVARCHAR (100) NULL,
    [UpdatedDate]         DATETIME       NULL,
    [UpdatedBy]           NVARCHAR (100) NULL
);

