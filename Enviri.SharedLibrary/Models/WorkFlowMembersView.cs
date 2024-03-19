using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class WorkFlowMembersView
{
    public int Id { get; set; }

    public int WorkFlowId { get; set; }

    public string Adname { get; set; } = null!;

    public string DisplayName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public decimal ApproverSequence { get; set; }

    public decimal ApprovalAmount { get; set; }

    public bool IsDeleted { get; set; }
}
