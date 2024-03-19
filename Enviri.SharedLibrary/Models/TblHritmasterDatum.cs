using System;
using System.Collections.Generic;

namespace Enviri.SharedLibrary.Models;

public partial class TblHritmasterDatum
{
    public int Sno { get; set; }

    public string EmployeeNumber { get; set; } = null!;

    public string? LastName { get; set; }

    public string? FirstName { get; set; }

    public DateTime? StartDate { get; set; }

    public DateTime? Terminationdate { get; set; }

    public string? JobTitleDaily { get; set; }

    public string? JobFamily { get; set; }

    public string? DirectIndirect { get; set; }

    public string? SupervisorNumber { get; set; }

    public string? SupervisorName { get; set; }

    public string? LocationName { get; set; }

    public string? LocationCode { get; set; }

    public string? CountryCode { get; set; }

    public string? CountryName { get; set; }

    public string? OrganizationName { get; set; }

    public string? DivisionCode { get; set; }

    public string? DivisionName { get; set; }

    public string? EmailAddress { get; set; }

    public string? AdUsername { get; set; }

    public string? AssignmentCategory { get; set; }

    public string? SalaryBasis { get; set; }

    public string? AssignmentStatus { get; set; }

    public DateTime? UpdatedDate { get; set; }

    public string? UpdatedBy { get; set; }
}
