using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Status
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Printer> Printers { get; set; } = new List<Printer>();
}
