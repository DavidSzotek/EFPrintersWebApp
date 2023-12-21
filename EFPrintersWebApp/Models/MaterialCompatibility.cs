using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class MaterialCompatibility
{
    public int Id { get; set; }

    public int PrintertypeId { get; set; }

    public int MaterialId { get; set; }

    public virtual Material Material { get; set; } = null!;

    public virtual Printertype Printertype { get; set; } = null!;
}
