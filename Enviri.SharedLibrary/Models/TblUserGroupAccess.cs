using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class TblUserGroupAccess
{
    public int Id { get; set; }

    public string? LoginId { get; set; }

    public bool? CorporateUsers { get; set; }

    public bool? ApproverUsers { get; set; }

    public bool? InitiatorUsers { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public string? UpdatedBy { get; set; }

    public bool? IsActive { get; set; }
}
