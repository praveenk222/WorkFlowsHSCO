using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class Approval
{
    public int Id { get; set; }

    public int WorkflowId { get; set; }

    public int PurchaseOrderId { get; set; }

    public string ApprovalId { get; set; } = null!;

    public string ApprovalName { get; set; } = null!;

    public decimal Sequence { get; set; }

    public int ApprovalStatusId { get; set; }

    public int? CommentId { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }

    public virtual ApprovalStatus ApprovalStatus { get; set; } = null!;

    public virtual Comment? Comment { get; set; }

    public virtual PurchaseOrder PurchaseOrder { get; set; } = null!;
}
