using System;
using System.Collections.Generic;

namespace Enviri.PO.WebUI.Data;

public partial class TblUser
{
    public int EntryId { get; set; }

    public string CountryCode { get; set; } = null!;

    public string DivisionId { get; set; } = null!;

    public string UserId { get; set; } = null!;

    public string? SiteLocation { get; set; }

    public string? UserFname { get; set; }

    public string? UserLname { get; set; }

    public string? UserMname { get; set; }

    public string? UserTitle { get; set; }

    public string? UserEmail { get; set; }

    public bool? UserAdmin { get; set; }

    public bool? UserPreparer { get; set; }

    public bool? UserApprover { get; set; }

    public DateTime Created { get; set; }

    public DateTime Modified { get; set; }
}
