using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Printertype
{
    public int Id { get; set; }

    public string Model { get; set; } = null!;

    public bool IsColor { get; set; }

    public int ManufacturerId { get; set; }

    public int FunctiontypeId { get; set; }

    public bool IsA3capable { get; set; }

    public virtual Functiontype Functiontype { get; set; } = null!;

    public virtual Manufacturer Manufacturer { get; set; } = null!;

    public virtual ICollection<MaterialCompatibility> MaterialCompatibilities { get; set; } = new List<MaterialCompatibility>();

    public virtual ICollection<Printer> Printers { get; set; } = new List<Printer>();
}
