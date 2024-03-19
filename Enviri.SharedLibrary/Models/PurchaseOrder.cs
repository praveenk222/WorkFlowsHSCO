using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Enviri.SharedLibrary.Models;

public partial class PurchaseOrder
{
    public int Id { get; set; }
    [Required]
    public string Title { get; set; } = null!;

    public int? WorkFlowId { get; set; }
    [Required]
    public string RequestedBy { get; set; } = null!;

    public int DepartmentId { get; set; }

    public int RequestingDepartmentId { get; set; }

    public string Afinumber { get; set; } = null!;

    public int VendorId { get; set; }

    public string VendorNumber { get; set; } = null!;

    public string VendorEmail { get; set; } = null!;

    public string VendorPhone { get; set; } = null!;

    public string VendorFax { get; set; } = null!;

    public DateTime DeliveryDate { get; set; }

    public int VendorSelectionId { get; set; }

    public int? VendorReasonId { get; set; }

    public int? RemarksId { get; set; }

    public int StatusId { get; set; }

    public int? VendorRemarksId { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }

    public virtual ICollection<Approval> Approvals { get; set; } = new List<Approval>();

    public virtual ICollection<Attachment> Attachments { get; set; } = new List<Attachment>();

    public virtual ICollection<CommunicationsLog> CommunicationsLogs { get; set; } = new List<CommunicationsLog>();

    public virtual ICollection<Item> Items { get; set; } = new List<Item>();

    public virtual Comment? Remarks { get; set; }

    public virtual RequestingDepartment RequestingDepartment { get; set; } = null!;

    public virtual Status Status { get; set; } = null!;

    public virtual VendorReason? VendorReason { get; set; }

    public virtual Comment? VendorRemarks { get; set; }

    public virtual VendorSelection VendorSelection { get; set; } = null!;
}


public  class PurchaseOrderModel
{
    public int Id { get; set; }
    [Required]
    public string Title { get; set; } = null!;
    [Required]
    public int? WorkFlowId { get; set; }
    [Required]
    public string RequestedBy { get; set; } = null!;
    [Required]
    public int DepartmentId { get; set; }
    [Required]
    public int RequestingDepartmentId { get; set; }

    public string Afinumber { get; set; } = null!;
    [Required]
    public int VendorId { get; set; }

    public string VendorNumber { get; set; } = null!;

    public string VendorEmail { get; set; } = null!;
    [Required]
    public string VendorPhone { get; set; } = null!;

    public string VendorFax { get; set; } = null!;

    public DateTime DeliveryDate { get; set; }
    [Required]
    public int VendorSelectionId { get; set; }
    [Required]
    public int? VendorReasonId { get; set; }
    [Required]
    public int? RemarksId { get; set; }
    [Required]
    public int StatusId { get; set; }

    public int? VendorRemarksId { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime ModifiedOn { get; set; }

}
