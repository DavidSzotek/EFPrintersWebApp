using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class PrinterFile
{
    public int Id { get; set; }

    public int PrinterId { get; set; }

    public DateOnly Date { get; set; }

    public string Comment { get; set; } = null!;

    public string FileName { get; set; } = null!;

    public virtual Printer Printer { get; set; } = null!;
}
