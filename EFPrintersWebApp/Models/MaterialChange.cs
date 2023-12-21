using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class MaterialChange
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public int PrinterId { get; set; }

    public int MaterialId { get; set; }

    public virtual Material Material { get; set; } = null!;

    public virtual Printer Printer { get; set; } = null!;

    public virtual User User { get; set; } = null!;
}
