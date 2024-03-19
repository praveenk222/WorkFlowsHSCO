using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class TblCard
{
    public int Id { get; set; }

    public int CardId { get; set; }

    public string? CardName { get; set; }

    public int? ParentId { get; set; }

    public string? DisplayType { get; set; }

    public string? Description { get; set; }

    public string? UpdatedBy { get; set; }

    public DateTime? UpdatedOn { get; set; }

    public bool? IsActive { get; set; }
}
