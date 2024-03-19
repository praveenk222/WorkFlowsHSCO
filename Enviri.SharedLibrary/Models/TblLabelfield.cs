using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class TblLabelfield
{
    public int Id { get; set; }

    public string? Qtext { get; set; }

    public int? CardId { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public bool? IsActive { get; set; }
}
