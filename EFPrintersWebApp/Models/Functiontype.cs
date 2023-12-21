using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Functiontype
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Printertype> Printertypes { get; set; } = new List<Printertype>();
}
