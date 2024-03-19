using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class DepartmentsView
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string Code { get; set; } = null!;

    public bool IsDeleted { get; set; }
}
