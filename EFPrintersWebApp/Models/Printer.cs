using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Printer
{
    public int Id { get; set; }

    public int PrintertypeId { get; set; }

    public string InventaryNumber { get; set; } = null!;

    public string SerialNumber { get; set; } = null!;

    public int OfficeId { get; set; }

    public string Room { get; set; } = null!;

    public int StatusId { get; set; }

    public DateOnly? ActivationDate { get; set; }

    public decimal? Price { get; set; }

    public string? PropertyType { get; set; }

    public virtual ICollection<MaterialChange> MaterialChanges { get; set; } = new List<MaterialChange>();

    public virtual Office Office { get; set; } = null!;

    public virtual ICollection<PrinterFile> PrinterFiles { get; set; } = new List<PrinterFile>();

    public virtual Printertype Printertype { get; set; } = null!;

    public virtual Status Status { get; set; } = null!;
}
