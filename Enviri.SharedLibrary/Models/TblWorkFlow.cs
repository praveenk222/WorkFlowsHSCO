using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class TblWorkFlow
{
    public int Id { get; set; }

    public string WorkFlowName { get; set; } = null!;

    public int DepartmentId { get; set; }

    public string GoesTo { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }
}


public partial class TblWorkFlowNew
{
    public int Id { get; set; }

    public string WorkFlowName { get; set; } = null!;

    public int DepartmentId { get; set; }

    public string GoesTo { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }
    public string DeaprtmentName { get; set; } = null!;
}
