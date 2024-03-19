﻿using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class TblError
{
    public int ErrorId { get; set; }

    public string? UserName { get; set; }

    public int? ErrorNumber { get; set; }

    public int? ErrorState { get; set; }

    public int? ErrorSeverity { get; set; }

    public int? ErrorLine { get; set; }

    public string? ErrorProcedure { get; set; }

    public string? ErrorMessage { get; set; }

    public DateTime? ErrorDateTime { get; set; }
}
