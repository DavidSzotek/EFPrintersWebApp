using System;
using System.Collections.Generic;

namespace EFPrintersWebApp.Models;

public partial class Material
{
    public int Id { get; set; }

    public string PartNumber { get; set; } = null!;

    public string Name { get; set; } = null!;

    public string? Color { get; set; }

    public int MaterialtypeId { get; set; }

    public bool IsAlternative { get; set; }

    public int? Capacity { get; set; }

    public bool IsAvailable { get; set; }

    public decimal? Price { get; set; }

    public decimal? PriceDph { get; set; }

    public virtual ICollection<MaterialChange> MaterialChanges { get; set; } = new List<MaterialChange>();

    public virtual ICollection<MaterialCompatibility> MaterialCompatibilities { get; set; } = new List<MaterialCompatibility>();

    public virtual Materialtype Materialtype { get; set; } = null!;

    public virtual ICollection<Stock> Stocks { get; set; } = new List<Stock>();
}
