using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class CommunicationsLog
{
    public int Id { get; set; }

    public int PurchaseOrderId { get; set; }

    public string Recipients { get; set; } = null!;

    public string Subject { get; set; } = null!;

    public string Body { get; set; } = null!;

    public DateTime DateSent { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public virtual PurchaseOrder PurchaseOrder { get; set; } = null!;
}
