using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Enviri.SharedLibrary.Models;

public partial class TblVendor
{
    public int Id { get; set; }
    [Required]
    public string Name { get; set; } = null!;
    [Required]

    public string Number { get; set; } = null!;

    public string? Address1 { get; set; }

    public string? Address2 { get; set; }

    public string? Address3 { get; set; }

    public string? Address4 { get; set; }

    public string? City { get; set; }

    public string? State { get; set; }

    public string? Zip { get; set; }

    public int? PaymentTermsId { get; set; }

    public bool IsDeleted { get; set; }

    public string CreatedBy { get; set; } = null!;

    public DateTime CreatedOn { get; set; }

    public string ModifiedBy { get; set; } = null!;

    public DateTime? ModifiedOn { get; set; }
}
