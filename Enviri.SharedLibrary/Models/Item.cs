using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class Item
{
    public int Id { get; set; }

    public int PurchaseOrderId { get; set; }

    public decimal Quantity { get; set; }

    public decimal UnitPrice { get; set; }

    public string Description { get; set; } = null!;

    public int? GldescriptionId { get; set; }

    public string Glcode { get; set; } = null!;

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }

    public virtual PurchaseOrder PurchaseOrder { get; set; } = null!;
}
