using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Materialtype
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public virtual ICollection<Material> Materials { get; set; } = new List<Material>();
}
