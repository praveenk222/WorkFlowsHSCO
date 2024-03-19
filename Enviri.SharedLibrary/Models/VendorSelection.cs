﻿using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class VendorSelection
{
    public int Id { get; set; }

    public string Description { get; set; } = null!;

    public bool IsDeleted { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }

    public virtual ICollection<PurchaseOrder> PurchaseOrders { get; set; } = new List<PurchaseOrder>();
}
