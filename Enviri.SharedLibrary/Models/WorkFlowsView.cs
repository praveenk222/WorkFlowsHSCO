using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class WorkFlowsView
{
    public int Id { get; set; }

    public string WorkFlowName { get; set; } = null!;

    public int DepartmentId { get; set; }

    public bool IsDeleted { get; set; }
}
