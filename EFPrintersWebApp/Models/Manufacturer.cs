using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Manufacturer
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public string? Contact { get; set; }

    public virtual ICollection<Printertype> Printertypes { get; set; } = new List<Printertype>();
}
