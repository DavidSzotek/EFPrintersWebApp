using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Stock
{
    public int Id { get; set; }

    public int MaterialId { get; set; }

    public int OfficeId { get; set; }

    public int Quantity { get; set; }

    public virtual Material Material { get; set; } = null!;

    public virtual Office Office { get; set; } = null!;
}
