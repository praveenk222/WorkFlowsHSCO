using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class Attachment
{
    public int Id { get; set; }

    public int PurchaseOrderId { get; set; }

    public string FileName { get; set; } = null!;

    public int FileSize { get; set; }

    public string FileType { get; set; } = null!;

    public byte[] AttachDocument { get; set; } = null!;

    public bool SendtoVendor { get; set; }

    public bool IsDeleted { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }

    public virtual PurchaseOrder PurchaseOrder { get; set; } = null!;
}
