using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class VendorsView
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

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

    public string? PaymentType { get; set; }
}
