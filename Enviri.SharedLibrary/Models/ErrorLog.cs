using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class ErrorLog
{
    public int Id { get; set; }

    public string Message { get; set; } = null!;

    public string StackTrace { get; set; } = null!;

    public string InnerException { get; set; } = null!;

    public string TargetSite { get; set; } = null!;

    public string ErrorSource { get; set; } = null!;

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }
}
